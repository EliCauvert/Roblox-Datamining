local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local DashModule = require(CorePackages.Packages.Dash)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local SetAssetInfoFromSortResultsModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults)
local SetBundleInfoFromSortResultsModule = require(Modules.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults)
local SetSponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Actions.SetSponsoredItems)
local SendAXStatFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXStat
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)

return function(p1, p2, p3)
	-- upvalues: CatalogUtilsModule (copy), PerformFetch (copy), WebApiModule (copy), SetSponsoredItemsModule (copy), DashModule (copy), ConstantsModule (copy), SetAssetInfoFromSortResultsModule (copy), SetBundleInfoFromSortResultsModule (copy), SendAXStatFunction (copy), ConstantsModule1 (copy), PromiseModule (copy)
	local ClockTime = os.clock()
	
	return PerformFetch.Single(CatalogUtilsModule.GetSponsoredItemsKey(p2, p3), function(p4)
		-- upvalues: WebApiModule (upval), p1 (copy), p2 (copy), p3 (copy), SetSponsoredItemsModule (upval), DashModule (upval), ConstantsModule (upval), SetAssetInfoFromSortResultsModule (upval), SetBundleInfoFromSortResultsModule (upval), ClockTime (copy), SendAXStatFunction (upval), ConstantsModule1 (upval), PromiseModule (upval)
		return WebApiModule.FetchSponsoredItems(p1, p2, p3):andThen(function(Result)
			-- upvalues: p4 (copy), SetSponsoredItemsModule (upval), p2 (upval), DashModule (upval), WebApiModule (upval), p1 (upval)
			local Data = Result.responseBody.data or {}
			p4:dispatch(SetSponsoredItemsModule(p2, Data))
			
			return (WebApiModule.FetchItemDetails(p1, (DashModule.map(Data, function(p5)
				return { id = p5.id, itemType = p5.itemType }
			end))))
		end):andThen(function(Result)
			-- upvalues: ConstantsModule (upval), p4 (copy), SetAssetInfoFromSortResultsModule (upval), SetBundleInfoFromSortResultsModule (upval), ClockTime (upval), SendAXStatFunction (upval), ConstantsModule1 (upval), PromiseModule (upval)
			local ResponseBody = Result.responseBody
			ResponseBody.data = ResponseBody.data or {}
			local List = {}
			local List1 = {}
			
			for _, entry in ResponseBody.data do
				if entry.itemType == ConstantsModule.ItemType.Asset then
					table.insert(List, entry)
				elseif entry.itemType == ConstantsModule.ItemType.Bundle then
					table.insert(List1, entry)
				end
			end
			if #List > 0 then
				p4:dispatch(SetAssetInfoFromSortResultsModule(List))
			end
			if #List1 > 0 then
				p4:dispatch(SetBundleInfoFromSortResultsModule(List1))
			end
			SendAXStatFunction({
				statName = ConstantsModule1.Counter.Latency.Network.FetchSponsoredItems,
				deltaMs = (os.clock() - ClockTime) * 1000
			})
			
			return PromiseModule.resolve()
		end)
	end)
end