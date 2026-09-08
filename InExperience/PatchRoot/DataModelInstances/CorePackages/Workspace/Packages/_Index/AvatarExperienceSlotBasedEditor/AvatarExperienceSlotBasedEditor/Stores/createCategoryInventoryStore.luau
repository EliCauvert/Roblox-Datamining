local httpService = game:GetService("HttpService")
local avatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local parent = avatarExperienceSlotBasedEditor.Parent
local signalsModule = require(parent.Signals)
local mutedError = require(parent.Loggers).mutedError
local inventoryItemTypeModule = require(avatarExperienceSlotBasedEditor.Enums.InventoryItemType)
local _ = require(avatarExperienceSlotBasedEditor.Enums.InventoryItemAvailability)
local _ = require(script.Parent.Parent.Types)
local fFlagAXModeratedItemsFlow = require(parent.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local fFlagAXInventoryDurablesSupport = require(parent.AvatarExperienceFlags).FFlagAXInventoryDurablesSupport
local fFlagAXEnableModeratedItemsFlowForDurables = require(parent.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local fFlagAXBackgroundGeneration = require(parent.AvatarExperienceFlags).FFlagAXBackgroundGeneration
local fFlagAXRefetchInventoryOnUpdate = require(parent.AvatarExperienceFlags).FFlagAXRefetchInventoryOnUpdate

return function()
	-- upvalues: signalsModule (ref), httpService (ref), fFlagAXRefetchInventoryOnUpdate (ref), inventoryItemTypeModule (ref), mutedError (ref), fFlagAXModeratedItemsFlow (ref), fFlagAXEnableModeratedItemsFlowForDurables (ref), fFlagAXInventoryDurablesSupport (ref), fFlagAXBackgroundGeneration (ref)
	local var1 = nil
	local var2, var3 = signalsModule.createSignal(nil)
	local var4, var5 = signalsModule.createSignal(false)
	local var6, var7 = signalsModule.createSignal(httpService:GenerateGUID(true))
	local var8 = if fFlagAXRefetchInventoryOnUpdate then false else nil
	
	return {
		nextPageCursor = nil,
		getItems = var2,
		getHasReachedLastPage = var4,
		getSearchUuid = var6,
		isRefreshPending = function()
			-- upvalues: var8 (write)
			return var8 == true
		end,
		startNewSearch = function()
			-- upvalues: var1 (write), fFlagAXRefetchInventoryOnUpdate (copy), var8 (write), var3 (ref), var5 (ref), var7 (ref), httpService (copy)
			var1.nextPageCursor = nil
			
			if fFlagAXRefetchInventoryOnUpdate then
				var8 = false
			end
			var3(nil)
			var5(false)
			var7(httpService:GenerateGUID(true))
		end,
		startRefresh = function()
			-- upvalues: var1 (write), var8 (write), var5 (ref), var7 (ref), httpService (copy)
			var1.nextPageCursor = nil
			var8 = true
			var5(false)
			var7(httpService:GenerateGUID(true))
		end,
		removeItems = function(p1)
			-- upvalues: var2 (ref), var3 (ref)
			local var9 = var2(false)
			
			if not var9 then return end
			local t = {}
			
			for i, v in p1 do
				t[v] = true
			end
			local t_1 = {}
			
			for i_1, v_1 in var9 do
				if not t[v_1.itemId] then
					t_1[#t_1 + 1] = v_1
				end
			end
			if #t_1 == #var9 then
				return
			end
			var3(if #t_1 > 0 then t_1 else nil)
		end,
		addResultsPage = function(p2, p3)
			-- upvalues: fFlagAXRefetchInventoryOnUpdate (copy), var6 (ref), var8 (write), var2 (ref), inventoryItemTypeModule (copy), mutedError (copy), fFlagAXModeratedItemsFlow (copy), fFlagAXEnableModeratedItemsFlowForDurables (copy), fFlagAXInventoryDurablesSupport (copy), fFlagAXBackgroundGeneration (copy), var3 (ref), var1 (write), var5 (ref)
			if fFlagAXRefetchInventoryOnUpdate and p3 ~= nil and p3 ~= var6(false) then return end
			local var10 = fFlagAXRefetchInventoryOnUpdate and var8 == true
			
			if fFlagAXRefetchInventoryOnUpdate then
				var8 = false
			end
			local var11 = if var10 then nil else var2(false)
			local var12 = if var11 then table.clone(var11) else {}
			
			for i, v in p2.avatarInventoryItems do
				local var13 = if v.itemCategory.itemType == Enum.AvatarItemType.Asset.Value then inventoryItemTypeModule.Asset elseif v.itemCategory.itemType == Enum.AvatarItemType.Bundle.Value then inventoryItemTypeModule.Outfit else inventoryItemTypeModule.Unknown
				
				if var13 == inventoryItemTypeModule.Unknown then
					mutedError(`Unknown item type received from user inventory endpoint: {v.itemCategory.itemType}`)
					continue
				end
				table.insert(var12, {
					itemId = tostring(v.itemId),
					inventoryItemType = var13,
					availabilityStatus = if fFlagAXModeratedItemsFlow or fFlagAXEnableModeratedItemsFlowForDurables then v.availabilityStatus else nil,
					expirationTime = if fFlagAXInventoryDurablesSupport then v.expirationTime else nil,
					isPlusExclusive = if fFlagAXBackgroundGeneration then v.isPlusExclusive else nil
				})
			end
			var3(var12)
			local nextPageToken = p2.nextPageToken
			var1.nextPageCursor = nextPageToken
			
			if nextPageToken == nil or nextPageToken == "" then
				var5(true)
			end
		end
	}
end