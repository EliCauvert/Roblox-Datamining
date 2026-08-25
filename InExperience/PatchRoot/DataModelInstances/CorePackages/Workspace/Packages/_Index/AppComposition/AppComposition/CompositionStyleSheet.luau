local appComposition = script:FindFirstAncestor("AppComposition")
local parent = appComposition.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useTokens = foundationModule.Hooks.useTokens
local setupCompositionStyleRulesModule = require(appComposition.setupCompositionStyleRules)

return function()
	-- upvalues: reactModule (ref), useStyleSheet (ref), useTokens (ref), setupCompositionStyleRulesModule (ref)
	local var4 = reactModule.useRef(nil)
	local var5 = useStyleSheet()
	local var6 = useTokens()
	reactModule.useLayoutEffect(function()
		-- upvalues: var4 (ref), var5 (ref), setupCompositionStyleRulesModule (copy), var6 (ref)
		if var4.current and var5 then
			var4.current:SetDerives({ var5 })
			
			return setupCompositionStyleRulesModule(var4.current, var6)
		end
		return function() end
	end, { var4, var5, var6 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		CompositionStyleSheet = reactModule.createElement("StyleSheet", { ref = var4 }),
		CompositionStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var4.current })
	})
end