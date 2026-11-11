local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Style = Parent1.App.Style
local RoactModule = require(Parent1.Parent.Roact)
local TModule = require(Parent1.Parent.t)
local StyleContextModule = require(Parent.StyleContext)
local GetTextSizeOffsetModule = require(Parent1.Utility.getTextSizeOffset)
local _ = require(Style.StyleTypes)
local ThemesModule = require(Style.Themes)
local ConstantsModule = require(Style.Constants)
local GetFontFromNameModule = require(Style.Fonts.getFontFromName)
local TokensModule = require(Style.Tokens)
local GetTokensFunction = TokensModule.getTokens
local GetFoundationTokensFunction = TokensModule.getFoundationTokens
local Mappers = TokensModule.Mappers
local Parent2 = Parent1.Parent
local Object = require(Parent2.LuauPolyfill).Object
local EnablePreferredTextSizeSetting = require(Parent2.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting")
local StyleProvider = RoactModule.Component:extend("StyleProvider")
StyleProvider.validateProps = TModule.strictInterface({
	style = TModule.optional((require(Style.Validator.validateStyle))),
	derivedValues = TModule.optional(TModule.table),
	[RoactModule.Children] = TModule.table
})
local config = {
	Theme = ThemesModule.DarkTheme,
	Settings = {
		PreferredTransparency = 1,
		ReducedMotion = false,
		Scale = 1,
		PreferredTextSize = if EnablePreferredTextSizeSetting then Enum.PreferredTextSize.Medium else nil
	}
}
local config1 = { textSizeOffset = 0 }

function StyleProvider.init(p1)
	p1:setState({
		style = p1.props.style,
		derivedValues = p1.props.derivedValues
	})
end

function StyleProvider.updateTextSizeOffset(p1, BodyFont)
	-- upvalues: GetTextSizeOffsetModule (copy)
	local TextSizeOffsetModule, TextSizeOffsetModule2 = GetTextSizeOffsetModule(BodyFont)
	
	if TextSizeOffsetModule then
		p1:setState({
			derivedValues = { textSizeOffset = TextSizeOffsetModule2 }
		})
	end
end

function StyleProvider.didUpdate(p1, _, p2)
	if p2.style and p2.style.Settings.PreferredTextSize ~= p1.state.style.Settings.PreferredTextSize then
		p1:updateTextSizeOffset(p1.state.style.Font.Body.Font)
	end
end

function StyleProvider.render(p1)
	-- upvalues: Object (copy), config (copy), config1 (copy), ThemesModule (copy), ConstantsModule (copy), GetTokensFunction (copy), GetFoundationTokensFunction (copy), Mappers (copy), GetFontFromNameModule (copy), RoactModule (copy), StyleContextModule (copy)
	local AssignResult = Object.assign({}, config, p1.state.style)
	local AssignResult1 = Object.assign({}, config1, p1.state.derivedValues)
	
	if AssignResult.Tokens == nil then
		local Light = if AssignResult.Theme == ThemesModule.LightTheme then ConstantsModule.ThemeName.Light else ConstantsModule.ThemeName.Dark
		local DefaultDeviceType = ConstantsModule.DefaultDeviceType
		local Scale = AssignResult.Settings.Scale
		local Tokens = GetTokensFunction(DefaultDeviceType, Light, Scale)
		local FoundationTokens = GetFoundationTokensFunction(DefaultDeviceType, Light, Scale)
		local MapColorTokensToFoundationResult = Mappers.mapColorTokensToFoundation(Tokens, FoundationTokens)
		AssignResult.Theme = Mappers.mapThemeToFoundation(AssignResult.Theme, FoundationTokens)
		AssignResult.Tokens = Mappers.addFoundationFlatKeys(MapColorTokensToFoundationResult, FoundationTokens)
	end
	if AssignResult.Font == nil then
		AssignResult.Font = GetFontFromNameModule(ConstantsModule.FontName.Gotham, AssignResult.Tokens)
	end
	return RoactModule.createElement(StyleContextModule.Provider, {
		value = {
			style = AssignResult,
			update = function(_, Style)
				-- upvalues: p1 (copy)
				if p1.mounted then
					p1:setState({ style = Style })
				end
			end,
			derivedValues = AssignResult1
		}
	}, RoactModule.oneChild(p1.props[RoactModule.Children]))
end

function StyleProvider.didMount(p1)
	p1.mounted = true
end

function StyleProvider.willUnmount(p1)
	p1.mounted = false
end

return StyleProvider