local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(parent.Rules.Types)
local createStyleSheetRulesModule = require(parent.createStyleSheetRules)
local getOverrideAttributesModule = require(parent.getOverrideAttributes)
local useGeneratedRulesModule = require(foundation.Utility.useGeneratedRules)
local _ = require(foundation.Enums.Device)
local _ = require(foundation.Enums.Theme)

return reactModule.memo(function(p0) --[[ line: 31 | named "StyleSheet" ]]
	-- upvalues: reactModule (ref), useGeneratedRulesModule (ref), getOverrideAttributesModule (ref), createStyleSheetRulesModule (ref)
	local var5, var6 = reactModule.useState(nil)
	local var7 = reactModule.useRef({})
	reactModule.useLayoutEffect(function() --[[ line: 35 ]]
		-- upvalues: p0 (ref), var5 (ref)
		if p0.setStyleSheetRef and p0.setStyleSheetRef.current then
			p0.setStyleSheetRef.current(var5)
		end
	end, { var5 })
	local var8 = useGeneratedRulesModule(p0.theme, p0.device)
	local var9 = reactModule.useMemo(function() --[[ line: 43 ]]
		-- upvalues: getOverrideAttributesModule (copy), p0 (ref)
		return getOverrideAttributesModule(p0.theme, p0.device, p0.tokenOverrides)
	end, { p0.theme, p0.device, p0.tokenOverrides })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		FoundationStyleSheet = reactModule.createElement("StyleSheet", { ref = var6 }, reactModule.useMemo(function() --[[ line: 47 ]]
			-- upvalues: var5 (ref), createStyleSheetRulesModule (copy), var8 (ref), p0 (ref), var7 (ref), var9 (ref)
			return if var5 then createStyleSheetRulesModule(var8, p0.tags, var5, var7.current, p0.scale, var9) else nil
		end, {
			var5,
			var8,
			p0.tags,
			p0.scale,
			var9
		})),
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var5 })
	})
end)