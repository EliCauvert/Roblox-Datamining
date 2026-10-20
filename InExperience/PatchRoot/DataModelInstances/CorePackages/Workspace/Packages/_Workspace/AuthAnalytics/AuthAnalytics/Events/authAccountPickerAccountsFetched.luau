local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, List, List1, List2)
	-- upvalues: CheckAndSendEventModule (copy)
	CheckAndSendEventModule(p1, "authAccountPickerAccountsFetched", {
		validSessionUserIds = `[{table.concat(List, ",")}]`,
		shownUserIds = `[{table.concat(List1, ",")}]`,
		appStoragePreviousUserIds = `[{table.concat(List2, ",")}]`
	})
end