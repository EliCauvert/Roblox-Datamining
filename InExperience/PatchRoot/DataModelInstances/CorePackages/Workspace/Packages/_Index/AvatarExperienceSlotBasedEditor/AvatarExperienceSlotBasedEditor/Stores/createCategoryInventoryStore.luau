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

return function()
	-- upvalues: signalsModule (ref), httpService (ref), inventoryItemTypeModule (ref), mutedError (ref), fFlagAXModeratedItemsFlow (ref), fFlagAXEnableModeratedItemsFlowForDurables (ref), fFlagAXInventoryDurablesSupport (ref), fFlagAXBackgroundGeneration (ref)
	local var1 = nil
	local var2, var3 = signalsModule.createSignal(nil)
	local var4, var5 = signalsModule.createSignal(false)
	local var6, var7 = signalsModule.createSignal(httpService:GenerateGUID(true))
	
	return {
		nextPageCursor = nil,
		getItems = var2,
		getHasReachedLastPage = var4,
		getSearchUuid = var6,
		startNewSearch = function()
			-- upvalues: var1 (write), var3 (ref), var5 (ref), var7 (ref), httpService (copy)
			var1.nextPageCursor = nil
			var3(nil)
			var5(false)
			var7(httpService:GenerateGUID(true))
		end,
		addResultsPage = function(p1)
			-- upvalues: var2 (ref), inventoryItemTypeModule (copy), mutedError (copy), fFlagAXModeratedItemsFlow (copy), fFlagAXEnableModeratedItemsFlowForDurables (copy), fFlagAXInventoryDurablesSupport (copy), fFlagAXBackgroundGeneration (copy), var3 (ref), var1 (write), var5 (ref)
			local var8 = var2(false)
			local var9 = if var8 then table.clone(var8) else {}
			
			for i, v in p1.avatarInventoryItems do
				local var10 = if v.itemCategory.itemType == Enum.AvatarItemType.Asset.Value then inventoryItemTypeModule.Asset elseif v.itemCategory.itemType == Enum.AvatarItemType.Bundle.Value then inventoryItemTypeModule.Outfit else inventoryItemTypeModule.Unknown
				
				if var10 == inventoryItemTypeModule.Unknown then
					mutedError(`Unknown item type received from user inventory endpoint: {v.itemCategory.itemType}`)
					continue
				end
				table.insert(var9, {
					itemId = tostring(v.itemId),
					inventoryItemType = var10,
					availabilityStatus = if fFlagAXModeratedItemsFlow or fFlagAXEnableModeratedItemsFlowForDurables then v.availabilityStatus else nil,
					expirationTime = if fFlagAXInventoryDurablesSupport then v.expirationTime else nil,
					isPlusExclusive = if fFlagAXBackgroundGeneration then v.isPlusExclusive else nil
				})
			end
			var3(var9)
			local nextPageToken = p1.nextPageToken
			var1.nextPageCursor = nextPageToken
			
			if nextPageToken == nil or nextPageToken == "" then
				var5(true)
			end
		end
	}
end