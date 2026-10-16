local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseUserProfileInfoModule = require(script.Parent.useUserProfileInfo)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local IconButton = FoundationModule.IconButton
local List = FoundationModule.List
local Loading = FoundationModule.Loading
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local AccessoryType = FoundationModule.Enums.AccessoryType

return function(Frame) --[[ Line: 35 | Named "PickedUserRow" ]]
	-- upvalues: UseUserProfileInfoModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Loading (copy), IconSize (copy), IconButton (copy), IconName (copy), List (copy), AccessoryType (copy)
	local UseUserProfileInfoModuleResult = UseUserProfileInfoModule(Frame.userId)
	local UseLocalizationResult = UseLocalizationFunction({
		unknownUser = LocalizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER,
		username = {
			LocalizationStringsModule.USER_PICKER_USERNAME,
			USERNAME = UseUserProfileInfoModuleResult.username
		}
	})
	local UnknownUser = UseLocalizationResult.unknownUser
	local Username = UseLocalizationResult.username
	local Size1000 = UseTokensFunction().Size.Size_1000
	
	return ReactModule.createElement(List.Item, {
		LayoutOrder = Frame.LayoutOrder,
		leading = { type = AccessoryType.Avatar, userId = Frame.userId },
		title = if UseUserProfileInfoModuleResult.displayName == "" then UnknownUser else UseUserProfileInfoModuleResult.displayName,
		description = Username,
		trailing = if Frame.isRemoving then ReactModule.createElement(View, {
			tag = "align-x-center align-y-center",
			Size = UDim2.fromOffset(Size1000, Size1000),
			testId = `{Frame.testId}-removing`
		}, {
			Spinner = ReactModule.createElement(Loading, { size = IconSize.Small })
		}) else ReactModule.createElement(IconButton, {
			icon = IconName.TrashCan,
			onActivated = function() --[[ Line: 65 ]]
				-- upvalues: Frame (copy)
				Frame.onRemove(Frame.userId)
			end,
			testId = `{Frame.testId}-remove`
		}),
		testId = Frame.testId
	})
end