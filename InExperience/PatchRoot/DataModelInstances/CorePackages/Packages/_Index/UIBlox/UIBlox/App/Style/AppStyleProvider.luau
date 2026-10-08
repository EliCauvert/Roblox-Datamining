local parent = script.Parent
local parent_1 = parent.Parent.Parent
local getTextSizeOffsetModule = require(parent_1.Utility.getTextSizeOffset)
local parent_2 = parent_1.Parent
local cryoModule = require(parent_2.Cryo)
local reactModule = require(parent_2.React)
local roactModule = require(parent_2.Roact)
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
	-- upvalues: object (ref), t_1 (ref), reactModule (ref), getTokens (ref), getThemeFromNameModule (ref), useTokens (ref), getFoundationTokens (ref), cryoModule (ref), mappers (ref), getFontFromNameModule (ref), constantsModule (ref), getTextSizeOffsetModule (ref), styleContextModule (ref), foundationSurfaceTokensDifferModule (ref), roactModule (ref), parent_1 (ref), loggerModule (ref), foundationProvider (ref), t (ref)
	local var1 = object.assign({}, t_1, p1.style)
	local var2, var3 = reactModule.useState(var1.themeName)
	local var4 = getTokens(var1.deviceType, var2, var1.settings and var1.settings.scale)
	local var5, var6 = reactModule.useState(0)
	local var7 = getThemeFromNameModule(var2)
	local var8 = useTokens()
	local var9 = var8.Config ~= nil
	local var10 = getFoundationTokens(var1.deviceType, var2)
	local var11 = mappers.addFoundationFlatKeys(mappers.mapColorTokensToFoundation(var4, if var9 then cryoModule.Dictionary.join(var10, var8) else var10), if var9 then var8 else var10)
	local t_2 = {
		Font = getFontFromNameModule(var1.fontName, var11),
		Theme = mappers.mapThemeToFoundation(var7, if var9 then var8 else var10),
		Tokens = var11,
		Settings = if var1.settings then {
			PreferredTransparency = var1.settings.preferredTransparency,
			ReducedMotion = var1.settings.reducedMotion,
			PreferredTextSize = var1.settings.preferredTextSize,
			Scale = var1.settings.scale
		} else constantsModule.DefaultSettings
	}
	local var12 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var3 (ref), var1 (ref)
		var12.current = true
		var3(var1.themeName)
		
		return function()
			-- upvalues: var12 (copy)
			var12.current = false
		end
	end, { var12, var1.themeName, var3 })
	reactModule.useEffect(function()
		-- upvalues: getTextSizeOffsetModule (copy), var11 (ref), var6 (ref)
		local var13, var14 = getTextSizeOffsetModule(var11.Typography.BodyLarge.Font)
		
		if var13 then
			var6(var14)
		end
	end, { var1.settings.preferredTextSize })
	local var13 = reactModule.createElement(styleContextModule.Provider, {
		value = {
			style = t_2,
			updateTheme = reactModule.useCallback(function(_, p2)
				-- upvalues: var12 (ref), var3 (ref)
				if var12.current then
					var3(p2)
				end
			end, { var12, var3 }),
			derivedValues = { textSizeOffset = var5 },
			styleMetadata = {
				ThemeName = reactModule.useMemo(function()
					-- upvalues: var2 (ref), constantsModule (copy)
					return if var2:lower() == constantsModule.ThemeName.Dark:lower() then constantsModule.ThemeName.Dark elseif var2:lower() == constantsModule.ThemeName.Light:lower() then constantsModule.ThemeName.Light else constantsModule.DefaultThemeName
				end, { var2 }),
				HasSurfaceOverrides = if var9 then foundationSurfaceTokensDifferModule(var10, var8) else false
			}
		}
	}, roactModule.oneChild(p1.children))
	
	if var9 then
		return var13
	elseif _G.ENVIRONMENT ~= "PRODUCTION" then
		local packages = parent_1:FindFirstAncestor("Packages") or parent_1:FindFirstAncestor("CorePackages")
		
		if not (if packages and packages:FindFirstChild("Dev") and packages.Dev:FindFirstChild("JestGlobals") then pcall(require, packages.Dev.JestGlobals) else false) then
			loggerModule:warning(debug.traceback("FoundationProvider not found. Please ensure that the FoundationProvider is present in the component tree."))
		end
	end
	return reactModule.createElement(foundationProvider, {
		theme = t[var2:lower()],
		device = var1.deviceType,
		preferences = var1.settings
	}, var13)
end