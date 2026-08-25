local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local friendsCommonModule = require(parent.FriendsCommon)
local reactModule = require(parent.React)
local socialCommonModule = require(parent.SocialCommon)
local shareSheetItemViewModule = require(script.Parent.ShareSheetItemView)
local useGetPresenceByUserId = friendsCommonModule.Hooks.useGetPresenceByUserId
local convertToFoundationPresenceEnum = socialCommonModule.Utils.convertToFoundationPresenceEnum

return function(p0)
	-- upvalues: useGetPresenceByUserId (ref), convertToFoundationPresenceEnum (ref), foundationModule (ref), reactModule (ref), shareSheetItemViewModule (ref)
	local var5 = useGetPresenceByUserId(p0.primaryUserId)
	
	return reactModule.createElement(shareSheetItemViewModule, {
		icon = p0.icon,
		isSelected = p0.isSelected,
		primaryUserId = p0.primaryUserId,
		secondUserId = p0.secondUserId,
		label = p0.label,
		onActivated = p0.onActivated,
		shouldAnimate = p0.shouldAnimate,
		userPresence = if var5 and var5.userPresenceType then convertToFoundationPresenceEnum(var5.userPresenceType) else foundationModule.Enums.UserPresence.None,
		LayoutOrder = p0.LayoutOrder
	})
end