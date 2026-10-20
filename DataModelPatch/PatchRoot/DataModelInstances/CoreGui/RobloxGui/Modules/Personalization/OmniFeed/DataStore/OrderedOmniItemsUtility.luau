local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local CryoModule = require(CorePackages.Packages.Cryo)
local OmniFeedService = require(CorePackages.Workspace.Packages.OmniFeedService).OmniFeedService
local FeedItemModel = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.DataStore.FeedItemModel
local FixFeedItemRenderedRowsEqualityCheck = game:DefineFastFlag("FixFeedItemRenderedRowsEqualityCheck", false)

return {
	combineOmniFeedItems = function(List, List1)
		-- upvalues: OmniFeedService (copy), DiscoveryTypesModule (copy), FeedItemModel (copy), ArgCheckModule (copy)
		local List2 = {}
		local t = {}
		local OmniFeedItemMap = OmniFeedService.get():getOmniFeedItemMap()
		
		if List1 then
			for _, value in ipairs(List1) do
				if value.dataSource ~= DiscoveryTypesModule.DataSourceType.Local and OmniFeedItemMap.hasComponent(value.treatmentType) then
					local UniqueNameForFeed = FeedItemModel.getUniqueNameForFeed(value)
					
					if UniqueNameForFeed then
						ArgCheckModule.assert(t[UniqueNameForFeed] == nil, "Duplicate feed item id detected: " .. tostring(UniqueNameForFeed))
						t[UniqueNameForFeed] = value
					end
					table.insert(List2, value)
				end
			end
		end
		if List then
			for _, value1 in ipairs(List) do
				if value1.dataSource == DiscoveryTypesModule.DataSourceType.Local and OmniFeedItemMap.hasComponent(value1.treatmentType) then
					local UniqueNameForFeed = FeedItemModel.getUniqueNameForFeed(value1)
					assert(UniqueNameForFeed)
					
					if t[UniqueNameForFeed] == nil then
						t[UniqueNameForFeed] = value1
						local OrderHint = nil
						
						if value1.orderHint then
							OrderHint = value1.orderHint
							while OrderHint <= #List2 and (List2[OrderHint] and List2[OrderHint].dataSource == DiscoveryTypesModule.DataSourceType.Local and List2[OrderHint].orderHint and List2[OrderHint].orderHint == value1.orderHint) do
								OrderHint += 1
							end
						end
						if OrderHint == nil or OrderHint > #List2 then
							table.insert(List2, value1)
						else
							table.insert(List2, OrderHint, value1)
						end
					end
				end
			end
		end
		return List2
	end,
	setFeedItemRenderedRows = function(Tbl, Key, p1, p2)
		-- upvalues: ArgCheckModule (copy), FeedItemModel (copy), FixFeedItemRenderedRowsEqualityCheck (copy), CryoModule (copy)
		if not Tbl then
			return nil
		end
		local Entry = Tbl[Key]
		
		if not Entry then
			return nil
		elseif Entry ~= p1 then
			return nil
		else
			ArgCheckModule.assert(Entry.actualRenderedRows ~= nil, `WARNING: feed item was not set up for overwriting its number of rows.  "actualRenderedRows" should be defined in the FeedItemModel (feed item: {FeedItemModel.getUniqueNameForAnalytics(Entry)}`)
			local P4 = if FixFeedItemRenderedRowsEqualityCheck then p2 or -1 else nil
			
			if Entry.actualRenderedRows == (if FixFeedItemRenderedRowsEqualityCheck then P4 else p2) then
				return nil
			else
				local Copy = table.clone(Tbl)
				Copy[Key] = CryoModule.Dictionary.join(Copy[Key], {
					actualRenderedRows = if FixFeedItemRenderedRowsEqualityCheck then P4 else p2 or -1
				})
				
				return Copy
			end
		end
	end
}