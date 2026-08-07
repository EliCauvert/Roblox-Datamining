local parent = script:FindFirstAncestor("SocialContextToasts").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local reactModule = require(parent.React)
local deeplinkConfirmationModal = require(parent.NotificationsCommon).DeeplinkConfirmationModal

return function() --[[ line: 10 | named "ConfirmationModalRoot" ]]
	-- upvalues: useSelector (ref), reactModule (ref), deeplinkConfirmationModal (ref)
	local var1 = useSelector(function(p0) --[[ line: 11 ]]
		return p0.ConfirmationModal
	end)
	
	return {
		DeeplinkConfirmationModal = var1 and var1.isOpen and reactModule.createElement(deeplinkConfirmationModal, { closeCallback = var1.closeCallback })
	}
end