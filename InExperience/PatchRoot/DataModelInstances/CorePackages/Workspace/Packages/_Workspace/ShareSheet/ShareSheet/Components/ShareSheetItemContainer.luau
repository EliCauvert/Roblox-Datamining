local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local friendsCommonModule = require(parent.FriendsCommon)
local reactModule = require(parent.React)
local socialCommonModule = require(parent.SocialCommon)
local shareSheetItemViewModule = require(script.Parent.ShareSheetItemView)
local useGetPresenceByUserId = friendsCommonModule.Hooks.useGetPresenceByUserId
local convertToFoundationPresenceEnum = socialCommonModule.Utils.convertToFoundationPresenceEnum

return function(p1)
	-- upvalues: useGetPresenceByUserId (ref), convertToFoundationPresenceEnum (ref), foundationModule (ref), reactModule (ref), shareSheetItemViewModule (ref)
	local var1 = useGetPresenceByUserId(p1.primaryUserId)
	
	return reactModule.createElement(shareSheetItemViewModule, {
		icon = p1.icon,
		isSelected = p1.isSelected,
		primaryUserId = p1.primaryUserId,
		secondUserId = p1.secondUserId,
		label = p1.label,
		onActivated = p1.onActivated,
		shouldAnimate = p1.shouldAnimate,
		userPresence = if var1 and var1.userPresenceType then convertToFoundationPresenceEnum(var1.userPresenceType) else foundationModule.Enums.UserPresence.None,
		LayoutOrder = p1.LayoutOrder
	})
end