local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseUserProfileInfoModule = require(script.Parent.useUserProfileInfo)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Icon = FoundationModule.Icon
local List = FoundationModule.List
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AccessoryType = FoundationModule.Enums.AccessoryType
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize

return function(p1) --[[ Line: 36 | Named "UserPickerRow" ]]
	-- upvalues: UseUserProfileInfoModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseTokensFunction (copy), ReactModule (copy), Icon (copy), IconName (copy), IconSize (copy), List (copy), AccessoryType (copy), View (copy)
	local UseUserProfileInfoModuleResult = UseUserProfileInfoModule(p1.userId)
	local UseLocalizationResult = UseLocalizationFunction({
		unknownUser = LocalizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER,
		username = {
			LocalizationStringsModule.USER_PICKER_USERNAME,
			USERNAME = UseUserProfileInfoModuleResult.username
		}
	})
	local UnknownUser = UseLocalizationResult.unknownUser
	local Username = UseLocalizationResult.username
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onToggle,
		stateLayer = {},
		isDisabled = p1.isDisabled,
		testId = p1.testId
	}, {
		Item = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Item = ReactModule.createElement(List.Item, {
				leading = { type = AccessoryType.Avatar, userId = p1.userId },
				title = if UseUserProfileInfoModuleResult.displayName == "" then UnknownUser else UseUserProfileInfoModuleResult.displayName,
				description = Username,
				trailing = if p1.isSelected then ReactModule.createElement(Icon, {
					name = IconName.CheckLarge,
					size = IconSize.Medium,
					style = UseTokensResult.Color.Content.Emphasis
				}) else nil
			}),
			Scrim = if p1.isDisabled then ReactModule.createElement("Frame", {
				BackgroundTransparency = 0.5,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3
			}) else nil
		})
	})
end