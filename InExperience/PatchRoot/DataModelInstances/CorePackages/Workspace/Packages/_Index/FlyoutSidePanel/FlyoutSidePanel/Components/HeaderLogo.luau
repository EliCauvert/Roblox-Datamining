local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local themeName = foundationModule.Enums.ThemeName
local luaAppsEnableDynamicLogoWidth = game:DefineFastFlag("LuaAppsEnableDynamicLogoWidth", false)
local var1 = if luaAppsEnableDynamicLogoWidth then require(parent.FoundationImages).Images else nil
local fFlagLuaAppsEnableClassicWordmark = require(parent.SharedFlags).FFlagLuaAppsEnableClassicWordmark
local constantsModule = require(script.Parent.Parent.Constants)
local vector2 = Vector2.new(114, 30)
local var2 = if luaAppsEnableDynamicLogoWidth then var1["icons/logo/letterform_classic"].ImageRectSize.X / var1["icons/logo/letterform_classic"].ImageRectSize.Y else nil

return function()
	-- upvalues: useTokens (ref), fFlagLuaAppsEnableClassicWordmark (ref), themeName (ref), luaAppsEnableDynamicLogoWidth (ref), var1 (ref), var2 (ref), vector2 (ref), constantsModule (ref), reactModule (ref), foundationModule (ref)
	local var3 = useTokens()
	local var4 = if fFlagLuaAppsEnableClassicWordmark then var3.Config.Theme.Name == themeName.Classic else false
	local var5 = if var4 then "icons/logo/letterform_classic" else "icons/logo/letterform"
	local var6 = if luaAppsEnableDynamicLogoWidth and var4 then var1[var5] else nil
	local size500 = var3.Size.Size_500
	local var7 = if luaAppsEnableDynamicLogoWidth and var4 then Vector2.new(30 * var3.Config.UI.Scale * var2, 30 * var3.Config.UI.Scale) elseif var4 then vector2 * var3.Config.UI.Scale else Vector2.new(size500 * constantsModule.ROBLOX_LOGO_ASPECT_RATIO, size500)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		TitleOrRobloxLogoFrame = reactModule.createElement(foundationModule.Image, {
			LayoutOrder = 2,
			tag = "size-full-full",
			AnchorPoint = if luaAppsEnableDynamicLogoWidth then Vector2.zero else nil,
			Image = if var6 then var6.Image else var5,
			imageRect = if var6 then {
				offset = var6.ImageRectOffset,
				size = var6.ImageRectSize
			} else nil,
			imageStyle = if var4 then nil else var3.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(var7.X, var7.Y)
		})
	})
end