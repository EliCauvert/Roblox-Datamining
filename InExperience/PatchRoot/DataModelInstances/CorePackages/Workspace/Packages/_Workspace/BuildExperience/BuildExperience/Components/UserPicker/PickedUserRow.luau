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
	-- upvalues: useUserProfileInfoModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), view (ref), loading (ref), iconSize (ref), iconButton (ref), iconName (ref), list (ref), accessoryType (ref)
	local PRIVATE_INVITES_UNKNOWN_USER, var8
	local var6 = useUserProfileInfoModule(p0.userId)
	local var7 = if fFlagBuildLocalization then useLocalization({
		unknownUser = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER,
		username = {
			localizationStringsModule.USER_PICKER_USERNAME,
			USERNAME = var6.username
		}
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		PRIVATE_INVITES_UNKNOWN_USER = var7.unknownUser
		var8 = var7.username
	else
		PRIVATE_INVITES_UNKNOWN_USER = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
		var8 = localizationStringsModule.formatUserPickerUsername(var6.username)
	end
	local size1000 = useTokens().Size.Size_1000
	
	return reactModule.createElement(list.Item, {
		LayoutOrder = p0.LayoutOrder,
		leading = { type = accessoryType.Avatar, userId = p0.userId },
		title = if var6.displayName ~= "" then PRIVATE_INVITES_UNKNOWN_USER else var6.displayName,
		description = var8,
		trailing = if p0.isRemoving then reactModule.createElement(view, {
			tag = "align-x-center align-y-center",
			Size = UDim2.fromOffset(size1000, size1000),
			testId = `{p0.testId}-removing`
		}, {
			Spinner = reactModule.createElement(loading, { size = iconSize.Small })
		}) else reactModule.createElement(iconButton, {
			icon = iconName.TrashCan,
			onActivated = function() --[[ line: 77 ]]
				-- upvalues: p0 (ref)
				p0.onRemove(p0.userId)
			end,
			testId = `{p0.testId}-remove`
		}),
		testId = p0.testId
	})
end