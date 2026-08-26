local appComposition = script:FindFirstAncestor("AppComposition")
local parent = appComposition.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useTokens = foundationModule.Hooks.useTokens
local setupCompositionStyleRulesModule = require(appComposition.setupCompositionStyleRules)

return function()
	-- upvalues: reactModule (ref), useStyleSheet (ref), useTokens (ref), setupCompositionStyleRulesModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = useStyleSheet()
	local var3 = useTokens()
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), var2 (ref), setupCompositionStyleRulesModule (copy), var3 (ref)
		if var1.current and var2 then
			var1.current:SetDerives({ var2 })
			
			return setupCompositionStyleRulesModule(var1.current, var3)
		end
		return function() end
	end, { var1, var2, var3 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		CompositionStyleSheet = reactModule.createElement("StyleSheet", { ref = var1 }),
		CompositionStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var1.current })
	})
end