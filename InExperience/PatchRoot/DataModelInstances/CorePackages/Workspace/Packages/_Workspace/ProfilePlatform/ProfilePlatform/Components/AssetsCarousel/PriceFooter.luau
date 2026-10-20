local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagProfilePlatformFixResaleLimitedPriceModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFixResaleLimitedPrice)
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), FFlagProfilePlatformFixResaleLimitedPriceModule (copy), ReactModule (copy), ImageSetLabel (copy), IconsCommonRobux (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.SubHeader1.RelativeSize
	local _Vector2 = Vector2.new(ScaledBaseSize, ScaledBaseSize)
	local UseLocalizationResult = UseLocalizationFunction({
		freeText = TextKeysModule.CatalogLabelFree,
		offSaleText = TextKeysModule.CatalogLabelOffSale
	})
	local Text = nil
	local Flag = false
	
	if p1.isOffSale then
		if FFlagProfilePlatformFixResaleLimitedPriceModule and p1.lowestResalePrice and p1.lowestResalePrice > 0 then
			Text = tostring(p1.lowestResalePrice)
			Flag = true
		else
			Text = UseLocalizationResult.offSaleText
		end
	elseif p1.price == 0 then
		Text = UseLocalizationResult.freeText
	elseif p1.price then
		Text = tostring(p1.price)
		Flag = true
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20),
		Position = UDim2.fromOffset(0, -4)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 4)
		}),
		Icon = if Flag then ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Image = IconsCommonRobux,
			ImageColor3 = Theme.IconEmphasis.Color,
			ImageTransparency = Theme.IconEmphasis.Transparency,
			Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y)
		}) else nil,
		Text = ReactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, if Flag then -(_Vector2.X + 4) else 0, 1, 0),
			Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.SubHeader1.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.TitleLarge.Font) else nil,
			TextColor3 = Theme.SecondaryContent.Color,
			TextTransparency = Theme.SecondaryContent.Transparency,
			TextSize = ScaledBaseSize,
			Text = Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end