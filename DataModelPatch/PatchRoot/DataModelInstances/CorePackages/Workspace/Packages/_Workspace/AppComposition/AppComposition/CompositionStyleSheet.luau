local AppComposition = script:FindFirstAncestor("AppComposition")
local Parent = AppComposition.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SetupCompositionStyleRulesModule = require(AppComposition.setupCompositionStyleRules)

return function()
	-- upvalues: ReactModule (copy), UseStyleSheetFunction (copy), UseTokensFunction (copy), SetupCompositionStyleRulesModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseTokensResult = UseTokensFunction()
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), UseStyleSheetResult (copy), SetupCompositionStyleRulesModule (upval), UseTokensResult (copy)
		if UseRefResult.current and UseStyleSheetResult then
			UseRefResult.current:SetDerives({ UseStyleSheetResult })
			
			return SetupCompositionStyleRulesModule(UseRefResult.current, UseTokensResult)
		else
			return function() end
		end
	end, { UseRefResult, UseStyleSheetResult, UseTokensResult })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		CompositionStyleSheet = ReactModule.createElement("StyleSheet", { ref = UseRefResult }),
		CompositionStyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseRefResult.current })
	})
end