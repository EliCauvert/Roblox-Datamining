local Parent = script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagSduiMarketplaceCatalogCategorySupport = require(Parent.SharedFlags).FFlagSduiMarketplaceCatalogCategorySupport

return function(p1)
	-- upvalues: ReactModule (copy), FFlagSduiMarketplaceCatalogCategorySupport (copy), SignalsModule (copy), DataHydrationModule (copy), SignalsReactModule (copy)
	local P0 = p1 or ""
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: FFlagSduiMarketplaceCatalogCategorySupport (upval), P0 (copy), SignalsModule (upval), DataHydrationModule (upval)
		if FFlagSduiMarketplaceCatalogCategorySupport and P0 ~= "" then
			local MarketplaceCatalogCategoryStore = DataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false)
			
			return SignalsModule.createComputed(function(p2)
				-- upvalues: MarketplaceCatalogCategoryStore (copy), P0 (upval), DataHydrationModule (upval)
				local MarketplaceCatalogCategory = MarketplaceCatalogCategoryStore.getMarketplaceCatalogCategory(P0)
				
				if MarketplaceCatalogCategory.status(p2) == DataHydrationModule.DataStatus.Ready then
					local DataResult = MarketplaceCatalogCategory.data(p2)
					
					return if DataResult then DataResult.defaultSubcategoryId else nil
				else
					return nil
				end
			end)
		else
			return SignalsModule.createComputed(function()
				return nil
			end)
		end
	end, { P0 })))
end