local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Modules = DiscoveryMonolith.Modules
local Parent = DiscoveryMonolith.Parent
local PromiseModule = require(Parent.Promise)
local PostHomePageUpsellCardVariationDismissModule = require(Modules.LuaApp.Http.Requests.PostHomePageUpsellCardVariationDismiss)
local SetHomePageUpsellCardVariationModule = require(Modules.LuaApp.Actions.SetHomePageUpsellCardVariation)
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError

local function _(p1, CardType)
	-- upvalues: FlaggedMutedErrorFunction (copy)
	FlaggedMutedErrorFunction("HomePageContactMethodModuleVariationDismiss", p1, { cardType = CardType })
end

return function(p1, CardType)
	-- upvalues: SetHomePageUpsellCardVariationModule (copy), PromiseModule (copy), PostHomePageUpsellCardVariationDismissModule (copy), FlaggedMutedErrorFunction (copy)
	return function(p2)
		-- upvalues: SetHomePageUpsellCardVariationModule (upval), CardType (copy), PromiseModule (upval), PostHomePageUpsellCardVariationDismissModule (upval), p1 (copy), FlaggedMutedErrorFunction (upval)
		p2:dispatch(SetHomePageUpsellCardVariationModule("", "", "", {}))
		
		return if CardType and CardType ~= "" then PostHomePageUpsellCardVariationDismissModule(p1, CardType):andThen(function(Result)
			-- upvalues: CardType (upval), FlaggedMutedErrorFunction (upval)
			if not Result then
				FlaggedMutedErrorFunction("HomePageContactMethodModuleVariationDismiss", "Unexpected response to post upsell card variation dismiss", { cardType = CardType })
			end
		end, function(_)
			-- upvalues: CardType (upval), FlaggedMutedErrorFunction (upval)
			FlaggedMutedErrorFunction("HomePageContactMethodModuleVariationDismiss", "Failed to post upsell card variation dismiss", { cardType = CardType })
		end):catch(function(_)
			-- upvalues: CardType (upval), FlaggedMutedErrorFunction (upval)
			FlaggedMutedErrorFunction("HomePageContactMethodModuleVariationDismiss", "Failed to post upsell card variation dismiss", { cardType = CardType })
		end) else PromiseModule.resolve()
	end
end