local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, p2, p3, p4)
	-- upvalues: checkAndSendEventModule (ref)
	checkAndSendEventModule(p1, "authAccountPickerAccountsFetched", {
		validSessionUserIds = `[{table.concat(p2, ",")}]`,
		shownUserIds = `[{table.concat(p3, ",")}]`,
		appStoragePreviousUserIds = `[{table.concat(p4, ",")}]`
	})
end