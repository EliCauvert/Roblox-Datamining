local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local FetchAvatarInventoryPageModule = require(script.Parent.fetchAvatarInventoryPage)
local _ = require(script.Parent.AvatarInventoryStoreTypes)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), GetLocalPlayerUserIdFunction (copy), FetchAvatarInventoryPageModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local DataCacheModule = CreateDataCacheModule()
	local DataCacheModule1 = CreateDataCacheModule()
	local Count = 0
	
	local function storePage(Items)
		-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy)
		local Buffer = table.create(#Items)
		local t = {}
		local t1 = {}
		
		for _, item in Items do
			if item.itemId ~= nil then
				local Text = tostring(item.itemId)
				local ItemType = item.itemCategory and item.itemCategory.itemType
				
				if ItemType == Enum.AvatarItemType.Asset.Value then
					t[Text] = item
					table.insert(Buffer, { itemType = "Asset", itemId = Text })
				elseif ItemType == Enum.AvatarItemType.Bundle.Value then
					t1[Text] = item
					table.insert(Buffer, { itemType = "Outfit", itemId = Text })
				end
			end
		end
		DataCacheModule.replaceItems(t)
		DataCacheModule1.replaceItems(t1)
		
		return Buffer
	end
	
	return {
		fetchPage = function(p2, p3)
			-- upvalues: GetLocalPlayerUserIdFunction (upval), Count (ref), FetchAvatarInventoryPageModule (upval), config (copy), storePage (copy)
			local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
			local Count1 = Count
			
			return FetchAvatarInventoryPageModule(p2, p3, config):andThen(function(Result)
				-- upvalues: Count1 (copy), Count (upval), LocalPlayerUserId (copy), GetLocalPlayerUserIdFunction (upval), storePage (upval)
				if Count1 ~= Count or LocalPlayerUserId ~= GetLocalPlayerUserIdFunction() then
					error("AvatarInventory: dropped a page fetched before the store was reset")
				end
				return {
					items = storePage(Result.items),
					nextPageToken = Result.nextPageToken
				}
			end)
		end,
		getAsset = function(p2)
			-- upvalues: DataCacheModule (copy)
			return (DataCacheModule.getItem(p2))
		end,
		getOutfit = function(p2)
			-- upvalues: DataCacheModule1 (copy)
			return (DataCacheModule1.getItem(p2))
		end,
		clear = function()
			-- upvalues: Count (ref), DataCacheModule (copy), DataCacheModule1 (copy)
			Count += 1
			DataCacheModule.clear()
			DataCacheModule1.clear()
		end,
		dispose = function()
			-- upvalues: Count (ref), DataCacheModule (copy), DataCacheModule1 (copy)
			Count += 1
			DataCacheModule.dispose()
			DataCacheModule1.dispose()
		end
	}
end