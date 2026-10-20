local ContactImporter = script:FindFirstAncestor("ContactImporter")
local DependenciesModule = require(ContactImporter.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local UseLocalizationFunction = DependenciesModule.useLocalization
local UseStyleFunction = DependenciesModule.useStyle
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local IconSize = UIBlox.App.Constant.IconSize
local StandardButtonSize = UIBlox.App.Button.Enum.StandardButtonSize
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local TextKeysModule = require(ContactImporter.Common.TextKeys)
local IconsGraphicContactsLarge = UIBlox.App.ImageSet.Images["icons/graphic/contacts_large"]

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), UseStyleFunction (copy), React (copy), ImageSetLabel (copy), IconSize (copy), IconsGraphicContactsLarge (copy), StyledTextLabel (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local OpenAmpUpsell = p1.openAmpUpsell
	local NoShowMatchedContacts = not p1.showMatchedContacts
	local IsUserInGreenFindFriendsButtonExperiment = p1.isUserInGreenFindFriendsButtonExperiment
	local UseLocalizationResult = UseLocalizationFunction({
		findFriendsButton = TextKeysModule.CONTACTS_FIND_FRIENDS_BUTTON,
		findFriendsDescription = TextKeysModule.CONTACTS_FIND_FRIENDS_DESCRIPTION,
		findFriendsDescriptionPV = TextKeysModule.CONTACTS_FIND_FRIENDS_DESCRIPTION_PV
	})
	local UseStyleResult = UseStyleFunction()
	
	return React.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 48),
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = React.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		ImageIcon = React.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.new(0, IconSize.Large, 0, IconSize.Large),
			ScaleType = Enum.ScaleType.Fit,
			Image = IconsGraphicContactsLarge,
			ImageTransparency = UseStyleResult.Theme.SystemPrimaryDefault.Transparency
		}),
		TextFrame = React.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -((if NoShowMatchedContacts then 122 else 0) + 48 + 12), 0, 48)
		}, {
			textLayout = React.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Description = React.createElement(StyledTextLabel, {
				lineHeight = 1,
				text = if NoShowMatchedContacts then UseLocalizationResult.findFriendsDescription else UseLocalizationResult.findFriendsDescriptionPV,
				fontStyle = UseStyleResult.Font.CaptionBody,
				colorStyle = UseStyleResult.Theme.TextDefault,
				size = UDim2.new(1, 0, 1, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			})
		}),
		ButtonFrame = if NoShowMatchedContacts then React.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(0, 110, 0, 48),
			AnchorPoint = Vector2.new(1, 0.5)
		}, {
			ButtonLayout = React.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			FindFriendsButton = React.createElement(Button, {
				fitContent = false,
				buttonType = if IsUserInGreenFindFriendsButtonExperiment then ButtonType.PrimaryContextual else ButtonType.PrimarySystem,
				standardSize = StandardButtonSize.XSmall,
				text = UseLocalizationResult.findFriendsButton,
				onActivated = OpenAmpUpsell
			})
		}) else nil
	})
end