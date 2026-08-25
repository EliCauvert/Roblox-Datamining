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

function ContactsListSearchBar(p0)
	-- upvalues: useLocalization (ref), textKeysModule (ref), useStyle (ref), react (ref), roact (ref), imageSetLabel (ref), iconSize (ref), search (ref), callbackInputBox (ref), clearSmall (ref)
	local var3 = useLocalization({ searchContacts = textKeysModule.SEARCH_CONTACTS })
	local var4 = useStyle()
	local var5, var6 = react.useState(false)
	
	return roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = var4.Theme.BackgroundMuted.Transparency,
		BackgroundColor3 = var4.Theme.BackgroundMuted.Color,
		Size = UDim2.new(1, 0, 0, p0.height),
		LayoutOrder = p0.layoutOrder
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
			Color = if var5 then var4.Theme.SecondaryOnHover.Color else var4.Theme.Divider.Color,
			Transparency = if var5 then var4.Theme.SecondaryOnHover.Transparency else var4.Theme.Divider.Transparency
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
			ImageColor3 = var4.Theme.IconEmphasis.Color
		}),
		searchBarWrapper = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -iconSize.Small, 0, p0.height)
		}, {
			searchBar = roact.createElement(callbackInputBox, {
				clearButtonDisabled = false,
				clearIcon = clearSmall,
				clearIconColor3 = var4.Theme.IconEmphasis.Color,
				clearIconTransparency = var4.Theme.IconEmphasis.Transparency,
				clearButtonSize = iconSize.Small,
				focusChangedCallback = var6,
				inputTextColor3 = var4.Theme.TextEmphasis.Color,
				inputTextTransparency = var4.Theme.TextEmphasis.Transparency,
				placeholderText = var3.searchContacts,
				placeholderTextColor3 = var4.Theme.TextMuted.Color,
				placeholderTextTransparency = var4.Theme.TextMuted.Transparency,
				inputTextXAlignment = Enum.TextXAlignment.Left,
				textChangedCallback = p0.textChangeCallback
			})
		})
	})
end

return ContactsListSearchBar