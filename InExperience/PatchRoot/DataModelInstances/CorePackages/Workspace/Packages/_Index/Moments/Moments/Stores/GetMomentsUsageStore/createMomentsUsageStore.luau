local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local HttpClientModule = require(Parent.HttpClient)
local MomentsCommonModule = require(Parent.MomentsCommon)
local CreateMomentsUsageHeartbeatModule = require(Parent.MomentsCommon.createMomentsUsageHeartbeat)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local FIntMomentsUsageHeartbeatIntervalSecModule = require(Moments.Flags.FIntMomentsUsageHeartbeatIntervalSec)
local FIntMomentsUsageResumePollSecModule = require(Moments.Flags.FIntMomentsUsageResumePollSec)
local Analytics = MomentsCommonModule.Analytics

local function defaultPostHeartbeat()
	-- upvalues: Parent (copy), HttpClientModule (copy)
	return HttpClientModule.asPromise(require(Parent.DataHydration.MomentsPostMomentsUsageHeartbeat)())
end

local function defaultGetUsage()
	-- upvalues: Parent (copy), HttpClientModule (copy)
	return HttpClientModule.asPromise(require(Parent.DataHydration.MomentsGetMomentsUsage)())
end

local function defaultGetHasDailyLimit(p1)
	-- upvalues: MomentsCommonModule (copy)
	return MomentsCommonModule.Stores.GetMomentsCapabilities(false).getHasDailyLimit(p1)
end

local function defaultGetIsInExperience(p1)
	-- upvalues: Moments (copy)
	return require(Moments.Stores.GetMomentsPreferencesStore)(false).getIsTeleporting(p1)
end

return function(p1)
	-- upvalues: defaultPostHeartbeat (copy), defaultGetUsage (copy), defaultGetHasDailyLimit (copy), defaultGetIsInExperience (copy), SignalsModule (copy), CreateMomentsUsageHeartbeatModule (copy), FIntMomentsUsageHeartbeatIntervalSecModule (copy), Analytics (copy), FIntMomentsUsageResumePollSecModule (copy)
	local P2 = p1 or {}
	local PostHeartbeat = P2.postHeartbeat or defaultPostHeartbeat
	local GetUsage = P2.getUsage or defaultGetUsage
	local GetHasDailyLimit = P2.getHasDailyLimit or defaultGetHasDailyLimit
	local GetIsInExperience = P2.getIsInExperience or defaultGetIsInExperience
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local v1 = false
	local Foregrounded = true
	local v2 = false
	local IsWatching = false
	local Flag = false
	local v3 = nil
	local MomentsSessionHeartbeat = nil
	
	local function reconcile()
		-- upvalues: Signal (copy), v3 (ref), v1 (ref), IsWatching (ref), MomentsSessionHeartbeat (ref)
		local SignalResult = Signal(false)
		v3.setSuspended(SignalResult or not v1)
		local IsWatching1 = SignalResult and v3.getIsWatching()
		
		if IsWatching1 ~= IsWatching then
			IsWatching = IsWatching1
			
			if IsWatching1 then
				MomentsSessionHeartbeat.start("time_limit_poll")
				
				return
			end
			MomentsSessionHeartbeat.stop()
		end
	end
	
	local function markLimitReached(p2)
		-- upvalues: Signal2_1 (copy), Signal2 (copy), reconcile (copy)
		Signal2_1(p2)
		Signal2(true)
		reconcile()
	end
	
	local function applyUsage(Result)
		-- upvalues: Flag (ref), Signal2_1 (copy), Signal2 (copy), reconcile (copy), Signal (copy)
		if Flag then return end
		if Result.limitSeconds >= 0 and Result.remainingSeconds <= 0 then
			Signal2_1(Result.limitSeconds)
			Signal2(true)
			reconcile()
			
			return
		end
		if Signal(false) then
			Signal2(false)
			reconcile()
		end
	end
	
	local function ignoreFailure() end
	
	local function _()
		-- upvalues: GetUsage (copy), applyUsage (copy), ignoreFailure (copy)
		GetUsage():andThen(applyUsage):catch(ignoreFailure)
	end
	
	v3 = CreateMomentsUsageHeartbeatModule(FIntMomentsUsageHeartbeatIntervalSecModule, function()
		-- upvalues: PostHeartbeat (copy), applyUsage (copy), ignoreFailure (copy)
		PostHeartbeat():andThen(applyUsage):catch(ignoreFailure)
	end, function(p2)
		-- upvalues: Signal (copy), GetUsage (copy), applyUsage (copy), ignoreFailure (copy)
		if p2 and Signal(false) then
			GetUsage():andThen(applyUsage):catch(ignoreFailure)
		end
	end, P2.scheduler, P2.clock)
	MomentsSessionHeartbeat = Analytics.createMomentsSessionHeartbeat(FIntMomentsUsageResumePollSecModule, function(_)
		-- upvalues: GetUsage (copy), applyUsage (copy), ignoreFailure (copy)
		GetUsage():andThen(applyUsage):catch(ignoreFailure)
	end, P2.scheduler)
	
	local _ = function()
		-- upvalues: v3 (ref), Foregrounded (ref), v2 (ref), reconcile (copy)
		v3.setForegrounded(Foregrounded and not v2)
		reconcile()
	end
	
	local Effect = SignalsModule.createEffect(function(p2)
		-- upvalues: v1 (ref), GetHasDailyLimit (copy), reconcile (copy)
		v1 = GetHasDailyLimit(p2)
		reconcile()
	end)
	local Effect1 = SignalsModule.createEffect(function(p2)
		-- upvalues: v2 (ref), GetIsInExperience (copy), v3 (ref), Foregrounded (ref), reconcile (copy)
		v2 = GetIsInExperience(p2)
		v3.setForegrounded(Foregrounded and not v2)
		reconcile()
	end)
	
	return {
		getIsLimitReached = Signal,
		getLimitSeconds = Signal1,
		markLimitReached = markLimitReached,
		checkForMoreTime = function()
			-- upvalues: Signal (copy), GetUsage (copy), applyUsage (copy), ignoreFailure (copy)
			if Signal(false) then
				GetUsage():andThen(applyUsage):catch(ignoreFailure)
			end
		end,
		setTabFocused = function(p2)
			-- upvalues: v3 (ref), reconcile (copy)
			v3.setTabFocused(p2)
			reconcile()
		end,
		setForegrounded = function(Value)
			-- upvalues: Foregrounded (ref), v3 (ref), v2 (ref), reconcile (copy)
			Foregrounded = Value
			v3.setForegrounded(Foregrounded and not v2)
			reconcile()
		end,
		dispose = function()
			-- upvalues: Flag (ref), Effect (copy), Effect1 (copy), v3 (ref), MomentsSessionHeartbeat (ref)
			Flag = true
			Effect()
			Effect1()
			v3.stop()
			MomentsSessionHeartbeat.stop()
		end
	}
end