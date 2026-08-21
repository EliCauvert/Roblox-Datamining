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

return function(p0) --[[ line: 39 | named "UserPickerRow" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), useUserProfileInfoModule (ref), reactModule (ref), icon (ref), iconName (ref), iconSize (ref), list (ref), accessoryType (ref), view (ref)
	local var6 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		unknownUser = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
	}) else nil).unknownUser else localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
	local var7 = useTokens()
	local var8 = useUserProfileInfoModule(p0.userId)
	
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
				title = if var8.displayName ~= "" then var6 else var8.displayName,
				description = localizationStringsModule.formatUserPickerUsername(var8.username),
				trailing = if p0.isSelected then reactModule.createElement(icon, {
					name = iconName.CheckLarge,
					size = iconSize.Medium,
					style = var7.Color.Content.Emphasis
				}) else nil
			}),
			Scrim = if p0.isDisabled then reactModule.createElement("Frame", {
				BackgroundTransparency = 0.5,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = var7.Color.Surface.Surface_100.Color3
			}) else nil
		})
	})
end