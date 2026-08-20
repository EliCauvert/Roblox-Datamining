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

return function() --[[ line: 42 | named "createCategoryInventoryStore" ]]
	-- upvalues: signalsModule (ref), httpService (ref), inventoryItemTypeModule (ref), mutedError (ref), fFlagAXModeratedItemsFlow (ref), fFlagAXEnableModeratedItemsFlowForDurables (ref), fFlagAXInventoryDurablesSupport (ref), fFlagAXBackgroundGeneration (ref)
	local var4 = nil
	local var5, var6 = signalsModule.createSignal(nil)
	local var7, var8 = signalsModule.createSignal(false)
	local var9, var10 = signalsModule.createSignal(httpService:GenerateGUID(true))
	
	return {
		nextPageCursor = nil,
		getItems = var5,
		getHasReachedLastPage = var7,
		getSearchUuid = var9,
		startNewSearch = function() --[[ line: 51 ]]
			-- upvalues: var4 (write), var6 (ref), var8 (ref), var10 (ref), httpService (copy)
			var4.nextPageCursor = nil
			var6(nil)
			var8(false)
			var10(httpService:GenerateGUID(true))
		end,
		addResultsPage = function(p0) --[[ line: 59 ]]
			-- upvalues: var5 (ref), inventoryItemTypeModule (copy), mutedError (copy), fFlagAXModeratedItemsFlow (copy), fFlagAXEnableModeratedItemsFlowForDurables (copy), fFlagAXInventoryDurablesSupport (copy), fFlagAXBackgroundGeneration (copy), var6 (ref), var4 (write), var8 (ref)
			local var11 = var5(false)
			local var12 = if var11 then table.clone(var11) else {}
			
			for i, v in p0.avatarInventoryItems do
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
			var6(var12)
			local nextPageToken = p0.nextPageToken
			var4.nextPageCursor = nextPageToken
			
			if nextPageToken == nil or nextPageToken == "" then
				var8(true)
			end
		end
	}
end