local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local friendsCommonModule = require(parent.FriendsCommon)
local reactModule = require(parent.React)
local socialCommonModule = require(parent.SocialCommon)
local _ = require(script.Parent.PeoplePickerListView)
local useUserInfoModule = require(script.Parent.useUserInfo)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local useGetPresenceByUserId = friendsCommonModule.Hooks.useGetPresenceByUserId
local convertToFoundationPresenceEnum = socialCommonModule.Utils.convertToFoundationPresenceEnum
local useUserInfo = useUserInfoModule.useUserInfo

local function _(p1, p2)
	local var1 = if p1 then p1.displayName else ""
	
	return if p2 == nil then var1 else `{var1}, {p2.displayName}`
end

local _ = function(p1)
	return if p1 == nil or p1.username == "" then "" else `@{p1.username}`
end

local _ = function(p1, p2)
	return if p1 == nil then false elseif p2 ~= nil then p2.isLoading else true
end

local _ = function(p1, p2)
	local var1 = if p1 == nil or p1.username == "" then "" else `@{p1.username}`
	
	return if p2 == nil then var1 else `{var1}, {if p2 == nil or p2.username == "" then "" else `@{p2.username}`}`
end

return function(p3)
	-- upvalues: useTokens (ref), useUserInfo (ref), useGetPresenceByUserId (ref), convertToFoundationPresenceEnum (ref), foundationModule (ref), reactModule (ref), icon (ref), iconName (ref), iconSize (ref)
	local var2 = useTokens()
	local var3 = useUserInfo(p3.primaryUserId)
	local var4 = useUserInfo(p3.secondUserId)
	local var5 = useGetPresenceByUserId(if p3.secondUserId == nil then p3.primaryUserId else nil)
	local var6 = if var5 and var5.userPresenceType then convertToFoundationPresenceEnum(var5.userPresenceType) else foundationModule.Enums.UserPresence.None
	local var7 = true
	
	if p3.isLoading ~= true then
		var7 = if p3.primaryUserId == nil then false elseif var3 ~= nil then var3.isLoading else true
		
		if not var7 then
			var7 = if p3.secondUserId == nil then false elseif var4 ~= nil then var4.isLoading else true
		end
	end
	local testId = p3.testId or "people-picker-list-item"
	local isSelected = p3.isSelected
	local t = {
		input = "None",
		leading = {
			type = "Avatar",
			userId = p3.primaryUserId,
			secondUserId = p3.secondUserId,
			userPresence = var6
		},
		trailing = reactModule.useMemo(function()
			-- upvalues: isSelected (ref), reactModule (copy), icon (copy), iconName (copy), iconSize (copy), var2 (ref), testId (ref)
			return if isSelected then reactModule.createElement(icon, {
				name = iconName.Check,
				size = iconSize.Large,
				style = var2.Color.Content.Emphasis,
				testId = `{testId}--selected-check`
			}) else nil
		end, { isSelected, testId, var2 })
	}
	local var8 = if var3 then var3.displayName else ""
	t.title = if var4 == nil then var8 else `{var8}, {var4.displayName}`
	local var9 = if var3 == nil or var3.username == "" then "" else `@{var3.username}`
	t.description = if var4 == nil then var9 else `{var9}, {if var4 == nil or var4.username == "" then "" else `@{var4.username}`}`
	t.isLoading = var7
	t.onActivated = p3.onActivated
	t.LayoutOrder = p3.LayoutOrder
	t.testId = testId
	
	return t
end