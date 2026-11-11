local SetHomePageUpsellCardVariationModule = require(script:FindFirstAncestor("DiscoveryMonolith").Modules.LuaApp.Actions.SetHomePageUpsellCardVariation)

return function(p1, p2)
	-- upvalues: SetHomePageUpsellCardVariationModule (copy)
	local P0 = p1 or {
		upsellCardType = "",
		titleTextOverride = "",
		bodyTextOverride = "",
		upsellCardV2Config = nil
	}
	
	return if p2.type == SetHomePageUpsellCardVariationModule.name then {
		upsellCardType = p2.upsellCardType,
		titleTextOverride = p2.titleTextOverride,
		bodyTextOverride = p2.bodyTextOverride,
		upsellCardV2Config = p2.upsellCardV2Config
	} else P0
end