local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local themeName = foundationModule.Enums.ThemeName
local fFlagLuaAppsEnableClassicWordmark = require(parent.SharedFlags).FFlagLuaAppsEnableClassicWordmark
local fFlagLuaAppsEnableMarkButtonSeqModule = require(script.Parent.Parent.Flags.FFlagLuaAppsEnableMarkButtonSeq)
local fFlagLuaAppsEnableMarkButtonSeqModule_1 = game:DefineFastFlag("LuaAppsMarkButtonStartWithHat", false) and fFlagLuaAppsEnableMarkButtonSeqModule
local var1 = if fFlagLuaAppsEnableMarkButtonSeqModule then require(parent.Style).AppearanceContext else nil
local constantsModule = require(script.Parent.Parent.Constants)
local vector2 = Vector2.new(114, 30)
local list = {
	if fFlagLuaAppsEnableMarkButtonSeqModule_1 then "icons/logo/letterform_light_hat" else "icons/logo/letterform_light",
	"icons/logo/letterform_light_01", "icons/logo/letterform_light_02",
	"icons/logo/letterform_light_03", "icons/logo/letterform_light_04",
	"icons/logo/letterform_light_05", "icons/logo/letterform_light_06"
}
local list_1 = {
	if fFlagLuaAppsEnableMarkButtonSeqModule_1 then "icons/logo/letterform_dark_hat" else "icons/logo/letterform_dark",
	"icons/logo/letterform_dark_01", "icons/logo/letterform_dark_02",
	"icons/logo/letterform_dark_03", "icons/logo/letterform_dark_04",
	"icons/logo/letterform_dark_05", "icons/logo/letterform_dark_06"
}

return function(p1)
	-- upvalues: useTokens (ref), fFlagLuaAppsEnableMarkButtonSeqModule (ref), reactModule (ref), var1 (ref), fFlagLuaAppsEnableClassicWordmark (ref), themeName (ref), list (ref), list_1 (ref), vector2 (ref), constantsModule (ref), foundationModule (ref)
	local var2 = useTokens()
	local var3 = if fFlagLuaAppsEnableMarkButtonSeqModule then reactModule.useContext(var1) else nil
	local var4 = false
	
	if fFlagLuaAppsEnableClassicWordmark or fFlagLuaAppsEnableMarkButtonSeqModule then
		local name = var2.Config.Theme.Name
		var4 = if name ~= themeName.Classic then name == themeName.KidsClassic else true
	end
	local var5 = if var3 ~= nil and var3.theme == "light" then list else list_1
	local var6 = 1
	local var7 = nil
	
	if fFlagLuaAppsEnableMarkButtonSeqModule then
		local var8 = reactModule.useRef(0)
		local _ = nil
		local var9, var10 = reactModule.useState(1)
		var6 = var9
		local var11 = var10
		var7 = reactModule.useCallback(function()
			-- upvalues: var8 (ref), var5 (ref), var11 (write), p1 (ref)
			if var8.current < 6 then
				var8.current += 1
				
				if var8.current < #var5 then
					var11(var8.current + 1)
				end
			end
			if var8.current >= 6 and p1.onWordmarkActivated then
				p1.onWordmarkActivated()
			end
		end, { var5, p1.onWordmarkActivated })
	end
	local var12 = fFlagLuaAppsEnableMarkButtonSeqModule and (p1.isSystemThemeEnabled and (p1.onWordmarkActivated ~= nil and not var4))
	local var13 = if var12 then var5[var6] else nil
	local var14 = fFlagLuaAppsEnableClassicWordmark and var4
	local var11_1_1 = var14 or var13 ~= nil
	local size500 = var2.Size.Size_500
	local var15 = if var14 or var13 then vector2 * var2.Config.UI.Scale else Vector2.new(size500 * constantsModule.ROBLOX_LOGO_ASPECT_RATIO, size500)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		TitleOrRobloxLogoFrame = reactModule.createElement(foundationModule.Image, {
			LayoutOrder = 2,
			tag = "size-full-full",
			Image = var13 or (if var14 then "icons/logo/letterform_classic" else "icons/logo/letterform"),
			imageStyle = if var11_1_1 then nil else var2.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(var15.X, var15.Y)
		}, {
			WordmarkButton = if var12 then reactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutoButtonColor = false,
				AutoLocalize = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 0.5),
				Selectable = false,
				Size = UDim2.new(1, 0, 0, var2.Size.Size_1200),
				Text = "Roblox",
				TextTransparency = 1,
				[reactModule.Event.Activated] = var7
			}) else nil
		})
	})
end