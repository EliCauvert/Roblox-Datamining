local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(parent.Rules.Types)
local createStyleSheetRulesModule = require(parent.createStyleSheetRules)
local getOverrideAttributesModule = require(parent.getOverrideAttributes)
local useGeneratedRulesModule = require(foundation.Utility.useGeneratedRules)
local _ = require(foundation.Enums.ColorMode)
local _ = require(foundation.Enums.Device)
local _ = require(foundation.Enums.ThemeName)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useGeneratedRulesModule (ref), flagsModule (ref), getOverrideAttributesModule (ref), createStyleSheetRulesModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef({})
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1.setStyleSheetRef and p1.setStyleSheetRef.current then
			p1.setStyleSheetRef.current(var1)
		end
	end, { var1 })
	local var4 = useGeneratedRulesModule(if flagsModule.FoundationThemeName then p1.themeName else nil, p1.colorMode, p1.device)
	local var5 = reactModule.useMemo(function()
		-- upvalues: getOverrideAttributesModule (copy), flagsModule (copy), p1 (ref)
		return getOverrideAttributesModule(if flagsModule.FoundationThemeName then p1.themeName else nil, p1.colorMode, p1.device, p1.tokenOverrides)
	end, {
		if flagsModule.FoundationThemeName then p1.themeName else nil,
		p1.colorMode,
		p1.device,
		p1.tokenOverrides
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		FoundationStyleSheet = reactModule.createElement("StyleSheet", { ref = var2 }, reactModule.useMemo(function()
			-- upvalues: var1 (ref), createStyleSheetRulesModule (copy), var4 (ref), p1 (ref), var3 (ref), var5 (ref)
			return if var1 then createStyleSheetRulesModule(var4, p1.tags, var1, var3.current, p1.scale, var5) else nil
		end, {
			var1,
			var4,
			p1.tags,
			p1.scale,
			var5
		})),
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var1 })
	})
end)