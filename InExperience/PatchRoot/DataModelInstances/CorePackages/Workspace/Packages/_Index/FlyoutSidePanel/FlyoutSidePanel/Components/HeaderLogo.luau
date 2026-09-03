local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local themeName = foundationModule.Enums.ThemeName
local luaAppsEnableDynamicLogoWidth = game:DefineFastFlag("LuaAppsEnableDynamicLogoWidth", false)
local var1 = if luaAppsEnableDynamicLogoWidth then require(parent.FoundationImages).Images else nil
local fFlagLuaAppsEnableClassicWordmark = require(parent.SharedFlags).FFlagLuaAppsEnableClassicWordmark
local fFlagLuaAppsEnableMarkButtonSeqModule = require(script.Parent.Parent.Flags.FFlagLuaAppsEnableMarkButtonSeq)
local fFlagLuaAppsEnableMarkButtonSeqModule_1 = game:DefineFastFlag("LuaAppsMarkButtonStartWithHat", false) and fFlagLuaAppsEnableMarkButtonSeqModule
local var2 = if fFlagLuaAppsEnableMarkButtonSeqModule then require(parent.Style).AppearanceContext else nil
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
local t = {}

local function _(p1)
	-- upvalues: var1 (ref), t (ref)
	local imageRectSize = var1[p1].ImageRectSize
	t[p1] = imageRectSize.X / imageRectSize.Y
end

if luaAppsEnableDynamicLogoWidth then
	local imageRectSize = var1["icons/logo/letterform_classic"].ImageRectSize
	t["icons/logo/letterform_classic"] = imageRectSize.X / imageRectSize.Y
	
	for i, v in { list, list_1 } do
		for i_1, v_1 in v do
			local imageRectSize_1 = var1[v_1].ImageRectSize
			t[v_1] = imageRectSize_1.X / imageRectSize_1.Y
		end
	end
end
return function(p1)
	-- upvalues: useTokens (ref), fFlagLuaAppsEnableMarkButtonSeqModule (ref), reactModule (ref), var2 (ref), fFlagLuaAppsEnableClassicWordmark (ref), themeName (ref), list (ref), list_1 (ref), luaAppsEnableDynamicLogoWidth (ref), var1 (ref), t (ref), vector2 (ref), constantsModule (ref), foundationModule (ref)
	local var3 = useTokens()
	local var4 = if fFlagLuaAppsEnableMarkButtonSeqModule then reactModule.useContext(var2) else nil
	local var5 = false
	
	if fFlagLuaAppsEnableClassicWordmark or fFlagLuaAppsEnableMarkButtonSeqModule then
		local name = var3.Config.Theme.Name
		var5 = if name ~= themeName.Classic then name == themeName.KidsClassic else true
	end
	local var6 = if var4 ~= nil and var4.theme == "light" then list else list_1
	local var7 = 1
	local var8 = nil
	
	if fFlagLuaAppsEnableMarkButtonSeqModule then
		local var9 = reactModule.useRef(0)
		local _ = nil
		local var10, var11 = reactModule.useState(1)
		var7 = var10
		local var12 = var11
		var8 = reactModule.useCallback(function()
			-- upvalues: var9 (ref), var6 (ref), var12 (write), p1 (ref)
			if var9.current < 6 then
				var9.current += 1
				
				if var9.current < #var6 then
					var12(var9.current + 1)
				end
			end
			if var9.current >= 6 and p1.onWordmarkActivated then
				p1.onWordmarkActivated()
			end
		end, { var6, p1.onWordmarkActivated })
	end
	local var13 = fFlagLuaAppsEnableMarkButtonSeqModule and (p1.isSystemThemeEnabled and (p1.onWordmarkActivated ~= nil and not var5))
	local var14 = if var13 then var6[var7] else nil
	local var15 = fFlagLuaAppsEnableClassicWordmark and var5
	local var14_1_1 = var15 or var14 ~= nil
	local var14_1_2 = var15 or var14 ~= nil
	local var16 = var14 or (if var15 then "icons/logo/letterform_classic" else "icons/logo/letterform")
	local var17 = if luaAppsEnableDynamicLogoWidth and var14_1_2 then var1[var16] else nil
	local size500 = var3.Size.Size_500
	local var18 = if luaAppsEnableDynamicLogoWidth and var14_1_2 then Vector2.new(30 * var3.Config.UI.Scale * t[var16], 30 * var3.Config.UI.Scale) elseif var15 or var14 then vector2 * var3.Config.UI.Scale else Vector2.new(size500 * constantsModule.ROBLOX_LOGO_ASPECT_RATIO, size500)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		TitleOrRobloxLogoFrame = reactModule.createElement(foundationModule.Image, {
			LayoutOrder = 2,
			tag = "size-full-full",
			AnchorPoint = if luaAppsEnableDynamicLogoWidth then Vector2.zero else nil,
			Image = if var17 then var17.Image else var16,
			imageRect = if var17 then {
				offset = var17.ImageRectOffset,
				size = var17.ImageRectSize
			} else nil,
			imageStyle = if var14_1_1 then nil else var3.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(var18.X, var18.Y)
		}, {
			WordmarkButton = if var13 then reactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutoButtonColor = false,
				AutoLocalize = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 0.5),
				Selectable = false,
				Size = UDim2.new(1, 0, 0, var3.Size.Size_1200),
				Text = "Roblox",
				TextTransparency = 1,
				[reactModule.Event.Activated] = var8
			}) else nil
		})
	})
end