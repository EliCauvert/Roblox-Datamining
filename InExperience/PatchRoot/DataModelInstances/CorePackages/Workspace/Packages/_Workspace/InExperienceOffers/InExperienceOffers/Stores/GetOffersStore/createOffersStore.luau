local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local Parent = InExperienceOffers.Parent
local _ = require(Parent.Promise)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local GetAllUserOffersModule = require(InExperienceOffers.Api.getAllUserOffers)
local OffersDebugLoggerModule = require(InExperienceOffers.Internal.OffersDebugLogger)
local _ = require(InExperienceOffers.Types)
local MockGetAllUserOffersModule = require(InExperienceOffers.Mocks.MockGetAllUserOffers)
local GetSecondsUntilNextExpirationModule = require(InExperienceOffers.Utils.getSecondsUntilNextExpiration)
local GetSecondsUntilAnyKeyEmptiesModule = require(InExperienceOffers.Utils.getSecondsUntilAnyKeyEmpties)
local IsNotificationEligibleModule = require(InExperienceOffers.Utils.isNotificationEligible)
local FeatureKeyModule = require(InExperienceOffers.Enums.FeatureKey)
local NotificationLocationModule = require(InExperienceOffers.Enums.NotificationLocation)
local FFlagEnableUserOffers = SharedFlagsModule.FFlagEnableUserOffers
local FFlagHideOfferNotificationsWhenShopEmpty = SharedFlagsModule.FFlagHideOfferNotificationsWhenShopEmpty
local FFlagOffersRespectExpirationModule = require(InExperienceOffers.Flags.FFlagOffersRespectExpiration)
local FFlagOffersMergeStoreResultsModule = require(InExperienceOffers.Flags.FFlagOffersMergeStoreResults)
local FFlagUseMockUserOffersModule = require(InExperienceOffers.Flags.FFlagUseMockUserOffers)
local FIntOfferExpirationRefetchBufferSecondsModule = require(InExperienceOffers.Flags.FIntOfferExpirationRefetchBufferSeconds)
local FIntOfferExpirationRefetchJitterSecondsModule = require(InExperienceOffers.Flags.FIntOfferExpirationRefetchJitterSeconds)
local FIntOfferExpirationRefetchMaxCountModule = require(InExperienceOffers.Flags.FIntOfferExpirationRefetchMaxCount)
local FFlagOffersPerKeyExpiryRefetchModule = require(InExperienceOffers.Flags.FFlagOffersPerKeyExpiryRefetch)
local FFlagOffersShopScopedNotificationModule = require(InExperienceOffers.Flags.FFlagOffersShopScopedNotification)

local function normalizePresentationData(PresentationData)
	if PresentationData == nil then
		return nil
	end
	local t = {}
	
	for _, value in PresentationData do
		if value.banner ~= nil then
			t.banner = value.banner
		end
		if value.menuBadge ~= nil then
			t.menuBadge = value.menuBadge
		end
		if value.tooltip ~= nil then
			t.tooltip = value.tooltip
		end
	end
	return t
end

local function _(p1)
	-- upvalues: normalizePresentationData (copy)
	return {
		offerId = p1.offerId,
		offerStatus = p1.offerStatus,
		featureKeys = p1.featureKeys,
		expirationTimeInUTC = p1.expirationTimeInUTC,
		presentationData = normalizePresentationData(p1.presentationData)
	}
end

local function bucketResponse(p1)
	-- upvalues: normalizePresentationData (copy)
	local t = {}
	
	for _, offer in p1.offers do
		local config = {
			offerId = offer.offerId,
			offerStatus = offer.offerStatus,
			featureKeys = offer.featureKeys,
			expirationTimeInUTC = offer.expirationTimeInUTC,
			presentationData = normalizePresentationData(offer.presentationData)
		}
		
		for _, featureKey in config.featureKeys do
			local List = t[featureKey]
			
			if List == nil then
				List = {}
				t[featureKey] = List
			end
			table.insert(List, config)
		end
	end
	return t
end

local function mergeRequestedKeys(Tbl, p2, List)
	local T = if Tbl == nil then {} else table.clone(Tbl)
	for _, value in List do
		T[value] = p2[value]
	end
	return T
end

local _ = function(List)
	local List1 = {}
	
	for i in List do
		table.insert(List1, i)
	end
	return List1
end

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy), SignalsModule (copy), FFlagHideOfferNotificationsWhenShopEmpty (copy), FFlagOffersShopScopedNotificationModule (copy), FeatureKeyModule (copy), IsNotificationEligibleModule (copy), NotificationLocationModule (copy), FFlagUseMockUserOffersModule (copy), MockGetAllUserOffersModule (copy), GetAllUserOffersModule (copy), normalizePresentationData (copy), FFlagOffersRespectExpirationModule (copy), bucketResponse (copy), mergeRequestedKeys (copy), FFlagEnableUserOffers (copy), FFlagOffersMergeStoreResultsModule (copy), OffersDebugLoggerModule (copy), FIntOfferExpirationRefetchMaxCountModule (copy), FIntOfferExpirationRefetchBufferSecondsModule (copy), FIntOfferExpirationRefetchJitterSecondsModule (copy), GetSecondsUntilAnyKeyEmptiesModule (copy), FFlagOffersPerKeyExpiryRefetchModule (copy), GetSecondsUntilNextExpirationModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
	local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction(nil)
	local SessionScopedSignal3, SessionScopedSignal2_2 = CreateSessionScopedSignalFunction(false)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(true)
	local Signal3, Signal2_2 = SignalsModule.createSignal(true)
	local MockGetAllUserOffersModule1 = if FFlagUseMockUserOffersModule then MockGetAllUserOffersModule else GetAllUserOffersModule
	local v1 = nil
	local DelayedThread = nil
	local Count = 0
	local Count1 = 0
	local Callback = nil
	
	local function _()
		-- upvalues: DelayedThread (ref)
		if DelayedThread ~= nil then
			pcall(task.cancel, DelayedThread)
			DelayedThread = nil
		end
	end
	
	local function commitOffers(p3)
		-- upvalues: normalizePresentationData (upval), SessionScopedSignal2 (copy), FFlagOffersRespectExpirationModule (upval), Callback (ref)
		local t = {}
		
		for _, offer in p3.offers do
			local config = {
				offerId = offer.offerId,
				offerStatus = offer.offerStatus,
				featureKeys = offer.featureKeys,
				expirationTimeInUTC = offer.expirationTimeInUTC,
				presentationData = normalizePresentationData(offer.presentationData)
			}
			
			for _, featureKey in config.featureKeys do
				local List = t[featureKey]
				
				if List == nil then
					List = {}
					t[featureKey] = List
				end
				table.insert(List, config)
			end
		end
		SessionScopedSignal2(t)
		
		if FFlagOffersRespectExpirationModule then
			Callback(t)
		end
	end
	
	local _ = function(p4, p5)
		-- upvalues: bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (copy), SessionScopedSignal2 (copy), FFlagOffersRespectExpirationModule (upval), Callback (ref)
		local MergeRequestedKeysResult = mergeRequestedKeys(SessionScopedSignal(false), bucketResponse(p5), p4)
		SessionScopedSignal2(MergeRequestedKeysResult)
		
		if FFlagOffersRespectExpirationModule then
			Callback(MergeRequestedKeysResult)
		end
	end
	
	local function expireShopOffers()
		-- upvalues: SessionScopedSignal (copy), FeatureKeyModule (upval), SessionScopedSignal2 (copy)
		local SessionScopedSignalResult = SessionScopedSignal(false)
		
		if SessionScopedSignalResult == nil or SessionScopedSignalResult[FeatureKeyModule.RobloxShop] == nil then return end
		local t = {}
		
		for i, value in SessionScopedSignalResult do
			if i ~= FeatureKeyModule.RobloxShop then
				t[i] = value
			end
		end
		SessionScopedSignal2(t)
	end
	
	local _ = function(Count, p4)
		-- upvalues: Count1 (ref), commitOffers (copy)
		if Count == Count1 then
			commitOffers(p4)
			
			return
		end
	end
	
	local _ = function(Count, p4, p5)
		-- upvalues: Count1 (ref), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (copy), SessionScopedSignal2 (copy), FFlagOffersRespectExpirationModule (upval), Callback (ref)
		if Count ~= Count1 then return end
		local MergeRequestedKeysResult = mergeRequestedKeys(SessionScopedSignal(false), bucketResponse(p5), p4)
		SessionScopedSignal2(MergeRequestedKeysResult)
		
		if FFlagOffersRespectExpirationModule then
			Callback(MergeRequestedKeysResult)
		end
	end
	
	local function fetchOffers(p4)
		-- upvalues: FFlagEnableUserOffers (upval), FFlagOffersRespectExpirationModule (upval), v1 (ref), DelayedThread (ref), Count1 (ref), MockGetAllUserOffersModule1 (copy), FFlagOffersMergeStoreResultsModule (upval), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (copy), SessionScopedSignal2 (copy), Callback (ref), commitOffers (copy), OffersDebugLoggerModule (upval)
		if not FFlagEnableUserOffers then return end
		if not FFlagOffersRespectExpirationModule then
			MockGetAllUserOffersModule1(p4):andThen(function(Result)
				-- upvalues: FFlagOffersMergeStoreResultsModule (upval), p4 (copy), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (upval), SessionScopedSignal2 (upval), FFlagOffersRespectExpirationModule (upval), Callback (upval), commitOffers (upval)
				if FFlagOffersMergeStoreResultsModule then
					local MergeRequestedKeysResult = mergeRequestedKeys(SessionScopedSignal(false), bucketResponse(Result), p4)
					SessionScopedSignal2(MergeRequestedKeysResult)
					
					if FFlagOffersRespectExpirationModule then
						Callback(MergeRequestedKeysResult)
						
						return
					end
				else
					commitOffers(Result)
				end
			end):catch(function(Err)
				-- upvalues: OffersDebugLoggerModule (upval)
				OffersDebugLoggerModule.log("fetchOffers failed: " .. tostring(Err))
			end)
			
			return
		end
		v1 = p4
		
		if DelayedThread ~= nil then
			pcall(task.cancel, DelayedThread)
			DelayedThread = nil
		end
		Count1 += 1
		local Count: number = Count1
		MockGetAllUserOffersModule1(p4):andThen(function(Result)
			-- upvalues: FFlagOffersMergeStoreResultsModule (upval), Count (copy), p4 (copy), Count1 (upval), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (upval), SessionScopedSignal2 (upval), FFlagOffersRespectExpirationModule (upval), Callback (upval), commitOffers (upval)
			if FFlagOffersMergeStoreResultsModule then
				if Count ~= Count1 then return end
				local MergeRequestedKeysResult = mergeRequestedKeys(SessionScopedSignal(false), bucketResponse(Result), p4)
				SessionScopedSignal2(MergeRequestedKeysResult)
				
				if FFlagOffersRespectExpirationModule then
					Callback(MergeRequestedKeysResult)
					
					return
				end
			elseif Count ~= Count1 then return end
			commitOffers(Result)
		end):catch(function(Err)
			-- upvalues: OffersDebugLoggerModule (upval), Count (copy), Count1 (upval), SessionScopedSignal (upval), Callback (upval)
			OffersDebugLoggerModule.log("fetchOffers failed: " .. tostring(Err))
			
			if Count == Count1 then
				local SessionScopedSignalResult = SessionScopedSignal(false)
				
				if SessionScopedSignalResult ~= nil then
					Callback(SessionScopedSignalResult)
				end
			end
		end)
	end
	
	local function armExpirationRefetch(p4, p5)
		-- upvalues: Count (ref), FIntOfferExpirationRefetchMaxCountModule (upval), FIntOfferExpirationRefetchBufferSecondsModule (upval), FIntOfferExpirationRefetchJitterSecondsModule (upval), DelayedThread (ref), Count1 (ref), MockGetAllUserOffersModule1 (copy), FFlagOffersMergeStoreResultsModule (upval), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (copy), SessionScopedSignal2 (copy), FFlagOffersRespectExpirationModule (upval), Callback (ref), commitOffers (copy), OffersDebugLoggerModule (upval)
		if FIntOfferExpirationRefetchMaxCountModule <= Count then return end
		local NewFIntOfferExpirationRefetchBufferSecondsModule = p5 + FIntOfferExpirationRefetchBufferSecondsModule
		
		if FIntOfferExpirationRefetchJitterSecondsModule > 0 then
			NewFIntOfferExpirationRefetchBufferSecondsModule += math.random() * FIntOfferExpirationRefetchJitterSecondsModule
		end
		DelayedThread = task.delay(NewFIntOfferExpirationRefetchBufferSecondsModule, function()
			-- upvalues: DelayedThread (upval), Count (upval), Count1 (upval), MockGetAllUserOffersModule1 (upval), p4 (copy), FFlagOffersMergeStoreResultsModule (upval), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (upval), SessionScopedSignal2 (upval), FFlagOffersRespectExpirationModule (upval), Callback (upval), commitOffers (upval), OffersDebugLoggerModule (upval)
			DelayedThread = nil
			Count += 1
			local Count2 = Count1
			MockGetAllUserOffersModule1(p4):andThen(function(Result)
				-- upvalues: FFlagOffersMergeStoreResultsModule (upval), Count2 (copy), p4 (upval), Count1 (upval), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (upval), SessionScopedSignal2 (upval), FFlagOffersRespectExpirationModule (upval), Callback (upval), commitOffers (upval)
				if FFlagOffersMergeStoreResultsModule then
					if Count2 ~= Count1 then return end
					local MergeRequestedKeysResult = mergeRequestedKeys(SessionScopedSignal(false), bucketResponse(Result), p4)
					SessionScopedSignal2(MergeRequestedKeysResult)
					
					if FFlagOffersRespectExpirationModule then
						Callback(MergeRequestedKeysResult)
						
						return
					end
				elseif Count2 ~= Count1 then return end
				commitOffers(Result)
			end):catch(function(Err)
				-- upvalues: Count2 (copy), Count1 (upval), OffersDebugLoggerModule (upval), SessionScopedSignal (upval), Callback (upval)
				if Count2 ~= Count1 then return end
				OffersDebugLoggerModule.log("expiration refetch failed: " .. tostring(Err))
				local SessionScopedSignalResult = SessionScopedSignal(false)
				
				if SessionScopedSignalResult ~= nil then
					Callback(SessionScopedSignalResult)
				end
			end)
		end)
	end
	
	local _ = function(List)
		-- upvalues: DelayedThread (ref), GetSecondsUntilAnyKeyEmptiesModule (upval), armExpirationRefetch (copy)
		if DelayedThread ~= nil then
			pcall(task.cancel, DelayedThread)
			DelayedThread = nil
		end
		local SecondsUntilAnyKeyEmptiesModule = GetSecondsUntilAnyKeyEmptiesModule(List)
		
		if SecondsUntilAnyKeyEmptiesModule == nil then return end
		local List1 = {}
		
		for i in List do
			table.insert(List1, i)
		end
		armExpirationRefetch(List1, SecondsUntilAnyKeyEmptiesModule)
	end
	
	Callback = function(List)
		-- upvalues: FFlagOffersPerKeyExpiryRefetchModule (upval), DelayedThread (ref), GetSecondsUntilAnyKeyEmptiesModule (upval), armExpirationRefetch (copy), v1 (ref), GetSecondsUntilNextExpirationModule (upval), Count (ref), FIntOfferExpirationRefetchMaxCountModule (upval), FIntOfferExpirationRefetchBufferSecondsModule (upval), FIntOfferExpirationRefetchJitterSecondsModule (upval), Count1 (ref), MockGetAllUserOffersModule1 (copy), FFlagOffersMergeStoreResultsModule (upval), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (copy), SessionScopedSignal2 (copy), FFlagOffersRespectExpirationModule (upval), Callback (ref), commitOffers (copy), OffersDebugLoggerModule (upval), expireShopOffers (copy)
		if FFlagOffersPerKeyExpiryRefetchModule then
			if DelayedThread ~= nil then
				pcall(task.cancel, DelayedThread)
				DelayedThread = nil
			end
			local SecondsUntilAnyKeyEmptiesModule = GetSecondsUntilAnyKeyEmptiesModule(List)
			
			if SecondsUntilAnyKeyEmptiesModule == nil then return end
			local List1 = {}
			
			for i in List do
				table.insert(List1, i)
			end
			armExpirationRefetch(List1, SecondsUntilAnyKeyEmptiesModule)
			
			return
		else
			if DelayedThread ~= nil then
				pcall(task.cancel, DelayedThread)
				DelayedThread = nil
			end
			local v2 = v1
			local SecondsUntilNextExpirationModule = GetSecondsUntilNextExpirationModule(List)
			
			if v2 == nil or SecondsUntilNextExpirationModule == nil then return end
			if FIntOfferExpirationRefetchMaxCountModule <= Count then return end
			local NewSecondsUntilNextExpirationModule = SecondsUntilNextExpirationModule + FIntOfferExpirationRefetchBufferSecondsModule
			
			if FIntOfferExpirationRefetchJitterSecondsModule > 0 then
				NewSecondsUntilNextExpirationModule += math.random() * FIntOfferExpirationRefetchJitterSecondsModule
			end
			DelayedThread = task.delay(NewSecondsUntilNextExpirationModule, function()
				-- upvalues: DelayedThread (upval), Count (upval), Count1 (upval), MockGetAllUserOffersModule1 (upval), v2 (copy), FFlagOffersMergeStoreResultsModule (upval), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (upval), SessionScopedSignal2 (upval), FFlagOffersRespectExpirationModule (upval), Callback (upval), commitOffers (upval), OffersDebugLoggerModule (upval), expireShopOffers (upval)
				DelayedThread = nil
				Count += 1
				local Count2 = Count1
				MockGetAllUserOffersModule1(v2):andThen(function(Result)
					-- upvalues: FFlagOffersMergeStoreResultsModule (upval), Count2 (copy), v2 (upval), Count1 (upval), bucketResponse (upval), mergeRequestedKeys (upval), SessionScopedSignal (upval), SessionScopedSignal2 (upval), FFlagOffersRespectExpirationModule (upval), Callback (upval), commitOffers (upval)
					if FFlagOffersMergeStoreResultsModule then
						if Count2 ~= Count1 then return end
						local MergeRequestedKeysResult = mergeRequestedKeys(SessionScopedSignal(false), bucketResponse(Result), v2)
						SessionScopedSignal2(MergeRequestedKeysResult)
						
						if FFlagOffersRespectExpirationModule then
							Callback(MergeRequestedKeysResult)
							
							return
						end
					elseif Count2 ~= Count1 then return end
					commitOffers(Result)
				end):catch(function(Err)
					-- upvalues: Count2 (copy), Count1 (upval), OffersDebugLoggerModule (upval), expireShopOffers (upval)
					if Count2 == Count1 then
						OffersDebugLoggerModule.log("expiration refetch failed, expiring shop offers: " .. tostring(Err))
						expireShopOffers()
						
						return
					end
				end)
			end)
		end
	end
	
	return {
		getOffers = SessionScopedSignal,
		getOfferNotificationShown = SignalsModule.createComputed(function(p4): boolean
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal1 (copy), Signal1 (copy), FFlagHideOfferNotificationsWhenShopEmpty (upval), Signal3 (copy), FFlagOffersShopScopedNotificationModule (upval), FeatureKeyModule (upval), IsNotificationEligibleModule (upval)
			local SessionScopedSignalResult = SessionScopedSignal(p4)
			local SessionScopedSignalResult1 = SessionScopedSignal1(p4)
			
			if SessionScopedSignalResult == nil or SessionScopedSignalResult1 == nil then
				return false
			end
			if not Signal1(p4) then
				return false
			end
			if FFlagHideOfferNotificationsWhenShopEmpty and not Signal3(p4) then
				return false
			end
			if FFlagOffersShopScopedNotificationModule then
				local SessionScopedSignalResultEntry = SessionScopedSignalResult[FeatureKeyModule.RobloxShop]
				
				if SessionScopedSignalResultEntry ~= nil then
					for _, value in SessionScopedSignalResultEntry do
						if IsNotificationEligibleModule(value, SessionScopedSignalResult1) then
							return true
						end
					end
				end
				return false
			else
				for _, value1 in SessionScopedSignalResult do
					for _, value2 in value1 do
						if IsNotificationEligibleModule(value2, SessionScopedSignalResult1) then
							return true
						end
					end
				end
				return false
			end
		end),
		getOfferNotificationShownWithEnum = SignalsModule.createComputed(function(p5)
			-- upvalues: SessionScopedSignal3 (copy), NotificationLocationModule (upval), SessionScopedSignal (copy), SessionScopedSignal1 (copy), FFlagHideOfferNotificationsWhenShopEmpty (upval), Signal3 (copy), Signal (copy), Signal1 (copy), FFlagOffersShopScopedNotificationModule (upval), FeatureKeyModule (upval), IsNotificationEligibleModule (upval)
			if SessionScopedSignal3(p5) then
				return NotificationLocationModule.None
			end
			local SessionScopedSignalResult = SessionScopedSignal(p5)
			local SessionScopedSignalResult1 = SessionScopedSignal1(p5)
			
			if SessionScopedSignalResult == nil or SessionScopedSignalResult1 == nil then
				return NotificationLocationModule.None
			end
			if FFlagHideOfferNotificationsWhenShopEmpty and not Signal3(p5) then
				return NotificationLocationModule.None
			end
			local SignalResult = Signal(p5)
			
			if not SignalResult and not Signal1(p5) then
				return NotificationLocationModule.None
			end
			local GlobalIcon = if SignalResult then NotificationLocationModule.GlobalIcon else NotificationLocationModule.Hamburger
			
			if FFlagOffersShopScopedNotificationModule then
				local SessionScopedSignalResultEntry = SessionScopedSignalResult[FeatureKeyModule.RobloxShop]
				
				if SessionScopedSignalResultEntry ~= nil then
					for _, value in SessionScopedSignalResultEntry do
						if IsNotificationEligibleModule(value, SessionScopedSignalResult1) then
							return GlobalIcon
						end
					end
				end
				return NotificationLocationModule.None
			else
				for _, value1 in SessionScopedSignalResult do
					for _, value2 in value1 do
						if IsNotificationEligibleModule(value2, SessionScopedSignalResult1) then
							return GlobalIcon
						end
					end
				end
				return NotificationLocationModule.None
			end
		end),
		getOfferExposureSnapshot = SessionScopedSignal1,
		getHasInExperienceShopOpened = SessionScopedSignal3,
		getIsInExperienceShopGlobalIconAvailable = Signal,
		getIsShopAvailable = Signal1,
		getShopHasItems = Signal3,
		fetchOffers = fetchOffers,
		hydrateOfferExposureSnapshot = function(p6)
			-- upvalues: SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy)
			if SessionScopedSignal1(false) == nil then
				SessionScopedSignal2_1(p6)
			end
		end,
		markInExperienceShopOpened = function()
			-- upvalues: SessionScopedSignal2_2 (copy)
			SessionScopedSignal2_2(true)
		end,
		setInExperienceShopGlobalIconAvailable = Signal2,
		setIsShopAvailable = Signal2_1,
		setShopHasItems = Signal2_2
	}
end