-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:03 2026 Pacific Standard Time.

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
local var9 = require(parent_2.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting")
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
		PreferredTextSize = if var9 then Enum.PreferredTextSize.Medium else nil
	}
}
local t_1 = { textSizeOffset = 0 }

function styleProvider.init(p0) --[[ line: 54 ]]
	p0:setState({
		style = p0.props.style,
		derivedValues = p0.props.derivedValues
	})
end

function styleProvider.updateTextSizeOffset(value, p1) --[[ line: 63 ]]
	-- upvalues: getTextSizeOffsetModule (ref)
	local var13, var14 = getTextSizeOffsetModule(p1)
	
	if var13 then
		value:setState({ derivedValues = { textSizeOffset = var14 } })
	end
end

function styleProvider.didUpdate(p2, _, p3) --[[ line: 74 ]]
	if p3.style and p3.style.Settings.PreferredTextSize ~= p2.state.style.Settings.PreferredTextSize then
		p2:updateTextSizeOffset(p2.state.style.Font.Body.Font)
	end
end

function styleProvider.render(p4) --[[ line: 83 ]]
	-- upvalues: object (ref), t (ref), t_1 (ref), themesModule (ref), constantsModule (ref), getTokens (ref), getFoundationTokens (ref), mappers (ref), getFontFromNameModule (ref), roactModule (ref), styleContextModule (ref)
	local var15 = object.assign({}, t, p4.state.style)
	local var16 = object.assign({}, t_1, p4.state.derivedValues)
	
	if var15.Tokens == nil then
		local var17 = if var15.Theme == themesModule.LightTheme then constantsModule.ThemeName.Light else constantsModule.ThemeName.Dark
		local defaultDeviceType = constantsModule.DefaultDeviceType
		local scale = var15.Settings.Scale
		local var18 = getFoundationTokens(defaultDeviceType, var17, scale)
		local var19 = mappers.mapColorTokensToFoundation(getTokens(defaultDeviceType, var17, scale), var18)
		var15.Theme = mappers.mapThemeToFoundation(var15.Theme, var18)
		var15.Tokens = mappers.addFoundationFlatKeys(var19, var18)
	end
	if var15.Font == nil then
		var15.Font = getFontFromNameModule(constantsModule.FontName.Gotham, var15.Tokens)
	end
	return roactModule.createElement(styleContextModule.Provider, {
		value = {
			style = var15,
			update = function(_, p5) --[[ line: 108 ]]
				-- upvalues: p4 (ref)
				if p4.mounted then
					p4:setState({ style = p5 })
				end
			end,
			derivedValues = var16
		}
	}, roactModule.oneChild(p4.props[roactModule.Children]))
end

function styleProvider.didMount(p6) --[[ line: 121 ]]
	p6.mounted = true
end

function styleProvider.willUnmount(p7) --[[ line: 125 ]]
	p7.mounted = false
end

return styleProvider