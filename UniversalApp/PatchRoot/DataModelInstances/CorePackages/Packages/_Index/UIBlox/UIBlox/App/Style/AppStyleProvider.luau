local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local GetTextSizeOffsetModule = require(Parent1.Utility.getTextSizeOffset)
local Parent2 = Parent1.Parent
local CryoModule = require(Parent2.Cryo)
local ReactModule = require(Parent2.React)
local RoactModule = require(Parent2.Roact)
local FoundationModule = require(Parent2.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Object = require(Parent2.LuauPolyfill).Object
local GetThemeFromNameModule = require(Parent.Themes.getThemeFromName)
local GetFontFromNameModule = require(Parent.Fonts.getFontFromName)
local ConstantsModule = require(Parent.Constants)
local _ = require(script.Parent.StyleTypes)
local TokensModule = require(script.Parent.Tokens)
local StyleContextModule = require(Parent1.Core.Style.StyleContext)
local LoggerModule = require(Parent1.Logger)
local GetTokensFunction = TokensModule.getTokens
local GetFoundationTokensFunction = TokensModule.getFoundationTokens
local Mappers = TokensModule.Mappers
local FoundationSurfaceTokensDifferModule = require(script.Parent.foundationSurfaceTokensDiffer)
local config = {
	dark = FoundationModule.Enums.Theme.Dark,
	light = FoundationModule.Enums.Theme.Light
}
local config1 = {
	themeName = ConstantsModule.DefaultThemeName,
	fontName = ConstantsModule.DefaultFontName,
	deviceType = ConstantsModule.DefaultDeviceType,
	settings = ConstantsModule.DefaultSettings
}

return function(p1)
	-- upvalues: Object (copy), config1 (copy), ReactModule (copy), GetTokensFunction (copy), GetThemeFromNameModule (copy), UseTokensFunction (copy), GetFoundationTokensFunction (copy), CryoModule (copy), Mappers (copy), GetFontFromNameModule (copy), ConstantsModule (copy), GetTextSizeOffsetModule (copy), StyleContextModule (copy), FoundationSurfaceTokensDifferModule (copy), RoactModule (copy), Parent1 (copy), LoggerModule (copy), FoundationProvider (copy), config (copy)
	local AssignResult = Object.assign({}, config1, p1.style)
	local UseStateResult, UseStateResult2 = ReactModule.useState(AssignResult.themeName)
	local Tokens = GetTokensFunction(AssignResult.deviceType, UseStateResult, AssignResult.settings and AssignResult.settings.scale)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local ThemeFromNameModule = GetThemeFromNameModule(UseStateResult)
	local UseTokensResult = UseTokensFunction()
	local HasConfig = UseTokensResult.Config ~= nil
	local FoundationTokens = GetFoundationTokensFunction(AssignResult.deviceType, UseStateResult)
	local AddFoundationFlatKeysResult = Mappers.addFoundationFlatKeys(Mappers.mapColorTokensToFoundation(Tokens, if HasConfig then CryoModule.Dictionary.join(FoundationTokens, UseTokensResult) else FoundationTokens), if HasConfig then UseTokensResult else FoundationTokens)
	local Style = {
		Font = GetFontFromNameModule(AssignResult.fontName, AddFoundationFlatKeysResult),
		Theme = Mappers.mapThemeToFoundation(ThemeFromNameModule, if HasConfig then UseTokensResult else FoundationTokens),
		Tokens = AddFoundationFlatKeysResult,
		Settings = if AssignResult.settings then {
			PreferredTransparency = AssignResult.settings.preferredTransparency,
			ReducedMotion = AssignResult.settings.reducedMotion,
			PreferredTextSize = AssignResult.settings.preferredTextSize,
			Scale = AssignResult.settings.scale
		} else ConstantsModule.DefaultSettings
	}
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), AssignResult (copy)
		UseRefResult.current = true
		UseStateResult2(AssignResult.themeName)
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, { UseRefResult, AssignResult.themeName, UseStateResult2 })
	ReactModule.useEffect(function()
		-- upvalues: GetTextSizeOffsetModule (upval), AddFoundationFlatKeysResult (copy), UseStateResult2_1 (copy)
		local TextSizeOffsetModule, TextSizeOffsetModule2 = GetTextSizeOffsetModule(AddFoundationFlatKeysResult.Typography.BodyLarge.Font)
		
		if TextSizeOffsetModule then
			UseStateResult2_1(TextSizeOffsetModule2)
		end
	end, { AssignResult.settings.preferredTextSize })
	local Element = ReactModule.createElement(StyleContextModule.Provider, {
		value = {
			style = Style,
			updateTheme = ReactModule.useCallback(function(_, p2)
				-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
				if UseRefResult.current then
					UseStateResult2(p2)
				end
			end, { UseRefResult, UseStateResult2 }),
			derivedValues = { textSizeOffset = UseStateResult1 },
			styleMetadata = {
				ThemeName = ReactModule.useMemo(function()
					-- upvalues: UseStateResult (copy), ConstantsModule (upval)
					return if UseStateResult:lower() == ConstantsModule.ThemeName.Dark:lower() then ConstantsModule.ThemeName.Dark elseif UseStateResult:lower() == ConstantsModule.ThemeName.Light:lower() then ConstantsModule.ThemeName.Light else ConstantsModule.DefaultThemeName
				end, { UseStateResult }),
				HasSurfaceOverrides = if HasConfig then FoundationSurfaceTokensDifferModule(FoundationTokens, UseTokensResult) else false
			}
		}
	}, RoactModule.oneChild(p1.children))
	
	if HasConfig then
		return Element
	end
	if _G.ENVIRONMENT ~= "PRODUCTION" and (_G.ENVIRONMENT == "DEVELOPMENT" or _G.__DEV__) then
		local Packages = Parent1:FindFirstAncestor("Packages") or Parent1:FindFirstAncestor("CorePackages")
		
		if not (if Packages and Packages:FindFirstChild("Dev") and Packages.Dev:FindFirstChild("JestGlobals") then pcall(require, Packages.Dev.JestGlobals) else false) then
			LoggerModule:warning(debug.traceback("FoundationProvider not found. Please ensure that the FoundationProvider is present in the component tree."))
		end
	end
	return ReactModule.createElement(FoundationProvider, {
		theme = config[UseStateResult:lower()],
		device = AssignResult.deviceType,
		preferences = AssignResult.settings
	}, Element)
end