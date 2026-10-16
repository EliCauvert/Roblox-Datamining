local parent = script.Parent
local parent_1 = parent.Parent.Parent
local getTextSizeOffsetModule = require(parent_1.Utility.getTextSizeOffset)
local parent_2 = parent_1.Parent
local cryoModule = require(parent_2.Cryo)
local reactModule = require(parent_2.React)
local roactModule = require(parent_2.Roact)
local packages = parent_1:FindFirstAncestor("Packages") or parent_1:FindFirstAncestor("CorePackages")
local var1 = if packages and packages:FindFirstChild("Dev") and packages.Dev:FindFirstChild("JestGlobals") then pcall(require, packages.Dev.JestGlobals) else false
local foundationModule = require(parent_2.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local useTokens = foundationModule.Hooks.useTokens
local object = require(parent_2.LuauPolyfill).Object
local getThemeFromNameModule = require(parent.Themes.getThemeFromName)
local getFontFromNameModule = require(parent.Fonts.getFontFromName)
local constantsModule = require(parent.Constants)
local _ = require(script.Parent.StyleTypes)
local tokensModule = require(script.Parent.Tokens)
local styleContextModule = require(parent_1.Core.Style.StyleContext)
local loggerModule = require(parent_1.Logger)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local getTokens = tokensModule.getTokens
local getFoundationTokens = tokensModule.getFoundationTokens
local mappers = tokensModule.Mappers
local foundationSurfaceTokensDifferModule = require(script.Parent.foundationSurfaceTokensDiffer)
local t = {
	dark = foundationModule.Enums.Theme.Dark,
	light = foundationModule.Enums.Theme.Light
}
local t_1 = {
	themeName = constantsModule.DefaultThemeName,
	fontName = constantsModule.DefaultFontName,
	deviceType = constantsModule.DefaultDeviceType,
	settings = constantsModule.DefaultSettings
}

return function(p1)
	-- upvalues: object (ref), t_1 (ref), reactModule (ref), getTokens (ref), getThemeFromNameModule (ref), useTokens (ref), getFoundationTokens (ref), cryoModule (ref), mappers (ref), getFontFromNameModule (ref), constantsModule (ref), getTextSizeOffsetModule (ref), UIBloxConfigModule (ref), styleContextModule (ref), foundationSurfaceTokensDifferModule (ref), roactModule (ref), var1 (ref), loggerModule (ref), foundationProvider (ref), t (ref)
	local var2 = object.assign({}, t_1, p1.style)
	local var3, var4 = reactModule.useState(var2.themeName)
	local var5 = getTokens(var2.deviceType, var3, var2.settings and var2.settings.scale)
	local var6, var7 = reactModule.useState(0)
	local var8 = getThemeFromNameModule(var3)
	local var9 = useTokens()
	local var10 = var9.Config ~= nil
	local var11 = getFoundationTokens(var2.deviceType, var3)
	local var12 = mappers.addFoundationFlatKeys(mappers.mapColorTokensToFoundation(var5, if var10 then cryoModule.Dictionary.join(var11, var9) else var11), if var10 then var9 else var11)
	local t_2 = {
		Font = getFontFromNameModule(var2.fontName, var12),
		Theme = mappers.mapThemeToFoundation(var8, if var10 then var9 else var11),
		Tokens = var12,
		Settings = if var2.settings then {
			PreferredTransparency = var2.settings.preferredTransparency,
			ReducedMotion = var2.settings.reducedMotion,
			PreferredTextSize = var2.settings.preferredTextSize,
			Scale = var2.settings.scale
		} else constantsModule.DefaultSettings
	}
	local var13 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var4 (ref), var2 (ref)
		var13.current = true
		var4(var2.themeName)
		
		return function()
			-- upvalues: var13 (copy)
			var13.current = false
		end
	end, { var13, var2.themeName, var4 })
	reactModule.useEffect(function()
		-- upvalues: getTextSizeOffsetModule (copy), UIBloxConfigModule (copy), var12 (ref), var7 (ref)
		local var14, var15 = getTextSizeOffsetModule(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var12.Typography.BodyLarge.Font else var12.Semantic.Typography.Body.Font)
		
		if var14 then
			var7(var15)
		end
	end, { var2.settings.preferredTextSize })
	local var14 = reactModule.createElement(styleContextModule.Provider, {
		value = {
			style = t_2,
			updateTheme = reactModule.useCallback(function(_, p2)
				-- upvalues: var13 (ref), var4 (ref)
				if var13.current then
					var4(p2)
				end
			end, { var13, var4 }),
			derivedValues = { textSizeOffset = var6 },
			styleMetadata = {
				ThemeName = reactModule.useMemo(function()
					-- upvalues: var3 (ref), constantsModule (copy)
					return if var3:lower() == constantsModule.ThemeName.Dark:lower() then constantsModule.ThemeName.Dark elseif var3:lower() == constantsModule.ThemeName.Light:lower() then constantsModule.ThemeName.Light else constantsModule.DefaultThemeName
				end, { var3 }),
				HasSurfaceOverrides = if var10 then foundationSurfaceTokensDifferModule(var11, var9) else false
			}
		}
	}, roactModule.oneChild(p1.children))
	
	if var10 then
		return var14
	elseif not var1 and _G.__DEV__ then
		loggerModule:warning(debug.traceback("FoundationProvider not found. Please ensure that the FoundationProvider is present in the component tree."))
	end
	return reactModule.createElement(foundationProvider, {
		theme = t[var3:lower()],
		device = var2.deviceType,
		preferences = var2.settings
	}, var14)
end