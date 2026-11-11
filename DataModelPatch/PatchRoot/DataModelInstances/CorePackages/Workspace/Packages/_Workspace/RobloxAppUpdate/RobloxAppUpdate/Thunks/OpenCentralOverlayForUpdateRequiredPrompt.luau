local Parent = script:FindFirstAncestor("RobloxAppUpdate").Parent
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType

return function(CanPerformBinaryUpdate, ShowInternalChannelMessage, UpdateMessageType)
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), CanPerformBinaryUpdate (copy), ShowInternalChannelMessage (copy), UpdateMessageType (copy)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.UpdateRequiredPrompt, {
			canPerformBinaryUpdate = CanPerformBinaryUpdate,
			showInternalChannelMessage = ShowInternalChannelMessage,
			updateMessageType = UpdateMessageType
		}, { DisableBackButtonClose = true }))
	end
end