local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local InitiateRobloxSubscriptionPurchaseFunction = RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase
local RobloxSubscriptionSignals = RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local _ = require(Parent.PlayabilityRodux)
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local FIntEarlyAccessPollIntervalSecondsModule = require(script.Parent.FIntEarlyAccessPollIntervalSeconds)
local FIntEarlyAccessMaxPollAttemptsModule = require(script.Parent.FIntEarlyAccessMaxPollAttempts)
local R20UniverseAccessTime = game:DefineFastString("R20UniverseAccessTime", "")

local function _(Text: string, p1: number) --[[ Line: 24 | Named "resolveUnlockTimestamp" ]]
	local IsSegmentMatch = string.sub(Text, 1, 1) == "+"
	local Number: number? = tonumber(if IsSegmentMatch then string.sub(Text, 2) else Text)
	
	return if Number == nil or Number == 0 then nil elseif IsSegmentMatch then p1 + Number else Number
end

return function(p1, p2) --[[ Line: 42 | Named "useGameJoinEarlyAccess" ]]
	-- upvalues: UseAppPolicyFunction (copy), PlayabilityStatusEnum (copy), RobloxSubscriptionSignals (copy), SignalsReactModule (copy), ReactModule (copy), R20UniverseAccessTime (copy), FIntEarlyAccessMaxPollAttemptsModule (copy), FIntEarlyAccessPollIntervalSecondsModule (copy), InitiateRobloxSubscriptionPurchaseFunction (copy), SurfaceName (copy), SurfaceContext (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p3): boolean --[[ Line: 47 ]]
		return not p3.getDisableBlackbirdEntrypoints()
	end)
	local IsPlayabilityStatusMatch: boolean = p2 ~= nil and p2.playabilityStatus == PlayabilityStatusEnum.PlusSubscriptionRequired
	local UseSignalStateResult = SignalsReactModule.useSignalState(RobloxSubscriptionSignals.get().getGainedRobloxSubscriptionThisSession)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = DateTime.now().UnixTimestamp
	end
	local NewCurrent = nil
	if IsPlayabilityStatusMatch then
		local Current: number = UseRefResult.current
		local IsSegmentMatch = string.sub(R20UniverseAccessTime, 1, 1) == "+"
		local Number: number? = tonumber(if IsSegmentMatch then string.sub(R20UniverseAccessTime, 2) else R20UniverseAccessTime)
		NewCurrent = if Number == nil or Number == 0 then nil elseif IsSegmentMatch then Current + Number else Number
	else
		NewCurrent = nil
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	ReactModule.useEffect(function() --[[ Line: 69 ]]
		-- upvalues: UseStateResult2 (copy), NewCurrent (copy), FIntEarlyAccessMaxPollAttemptsModule (upval), FIntEarlyAccessPollIntervalSecondsModule (upval)
		UseStateResult2(0)
		
		if NewCurrent == nil then return end
		local Flag = false
		local DelayedThread = nil
		local Count = 0
		
		local function poll() --[[ Line: 79 ]]
			-- upvalues: Flag (ref), Count (ref), UseStateResult2 (upval), FIntEarlyAccessMaxPollAttemptsModule (upval), DelayedThread (ref), FIntEarlyAccessPollIntervalSecondsModule (upval), poll (copy)
			if Flag then return end
			Count += 1
			UseStateResult2(Count)
			
			if Count < FIntEarlyAccessMaxPollAttemptsModule then
				DelayedThread = task.delay(FIntEarlyAccessPollIntervalSecondsModule, poll)
				
				return
			else
				DelayedThread = nil
			end
		end
		
		DelayedThread = task.delay(math.max(NewCurrent - DateTime.now().UnixTimestamp, 0), poll)
		
		return function() --[[ Line: 95 ]]
			-- upvalues: Flag (ref), DelayedThread (ref)
			Flag = true
			
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
	end, { NewCurrent })
	
	return {
		isPendingUnlock = IsPlayabilityStatusMatch and UseStateResult > 0,
		unlockRefetchTick = UseStateResult,
		unlockTimestamp = NewCurrent,
		showPlusUpsell = IsPlayabilityStatusMatch and UseAppPolicyResult,
		openUpsell = ReactModule.useCallback(function() --[[ Line: 104 ]]
			-- upvalues: InitiateRobloxSubscriptionPurchaseFunction (upval), p1 (copy), SurfaceName (upval), SurfaceContext (upval)
			InitiateRobloxSubscriptionPurchaseFunction(nil, nil, if p1 then tonumber(p1) else nil, SurfaceName.GameJoinEarlyAccessUpsell, SurfaceContext.InApp)
		end, { p1 }),
		gainedSubscription = IsPlayabilityStatusMatch and UseSignalStateResult
	}
end