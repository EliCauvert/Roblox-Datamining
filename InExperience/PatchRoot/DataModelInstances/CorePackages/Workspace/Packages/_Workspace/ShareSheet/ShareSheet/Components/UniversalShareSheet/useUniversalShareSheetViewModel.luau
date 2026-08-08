local shareSheet = script:FindFirstAncestor("ShareSheet")
local signalsReactModule = require(shareSheet.Parent.SignalsReact)
local _ = require(script.Parent.Parent.useShareSheetViewModel)
local getUniversalShareSheetStoreModule = require(shareSheet.Stores.GetUniversalShareSheetStore)

return function() --[[ line: 13 | named "useUniversalShareSheetViewModel" ]]
	-- upvalues: getUniversalShareSheetStoreModule (ref), signalsReactModule (ref)
	local var3 = getUniversalShareSheetStoreModule()
	local var4 = signalsReactModule.useSignalState(var3.getRequest)
	
	return if var4 == nil then nil else {
		isOpen = true,
		context = var4.context,
		formatSuccessSnackbarText = var4.formatSuccessSnackbarText,
		messagePlaceholder = var4.messagePlaceholder,
		onClose = var3.hide,
		onCloseWithReason = var3.hide,
		telemetryId = var4.telemetryId,
		url = var4.url
	}
end