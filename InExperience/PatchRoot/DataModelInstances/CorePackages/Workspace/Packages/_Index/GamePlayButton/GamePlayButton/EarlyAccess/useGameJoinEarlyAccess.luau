local parent = script:FindFirstAncestor("GamePlayButton").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local initiateRobloxSubscriptionPurchase = robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase
local robloxSubscriptionSignals = robloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local _ = require(parent.PlayabilityRodux)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local fIntEarlyAccessPollIntervalSecondsModule = require(script.Parent.FIntEarlyAccessPollIntervalSeconds)
local fIntEarlyAccessMaxPollAttemptsModule = require(script.Parent.FIntEarlyAccessMaxPollAttempts)
local r20UniverseAccessTime = game:DefineFastString("R20UniverseAccessTime", "")

local function _(p1, p2)
	local var1 = string.sub(p1, 1, 1) == "+"
	local var2 = tonumber(if var1 then string.sub(p1, 2) else p1)
	
	return if var2 == nil or var2 == 0 then nil elseif var1 then p2 + var2 else var2
end

return function(p1, p2)
	-- upvalues: useAppPolicy (ref), playabilityStatusEnum (ref), robloxSubscriptionSignals (ref), signalsReactModule (ref), reactModule (ref), r20UniverseAccessTime (ref), fIntEarlyAccessMaxPollAttemptsModule (ref), fIntEarlyAccessPollIntervalSecondsModule (ref), initiateRobloxSubscriptionPurchase (ref), surfaceName (ref), surfaceContext (ref)
	local var1
	local var2 = useAppPolicy(function(p3)
		return not p3.getDisableBlackbirdEntrypoints()
	end)
	local var3 = p2 ~= nil and p2.playabilityStatus == playabilityStatusEnum.PlusSubscriptionRequired
	local var4 = signalsReactModule.useSignalState(robloxSubscriptionSignals.get().getGainedRobloxSubscriptionThisSession)
	local var5 = reactModule.useRef(nil)
	
	if var5.current == nil then
		var5.current = DateTime.now().UnixTimestamp
	end
	if var3 then
		local var6 = r20UniverseAccessTime
		local current = var5.current
		local var7 = string.sub(var6, 1, 1) == "+"
		local var8 = tonumber(if var7 then string.sub(var6, 2) else var6)
		var1 = if var8 == nil or var8 == 0 then nil elseif var7 then current + var8 else var8
	else
		var1 = nil
	end
	local var9, var10 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var1 (ref), fIntEarlyAccessMaxPollAttemptsModule (copy), fIntEarlyAccessPollIntervalSecondsModule (copy)
		var10(0)
		
		if var1 == nil then
			return
		end
		local var11 = false
		local delayedThread = nil
		local var12 = 0
		
		local function poll()
			-- upvalues: var11 (write), var12 (write), var10 (copy), fIntEarlyAccessMaxPollAttemptsModule (copy), delayedThread (write), fIntEarlyAccessPollIntervalSecondsModule (copy), poll (ref)
			if var11 then return end
			var12 += 1
			var10(var12)
			
			if var12 < fIntEarlyAccessMaxPollAttemptsModule then
				delayedThread = task.delay(fIntEarlyAccessPollIntervalSecondsModule, poll)
				
				return
			end
			delayedThread = nil
		end
		
		delayedThread = task.delay(math.max(var1 - DateTime.now().UnixTimestamp, 0), poll)
		
		return function()
			-- upvalues: var11 (write), delayedThread (write)
			var11 = true
			
			if delayedThread ~= nil then
				task.cancel(delayedThread)
				delayedThread = nil
			end
		end
	end, { var1 })
	
	return {
		isPendingUnlock = var3 and var9 > 0,
		unlockRefetchTick = var9,
		unlockTimestamp = var1,
		showPlusUpsell = var3 and var2,
		openUpsell = reactModule.useCallback(function()
			-- upvalues: initiateRobloxSubscriptionPurchase (copy), p1 (ref), surfaceName (copy), surfaceContext (copy)
			initiateRobloxSubscriptionPurchase(nil, nil, if p1 then tonumber(p1) else nil, surfaceName.GameJoinEarlyAccessUpsell, surfaceContext.InApp)
		end, { p1 }),
		gainedSubscription = var3 and var4
	}
end