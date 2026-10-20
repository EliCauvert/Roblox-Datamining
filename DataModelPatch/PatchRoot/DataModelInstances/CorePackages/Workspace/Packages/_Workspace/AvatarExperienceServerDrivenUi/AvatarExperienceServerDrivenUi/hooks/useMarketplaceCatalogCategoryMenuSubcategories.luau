local Parent = script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AvatarExperienceUIKit)
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
				
				if MarketplaceCatalogCategory.status(p2) ~= DataHydrationModule.DataStatus.Ready then
					return nil
				end
				local DataResult = MarketplaceCatalogCategory.data(p2)
				
				if not DataResult then
					return nil
				end
				local Subcategories = DataResult.subcategories
				
				if not Subcategories or #Subcategories == 0 then
					return nil
				end
				local List = {}
				
				for _, subcategory in Subcategories do
					local MarketplaceCatalogCategory1 = MarketplaceCatalogCategoryStore.getMarketplaceCatalogCategory(subcategory)
					
					if MarketplaceCatalogCategory1.status(p2) == DataHydrationModule.DataStatus.Ready then
						local DataResult1 = MarketplaceCatalogCategory1.data(p2)
						
						if DataResult1 then
							table.insert(List, { id = DataResult1.id, text = DataResult1.title })
						end
					end
				end
				return if #List == 0 then nil else List
			end)
		else
			return SignalsModule.createComputed(function()
				return nil
			end)
		end
	end, { P0 })))
end