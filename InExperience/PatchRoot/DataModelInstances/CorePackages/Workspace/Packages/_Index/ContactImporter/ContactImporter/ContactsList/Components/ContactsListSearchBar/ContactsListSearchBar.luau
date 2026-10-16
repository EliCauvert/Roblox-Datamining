local ContactImporter = script:FindFirstAncestor("ContactImporter")
local DependenciesModule = require(ContactImporter.dependencies)
local Roact = DependenciesModule.Roact
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local IconSize = UIBlox.App.Constant.IconSize
local CallbackInputBox = DependenciesModule.SocialLibraries.Components.CallbackInputBox
local Images = UIBlox.App.ImageSet.Images
local TextKeysModule = require(ContactImporter.Common.TextKeys)
local UseStyleFunction = DependenciesModule.useStyle
local UseLocalizationFunction = DependenciesModule.useLocalization
local IconsCommonSearch = Images["icons/common/search"]
local IconsActionsEditClearSmall = Images["icons/actions/edit/clear_small"]

function ContactsListSearchBar(p1) --[[ Line: 29 ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), UseStyleFunction (copy), React (copy), Roact (copy), ImageSetLabel (copy), IconSize (copy), IconsCommonSearch (copy), CallbackInputBox (copy), IconsActionsEditClearSmall (copy)
	local UseLocalizationResult = UseLocalizationFunction({ searchContacts = TextKeysModule.SEARCH_CONTACTS })
	local UseStyleResult = UseStyleFunction()
	local UseStateResult, UseStateResult2 = React.useState(false)
	
	return Roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundMuted.Transparency,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundMuted.Color,
		Size = UDim2.new(1, 0, 0, p1.height),
		LayoutOrder = p1.layoutOrder
	}, {
		layout = Roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		}),
		BorderRadius = Roact.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
		Border = React.createElement("UIStroke", {
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = if UseStateResult then UseStyleResult.Theme.SecondaryOnHover.Color else UseStyleResult.Theme.Divider.Color,
			Transparency = if UseStateResult then UseStyleResult.Theme.SecondaryOnHover.Transparency else UseStyleResult.Theme.Divider.Transparency
		}),
		padding = Roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 13),
			PaddingRight = UDim.new(0, 13)
		}),
		icon = Roact.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, IconSize.Small, 0, IconSize.Small),
			Image = IconsCommonSearch,
			ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color
		}),
		searchBarWrapper = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -IconSize.Small, 0, p1.height)
		}, {
			searchBar = Roact.createElement(CallbackInputBox, {
				clearButtonDisabled = false,
				clearIcon = IconsActionsEditClearSmall,
				clearIconColor3 = UseStyleResult.Theme.IconEmphasis.Color,
				clearIconTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
				clearButtonSize = IconSize.Small,
				focusChangedCallback = UseStateResult2,
				inputTextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
				inputTextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
				placeholderText = UseLocalizationResult.searchContacts,
				placeholderTextColor3 = UseStyleResult.Theme.TextMuted.Color,
				placeholderTextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
				inputTextXAlignment = Enum.TextXAlignment.Left,
				textChangedCallback = p1.textChangeCallback
			})
		})
	})
end

return ContactsListSearchBar