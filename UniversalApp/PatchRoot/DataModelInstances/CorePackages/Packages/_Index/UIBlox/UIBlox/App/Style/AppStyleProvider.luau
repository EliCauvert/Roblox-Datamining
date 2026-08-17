local parent = script.Parent
local parent_1 = parent.Parent.Parent
local getTextSizeOffsetModule = require(parent_1.Utility.getTextSizeOffset)
local parent_2 = parent_1.Parent
local cryoModule = require(parent_2.Cryo)
local reactModule = require(parent_2.React)
local roactModule = require(parent_2.Roact)
local packages = parent_1:FindFirstAncestor("Packages") or parent_1:FindFirstAncestor("CorePackages")
local var5 = if packages and packages:FindFirstChild("Dev") and packages.Dev:FindFirstChild("JestGlobals") then pcall(require, packages.Dev.JestGlobals) else false
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

return function(p0) --[[ line: 84 | named "AppStyleProvider" ]]
	-- upvalues: object (ref), t_1 (ref), reactModule (ref), getTokens (ref), getThemeFromNameModule (ref), useTokens (ref), getFoundationTokens (ref), cryoModule (ref), mappers (ref), getFontFromNameModule (ref), constantsModule (ref), getTextSizeOffsetModule (ref), UIBloxConfigModule (ref), styleContextModule (ref), foundationSurfaceTokensDifferModule (ref), roactModule (ref), var5 (ref), loggerModule (ref), foundationProvider (ref), t (ref)
	local var17 = object.assign({}, t_1, p0.style)
	local var18, var19 = reactModule.useState(var17.themeName)
	local var20 = getTokens(var17.deviceType, var18, var17.settings and var17.settings.scale)
	local var21, var22 = reactModule.useState(0)
	local var23 = getThemeFromNameModule(var18)
	local var24 = useTokens()
	local var25 = var24.Config ~= nil
	local var26 = getFoundationTokens(var17.deviceType, var18)
	local var27 = mappers.addFoundationFlatKeys(mappers.mapColorTokensToFoundation(var20, if var25 then cryoModule.Dictionary.join(var26, var24) else var26), if var25 then var24 else var26)
	local t_2 = {
		Font = getFontFromNameModule(var17.fontName, var27),
		Theme = mappers.mapThemeToFoundation(var23, if var25 then var24 else var26),
		Tokens = var27,
		Settings = if var17.settings then {
			PreferredTransparency = var17.settings.preferredTransparency,
			ReducedMotion = var17.settings.reducedMotion,
			PreferredTextSize = var17.settings.preferredTextSize,
			Scale = var17.settings.scale
		} else constantsModule.DefaultSettings
	}
	local var29 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 127 ]]
		-- upvalues: var29 (ref), var19 (ref), var17 (ref)
		var29.current = true
		var19(var17.themeName)
		
		return function() --[[ line: 130 ]]
			-- upvalues: var29 (copy)
			var29.current = false
		end
	end, { var29, var17.themeName, var19 })
	reactModule.useEffect(function() --[[ line: 135 ]]
		-- upvalues: getTextSizeOffsetModule (copy), UIBloxConfigModule (copy), var27 (ref), var22 (ref)
		local var31, var32 = getTextSizeOffsetModule(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var27.Typography.BodyLarge.Font else var27.Semantic.Typography.Body.Font)
		
		if var31 then
			var22(var32)
		end
	end, { var17.settings.preferredTextSize })
	local var30 = reactModule.createElement(styleContextModule.Provider, {
		value = {
			style = t_2,
			updateTheme = reactModule.useCallback(function(_, p1) --[[ line: 146 ]]
				-- upvalues: var29 (ref), var19 (ref)
				if var29.current then
					var19(p1)
				end
			end, { var29, var19 }),
			derivedValues = { textSizeOffset = var21 },
			styleMetadata = {
				ThemeName = reactModule.useMemo(function() --[[ line: 152 ]]
					-- upvalues: var18 (ref), constantsModule (copy)
					return if var18:lower() == constantsModule.ThemeName.Dark:lower() then constantsModule.ThemeName.Dark elseif var18:lower() == constantsModule.ThemeName.Light:lower() then constantsModule.ThemeName.Light else constantsModule.DefaultThemeName
				end, { var18 }),
				HasSurfaceOverrides = if var25 then foundationSurfaceTokensDifferModule(var26, var24) else false
			}
		}
	}, roactModule.oneChild(p0.children))
	
	if var25 then
		return var30
	elseif not var5 and _G.__DEV__ then
		loggerModule:warning(debug.traceback("FoundationProvider not found. Please ensure that the FoundationProvider is present in the component tree."))
	end
	return reactModule.createElement(foundationProvider, {
		theme = t[var18:lower()],
		device = var17.deviceType,
		preferences = var17.settings
	}, var30)
end