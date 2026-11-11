local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local DebounceModule = require(Modules.LuaApp.Util.debounce)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local CryoModule = require(CorePackages.Packages.Cryo)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local MapTypographyVariantToFontEnumFunction = require(CorePackages.Workspace.Packages.Style).mapTypographyVariantToFontEnum
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), MapTypographyVariantToFontEnumFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), UseLocalizationModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), CryoModule (copy), DebounceModule (copy), ImageSetLabel (copy), Images (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2)
		-- upvalues: MapTypographyVariantToFontEnumFunction (upval), FFlagRenameDeprecatedUIBloxTokens (upval)
		return {
			textStyles = {
				Font = MapTypographyVariantToFontEnumFunction(if FFlagRenameDeprecatedUIBloxTokens then p2.Typography.BodyLarge else p2.Semantic.Typography.Body),
				TextSize = if FFlagRenameDeprecatedUIBloxTokens then p2.FontSize.FontSize_500 else p2.Global.FontSize_200,
				TextColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p2.Color.Content.Emphasis else p2.Semantic.Color.Text.Emphasis).Color3,
				TextTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p2.Color.Content.Emphasis else p2.Semantic.Color.Text.Emphasis).Transparency
			},
			Search = p2.LuaApps.Search,
			cornerRadius = if FFlagRenameDeprecatedUIBloxTokens then p2.Radius.Small else p2.Semantic.Radius.Small,
			leftPadding = if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_400 else p2.Global.Space_200,
			backgroundColor = (if FFlagRenameDeprecatedUIBloxTokens then p2.Color.Surface.Surface_0 else p2.Semantic.Color.Background.Default).Color3,
			placeholderColor = (if FFlagRenameDeprecatedUIBloxTokens then p2.Color.Content.Default else p2.Semantic.Color.Text.Default).Color3,
			iconColor = (if FFlagRenameDeprecatedUIBloxTokens then p2.Color.Content.Default else p2.Semantic.Color.Icon.Default).Color3,
			iconTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p2.Color.Content.Default else p2.Semantic.Color.Icon.Default).Transparency
		}
	end)
	local UseLocalizationModuleResult = UseLocalizationModule({ searchPlaceholder = "CommonUI.Controls.Action.Search" })
	local OnSubmitSearchFunction = p1.onSubmitSearch
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(UseDesignTokensResult.Search.SearchHeadingScale, 0, 0, UseDesignTokensResult.Search.SearchBoxHeight),
		Position = UDim2.fromScale(1 - UseDesignTokensResult.Search.SearchHeadingScale, 0),
		LayoutOrder = p1.layoutOrder
	}, {
		SearchBox = ReactModule.createElement("TextBox", CryoModule.Dictionary.join(UseDesignTokensResult.textStyles, {
			ClearTextOnFocus = false,
			Position = UDim2.new(0, 0, 0, 0),
			PlaceholderText = p1.placeholderText or UseLocalizationModuleResult.searchPlaceholder,
			Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Search.SearchBoxHeight),
			Text = "",
			BackgroundColor3 = UseDesignTokensResult.backgroundColor,
			PlaceholderColor3 = UseDesignTokensResult.placeholderColor,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRectNoInset),
			[ReactModule.Event.Focused] = p1.onFocused,
			[ReactModule.Event.FocusLost] = OnSubmitSearchFunction,
			[ReactModule.Change.Text] = DebounceModule(function(p2)
				-- upvalues: OnSubmitSearchFunction (copy)
				OnSubmitSearchFunction(p2)
			end, 0.25),
			ref = p1.textBoxRef
		}), {
			SearchIcon = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				ImageColor3 = UseDesignTokensResult.iconColor,
				ImageTransparency = UseDesignTokensResult.iconTransparency,
				Position = UDim2.new(0, -UseDesignTokensResult.Search.SearchBoxIconSize - UseDesignTokensResult.leftPadding, 0.5, 0),
				Size = UDim2.fromOffset(UseDesignTokensResult.Search.SearchBoxIconSize, UseDesignTokensResult.Search.SearchBoxIconSize),
				Image = Images["icons/common/search"]
			}),
			UICorner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseDesignTokensResult.cornerRadius)
			}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, UseDesignTokensResult.Search.SearchBoxIconPaddingVertical),
				PaddingLeft = UDim.new(0, UseDesignTokensResult.Search.SearchBoxIconPaddingLeft + UseDesignTokensResult.leftPadding),
				PaddingRight = UDim.new(0, UseDesignTokensResult.Search.SearchBoxIconPaddingRight),
				PaddingTop = UDim.new(0, UseDesignTokensResult.Search.SearchBoxIconPaddingVertical)
			})
		})
	})
end