local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useUserProfileInfoModule = require(script.Parent.useUserProfileInfo)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local icon = foundationModule.Icon
local list = foundationModule.List
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local accessoryType = foundationModule.Enums.AccessoryType
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

return function(p1)
	-- upvalues: useUserProfileInfoModule (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), icon (ref), iconName (ref), iconSize (ref), list (ref), accessoryType (ref), view (ref)
	local var1 = useUserProfileInfoModule(p1.userId)
	local var2 = useLocalization({
		unknownUser = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER,
		username = {
			localizationStringsModule.USER_PICKER_USERNAME,
			USERNAME = var1.username
		}
	})
	local var3 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onToggle,
		stateLayer = {},
		isDisabled = p1.isDisabled,
		testId = p1.testId
	}, {
		Item = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Item = reactModule.createElement(list.Item, {
				leading = { type = accessoryType.Avatar, userId = p1.userId },
				title = if var1.displayName ~= "" then var2.unknownUser else var1.displayName,
				description = var2.username,
				trailing = if p1.isSelected then reactModule.createElement(icon, {
					name = iconName.CheckLarge,
					size = iconSize.Medium,
					style = var3.Color.Content.Emphasis
				}) else nil
			}),
			Scrim = if p1.isDisabled then reactModule.createElement("Frame", {
				BackgroundTransparency = 0.5,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = var3.Color.Surface.Surface_100.Color3
			}) else nil
		})
	})
end