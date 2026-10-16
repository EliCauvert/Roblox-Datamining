local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ThemeName = FoundationModule.Enums.ThemeName
local Images = require(Parent.FoundationImages).Images
local ConstantsModule = require(script.Parent.Parent.Constants)
local XRatio = Images["icons/logo/letterform_classic"].ImageRectSize.X / Images["icons/logo/letterform_classic"].ImageRectSize.Y

return function() --[[ Line: 19 | Named "HeaderLogo" ]]
	-- upvalues: UseTokensFunction (copy), ThemeName (copy), Images (copy), XRatio (copy), ConstantsModule (copy), ReactModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local IsNameMatch = UseTokensResult.Config.Theme.Name == ThemeName.Classic
	local LetterformClassic: string = if IsNameMatch then "icons/logo/letterform_classic" else "icons/logo/letterform"
	local Image = if IsNameMatch then Images[LetterformClassic] else nil
	local Size500 = UseTokensResult.Size.Size_500
	local _Vector2: Vector2 = if IsNameMatch then Vector2.new(30 * UseTokensResult.Config.UI.Scale * XRatio, 30 * UseTokensResult.Config.UI.Scale) else Vector2.new(Size500 * ConstantsModule.ROBLOX_LOGO_ASPECT_RATIO, Size500)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		TitleOrRobloxLogoFrame = ReactModule.createElement(FoundationModule.Image, {
			LayoutOrder = 2,
			tag = "size-full-full",
			AnchorPoint = Vector2.zero,
			Image = if Image then Image.Image else LetterformClassic,
			imageRect = if Image then {
				offset = Image.ImageRectOffset,
				size = Image.ImageRectSize
			} else nil,
			imageStyle = if IsNameMatch then nil else UseTokensResult.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y)
		})
	})
end