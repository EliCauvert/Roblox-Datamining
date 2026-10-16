local shareSheet = script:FindFirstAncestor("ShareSheet")
local signalsReactModule = require(shareSheet.Parent.SignalsReact)
local _ = require(script.Parent.Parent.useShareSheetViewModel)
local getUniversalShareSheetStoreModule = require(shareSheet.Stores.GetUniversalShareSheetStore)

return function()
	-- upvalues: getUniversalShareSheetStoreModule (ref), signalsReactModule (ref)
	local var1 = getUniversalShareSheetStoreModule()
	local var2 = signalsReactModule.useSignalState(var1.getRequest)
	
	return if var2 == nil then nil else {
		isOpen = true,
		context = var2.context,
		formatSuccessSnackbarText = var2.formatSuccessSnackbarText,
		messagePlaceholder = var2.messagePlaceholder,
		onCloseWithReason = var1.hide,
		telemetryId = var2.telemetryId,
		url = var2.url
	}
end