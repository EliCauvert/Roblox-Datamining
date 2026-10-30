local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local CreateSignalFunction = require(Parent.Signals).createSignal
local AvatarInventoryModule = require(Parent.DataHydration.AvatarInventory)
local _ = require(AvatarWorkshop.Constants.InventoryPagesData)

local function getQuery(p1)
	if not p1.assetTypes then
		return if p1.outfitInventoryType then { outfitInventoryTypes = { p1.outfitInventoryType } } else nil
	end
	local Buffer = table.create(#p1.assetTypes)
	
	for _, assetType in p1.assetTypes do
		table.insert(Buffer, assetType.Value)
	end
	return { assetTypeIds = Buffer }
end

return function(p2, p3)
	-- upvalues: AvatarInventoryModule (copy), getQuery (copy), CreateSignalFunction (copy)
	local P2 = p3 or AvatarInventoryModule.getAvatarInventoryStore(false)
	local Query = getQuery(p2)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local Signal5, Signal2_4 = CreateSignalFunction(false)
	local NextPageToken = nil
	
	local function applyPage(Result)
		-- upvalues: NextPageToken (ref), Signal2_2 (copy), Signal (copy), Signal2 (copy)
		NextPageToken = Result.nextPageToken
		Signal2_2(Result.nextPageToken == nil)
		
		if #Result.items > 0 then
			local Copy = table.clone(Signal(false))
			table.move(Result.items, 1, #Result.items, #Copy + 1, Copy)
			Signal2(Copy)
		end
	end
	
	return {
		getEntries = Signal,
		getDidInitialFetch = Signal1,
		getLastPageReached = Signal3,
		getIsFetching = Signal4,
		getHasFetchError = Signal5,
		fetchNextPage = function()
			-- upvalues: Signal4 (copy), Signal3 (copy), Query (copy), Signal2_3 (copy), Signal2_4 (copy), P2 (copy), NextPageToken (ref), applyPage (copy), Signal2_1 (copy)
			if Signal4(false) or Signal3(false) then return end
			if Query then
				Signal2_3(true)
				Signal2_4(false)
				P2.fetchPage(Query, NextPageToken):andThen(applyPage):catch(function(Err)
					-- upvalues: Signal2_4 (upval)
					warn("createInventoryPageStore: avatar-inventory fetch failed:", if typeof(Err) == "table" then Err.errorMessage else Err)
					Signal2_4(true)
				end):finally(function()
					-- upvalues: Signal2_1 (upval), Signal2_3 (upval)
					Signal2_1(true)
					Signal2_3(false)
				end)
				
				return
			else
				warn("createInventoryPageStore: pageData must specify assetTypes or outfitInventoryType")
			end
		end
	}
end