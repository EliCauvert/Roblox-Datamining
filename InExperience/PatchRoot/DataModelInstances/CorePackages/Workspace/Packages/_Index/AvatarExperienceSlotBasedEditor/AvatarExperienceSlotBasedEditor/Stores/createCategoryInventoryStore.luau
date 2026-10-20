local HttpService = game:GetService("HttpService")
local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local SignalsModule = require(Parent.Signals)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local InventoryItemTypeModule = require(AvatarExperienceSlotBasedEditor.Enums.InventoryItemType)
local _ = require(AvatarExperienceSlotBasedEditor.Enums.InventoryItemAvailability)
local _ = require(script.Parent.Parent.Types)
local FFlagAXInventoryDurablesSupport = require(Parent.AvatarExperienceFlags).FFlagAXInventoryDurablesSupport
local FFlagAXBackgroundGeneration = require(Parent.AvatarExperienceFlags).FFlagAXBackgroundGeneration
local FFlagAXRefetchInventoryOnUpdate = require(Parent.AvatarExperienceFlags).FFlagAXRefetchInventoryOnUpdate

return function()
	-- upvalues: SignalsModule (copy), HttpService (copy), FFlagAXRefetchInventoryOnUpdate (copy), InventoryItemTypeModule (copy), MutedErrorFunction (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXBackgroundGeneration (copy)
	local v1 = nil
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(HttpService:GenerateGUID(true))
	local Flag = not FFlagAXRefetchInventoryOnUpdate and nil
	v1 = {
		nextPageCursor = nil,
		getItems = Signal,
		getHasReachedLastPage = Signal1,
		getSearchUuid = Signal3,
		isRefreshPending = function(): boolean
			-- upvalues: Flag (ref)
			return Flag == true
		end,
		startNewSearch = function()
			-- upvalues: v1 (ref), FFlagAXRefetchInventoryOnUpdate (upval), Flag (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), HttpService (upval)
			v1.nextPageCursor = nil
			
			if FFlagAXRefetchInventoryOnUpdate then
				Flag = false
			end
			Signal2(nil)
			Signal2_1(false)
			Signal2_2(HttpService:GenerateGUID(true))
		end,
		startRefresh = function()
			-- upvalues: v1 (ref), Flag (ref), Signal2_1 (copy), Signal2_2 (copy), HttpService (upval)
			v1.nextPageCursor = nil
			Flag = true
			Signal2_1(false)
			Signal2_2(HttpService:GenerateGUID(true))
		end,
		removeItems = function(List)
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal(false)
			
			if not SignalResult then return end
			local t = {}
			
			for _, value in List do
				t[value] = true
			end
			local t1 = {}
			
			for _, value1 in SignalResult do
				if not t[value1.itemId] then
					t1[#t1 + 1] = value1
				end
			end
			if #t1 ~= #SignalResult then
				Signal2(if #t1 > 0 then t1 else nil)
				
				return
			end
		end,
		addResultsPage = function(p1, p2)
			-- upvalues: FFlagAXRefetchInventoryOnUpdate (upval), Signal3 (copy), Flag (ref), Signal (copy), InventoryItemTypeModule (upval), MutedErrorFunction (upval), FFlagAXInventoryDurablesSupport (upval), FFlagAXBackgroundGeneration (upval), Signal2 (copy), v1 (ref), Signal2_1 (copy)
			if FFlagAXRefetchInventoryOnUpdate and p2 ~= nil and p2 ~= Signal3(false) then return end
			local IsFlag: boolean = FFlagAXRefetchInventoryOnUpdate and Flag == true
			
			if FFlagAXRefetchInventoryOnUpdate then
				Flag = false
			end
			local SignalResult = if IsFlag then nil else Signal(false)
			local Copy = if SignalResult then table.clone(SignalResult) else {}
			for _, avatarInventoryItem in p1.avatarInventoryItems do
				local Asset = if avatarInventoryItem.itemCategory.itemType == Enum.AvatarItemType.Asset.Value then InventoryItemTypeModule.Asset elseif avatarInventoryItem.itemCategory.itemType == Enum.AvatarItemType.Bundle.Value then InventoryItemTypeModule.Outfit else InventoryItemTypeModule.Unknown
				
				if Asset == InventoryItemTypeModule.Unknown then
					MutedErrorFunction(`Unknown item type received from user inventory endpoint: {avatarInventoryItem.itemCategory.itemType}`)
				else
					table.insert(Copy, {
						itemId = tostring(avatarInventoryItem.itemId),
						inventoryItemType = Asset,
						availabilityStatus = avatarInventoryItem.availabilityStatus,
						expirationTime = if FFlagAXInventoryDurablesSupport then avatarInventoryItem.expirationTime else nil,
						isPlusExclusive = if FFlagAXBackgroundGeneration then avatarInventoryItem.isPlusExclusive else nil
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