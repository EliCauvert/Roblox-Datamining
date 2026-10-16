local Parent = script:FindFirstAncestor("ShareSheet").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.PeoplePickerListView)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local ConvertToFoundationPresenceEnumFunction = require(Parent.SocialCommon).Utils.convertToFoundationPresenceEnum

return function(p1) --[[ Line: 33 | Named "usePeoplePickerListItemViewModel" ]]
	-- upvalues: UseTokensFunction (copy), UseGetPresenceByUserIdFunction (copy), ConvertToFoundationPresenceEnumFunction (copy), FoundationModule (copy), ReactModule (copy), Icon (copy), IconName (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(if p1.primaryUserId == "" or p1.secondUserId ~= nil then nil else p1.primaryUserId)
	local TestId = p1.testId or "people-picker-list-item"
	local IsSelected = p1.isSelected
	
	return {
		leading = {
			type = "Avatar",
			userId = p1.primaryUserId,
			secondUserId = p1.secondUserId,
			userPresence = if UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.userPresenceType then ConvertToFoundationPresenceEnumFunction(UseGetPresenceByUserIdResult.userPresenceType) else FoundationModule.Enums.UserPresence.None
		},
		trailing = ReactModule.useMemo(function() --[[ Line: 48 ]]
			-- upvalues: IsSelected (copy), ReactModule (upval), Icon (upval), IconName (upval), IconSize (upval), UseTokensResult (copy), TestId (copy)
			return if IsSelected then ReactModule.createElement(Icon, {
				name = IconName.Check,
				size = IconSize.Large,
				style = UseTokensResult.Color.Content.Emphasis,
				testId = `{TestId}--selected-check`
			}) else nil
		end, { IsSelected, TestId, UseTokensResult }),
		title = p1.title,
		description = p1.description,
		isLoading = p1.isLoading == true,
		onActivated = p1.onActivated,
		testId = TestId
	}
end