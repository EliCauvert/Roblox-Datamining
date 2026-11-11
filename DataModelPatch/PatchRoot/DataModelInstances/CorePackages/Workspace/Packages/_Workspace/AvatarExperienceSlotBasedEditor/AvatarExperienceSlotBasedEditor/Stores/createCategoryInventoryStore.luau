local HttpService = game:GetService("HttpService")
local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local SignalsModule = require(Parent.Signals)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local InventoryItemTypeModule = require(AvatarExperienceSlotBasedEditor.Enums.InventoryItemType)
local _ = require(AvatarExperienceSlotBasedEditor.Enums.InventoryItemAvailability)
local _ = require(script.Parent.Parent.Types)
local FFlagAXModeratedItemsFlow = require(Parent.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXInventoryDurablesSupport = require(Parent.AvatarExperienceFlags).FFlagAXInventoryDurablesSupport
local FFlagAXEnableModeratedItemsFlowForDurables = require(Parent.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables

return function()
	-- upvalues: SignalsModule (copy), HttpService (copy), InventoryItemTypeModule (copy), MutedErrorFunction (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), FFlagAXInventoryDurablesSupport (copy)
	local v1 = nil
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(HttpService:GenerateGUID(true))
	v1 = {
		nextPageCursor = nil,
		getItems = Signal,
		getHasReachedLastPage = Signal1,
		getSearchUuid = Signal3,
		startNewSearch = function()
			-- upvalues: v1 (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), HttpService (upval)
			v1.nextPageCursor = nil
			Signal2(nil)
			Signal2_1(false)
			Signal2_2(HttpService:GenerateGUID(true))
		end,
		addResultsPage = function(p1)
			-- upvalues: Signal (copy), InventoryItemTypeModule (upval), MutedErrorFunction (upval), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), FFlagAXInventoryDurablesSupport (upval), Signal2 (copy), v1 (ref), Signal2_1 (copy)
			local SignalResult = Signal(false)
			local Copy = if SignalResult then table.clone(SignalResult) else {}
			for _, avatarInventoryItem in p1.avatarInventoryItems do
				local Asset = if avatarInventoryItem.itemCategory.itemType == Enum.AvatarItemType.Asset.Value then InventoryItemTypeModule.Asset elseif avatarInventoryItem.itemCategory.itemType == Enum.AvatarItemType.Bundle.Value then InventoryItemTypeModule.Outfit else InventoryItemTypeModule.Unknown
				
				if Asset == InventoryItemTypeModule.Unknown then
					MutedErrorFunction(`Unknown item type received from user inventory endpoint: {avatarInventoryItem.itemCategory.itemType}`)
				else
					table.insert(Copy, {
						itemId = tostring(avatarInventoryItem.itemId),
						inventoryItemType = Asset,
						availabilityStatus = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then avatarInventoryItem.availabilityStatus else nil,
						expirationTime = if FFlagAXInventoryDurablesSupport then avatarInventoryItem.expirationTime else nil
					})
				end
			end
			Signal2(Copy)
			local NextPageToken = p1.nextPageToken
			v1.nextPageCursor = NextPageToken
			
			if NextPageToken == nil or NextPageToken == "" then
				Signal2_1(true)
			end
		end
	}
	
	return v1
end