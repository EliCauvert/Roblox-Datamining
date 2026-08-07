local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p0, p1, p2, p3) --[[ line: 4 ]]
	-- upvalues: checkAndSendEventModule (ref)
	checkAndSendEventModule(p0, "authAccountPickerAccountsFetched", {
		validSessionUserIds = `[{table.concat(p1, ",")}]`,
		shownUserIds = `[{table.concat(p2, ",")}]`,
		appStoragePreviousUserIds = `[{table.concat(p3, ",")}]`
	})
end