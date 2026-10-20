local Parent = script:FindFirstAncestor("ShareSheet").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ShareSheetItemViewModule = require(script.Parent.ShareSheetItemView)
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local ConvertToFoundationPresenceEnumFunction = require(Parent.SocialCommon).Utils.convertToFoundationPresenceEnum

return function(Frame)
	-- upvalues: UseGetPresenceByUserIdFunction (copy), ConvertToFoundationPresenceEnumFunction (copy), FoundationModule (copy), ReactModule (copy), ShareSheetItemViewModule (copy)
	local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(Frame.primaryUserId)
	
	return ReactModule.createElement(ShareSheetItemViewModule, {
		icon = Frame.icon,
		isSelected = Frame.isSelected,
		primaryUserId = Frame.primaryUserId,
		secondUserId = Frame.secondUserId,
		label = Frame.label,
		onActivated = Frame.onActivated,
		shouldAnimate = Frame.shouldAnimate,
		userPresence = if UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.userPresenceType then ConvertToFoundationPresenceEnumFunction(UseGetPresenceByUserIdResult.userPresenceType) else FoundationModule.Enums.UserPresence.None,
		LayoutOrder = Frame.LayoutOrder
	})
end