local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local InExperienceOffersModule = require(CorePackages.Workspace.Packages.InExperienceOffers)
local LocalStoreModule = require(script:FindFirstAncestor("Chrome").ChromeShared.Service.LocalStore)
local FFlagOfferNotifyOnGlobalIcon = require(CorePackages.Workspace.Packages.SharedFlags).FFlagOfferNotifyOnGlobalIcon
local GetOffersStoreFunction = InExperienceOffersModule.getOffersStore
local IsNotificationEligibleFunction = InExperienceOffersModule.Utils.isNotificationEligible
local NotificationLocation = InExperienceOffersModule.NotificationLocation
local InExperienceOfferExposureStorageKey = game:DefineFastString("InExperienceOfferExposureStorageKey", "InExperienceOfferExposure")
local InExperienceOfferExposureMaxStoredOffers = game:DefineFastInt("InExperienceOfferExposureMaxStoredOffers", 50)
local t = {}

local function loadPersistedTally()
	-- upvalues: LocalStoreModule (copy), InExperienceOfferExposureStorageKey (copy)
	local ForLocalPlayer = LocalStoreModule.loadForLocalPlayer(InExperienceOfferExposureStorageKey)
	local t = {}
	
	if type(ForLocalPlayer) ~= "table" then
		return t
	end
	for i, value in ForLocalPlayer do
		if type(i) == "string" and type(value) == "table" and type(value.exposureCount) == "number" and type(value.lastExposureUTCTime) == "string" then
			t[i] = {
				exposureCount = value.exposureCount,
				lastExposureUTCTime = value.lastExposureUTCTime
			}
		end
	end
	return t
end

local function withOldestEvicted(List)
	-- upvalues: InExperienceOfferExposureMaxStoredOffers (copy)
	local List1 = {}
	
	for i in List do
		table.insert(List1, i)
	end
	if #List1 <= InExperienceOfferExposureMaxStoredOffers then
		return List
	end
	table.sort(List1, function(A, B): boolean
		-- upvalues: List (copy)
		return List[B].lastExposureUTCTime < List[A].lastExposureUTCTime
	end)
	local t = {}
	
	for i1 = 1, InExperienceOfferExposureMaxStoredOffers do
		local Entry = List1[i1]
		t[Entry] = List[Entry]
	end
	return t
end

local function tallyExposures(Offers, OfferExposureSnapshot)
	-- upvalues: t (copy), IsNotificationEligibleFunction (copy), loadPersistedTally (copy), withOldestEvicted (copy), LocalStoreModule (copy), InExperienceOfferExposureStorageKey (copy)
	if Offers == nil or OfferExposureSnapshot == nil then return end
	local List = {}
	
	for _, offer in Offers do
		for _, value in offer do
			if not t[value.offerId] and IsNotificationEligibleFunction(value, OfferExposureSnapshot) then
				t[value.offerId] = true
				table.insert(List, value.offerId)
			end
		end
	end
	if #List == 0 then return end
	local PersistedTally = loadPersistedTally()
	local IsoDate = DateTime.now():ToIsoDate()
	
	for _, value1 in List do
		local PersistedTallyEntry = PersistedTally[value1]
		PersistedTally[value1] = {
			exposureCount = if PersistedTallyEntry == nil then 1 else PersistedTallyEntry.exposureCount + 1,
			lastExposureUTCTime = IsoDate
		}
	end
	LocalStoreModule.storeForLocalPlayer(InExperienceOfferExposureStorageKey, (withOldestEvicted(PersistedTally)))
end

return function()
	-- upvalues: ReactModule (copy), GetOffersStoreFunction (copy), loadPersistedTally (copy), SignalsModule (copy), FFlagOfferNotifyOnGlobalIcon (copy), NotificationLocation (copy), tallyExposures (copy)
	ReactModule.useEffect(function()
		-- upvalues: GetOffersStoreFunction (upval), loadPersistedTally (upval), SignalsModule (upval), FFlagOfferNotifyOnGlobalIcon (upval), NotificationLocation (upval), tallyExposures (upval)
		local OffersStore = GetOffersStoreFunction(false)
		OffersStore.hydrateOfferExposureSnapshot((loadPersistedTally()))
		
		return SignalsModule.createEffect(function(p1)
			-- upvalues: FFlagOfferNotifyOnGlobalIcon (upval), OffersStore (copy), NotificationLocation (upval), tallyExposures (upval)
			if FFlagOfferNotifyOnGlobalIcon then
				if OffersStore.getOfferNotificationShownWithEnum(p1) == NotificationLocation.None then return end
			elseif not OffersStore.getIsShopAvailable(p1) then return end
			tallyExposures(OffersStore.getOffers(p1), OffersStore.getOfferExposureSnapshot(p1))
		end)
	end, {})
end