local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Images = require(Parent.FoundationImages).Images
local FFlagThemeAssetsFromTokens = require(Parent.SharedFlags).FFlagThemeAssetsFromTokens
local ThemeName = if FFlagThemeAssetsFromTokens then nil else FoundationModule.Enums.ThemeName
local ConstantsModule = if FFlagThemeAssetsFromTokens then nil else require(script.Parent.Parent.Constants)
local Letterform = if FFlagThemeAssetsFromTokens then nil else "icons/logo/letterform"
local LetterformClassic = if FFlagThemeAssetsFromTokens then nil else "icons/logo/letterform_classic"
local v1 = if FFlagThemeAssetsFromTokens then nil else 30
local XRatio = if FFlagThemeAssetsFromTokens then nil else Images[LetterformClassic].ImageRectSize.X / Images[LetterformClassic].ImageRectSize.Y

return function()
	-- upvalues: UseTokensFunction (copy), FFlagThemeAssetsFromTokens (copy), Images (copy), ReactModule (copy), FoundationModule (copy), ThemeName (copy), LetterformClassic (copy), Letterform (copy), v1 (copy), XRatio (copy), ConstantsModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	if not FFlagThemeAssetsFromTokens then
		local IsNameMatch = UseTokensResult.Config.Theme.Name == ThemeName.Classic
		local LetterformClassic1 = if IsNameMatch then LetterformClassic else Letterform
		local Image1 = if IsNameMatch then Images[LetterformClassic1] else nil
		local Size500 = UseTokensResult.Size.Size_500
		local _Vector2: Vector2 = if IsNameMatch then Vector2.new(v1 * UseTokensResult.Config.UI.Scale * XRatio, v1 * UseTokensResult.Config.UI.Scale) else Vector2.new(Size500 * ConstantsModule.ROBLOX_LOGO_ASPECT_RATIO, Size500)
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			TitleOrRobloxLogoFrame = ReactModule.createElement(FoundationModule.Image, {
				LayoutOrder = 2,
				tag = "size-full-full",
				testId = "--core-ui-flyout-header-logo",
				AnchorPoint = Vector2.zero,
				Image = if Image1 then Image1.Image else LetterformClassic1,
				imageRect = if Image1 then {
					offset = Image1.ImageRectOffset,
					size = Image1.ImageRectSize
				} else nil,
				imageStyle = if IsNameMatch then nil else UseTokensResult.Color.Content.Emphasis,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y)
			})
		})
	end
	local Wordmark = UseTokensResult.Assets.Wordmark
	local Image = Images[Wordmark.Image]
	
	if Image and Image.ImageRectSize then
		local ImageRectSize = Image.ImageRectSize
		
		return ReactModule.createElement(FoundationModule.Image, {
			LayoutOrder = 2,
			tag = "size-full-full",
			testId = "--core-ui-flyout-header-logo",
			AnchorPoint = Vector2.zero,
			Image = Wordmark.Image,
			imageStyle = if Wordmark.Tinted then UseTokensResult.Color.Content.Emphasis else nil,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(Wordmark.Height * ImageRectSize.X / ImageRectSize.Y, Wordmark.Height)
		})
	else
		return nil
	end
end