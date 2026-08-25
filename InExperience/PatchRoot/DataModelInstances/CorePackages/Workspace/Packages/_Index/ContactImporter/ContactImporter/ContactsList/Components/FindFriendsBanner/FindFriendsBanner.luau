local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local useLocalization = dependenciesModule.useLocalization
local useStyle = dependenciesModule.useStyle
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local iconSize = UIBlox.App.Constant.IconSize
local standardButtonSize = UIBlox.App.Button.Enum.StandardButtonSize
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local textKeysModule = require(contactImporter.Common.TextKeys)
local contactsLarge = images["icons/graphic/contacts_large"]

return function(p0)
	-- upvalues: useLocalization (ref), textKeysModule (ref), useStyle (ref), react (ref), imageSetLabel (ref), iconSize (ref), contactsLarge (ref), styledTextLabel (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local openAmpUpsell = p0.openAmpUpsell
	local var3 = not p0.showMatchedContacts
	local var4 = if var3 then 122 else 0
	local isUserInGreenFindFriendsButtonExperiment = p0.isUserInGreenFindFriendsButtonExperiment
	local var5 = useLocalization({
		findFriendsButton = textKeysModule.CONTACTS_FIND_FRIENDS_BUTTON,
		findFriendsDescription = textKeysModule.CONTACTS_FIND_FRIENDS_DESCRIPTION,
		findFriendsDescriptionPV = textKeysModule.CONTACTS_FIND_FRIENDS_DESCRIPTION_PV
	})
	local var6 = useStyle()
	
	return react.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 48),
		LayoutOrder = p0.layoutOrder
	}, {
		UIListLayout = react.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		ImageIcon = react.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.new(0, iconSize.Large, 0, iconSize.Large),
			ScaleType = Enum.ScaleType.Fit,
			Image = contactsLarge,
			ImageTransparency = var6.Theme.SystemPrimaryDefault.Transparency
		}),
		TextFrame = react.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -(var4 + 48 + 12), 0, 48)
		}, {
			textLayout = react.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Description = react.createElement(styledTextLabel, {
				lineHeight = 1,
				text = if var3 then var5.findFriendsDescription else var5.findFriendsDescriptionPV,
				fontStyle = var6.Font.CaptionBody,
				colorStyle = var6.Theme.TextDefault,
				size = UDim2.new(1, 0, 1, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			})
		}),
		ButtonFrame = if var3 then react.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(0, 110, 0, 48),
			AnchorPoint = Vector2.new(1, 0.5)
		}, {
			ButtonLayout = react.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			FindFriendsButton = react.createElement(button, {
				fitContent = false,
				buttonType = if isUserInGreenFindFriendsButtonExperiment then buttonType.PrimaryContextual else buttonType.PrimarySystem,
				standardSize = standardButtonSize.XSmall,
				text = var5.findFriendsButton,
				onActivated = openAmpUpsell
			})
		}) else nil
	})
end