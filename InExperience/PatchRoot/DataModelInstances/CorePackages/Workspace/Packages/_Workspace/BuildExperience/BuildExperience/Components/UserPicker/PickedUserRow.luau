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

return function(p1)
	-- upvalues: useUserProfileInfoModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), view (ref), loading (ref), iconSize (ref), iconButton (ref), iconName (ref), list (ref), accessoryType (ref)
	local PRIVATE_INVITES_UNKNOWN_USER, var1
	local var2 = useUserProfileInfoModule(p1.userId)
	local var3 = if fFlagBuildLocalization then useLocalization({
		unknownUser = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER,
		username = {
			localizationStringsModule.USER_PICKER_USERNAME,
			USERNAME = var2.username
		}
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		PRIVATE_INVITES_UNKNOWN_USER = var3.unknownUser
		var1 = var3.username
	else
		PRIVATE_INVITES_UNKNOWN_USER = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
		var1 = localizationStringsModule.formatUserPickerUsername(var2.username)
	end
	local size1000 = useTokens().Size.Size_1000
	
	return reactModule.createElement(list.Item, {
		LayoutOrder = p1.LayoutOrder,
		leading = { type = accessoryType.Avatar, userId = p1.userId },
		title = if var2.displayName ~= "" then PRIVATE_INVITES_UNKNOWN_USER else var2.displayName,
		description = var1,
		trailing = if p1.isRemoving then reactModule.createElement(view, {
			tag = "align-x-center align-y-center",
			Size = UDim2.fromOffset(size1000, size1000),
			testId = `{p1.testId}-removing`
		}, {
			Spinner = reactModule.createElement(loading, { size = iconSize.Small })
		}) else reactModule.createElement(iconButton, {
			icon = iconName.TrashCan,
			onActivated = function()
				-- upvalues: p1 (ref)
				p1.onRemove(p1.userId)
			end,
			testId = `{p1.testId}-remove`
		}),
		testId = p1.testId
	})
end