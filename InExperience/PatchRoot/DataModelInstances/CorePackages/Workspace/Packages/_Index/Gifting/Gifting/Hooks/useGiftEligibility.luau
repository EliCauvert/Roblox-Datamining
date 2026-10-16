local Gifting = script:FindFirstAncestor("Gifting")
local Parent = Gifting.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DataStatus = require(Parent.DataHydration).DataStatus
local _ = require(Gifting.Models.CanGiftResponseModel)
local _ = require(Gifting.Stores.createCanGiftStore)
local GetCanGiftStoreModule = require(Gifting.Stores.getCanGiftStore)
local GiftEligibilityModule = require(Gifting.Enums.GiftEligibility)
local _ = require(Gifting.Types)
local BuildItemGiftabilityKeyFunction = require(Gifting.Stores.itemGiftabilityCacheKey).buildItemGiftabilityKey
local t = {}

local function buildItemsSignature(Current): string? --[[ Line: 43 ]]
	-- upvalues: BuildItemGiftabilityKeyFunction (copy)
	if Current == nil or #Current == 0 then
		return nil
	end
	local List = {}
	
	for _, value in Current do
		table.insert(List, BuildItemGiftabilityKeyFunction(value))
	end
	return table.concat(List, ",")
end

local function createEligibilitySignal(Store, Current) --[[ Line: 55 ]]
	-- upvalues: SignalsModule (copy), GiftEligibilityModule (copy), t (copy), DataStatus (copy)
	local v1: boolean = Current ~= nil and #Current > 0
	local SenderEligibility = Store.getSenderEligibility()
	local T = if Current == nil or #Current <= 0 then {} else Store.getAndFetchItemGiftabilities(Current)
	
	return SignalsModule.createComputed(function(p1) --[[ Line: 62 ]]
		-- upvalues: SenderEligibility (copy), GiftEligibilityModule (upval), t (upval), T (copy), DataStatus (upval), v1 (copy)
		local StatusResult = SenderEligibility.status(p1)
		local DataResult = SenderEligibility.data(p1)
		local Unknown = if DataResult == nil then GiftEligibilityModule.Unknown else DataResult.eligibility
		local T1 = if DataResult == nil then t else DataResult.requiredActions
		local Flag = false
		local Flag1 = false
		local Flag2 = false
		
		for _, value in T do
			local StatusResult1 = value.status(p1)
			
			if StatusResult1 == DataStatus.NotReady then
				Flag = true
			elseif StatusResult1 == DataStatus.Failed then
				Flag1 = true
			end
			local DataResult1 = value.data(p1)
			
			if DataResult1 == nil or not DataResult1.isGiftable then
				Flag2 = true
			end
		end
		local IsStatusResultMatch: boolean = StatusResult == DataStatus.NotReady or Flag
		local IsStatusResultMatch1: boolean = StatusResult == DataStatus.Failed or Flag1
		
		return {
			canGift = not IsStatusResultMatch and (not IsStatusResultMatch1 and (Unknown == GiftEligibilityModule.Eligible and not Flag2)),
			areItemsGiftable = v1 and (not Flag and (not Flag1 and not Flag2)),
			senderEligibility = Unknown,
			requiredActions = T1,
			isLoading = IsStatusResultMatch,
			hasFailed = IsStatusResultMatch1
		}
	end)
end

return function(Current, p1) --[[ Line: 109 | Named "useGiftEligibility" ]]
	-- upvalues: GetCanGiftStoreModule (copy), buildItemsSignature (copy), ReactModule (copy), createEligibilitySignal (copy), SignalsReactModule (copy)
	local Store = (if p1 then p1.store else nil) or GetCanGiftStoreModule(false)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 119 ]]
		-- upvalues: createEligibilitySignal (upval), Store (copy), UseRefResult (copy)
		return createEligibilitySignal(Store, UseRefResult.current)
	end, { Store, (buildItemsSignature(Current)) })))
end