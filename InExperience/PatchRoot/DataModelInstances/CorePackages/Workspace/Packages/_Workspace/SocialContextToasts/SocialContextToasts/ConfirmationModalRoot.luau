local Parent = script:FindFirstAncestor("SocialContextToasts").Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ReactModule = require(Parent.React)
local DeeplinkConfirmationModal = require(Parent.NotificationsCommon).DeeplinkConfirmationModal

return function() --[[ Line: 10 | Named "ConfirmationModalRoot" ]]
	-- upvalues: UseSelectorFunction (copy), ReactModule (copy), DeeplinkConfirmationModal (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 11 ]]
		return p1.ConfirmationModal
	end)
	
	return {
		DeeplinkConfirmationModal = UseSelectorResult and UseSelectorResult.isOpen and ReactModule.createElement(DeeplinkConfirmationModal, { closeCallback = UseSelectorResult.closeCallback })
	}
end