local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local friendsCommonModule = require(parent.FriendsCommon)
local reactModule = require(parent.React)
local socialCommonModule = require(parent.SocialCommon)
local _ = require(script.Parent.PeoplePickerListView)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local useGetPresenceByUserId = friendsCommonModule.Hooks.useGetPresenceByUserId
local convertToFoundationPresenceEnum = socialCommonModule.Utils.convertToFoundationPresenceEnum

return function(p1)
	-- upvalues: useTokens (ref), useGetPresenceByUserId (ref), convertToFoundationPresenceEnum (ref), foundationModule (ref), reactModule (ref), icon (ref), iconName (ref), iconSize (ref)
	local var1 = useTokens()
	local var2 = useGetPresenceByUserId(if p1.primaryUserId == "" or p1.secondUserId ~= nil then nil else p1.primaryUserId)
	local var3 = if var2 and var2.userPresenceType then convertToFoundationPresenceEnum(var2.userPresenceType) else foundationModule.Enums.UserPresence.None
	local var4 = p1.isLoading == true
	local testId = p1.testId or "people-picker-list-item"
	local isSelected = p1.isSelected
	
	return {
		input = "None",
		leading = {
			type = "Avatar",
			userId = p1.primaryUserId,
			secondUserId = p1.secondUserId,
			userPresence = var3
		},
		trailing = reactModule.useMemo(function()
			-- upvalues: isSelected (ref), reactModule (copy), icon (copy), iconName (copy), iconSize (copy), var1 (ref), testId (ref)
			return if isSelected then reactModule.createElement(icon, {
				name = iconName.Check,
				size = iconSize.Large,
				style = var1.Color.Content.Emphasis,
				testId = `{testId}--selected-check`
			}) else nil
		end, { isSelected, testId, var1 }),
		title = p1.title,
		description = p1.description,
		isLoading = var4,
		onActivated = p1.onActivated,
		LayoutOrder = p1.LayoutOrder,
		testId = testId
	}
end