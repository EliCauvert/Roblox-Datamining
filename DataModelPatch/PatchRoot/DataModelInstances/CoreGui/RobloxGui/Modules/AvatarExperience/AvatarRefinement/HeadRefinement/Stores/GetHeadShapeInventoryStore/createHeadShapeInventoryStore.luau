local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local SignalsModule = require(CorePackages.Packages.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpStoreModule = require(CorePackages.Workspace.Packages.HttpStore)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaAppUseAppHttpStore = SharedFlagsModule.FFlagLuaAppUseAppHttpStore
local FFlagLuaAppHeadShapeInventory = SharedFlagsModule.FFlagLuaAppHeadShapeInventory
local FFlagAXInventoryIncludeUnavailableItems = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryIncludeUnavailableItems
local InternalHttpStoreModule = require(CorePackages.Workspace.Packages.InternalHttpStore)
local IsHttpStoreFetchCancelledFunction = HttpStoreModule.isHttpStoreFetchCancelled
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError

return function()
	-- upvalues: CreateSignalFunction (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), Modules (copy), FFlagAXInventoryIncludeUnavailableItems (copy), SignalsModule (copy), FFlagLuaAppHeadShapeInventory (copy), HttpService (copy), MutedErrorFunction (copy), IsHttpStoreFetchCancelledFunction (copy), CreateComputedFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Flag = false
	local HttpStore = InternalHttpStoreModule.GetHttpStore()
	
	if FFlagLuaAppUseAppHttpStore then
		local GetResult = HttpStoreModule.Instance.get()
		
		if GetResult then
			HttpStore = GetResult
		end
	end
	local Effect: (() -> ())? = nil
	
	local function fetchInventory()
		-- upvalues: Signal (copy), Flag (ref), Modules (upval), FFlagAXInventoryIncludeUnavailableItems (upval), HttpStore (ref), Effect (ref), SignalsModule (upval), FFlagLuaAppHeadShapeInventory (upval), HttpService (upval), Signal2 (copy), MutedErrorFunction (upval), IsHttpStoreFetchCancelledFunction (upval)
		if Signal(false) or Flag then return end
		Flag = true
		local UrlModule = require(Modules.LuaApp.Http.Url)
		local HeadShapeInventory, _ = HttpStore.fetch("HeadShapeInventory", {
			Method = "GET",
			Url = string.format("%sv1/avatar-inventory?%s", UrlModule.AVATAR_URL, UrlModule:makeQueryString({
				pageLimit = 100,
				sortOption = "recentAdded",
				pageToken = "",
				includeUnavailableItems = if FFlagAXInventoryIncludeUnavailableItems then true else nil,
				["itemCategories[0].itemType"] = "HeadShape",
				["itemCategories[0].itemSubType"] = 1
			}))
		})
		
		if Effect then
			Effect()
		end
		Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: HeadShapeInventory (copy), FFlagLuaAppHeadShapeInventory (upval), HttpService (upval), Effect (upval), Signal2 (upval), Flag (upval), MutedErrorFunction (upval), IsHttpStoreFetchCancelledFunction (upval)
			local HeadShapeInventoryResult = HeadShapeInventory(p1)
			
			if HeadShapeInventoryResult.status == "Success" then
				local Body = if FFlagLuaAppHeadShapeInventory then HeadShapeInventoryResult.response.Body else HeadShapeInventoryResult.response.Body
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), Body (copy)
					return HttpService:JSONDecode(Body)
				end)
				
				if not Success or not Result then
					MutedErrorFunction("Failed to decode HeadShape inventory JSON response")
					Flag = false
					
					return
				end
				if FFlagLuaAppHeadShapeInventory then
					task.defer(function()
						-- upvalues: Effect (upval), Signal2 (upval), Result (copy), Flag (upval)
						local Callback: () -> () = Effect
						
						if Callback then
							Effect = nil
							Callback()
						end
						Signal2(Result)
						Flag = false
					end)
					
					return
				else
					Signal2(Result)
					Flag = false
					
					return
				end
			else
				if HeadShapeInventoryResult.status == "Failed" then
					if FFlagLuaAppHeadShapeInventory then
						if not IsHttpStoreFetchCancelledFunction(HeadShapeInventoryResult) then
							MutedErrorFunction("Failed to fetch HeadShape inventory")
						end
					else
						MutedErrorFunction("Failed to fetch HeadShape inventory")
					end
					Flag = false
				end
			end
		end)
	end
	
	return {
		getInventory = CreateComputedFunction(function(p1)
			-- upvalues: Signal (copy), Flag (ref), fetchInventory (copy)
			local SignalResult = Signal(p1)
			
			if SignalResult == nil and not Flag then
				fetchInventory()
			end
			return SignalResult
		end),
		fetchInventory = fetchInventory
	}
end