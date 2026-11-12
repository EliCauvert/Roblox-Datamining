local CreateMomentsSessionHeartbeatModule = require(script.Parent.createMomentsSessionHeartbeat)
local FIntMomentsUsageMinCreditedGapSecModule = require(script:FindFirstAncestor("MomentsCommon").Flags.FIntMomentsUsageMinCreditedGapSec)

return function(p1, Callback2, Callback, p2, p3)
	-- upvalues: FIntMomentsUsageMinCreditedGapSecModule (copy), CreateMomentsSessionHeartbeatModule (copy)
	local Callback1 = p3 or os.clock
	local v1 = nil
	
	local function _()
		-- upvalues: v1 (ref), Callback1 (copy), Callback2 (copy)
		v1 = Callback1()
		Callback2()
	end
	
	local _ = function()
		-- upvalues: v1 (ref), Callback1 (copy), FIntMomentsUsageMinCreditedGapSecModule (upval), Callback2 (copy)
		if v1 == nil or FIntMomentsUsageMinCreditedGapSecModule <= Callback1() - v1 then
			v1 = Callback1()
			Callback2()
		end
	end
	
	local MomentsSessionHeartbeatModule = CreateMomentsSessionHeartbeatModule(p1, function(_)
		-- upvalues: v1 (ref), Callback1 (copy), Callback2 (copy)
		v1 = Callback1()
		Callback2()
	end, p2)
	local TabFocused = false
	local Foregrounded = true
	local Suspended = false
	local v2 = false
	local v3 = false
	
	local function reconcile()
		-- upvalues: TabFocused (ref), Foregrounded (ref), Suspended (ref), v3 (ref), v2 (ref), MomentsSessionHeartbeatModule (copy), v1 (ref), Callback1 (copy), FIntMomentsUsageMinCreditedGapSecModule (upval), Callback2 (copy), Callback (copy)
		local Foregrounded1 = TabFocused and Foregrounded
		local NoSuspended: boolean = Foregrounded1 and not Suspended
		local IsNotNoSuspendedMatch = NoSuspended ~= v3
		local IsNotForegroundedMatch = Foregrounded1 ~= v2
		v3 = NoSuspended
		v2 = Foregrounded1
		
		if IsNotNoSuspendedMatch then
			if NoSuspended then
				MomentsSessionHeartbeatModule.start("watch_tab")
			else
				MomentsSessionHeartbeatModule.stop()
			end
			if v1 == nil or FIntMomentsUsageMinCreditedGapSecModule <= Callback1() - v1 then
				v1 = Callback1()
				Callback2()
			end
		end
		if IsNotForegroundedMatch and Callback ~= nil then
			Callback(Foregrounded1)
		end
	end
	
	return {
		setTabFocused = function(Value)
			-- upvalues: TabFocused (ref), reconcile (copy)
			TabFocused = Value
			reconcile()
		end,
		setForegrounded = function(Value)
			-- upvalues: Foregrounded (ref), reconcile (copy)
			Foregrounded = Value
			reconcile()
		end,
		setSuspended = function(Value)
			-- upvalues: Suspended (ref), reconcile (copy)
			Suspended = Value
			reconcile()
		end,
		getIsWatching = function()
			-- upvalues: v2 (ref)
			return v2
		end,
		stop = function()
			-- upvalues: TabFocused (ref), reconcile (copy)
			TabFocused = false
			reconcile()
		end
	}
end