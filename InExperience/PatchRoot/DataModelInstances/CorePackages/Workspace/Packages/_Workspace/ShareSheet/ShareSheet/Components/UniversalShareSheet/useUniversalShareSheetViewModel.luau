local ShareSheet = script:FindFirstAncestor("ShareSheet")
local SignalsReactModule = require(ShareSheet.Parent.SignalsReact)
local _ = require(script.Parent.Parent.useShareSheetViewModel)
local GetUniversalShareSheetStoreModule = require(ShareSheet.Stores.GetUniversalShareSheetStore)

return function()
	-- upvalues: GetUniversalShareSheetStoreModule (copy), SignalsReactModule (copy)
	local UniversalShareSheetStoreModule = GetUniversalShareSheetStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UniversalShareSheetStoreModule.getRequest)
	
	return if UseSignalStateResult == nil then nil else {
		isOpen = true,
		context = UseSignalStateResult.context,
		formatSuccessSnackbarText = UseSignalStateResult.formatSuccessSnackbarText,
		messagePlaceholder = UseSignalStateResult.messagePlaceholder,
		onCloseWithReason = UniversalShareSheetStoreModule.hide,
		recipientSource = UseSignalStateResult.recipientSource,
		telemetryId = UseSignalStateResult.telemetryId,
		url = UseSignalStateResult.url
	}
end