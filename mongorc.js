// This should pretify documents in the shell,
// but it doesn't appear to work in the windows
// shell for docs after the first one in the
// collection :/.
DBQuery.prototype._prettyShell = true

// The prompt definition.
function stateName(stateCode) {
    switch(stateCode) {
        case 1:
            return "PRIMARY";
        case 2:
            return "SECONDARY";
        case 3:
            return "RECOVERING";
        case 7:
            return "ARBITER";
        default:
            return "IDUNNO";
    }
}
prompt = function () {
    var rsStatus = rs.status();
    var promptStatus = "";
    if (!rsStatus.ok) {
        promptStatus = "STANDALONE";
    }
    else {
        var rsStateCode = rsStatus.myState;
        promptStatus = rsStatus.set + ":" + rsStateCode + "=" + stateName(rsStateCode);
    }
    return "["
            + "v" + db.version() + "@" + db.hostInfo().system.hostname + " "
            + "(db:" + db + ") "
            + promptStatus
            + "]> ";
}

// Slaves are OK for reading.
db.getMongo().slaveOk = true

