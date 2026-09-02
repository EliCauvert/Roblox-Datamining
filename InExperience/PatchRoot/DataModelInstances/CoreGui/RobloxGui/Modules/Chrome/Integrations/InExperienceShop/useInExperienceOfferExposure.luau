local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local signalsModule = require(corePackagesService.Packages.Signals)
local inExperienceOffersModule = require(corePackagesService.Workspace.Packages.InExperienceOffers)
local localStoreModule = require(chrome.ChromeShared.Service.LocalStore)
local getOffersStore = inExperienceOffersModule.getOffersStore
local isNotificationEligible = inExperienceOffersModule.Utils.isNotificationEligible
local inExperienceOfferExposureStorageKey = game:DefineFastString("InExperienceOfferExposureStorageKey", "InExperienceOfferExposure")
local inExperienceOfferExposureMaxStoredOffers = game:DefineFastInt("InExperienceOfferExposureMaxStoredOffers", 50)
local t = {}

local function loadPersistedTally()
	-- upvalues: localStoreModule (ref), inExperienceOfferExposureStorageKey (ref)
	local var1 = localStoreModule.loadForLocalPlayer(inExperienceOfferExposureStorageKey)
	local t = {}
	
	if type(var1) ~= "table" then
		return t
	end
	for i, v in var1 do
		if type(i) == "string" and type(v) == "table" and (type(v.exposureCount) == "number" and type(v.lastExposureUTCTime) == "string") then
			t[i] = {
				exposureCount = v.exposureCount,
				lastExposureUTCTime = v.lastExposureUTCTime
			}
		end
	end
	return t
end

local function withOldestEvicted(p1)
	-- upvalues: inExperienceOfferExposureMaxStoredOffers (ref)
	local t = {}
	
	for i in p1 do
		table.insert(t, i)
	end
	if #t <= inExperienceOfferExposureMaxStoredOffers then
		return p1
	end
	table.sort(t, function(p2, p3)
		-- upvalues: p1 (ref)
		return p1[p3].lastExposureUTCTime < p1[p2].lastExposureUTCTime
	end)
	local t_1 = {}
	
	for i_1 = 1, inExperienceOfferExposureMaxStoredOffers do
		local var2 = t[i_1]
		t_1[var2] = p1[var2]
	end
	return t_1
end

local function tallyExposures(p2, p3)
	-- upvalues: t (ref), isNotificationEligible (ref), loadPersistedTally (ref), withOldestEvicted (ref), localStoreModule (ref), inExperienceOfferExposureStorageKey (ref)
	if p2 == nil or p3 == nil then return end
	local t_1 = {}
	
	for i, v in p2 do
		for i_1, v_1 in v do
			if not t[v_1.offerId] and isNotificationEligible(v_1, p3) then
				t[v_1.offerId] = true
				table.insert(t_1, v_1.offerId)
			end
		end
	end
	if #t_1 == 0 then return end
	local var3 = loadPersistedTally()
	local var4 = DateTime.now():ToIsoDate()
	
	for i_1, v_1 in t_1 do
		local var5 = var3[v_1]
		var3[v_1] = {
			exposureCount = if var5 ~= nil then 1 else var5.exposureCount + 1,
			lastExposureUTCTime = var4
		}
	end
	localStoreModule.storeForLocalPlayer(inExperienceOfferExposureStorageKey, withOldestEvicted(var3))
end

return function()
	-- upvalues: reactModule (ref), getOffersStore (ref), loadPersistedTally (ref), signalsModule (ref), tallyExposures (ref)
	reactModule.useEffect(function()
		-- upvalues: getOffersStore (copy), loadPersistedTally (copy), signalsModule (copy), tallyExposures (copy)
		local var6 = getOffersStore(false)
		var6.hydrateOfferExposureSnapshot(loadPersistedTally())
		
		return signalsModule.createEffect(function(p4)
			-- upvalues: var6 (ref), tallyExposures (copy)
			if var6.getIsShopAvailable(p4) then
				tallyExposures(var6.getOffers(p4), var6.getOfferExposureSnapshot(p4))
				
				return
			end
		end)
	end, {})
end