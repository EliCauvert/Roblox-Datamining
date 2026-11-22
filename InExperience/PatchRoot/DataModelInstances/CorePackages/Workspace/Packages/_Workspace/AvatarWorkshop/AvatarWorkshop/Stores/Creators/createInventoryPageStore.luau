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
	local Count = 0
	local Flag = false
	local t = {}
	
	local function applyPage(p4)
		-- upvalues: NextPageToken (ref), Signal2_2 (copy), Flag (ref), t (ref), Signal (copy), Signal2 (copy)
		NextPageToken = p4.nextPageToken
		Signal2_2(p4.nextPageToken == nil)
		local Flag1: boolean = Flag
		Flag = false
		
		if Flag1 then
			t = {}
		end
		local T = if Flag1 then {} else table.clone(Signal(false))
		for _, item in p4.items do
			local Text: string = `{item.itemType}:{item.itemId}`
			
			if not t[Text] then
				t[Text] = true
				table.insert(T, item)
			end
		end
		if Flag1 or #p4.items > 0 then
			Signal2(T)
		end
	end
	
	local function fetchNextPage()
		-- upvalues: Signal4 (copy), Signal3 (copy), Query (copy), Signal2_3 (copy), Signal2_4 (copy), Count (ref), P2 (copy), NextPageToken (ref), applyPage (copy), Signal2_1 (copy)
		if Signal4(false) or Signal3(false) then return end
		if Query then
			Signal2_3(true)
			Signal2_4(false)
			local Count1 = Count
			P2.fetchPage(Query, NextPageToken):andThen(function(Result)
				-- upvalues: Count1 (copy), Count (upval), applyPage (upval)
				if Count1 == Count then
					applyPage(Result)
				end
			end):catch(function(Err)
				-- upvalues: Count1 (copy), Count (upval), Signal2_4 (upval)
				if Count1 == Count then
					warn("createInventoryPageStore: avatar-inventory fetch failed:", if typeof(Err) == "table" then Err.errorMessage else Err)
					Signal2_4(true)
					
					return
				end
			end):finally(function()
				-- upvalues: Count1 (copy), Count (upval), Signal2_1 (upval), Signal2_3 (upval)
				if Count1 == Count then
					Signal2_1(true)
					Signal2_3(false)
					
					return
				end
			end)
			
			return
		else
			warn("createInventoryPageStore: pageData must specify assetTypes or outfitInventoryType")
		end
	end
	
	return {
		getEntries = Signal,
		getDidInitialFetch = Signal1,
		getLastPageReached = Signal3,
		getIsFetching = Signal4,
		getHasFetchError = Signal5,
		fetchNextPage = fetchNextPage,
		refresh = function()
			-- upvalues: Count (ref), NextPageToken (ref), Flag (ref), Signal2_2 (copy), Signal2_4 (copy), Signal2_3 (copy), fetchNextPage (copy)
			Count += 1
			NextPageToken = nil
			Flag = true
			Signal2_2(false)
			Signal2_4(false)
			Signal2_3(false)
			fetchNextPage()
		end,
		getItem = function(p5)
			-- upvalues: P2 (copy)
			return if p5.itemType == "Outfit" then P2.getOutfit(p5.itemId).data(false) else P2.getAsset(p5.itemId).data(false)
		end
	}
end