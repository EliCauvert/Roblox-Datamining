local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local GameGetDeveloperProductsModule = require(Modules.LuaApp.Http.Requests.DeveloperProductApi.GameGetDeveloperProducts)
local GameGetExperienceStoreDeveloperProductsModule = require(Modules.LuaApp.Http.Requests.DeveloperProductApi.GameGetExperienceStoreDeveloperProducts)
local SetGameDeveloperProductsModule = require(Modules.LuaApp.Actions.DeveloperProduct.SetGameDeveloperProducts)
local ApiFetchDeveloperProductsThumbnailsModule = require(Modules.LuaApp.Thunks.DeveloperProduct.ApiFetchDeveloperProductsThumbnails)
local ApiFetchDeveloperProductsStatusModule = require(Modules.LuaApp.Thunks.DeveloperProduct.ApiFetchDeveloperProductsStatus)
local GetFIntExperienceStoreApiPageCountModule = require(Modules.LuaApp.Flags.GetFIntExperienceStoreApiPageCount)
local FFlagUseExperienceStoreApiForEdpModule = require(Modules.LuaApp.Flags.FFlagUseExperienceStoreApiForEdp)
local _ = require(Modules.LuaApp.Models.DeveloperProductApi.StorePageTypes)
local SortDeveloperProductsComparatorModule = require(Modules.LuaApp.Thunks.DeveloperProduct.util.sortDeveloperProductsComparator)

return function(p1, p2, p3, Text)
	-- upvalues: PerformFetch (copy), FFlagUseExperienceStoreApiForEdpModule (copy), GetFIntExperienceStoreApiPageCountModule (copy), PromiseModule (copy), GameGetExperienceStoreDeveloperProductsModule (copy), CryoModule (copy), GameGetDeveloperProductsModule (copy), SortDeveloperProductsComparatorModule (copy), SetGameDeveloperProductsModule (copy), ApiFetchDeveloperProductsThumbnailsModule (copy), ApiFetchDeveloperProductsStatusModule (copy)
	return PerformFetch.Single("ApiFetchGameDeveloperProducts" .. tostring(p2) .. Text, function(p4)
		-- upvalues: FFlagUseExperienceStoreApiForEdpModule (upval), GetFIntExperienceStoreApiPageCountModule (upval), PromiseModule (upval), GameGetExperienceStoreDeveloperProductsModule (upval), p1 (copy), p2 (copy), CryoModule (upval), GameGetDeveloperProductsModule (upval), SortDeveloperProductsComparatorModule (upval), SetGameDeveloperProductsModule (upval), ApiFetchDeveloperProductsThumbnailsModule (upval), ApiFetchDeveloperProductsStatusModule (upval), Text (copy), p3 (copy)
		local Page = nil
		if FFlagUseExperienceStoreApiForEdpModule then
			local FIntExperienceStoreApiPageCountModule = GetFIntExperienceStoreApiPageCountModule()
			local NextPageCursor = ""
			local ResponseBody = {}
			
			local function createProductsFromResponseData(ResponseBody)
				local List = {}
				
				if ResponseBody.developerProducts then
					for _, developerProduct in ResponseBody.developerProducts do
						table.insert(List, {
							iconImageAssetId = developerProduct.IconImageAssetId,
							id = developerProduct.DeveloperProductId,
							name = developerProduct.Name,
							priceInRobux = developerProduct.PriceInRobux,
							productId = developerProduct.ProductId
						})
					end
				end
				return List
			end
			
			local function fetchPage(p5)
				-- upvalues: FIntExperienceStoreApiPageCountModule (copy), PromiseModule (upval), ResponseBody (ref), GameGetExperienceStoreDeveloperProductsModule (upval), p1 (upval), p2 (upval), NextPageCursor (ref), createProductsFromResponseData (copy), CryoModule (upval), fetchPage (copy)
				return if FIntExperienceStoreApiPageCountModule < p5 then PromiseModule.resolve({ responseBody = ResponseBody }) else GameGetExperienceStoreDeveloperProductsModule(p1, p2, NextPageCursor):andThen(function(Result)
					-- upvalues: createProductsFromResponseData (upval), ResponseBody (upval), CryoModule (upval), NextPageCursor (upval), fetchPage (upval), p5 (copy), PromiseModule (upval)
					local ResponseBody1 = Result.responseBody
					ResponseBody = CryoModule.List.join(ResponseBody, (createProductsFromResponseData(ResponseBody1)))
					
					if ResponseBody1.nextPageCursor and ResponseBody1.nextPageCursor ~= "" then
						NextPageCursor = ResponseBody1.nextPageCursor
						
						return fetchPage(p5 + 1)
					else
						return PromiseModule.resolve({ responseBody = ResponseBody })
					end
				end):catch(function(_)
					-- upvalues: PromiseModule (upval), ResponseBody (upval)
					return PromiseModule.resolve({ responseBody = ResponseBody })
				end)
			end
			
			Page = fetchPage(1)
		else
			Page = GameGetDeveloperProductsModule(p1, p2)
		end
		return Page:andThen(function(Result)
			-- upvalues: FFlagUseExperienceStoreApiForEdpModule (upval), SortDeveloperProductsComparatorModule (upval), p4 (copy), SetGameDeveloperProductsModule (upval), p2 (upval), ApiFetchDeveloperProductsThumbnailsModule (upval), p1 (upval), ApiFetchDeveloperProductsStatusModule (upval), Text (upval), p3 (upval), PromiseModule (upval)
			local ResponseBody = Result.responseBody
			
			if FFlagUseExperienceStoreApiForEdpModule then
				table.sort(ResponseBody, SortDeveloperProductsComparatorModule)
			end
			p4:dispatch(SetGameDeveloperProductsModule(p2, ResponseBody))
			
			if ResponseBody and type(ResponseBody) == "table" and #ResponseBody > 0 then
				local IconImageAssetIds = {}
				
				for _, value in ipairs(ResponseBody) do
					if value.iconImageAssetId then
						table.insert(IconImageAssetIds, value.iconImageAssetId)
					end
				end
				p4:dispatch(ApiFetchDeveloperProductsThumbnailsModule(p1, IconImageAssetIds))
			end
			p4:dispatch(ApiFetchDeveloperProductsStatusModule(p1, Text, p2, p3))
			
			return PromiseModule.resolve(Result)
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end)
end