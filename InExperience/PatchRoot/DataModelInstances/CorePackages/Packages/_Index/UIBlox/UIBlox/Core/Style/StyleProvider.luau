local parent = script.Parent
local parent_1 = parent.Parent.Parent
local style = parent_1.App.Style
local roactModule = require(parent_1.Parent.Roact)
local tModule = require(parent_1.Parent.t)
local validateStyleModule = require(style.Validator.validateStyle)
local styleContextModule = require(parent.StyleContext)
local getTextSizeOffsetModule = require(parent_1.Utility.getTextSizeOffset)
local _ = require(style.StyleTypes)
local themesModule = require(style.Themes)
local constantsModule = require(style.Constants)
local getFontFromNameModule = require(style.Fonts.getFontFromName)
local tokensModule = require(style.Tokens)
local getTokens = tokensModule.getTokens
local getFoundationTokens = tokensModule.getFoundationTokens
local mappers = tokensModule.Mappers
local parent_2 = parent_1.Parent
local object = require(parent_2.LuauPolyfill).Object
local var1 = require(parent_2.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting")
local styleProvider = roactModule.Component:extend("StyleProvider")
styleProvider.validateProps = tModule.strictInterface({
	style = tModule.optional(validateStyleModule),
	derivedValues = tModule.optional(tModule.table),
	[roactModule.Children] = tModule.table
})
local t = {
	Theme = themesModule.DarkTheme,
	Settings = {
		PreferredTransparency = 1,
		ReducedMotion = false,
		Scale = 1,
		PreferredTextSize = if var1 then Enum.PreferredTextSize.Medium else nil
	}
}
local t_1 = { textSizeOffset = 0 }

function styleProvider.init(p1)
	p1:setState({
		style = p1.props.style,
		derivedValues = p1.props.derivedValues
	})
end

function styleProvider.updateTextSizeOffset(value, p1)
	-- upvalues: getTextSizeOffsetModule (ref)
	local var2, var3 = getTextSizeOffsetModule(p1)
	
	if var2 then
		value:setState({ derivedValues = { textSizeOffset = var3 } })
	end
end

function styleProvider.didUpdate(p1, _, p2)
	if p2.style and p2.style.Settings.PreferredTextSize ~= p1.state.style.Settings.PreferredTextSize then
		p1:updateTextSizeOffset(p1.state.style.Font.Body.Font)
	end
end

function styleProvider.render(p1)
	-- upvalues: object (ref), t (ref), t_1 (ref), themesModule (ref), constantsModule (ref), getTokens (ref), getFoundationTokens (ref), mappers (ref), getFontFromNameModule (ref), roactModule (ref), styleContextModule (ref)
	local var2 = object.assign({}, t, p1.state.style)
	local var3 = object.assign({}, t_1, p1.state.derivedValues)
	
	if var2.Tokens == nil then
		local var4 = if var2.Theme == themesModule.LightTheme then constantsModule.ThemeName.Light else constantsModule.ThemeName.Dark
		local defaultDeviceType = constantsModule.DefaultDeviceType
		local scale = var2.Settings.Scale
		local var5 = getFoundationTokens(defaultDeviceType, var4, scale)
		local var6 = mappers.mapColorTokensToFoundation(getTokens(defaultDeviceType, var4, scale), var5)
		var2.Theme = mappers.mapThemeToFoundation(var2.Theme, var5)
		var2.Tokens = mappers.addFoundationFlatKeys(var6, var5)
	end
	if var2.Font == nil then
		var2.Font = getFontFromNameModule(constantsModule.FontName.Gotham, var2.Tokens)
	end
	return roactModule.createElement(styleContextModule.Provider, {
		value = {
			style = var2,
			update = function(_, p2)
				-- upvalues: p1 (ref)
				if p1.mounted then
					p1:setState({ style = p2 })
				end
			end,
			derivedValues = var3
		}
	}, roactModule.oneChild(p1.props[roactModule.Children]))
end

function styleProvider.didMount(p1)
	p1.mounted = true
end

function styleProvider.willUnmount(p1)
	p1.mounted = false
end

return styleProvider