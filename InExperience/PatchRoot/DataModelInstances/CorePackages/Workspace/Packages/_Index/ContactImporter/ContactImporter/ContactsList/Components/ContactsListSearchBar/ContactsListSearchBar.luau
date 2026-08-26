local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local roact = dependenciesModule.Roact
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local socialLibraries = dependenciesModule.SocialLibraries
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local iconSize = UIBlox.App.Constant.IconSize
local callbackInputBox = socialLibraries.Components.CallbackInputBox
local images = UIBlox.App.ImageSet.Images
local textKeysModule = require(contactImporter.Common.TextKeys)
local useStyle = dependenciesModule.useStyle
local useLocalization = dependenciesModule.useLocalization
local search = images["icons/common/search"]
local clearSmall = images["icons/actions/edit/clear_small"]

function ContactsListSearchBar(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), useStyle (ref), react (ref), roact (ref), imageSetLabel (ref), iconSize (ref), search (ref), callbackInputBox (ref), clearSmall (ref)
	local var1 = useLocalization({ searchContacts = textKeysModule.SEARCH_CONTACTS })
	local var2 = useStyle()
	local var3, var4 = react.useState(false)
	
	return roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = var2.Theme.BackgroundMuted.Transparency,
		BackgroundColor3 = var2.Theme.BackgroundMuted.Color,
		Size = UDim2.new(1, 0, 0, p1.height),
		LayoutOrder = p1.layoutOrder
	}, {
		layout = roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		}),
		BorderRadius = roact.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
		Border = react.createElement("UIStroke", {
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = if var3 then var2.Theme.SecondaryOnHover.Color else var2.Theme.Divider.Color,
			Transparency = if var3 then var2.Theme.SecondaryOnHover.Transparency else var2.Theme.Divider.Transparency
		}),
		padding = roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 13),
			PaddingRight = UDim.new(0, 13)
		}),
		icon = roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, iconSize.Small, 0, iconSize.Small),
			Image = search,
			ImageColor3 = var2.Theme.IconEmphasis.Color
		}),
		searchBarWrapper = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -iconSize.Small, 0, p1.height)
		}, {
			searchBar = roact.createElement(callbackInputBox, {
				clearButtonDisabled = false,
				clearIcon = clearSmall,
				clearIconColor3 = var2.Theme.IconEmphasis.Color,
				clearIconTransparency = var2.Theme.IconEmphasis.Transparency,
				clearButtonSize = iconSize.Small,
				focusChangedCallback = var4,
				inputTextColor3 = var2.Theme.TextEmphasis.Color,
				inputTextTransparency = var2.Theme.TextEmphasis.Transparency,
				placeholderText = var1.searchContacts,
				placeholderTextColor3 = var2.Theme.TextMuted.Color,
				placeholderTextTransparency = var2.Theme.TextMuted.Transparency,
				inputTextXAlignment = Enum.TextXAlignment.Left,
				textChangedCallback = p1.textChangeCallback
			})
		})
	})
end

return ContactsListSearchBar