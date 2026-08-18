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
local getTokens = tokensModule.getTokens
local validateTokens = tokensModule.validateTokens
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
	-- upvalues: object (ref), t_1 (ref), reactModule (ref), getTokens (ref), getThemeFromNameModule (ref), useTokens (ref), getFoundationTokens (ref), cryoModule (ref), mappers (ref), validateTokens (ref), getFontFromNameModule (ref), constantsModule (ref), getTextSizeOffsetModule (ref), styleContextModule (ref), foundationSurfaceTokensDifferModule (ref), roactModule (ref), var5 (ref), loggerModule (ref), foundationProvider (ref), t (ref)
	local var16 = object.assign({}, t_1, p0.style)
	local var17, var18 = reactModule.useState(var16.themeName)
	local var19 = getTokens(var16.deviceType, var17, var16.settings and var16.settings.scale)
	local var20, var21 = reactModule.useState(0)
	local var22 = getThemeFromNameModule(var17)
	local var23 = useTokens()
	local var24 = var23.Config ~= nil
	local var25 = getFoundationTokens(var16.deviceType, var17)
	local var26 = mappers.mapColorTokensToFoundation(var19, if var24 then cryoModule.Dictionary.join(var25, var23) else var25)
	local var27 = mappers.mapThemeToFoundation(var22, if var24 then var23 else var25)
	assert(validateTokens(var26), "Invalid tokens!")
	var26 = mappers.addFoundationFlatKeys(var26, if var24 then var23 else var25)
	local t_2 = {
		Font = getFontFromNameModule(var16.fontName, var26),
		Theme = var27,
		Tokens = var26,
		Settings = if var16.settings then {
			PreferredTransparency = var16.settings.preferredTransparency,
			ReducedMotion = var16.settings.reducedMotion,
			PreferredTextSize = var16.settings.preferredTextSize,
			Scale = var16.settings.scale
		} else constantsModule.DefaultSettings
	}
	local var29 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 128 ]]
		-- upvalues: var29 (ref), var18 (ref), var16 (ref)
		var29.current = true
		var18(var16.themeName)
		
		return function() --[[ line: 131 ]]
			-- upvalues: var29 (copy)
			var29.current = false
		end
	end, { var29, var16.themeName, var18 })
	reactModule.useEffect(function() --[[ line: 136 ]]
		-- upvalues: getTextSizeOffsetModule (copy), var26 (ref), var21 (ref)
		local var31, var32 = getTextSizeOffsetModule(var26.Semantic.Typography.Body.Font)
		
		if var31 then
			var21(var32)
		end
	end, { var16.settings.preferredTextSize })
	local var30 = reactModule.createElement(styleContextModule.Provider, {
		value = {
			style = t_2,
			updateTheme = reactModule.useCallback(function(_, p1) --[[ line: 143 ]]
				-- upvalues: var29 (ref), var18 (ref)
				if var29.current then
					var18(p1)
				end
			end, { var29, var18 }),
			derivedValues = { textSizeOffset = var20 },
			styleMetadata = {
				ThemeName = reactModule.useMemo(function() --[[ line: 149 ]]
					-- upvalues: var17 (ref), constantsModule (copy)
					return if var17:lower() == constantsModule.ThemeName.Dark:lower() then constantsModule.ThemeName.Dark elseif var17:lower() == constantsModule.ThemeName.Light:lower() then constantsModule.ThemeName.Light else constantsModule.DefaultThemeName
				end, { var17 }),
				HasSurfaceOverrides = if var24 then foundationSurfaceTokensDifferModule(var25, var23) else false
			}
		}
	}, roactModule.oneChild(p0.children))
	
	if var24 then
		return var30
	elseif not var5 and _G.__DEV__ then
		loggerModule:warning(debug.traceback("FoundationProvider not found. Please ensure that the FoundationProvider is present in the component tree."))
	end
	return reactModule.createElement(foundationProvider, {
		theme = t[var17:lower()],
		device = var16.deviceType,
		preferences = var16.settings
	}, var30)
end