local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local _ = require(script.Parent.Parent.useShareSheetViewModel)
local GetUniversalShareSheetStoreModule = require(ShareSheet.Stores.GetUniversalShareSheetStore)

return function()
	-- upvalues: GetUniversalShareSheetStoreModule (copy), SignalsReactModule (copy), FFlagShareSheetFriendsSort (copy)
	local UniversalShareSheetStoreModule = GetUniversalShareSheetStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UniversalShareSheetStoreModule.getRequest)
	
	return if UseSignalStateResult == nil then nil else {
		isOpen = true,
		context = UseSignalStateResult.context,
		formatSuccessSnackbarText = UseSignalStateResult.formatSuccessSnackbarText,
		messagePlaceholder = UseSignalStateResult.messagePlaceholder,
		onCloseWithReason = UniversalShareSheetStoreModule.hide,
		recipientSource = if FFlagShareSheetFriendsSort then UseSignalStateResult.recipientSource else nil,
		telemetryId = UseSignalStateResult.telemetryId,
		url = UseSignalStateResult.url
	}
end