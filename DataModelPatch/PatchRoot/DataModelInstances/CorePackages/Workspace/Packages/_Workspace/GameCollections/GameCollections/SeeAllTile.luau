local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local IconsNavigationPushRight = UIBloxModule.App.ImageSet.Images["icons/navigation/pushRight"]

function SeeAllTile(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseLocalizationFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), UseCursorFunction (copy), IconsNavigationPushRight (copy), ReactModule (copy), ImageSetLabel (copy)
	local Size = p1.size
	local LayoutOrder = p1.layoutOrder
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({ seeAll = "Feature.Home.ActionSeeAll" })
	local _UDim = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Space_100)
	local TitleLarge = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.TitleLarge else UseDesignTokensResult.Semantic.Typography.Subheader
	local Size900 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_900 else UseDesignTokensResult.Semantic.Icon.Size.Medium
	
	return ReactModule.createElement("TextButton", {
		AutoButtonColor = false,
		Text = "",
		Size = Size,
		LayoutOrder = LayoutOrder,
		BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_300 else UseDesignTokensResult.Semantic.Color.BackgroundUi.Default).Transparency,
		BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_300 else UseDesignTokensResult.Semantic.Color.BackgroundUi.Default).Color3,
		[ReactModule.Event.Activated] = p1.onActivated,
		SelectionImageObject = UseCursorFunction(_UDim)
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_100 else UseDesignTokensResult.Global.Space_50)
		}),
		Icon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(Size900, Size900),
			Image = p1.icon or IconsNavigationPushRight,
			ImageColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Icon.Emphasis).Color3,
			ImageTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Icon.Emphasis).Transparency
		}),
		Title = ReactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = p1.title or UseLocalizationResult.seeAll,
			Size = UDim2.new(1, 0, 0, TitleLarge.FontSize),
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = TitleLarge.Font,
			TextSize = TitleLarge.FontSize,
			TextColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis).Color3,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end

return SeeAllTile