local Parent = script.Parent
local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Parent.Rules.Types)
local CreateStyleSheetRulesModule = require(Parent.createStyleSheetRules)
local GetOverrideAttributesModule = require(Parent.getOverrideAttributes)
local UseGeneratedRulesModule = require(Foundation.Utility.useGeneratedRules)
local _ = require(Foundation.Enums.ColorMode)
local _ = require(Foundation.Enums.Device)
local _ = require(Foundation.Enums.ThemeName)

return ReactModule.memo(function(p1) --[[ Line: 34 | Named "StyleSheet" ]]
	-- upvalues: ReactModule (copy), UseGeneratedRulesModule (copy), GetOverrideAttributesModule (copy), CreateStyleSheetRulesModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef({})
	ReactModule.useLayoutEffect(function() --[[ Line: 38 ]]
		-- upvalues: p1 (copy), UseStateResult (copy)
		if p1.setStyleSheetRef and p1.setStyleSheetRef.current then
			p1.setStyleSheetRef.current(UseStateResult)
		end
	end, { UseStateResult })
	local UseGeneratedRulesModuleResult = UseGeneratedRulesModule(p1.themeName, p1.colorMode, p1.device)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 47 ]]
		-- upvalues: GetOverrideAttributesModule (upval), p1 (copy)
		return GetOverrideAttributesModule(p1.themeName, p1.colorMode, p1.device, p1.tokenOverrides)
	end, { p1.themeName, p1.colorMode, p1.device, p1.tokenOverrides })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		FoundationStyleSheet = ReactModule.createElement("StyleSheet", { ref = UseStateResult2 }, (ReactModule.useMemo(function() --[[ Line: 58 ]]
			-- upvalues: UseStateResult (copy), CreateStyleSheetRulesModule (upval), UseGeneratedRulesModuleResult (copy), p1 (copy), UseRefResult (copy), UseMemoResult (copy)
			return if UseStateResult then CreateStyleSheetRulesModule(UseGeneratedRulesModuleResult, p1.tags, UseStateResult, UseRefResult.current, p1.scale, UseMemoResult) else nil
		end, {
			UseStateResult,
			UseGeneratedRulesModuleResult,
			p1.tags,
			p1.scale,
			UseMemoResult
		}))),
		FoundationStyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStateResult })
	})
end)