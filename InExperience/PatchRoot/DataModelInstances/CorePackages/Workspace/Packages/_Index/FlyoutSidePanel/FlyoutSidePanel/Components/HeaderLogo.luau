local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local themeName = foundationModule.Enums.ThemeName
local images = require(parent.FoundationImages).Images
local constantsModule = require(script.Parent.Parent.Constants)
local var1 = images["icons/logo/letterform_classic"].ImageRectSize.X / images["icons/logo/letterform_classic"].ImageRectSize.Y

return function()
	-- upvalues: useTokens (ref), themeName (ref), images (ref), var1 (ref), constantsModule (ref), reactModule (ref), foundationModule (ref)
	local var2 = useTokens()
	local var3 = var2.Config.Theme.Name == themeName.Classic
	local var4 = if var3 then "icons/logo/letterform_classic" else "icons/logo/letterform"
	local var5 = if var3 then images[var4] else nil
	local size500 = var2.Size.Size_500
	local var6 = if var3 then Vector2.new(30 * var2.Config.UI.Scale * var1, 30 * var2.Config.UI.Scale) else Vector2.new(size500 * constantsModule.ROBLOX_LOGO_ASPECT_RATIO, size500)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		TitleOrRobloxLogoFrame = reactModule.createElement(foundationModule.Image, {
			LayoutOrder = 2,
			tag = "size-full-full",
			AnchorPoint = Vector2.zero,
			Image = if var5 then var5.Image else var4,
			imageRect = if var5 then { offset = var5.ImageRectOffset, size = var5.ImageRectSize } else nil,
			imageStyle = if var3 then nil else var2.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(var6.X, var6.Y)
		})
	})
end