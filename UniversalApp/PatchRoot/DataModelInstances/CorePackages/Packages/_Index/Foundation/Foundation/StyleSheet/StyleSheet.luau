local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(parent.Rules.Types)
local createStyleSheetRulesModule = require(parent.createStyleSheetRules)
local getOverrideAttributesModule = require(parent.getOverrideAttributes)
local useGeneratedRulesModule = require(foundation.Utility.useGeneratedRules)
local _ = require(foundation.Enums.Device)
local _ = require(foundation.Enums.Theme)

return reactModule.memo(function(p0) --[[ line: 32 | named "StyleSheet" ]]
	-- upvalues: reactModule (ref), useGeneratedRulesModule (ref), flagsModule (ref), getOverrideAttributesModule (ref), createStyleSheetRulesModule (ref)
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useRef({})
	reactModule.useLayoutEffect(function() --[[ line: 36 ]]
		-- upvalues: p0 (ref), var6 (ref)
		if p0.setStyleSheetRef and p0.setStyleSheetRef.current then
			p0.setStyleSheetRef.current(var6)
		end
	end, { var6 })
	local var9 = useGeneratedRulesModule(p0.theme, p0.device)
	reactModule.useLayoutEffect(function() --[[ line: 46 ]]
		-- upvalues: var6 (ref), flagsModule (copy), p0 (ref)
		if var6 and not flagsModule.FoundationDisableStyleProviderDerives then
			var6:SetDerives(p0.derives or {})
		end
	end, { var6, p0.derives })
	local var10 = reactModule.useMemo(function() --[[ line: 53 ]]
		-- upvalues: getOverrideAttributesModule (copy), p0 (ref)
		return getOverrideAttributesModule(p0.theme, p0.device, p0.tokenOverrides)
	end, { p0.theme, p0.device, p0.tokenOverrides })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		FoundationStyleSheet = reactModule.createElement("StyleSheet", { ref = var7 }, reactModule.useMemo(function() --[[ line: 57 ]]
			-- upvalues: var6 (ref), createStyleSheetRulesModule (copy), var9 (ref), p0 (ref), var8 (ref), var10 (ref)
			return if var6 then createStyleSheetRulesModule(var9, p0.tags, var6, var8.current, p0.scale, var10) else nil
		end, {
			var6,
			var9,
			p0.tags,
			p0.scale,
			var10
		})),
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var6 })
	})
end)