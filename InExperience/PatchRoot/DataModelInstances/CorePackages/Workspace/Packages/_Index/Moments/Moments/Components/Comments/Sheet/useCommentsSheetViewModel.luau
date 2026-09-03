local signalsReactModule = require(script:FindFirstAncestor("Moments").Parent.SignalsReact)
local _ = require(script.Parent.CommentsSheetView)
local getCommentsSheetStoreModule = require(script.Parent.getCommentsSheetStore)

return function()
	-- upvalues: getCommentsSheetStoreModule (ref), signalsReactModule (ref)
	local var1 = getCommentsSheetStoreModule(false)
	
	return {
		title = "Comments",
		content = nil,
		composer = nil,
		isOpen = signalsReactModule.useSignalState(var1.getIsOpen),
		onClose = var1.close
	}
end