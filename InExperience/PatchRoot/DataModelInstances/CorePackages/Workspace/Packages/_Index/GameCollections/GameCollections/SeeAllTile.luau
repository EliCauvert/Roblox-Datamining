local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local IconsNavigationPushRight = UIBloxModule.App.ImageSet.Images["icons/navigation/pushRight"]

function SeeAllTile(p1) --[[ Line: 30 ]]
	-- upvalues: UseDesignTokensFunction (copy), UseLocalizationFunction (copy), UseCursorFunction (copy), IconsNavigationPushRight (copy), ReactModule (copy), ImageSetLabel (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local Size = p1.size
	local LayoutOrder = p1.layoutOrder
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({ seeAll = "Feature.Home.ActionSeeAll" })
	local _UDim = UDim.new(0, UseDesignTokensResult.Size.Size_200)
	local TitleLarge = UseDesignTokensResult.Typography.TitleLarge
	local Size900 = UseDesignTokensResult.Size.Size_900
	
	return ReactModule.createElement("TextButton", {
		AutoButtonColor = false,
		Text = "",
		Size = Size,
		LayoutOrder = LayoutOrder,
		BackgroundTransparency = UseDesignTokensResult.Color.Surface.Surface_300.Transparency,
		BackgroundColor3 = UseDesignTokensResult.Color.Surface.Surface_300.Color3,
		[ReactModule.Event.Activated] = p1.onActivated,
		SelectionImageObject = UseCursorFunction(_UDim)
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseDesignTokensResult.Size.Size_100)
		}),
		Icon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(Size900, Size900),
			Image = p1.icon or IconsNavigationPushRight,
			ImageColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
			ImageTransparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency
		}),
		Title = ReactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = p1.title or UseLocalizationResult.seeAll,
			Size = UDim2.new(1, 0, 0, TitleLarge.FontSize),
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = if FoundationFontFaceMigration then nil else TitleLarge.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TitleLarge.Font) else nil,
			TextSize = TitleLarge.FontSize,
			TextColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end

return SeeAllTile