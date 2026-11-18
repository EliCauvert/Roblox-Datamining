local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.HttpClient)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local _ = require(Parent.MomentsTypes)
local SignalsModule = require(Parent.Signals)
local FFlagMomentsEngagementToastAnalyticsModule = require(Moments.Flags.FFlagMomentsEngagementToastAnalytics)
local list = { "comments", "reactionMilestone", "likes", "rollup" }
local Signal = SignalsModule.createSignal(false)

local function defaultSchedule(p1: number, p2)
	local DelayedThread = task.delay(p1 / 1000, p2)
	
	return function()
		-- upvalues: DelayedThread (copy)
		pcall(task.cancel, DelayedThread)
	end
end

local function observeRequest(PostNextToastResult, Callback: (any) -> ())
	-- upvalues: SignalsModule (copy)
	local Flag = false
	local Callback1: () -> () = nil
	
	local function stop()
		-- upvalues: Flag (ref), Callback1 (ref), PostNextToastResult (copy)
		if Flag then return end
		Flag = true
		
		if Callback1 ~= nil then
			Callback1()
			Callback1 = nil
		end
		PostNextToastResult.dispose()
	end
	
	local function _(p1)
		-- upvalues: Flag (ref), Callback1 (ref), PostNextToastResult (copy), Callback (copy)
		if Flag or p1.status == "pending" then return end
		if not Flag then
			Flag = true
			
			if Callback1 ~= nil then
				Callback1()
				Callback1 = nil
			end
			PostNextToastResult.dispose()
		end
		Callback(p1)
	end
	
	local StateResult = PostNextToastResult.state(false)
	
	if StateResult.status == "pending" then
		Callback1 = SignalsModule.createEffect(function(p1)
			-- upvalues: PostNextToastResult (copy), Flag (ref), Callback1 (ref), Callback (copy)
			local StateResult = PostNextToastResult.state(p1)
			
			if not Flag then
				if StateResult.status == "pending" then return end
				if not Flag then
					Flag = true
					
					if Callback1 ~= nil then
						Callback1()
						Callback1 = nil
					end
					PostNextToastResult.dispose()
				end
				Callback(StateResult)
			end
		end)
		
		if Flag and Callback1 ~= nil then
			Callback1()
			Callback1 = nil
		end
		return stop
	else
		if not Flag and StateResult.status ~= "pending" then
			if not Flag then
				Flag = true
				
				if Callback1 ~= nil then
					Callback1()
					Callback1 = nil
				end
				PostNextToastResult.dispose()
			end
			Callback(StateResult)
		end
		return stop
	end
end

return function(p1)
	-- upvalues: defaultSchedule (copy), SignalsModule (copy), list (copy), FFlagMomentsEngagementToastAnalyticsModule (copy), observeRequest (copy), Signal (copy)
	local Schedule = p1.schedule or defaultSchedule
	local Signal1, Signal2 = SignalsModule.createSignal(nil)
	local Trigger = nil
	local Signal3, Signal2_1 = SignalsModule.createSignal({})
	local Count = 0
	local Signal4, Signal2_2 = SignalsModule.createSignal(true)
	local Signal5, Signal2_3 = SignalsModule.createSignal({})
	local Count1 = 0
	local Computed = SignalsModule.createComputed(function(p2)
		-- upvalues: Signal5 (copy), list (upval)
		local t = {}
		
		for _, value in Signal5(p2) do
			for _, value1 in value do
				t[value1] = true
			end
		end
		local List = {}
		
		for _, value2 in list do
			if t[value2] then
				table.insert(List, value2)
			end
		end
		return List
	end)
	local Computed1 = SignalsModule.createComputed(function(p3): boolean
		-- upvalues: Signal3 (copy)
		for _, value in Signal3(p3) do
			if not value(p3) then
				return true
			end
		end
		return false
	end)
	local Computed2 = SignalsModule.createComputed(function(p4): boolean
		-- upvalues: Computed1 (copy), Signal4 (copy), Signal1 (copy), p1 (copy), Computed (copy)
		return Computed1(p4) and (Signal4(p4) and (Signal1(p4) == nil and (not p1.getHasOtherToast(p4) and (not p1.getIsUploading(p4) and (not p1.getIsCoveringSheetOpen(p4) and #Computed(p4) > 0)))))
	end)
	local Config = nil
	local Callback2 = nil
	local Callback: (() -> ())? = nil
	local Flag = false
	local Flag1 = false
	
	local function _()
		-- upvalues: Callback (ref), Flag (ref)
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
		Flag = false
	end
	
	local Callback1 = nil
	
	local _ = function(p4, p5)
		-- upvalues: Flag1 (ref), Config (ref), Callback1 (ref)
		if not Flag1 then
			local Config1 = Config
			Config = {
				trigger = if p4 == "open" or Config1 ~= nil and Config1.trigger == "open" then "open" else "live",
				fromPing = p5 or Config1 ~= nil and Config1.fromPing
			}
			Callback1()
			
			return
		end
	end
	
	local _ = function(p4, p5)
		-- upvalues: Callback (ref), Flag (ref), Schedule (copy), Flag1 (ref), Config (ref), Callback1 (ref)
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
		Flag = false
		Flag = p5
		Callback = Schedule(p4, function()
			-- upvalues: Callback (upval), Flag (upval), Flag1 (upval), Config (upval), Callback1 (upval)
			Callback = nil
			Flag = false
			
			if not Flag1 then
				local v1 = Config
				Config = {
					trigger = if v1 == nil or v1.trigger ~= "open" then "live" else "open",
					fromPing = v1 ~= nil and v1.fromPing
				}
				Callback1()
				
				return
			end
		end)
	end
	
	local function settle(p4, p5)
		-- upvalues: FFlagMomentsEngagementToastAnalyticsModule (upval), Trigger (ref), Signal2 (copy), Callback (ref), Flag (ref), Schedule (copy), Flag1 (ref), Config (ref), Callback1 (ref)
		if p5.status ~= "succeeded" or p5.result == nil then return end
		local Result = p5.result
		
		if Result.toast == nil then
			if Result.retryAfter == nil then
				if p4.fromPing then
					if Callback ~= nil then
						Callback()
						Callback = nil
					end
					Flag = false
					Flag = true
					Callback = Schedule(2000, function()
						-- upvalues: Callback (upval), Flag (upval), Flag1 (upval), Config (upval), Callback1 (upval)
						Callback = nil
						Flag = false
						
						if not Flag1 then
							local v1 = Config
							Config = {
								trigger = if v1 == nil or v1.trigger ~= "open" then "live" else "open",
								fromPing = v1 ~= nil and v1.fromPing
							}
							Callback1()
							
							return
						end
					end)
				end
				return
			else
				local ScaledClampedValue = math.clamp(Result.retryAfter, 1, 1800) * 1000
				
				if Callback ~= nil then
					Callback()
					Callback = nil
				end
				Flag = false
				Flag = false
				Callback = Schedule(ScaledClampedValue, function()
					-- upvalues: Callback (upval), Flag (upval), Flag1 (upval), Config (upval), Callback1 (upval)
					Callback = nil
					Flag = false
					
					if not Flag1 then
						local v1 = Config
						Config = {
							trigger = if v1 == nil or v1.trigger ~= "open" then "live" else "open",
							fromPing = v1 ~= nil and v1.fromPing
						}
						Callback1()
						
						return
					end
				end)
				
				return
			end
		else
			if FFlagMomentsEngagementToastAnalyticsModule then
				Trigger = p4.trigger
			end
			Signal2(Result.toast)
		end
	end
	
	Callback1 = function()
		-- upvalues: Config (ref), Flag1 (ref), Callback2 (ref), Computed2 (copy), Flag (ref), Callback (ref), observeRequest (upval), p1 (copy), Computed (copy), settle (copy), Callback1 (ref)
		local Config1 = Config
		
		if Flag1 or Callback2 ~= nil or Config1 == nil or not Computed2(false) then return end
		Config = nil
		
		if Flag then
			Config1 = { fromPing = true, trigger = Config1.trigger }
		end
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
		Flag = false
		local Flag2 = false
		local ObserveRequestResult = observeRequest(p1.postNextToast({
			surface = "moments",
			kinds = Computed(false),
			trigger = Config1.trigger
		}, p1.network), function(p4)
			-- upvalues: Flag2 (ref), Callback2 (upval), settle (upval), Config1 (ref), Callback1 (upval)
			Flag2 = true
			Callback2 = nil
			settle(Config1, p4)
			Callback1()
		end)
		
		if not Flag2 then
			Callback2 = ObserveRequestResult
		end
	end
	
	local v1 = false
	local Tbl = {
		SignalsModule.createEffect(function(p4)
			-- upvalues: Signal3 (copy), Computed2 (copy), v1 (ref), Flag1 (ref), Config (ref), Callback1 (ref)
			local HasNextEntry = next(Signal3(p4)) ~= nil
			local ComputedResult = Computed2(p4)
			local NoV39: boolean = HasNextEntry and not v1
			v1 = HasNextEntry
			
			if NoV39 then
				if not Flag1 then
					local Config1 = Config
					Config = {
						trigger = "open",
						fromPing = Config1 ~= nil and Config1.fromPing
					}
					Callback1()
					
					return
				end
				return
			elseif ComputedResult then
				Callback1()
			end
		end)
	}
	
	local function ping()
		-- upvalues: Flag1 (ref), Config (ref), Callback1 (ref)
		if not Flag1 then
			local Config1 = Config
			Config = {
				fromPing = true,
				trigger = if Config1 == nil or Config1.trigger ~= "open" then "live" else "open"
			}
			Callback1()
			
			return
		end
	end
	
	local function request(p4)
		-- upvalues: Flag1 (ref), Config (ref), Callback1 (ref)
		if not Flag1 then
			local Config1 = Config
			Config = {
				trigger = if p4 == "open" or Config1 ~= nil and Config1.trigger == "open" then "open" else "live",
				fromPing = Config1 ~= nil and Config1.fromPing
			}
			Callback1()
			
			return
		end
	end
	
	local function markSurfaceVisible(p4)
		-- upvalues: Count (ref), Signal2_1 (copy), Signal (upval)
		Count += 1
		local Count1: number = Count
		Signal2_1(function(Tbl)
			-- upvalues: Count1 (copy), p4 (copy), Signal (upval)
			local Copy = table.clone(Tbl)
			Copy[Count1] = p4 or Signal
			
			return Copy
		end)
		
		return function()
			-- upvalues: Signal2_1 (upval), Count1 (copy)
			Signal2_1(function(Tbl)
				-- upvalues: Count1 (upval)
				if Tbl[Count1] == nil then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy[Count1] = nil
					
					return Copy
				end
			end)
		end
	end
	
	local function setForegrounded(p4)
		-- upvalues: Signal4 (copy), Flag1 (ref), Config (ref), Callback1 (ref), Signal2_2 (copy)
		if p4 and not Signal4(false) and not Flag1 then
			local Config1 = Config
			Config = {
				trigger = "open",
				fromPing = Config1 ~= nil and Config1.fromPing
			}
			Callback1()
		end
		Signal2_2(p4)
	end
	
	local function registerKinds(Tbl)
		-- upvalues: Count1 (ref), Signal2_3 (copy)
		Count1 += 1
		local Count: number = Count1
		Signal2_3(function(Tbl1)
			-- upvalues: Count (copy), Tbl (copy)
			local Copy = table.clone(Tbl1)
			Copy[Count] = table.clone(Tbl)
			
			return Copy
		end)
		
		return function()
			-- upvalues: Signal2_3 (upval), Count (copy)
			Signal2_3(function(Tbl)
				-- upvalues: Count (upval)
				if Tbl[Count] == nil then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy[Count] = nil
					
					return Copy
				end
			end)
		end
	end
	
	local List = {}
	
	if p1.onAppHidden ~= nil and p1.onAppShown ~= nil then
		table.insert(List, p1.onAppHidden:Connect(function()
			-- upvalues: Signal2_2 (copy)
			Signal2_2(false)
		end))
		table.insert(List, p1.onAppShown:Connect(function()
			-- upvalues: Signal4 (copy), Flag1 (ref), Config (ref), Callback1 (ref), Signal2_2 (copy)
			if not Signal4(false) and not Flag1 then
				local Config1 = Config
				Config = {
					trigger = "open",
					fromPing = Config1 ~= nil and Config1.fromPing
				}
				Callback1()
			end
			Signal2_2(true)
		end))
	end
	return {
		getCurrentToast = Signal1,
		getCurrentToastTrigger = function()
			-- upvalues: Trigger (ref)
			return Trigger
		end,
		ping = ping,
		request = request,
		markSurfaceVisible = markSurfaceVisible,
		setForegrounded = setForegrounded,
		registerKinds = registerKinds,
		toastClosed = function()
			-- upvalues: Signal1 (copy), Flag1 (ref), Config (ref), Callback1 (ref), FFlagMomentsEngagementToastAnalyticsModule (upval), Trigger (ref), Signal2 (copy)
			if Signal1(false) == nil then return end
			if not Flag1 then
				local Config1 = Config
				Config = {
					trigger = if Config1 == nil or Config1.trigger ~= "open" then "live" else "open",
					fromPing = Config1 ~= nil and Config1.fromPing
				}
				Callback1()
			end
			if FFlagMomentsEngagementToastAnalyticsModule then
				Trigger = nil
			end
			Signal2(nil)
		end,
		dispose = function()
			-- upvalues: Flag1 (ref), Config (ref), Callback (ref), Flag (ref), Callback2 (ref), Tbl (copy), List (copy)
			Flag1 = true
			Config = nil
			
			if Callback ~= nil then
				Callback()
				Callback = nil
			end
			Flag = false
			
			if Callback2 ~= nil then
				Callback2()
				Callback2 = nil
			end
			for _, value in Tbl do
				value()
			end
			table.clear(Tbl)
			
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
		end
	}
end