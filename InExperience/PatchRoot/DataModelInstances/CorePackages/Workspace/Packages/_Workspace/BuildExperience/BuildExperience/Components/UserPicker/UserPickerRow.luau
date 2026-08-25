local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useUserProfileInfoModule = require(script.Parent.useUserProfileInfo)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local icon = foundationModule.Icon
local list = foundationModule.List
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local accessoryType = foundationModule.Enums.AccessoryType
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

return function(p0)
	-- upvalues: useUserProfileInfoModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), icon (ref), iconName (ref), iconSize (ref), list (ref), accessoryType (ref), view (ref)
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
	local var9 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		onActivated = p0.onToggle,
		stateLayer = {},
		isDisabled = p0.isDisabled,
		testId = p0.testId
	}, {
		Item = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Item = reactModule.createElement(list.Item, {
				leading = { type = accessoryType.Avatar, userId = p0.userId },
				title = if var6.displayName ~= "" then PRIVATE_INVITES_UNKNOWN_USER else var6.displayName,
				description = var8,
				trailing = if p0.isSelected then reactModule.createElement(icon, {
					name = iconName.CheckLarge,
					size = iconSize.Medium,
					style = var9.Color.Content.Emphasis
				}) else nil
			}),
			Scrim = if p0.isDisabled then reactModule.createElement("Frame", {
				BackgroundTransparency = 0.5,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = var9.Color.Surface.Surface_100.Color3
			}) else nil
		})
	})
end