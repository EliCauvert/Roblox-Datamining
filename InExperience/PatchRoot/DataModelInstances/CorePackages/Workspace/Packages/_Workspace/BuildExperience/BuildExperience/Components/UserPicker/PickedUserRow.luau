local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useUserProfileInfoModule = require(script.Parent.useUserProfileInfo)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local iconButton = foundationModule.IconButton
local list = foundationModule.List
local loading = foundationModule.Loading
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local accessoryType = foundationModule.Enums.AccessoryType

return function(p0) --[[ line: 38 | named "PickedUserRow" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), useUserProfileInfoModule (ref), reactModule (ref), view (ref), loading (ref), iconSize (ref), iconButton (ref), iconName (ref), list (ref), accessoryType (ref)
	local var6 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		unknownUser = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
	}) else nil).unknownUser else localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
	local var7 = useUserProfileInfoModule(p0.userId)
	local size1000 = useTokens().Size.Size_1000
	
	return reactModule.createElement(list.Item, {
		LayoutOrder = p0.LayoutOrder,
		leading = { type = accessoryType.Avatar, userId = p0.userId },
		title = if var7.displayName ~= "" then var6 else var7.displayName,
		description = localizationStringsModule.formatUserPickerUsername(var7.username),
		trailing = if p0.isRemoving then reactModule.createElement(view, {
			tag = "align-x-center align-y-center",
			Size = UDim2.fromOffset(size1000, size1000),
			testId = `{p0.testId}-removing`
		}, {
			Spinner = reactModule.createElement(loading, { size = iconSize.Small })
		}) else reactModule.createElement(iconButton, {
			icon = iconName.TrashCan,
			onActivated = function() --[[ line: 67 ]]
				-- upvalues: p0 (ref)
				p0.onRemove(p0.userId)
			end,
			testId = `{p0.testId}-remove`
		}),
		testId = p0.testId
	})
end