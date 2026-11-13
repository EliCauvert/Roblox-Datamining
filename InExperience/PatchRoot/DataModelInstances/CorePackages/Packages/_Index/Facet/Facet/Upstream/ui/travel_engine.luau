local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local self = setmetatable({}, { __mode = "k" })

return function(p1, p2)
	-- upvalues: self (copy), CoreModule (copy)
	local SelfEntry = self[p1.runtime]
	
	if not SelfEntry then
		SelfEntry = { entries = {}, carriers = {} }
		self[p1.runtime] = SelfEntry
	end
	local v1 = assert(p1.Compose.currentOwner())
	local SelfEntry1 = SelfEntry
	local SpringState = p1.Compose.createSpringState(p2.initial, #p2.initial)
	local Copy = table.clone(p2.initial)
	local Total = 0
	local Depth = 1
	while true do
		local Flag = false
		for _, entry in SelfEntry1.entries do
			Flag = Flag or entry.depth == Depth
		end
		if not Flag then break end
		Depth += 1
	end
	local config = {
		active = true,
		tick = function() end,
		depth = Depth
	}
	local Flag = false
	local HasParent: boolean = p2.carrier ~= nil and p2.carrier.Parent ~= nil
	local Callback = nil
	
	local function _(): boolean
		-- upvalues: Flag (ref), CoreModule (upval), v1 (copy), HasParent (ref), p2 (copy)
		return not Flag and (not CoreModule.owner.isDisposed(v1) and not (HasParent and (p2.carrier and p2.carrier.Parent == nil)))
	end
	
	local DelayResult = 0
	local Flag1 = true
	
	local _ = function()
		-- upvalues: Flag (ref), CoreModule (upval), v1 (copy), HasParent (ref), p2 (copy), Flag1 (ref)
		if not Flag and (not CoreModule.owner.isDisposed(v1) and not (HasParent and (p2.carrier and p2.carrier.Parent == nil))) and not Flag1 then
			Flag1 = true
			
			if p2.start then
				p2.start()
			end
		end
	end
	
	local function finish(TargetResult)
		-- upvalues: Flag (ref), CoreModule (upval), v1 (copy), HasParent (ref), p2 (copy), SpringState (copy), config (copy)
		if Flag or (CoreModule.owner.isDisposed(v1) or HasParent and (p2.carrier and p2.carrier.Parent == nil)) then return end
		for i, value in TargetResult do
			SpringState.position[i] = value
			SpringState.velocity[i] = 0
		end
		config.active = false
		p2.sample(SpringState.position)
		
		if not Flag and (not CoreModule.owner.isDisposed(v1) and not (HasParent and (p2.carrier and p2.carrier.Parent == nil))) and p2.complete then
			p2.complete()
		end
	end
	
	function config.tick(Amount: number)
		-- upvalues: p2 (copy), HasParent (ref), Flag (ref), CoreModule (upval), v1 (copy), Callback (ref), config (copy), Flag1 (ref), finish (copy), DelayResult (ref), p1 (copy), SpringState (copy), Copy (ref), Total (ref)
		if p2.carrier and p2.carrier.Parent ~= nil then
			HasParent = true
		end
		if Flag or (CoreModule.owner.isDisposed(v1) or HasParent and (p2.carrier and p2.carrier.Parent == nil)) then
			Callback()
			
			return
		end
		if not config.active then return end
		local TargetResult = p2.target()
		
		if Flag or (CoreModule.owner.isDisposed(v1) or HasParent and (p2.carrier and p2.carrier.Parent == nil)) then return end
		if p2.reduced() then
			if not Flag and (not CoreModule.owner.isDisposed(v1) and not (HasParent and (p2.carrier and p2.carrier.Parent == nil))) and not Flag1 then
				Flag1 = true
				
				if p2.start then
					p2.start()
				end
			end
			finish(TargetResult)
			
			return
		else
			if DelayResult > 0 then
				local Smallest = math.min(DelayResult, Amount)
				DelayResult -= Smallest
				Amount -= Smallest
				
				if DelayResult > 0 then return end
			end
			if not Flag and (not CoreModule.owner.isDisposed(v1) and not (HasParent and (p2.carrier and p2.carrier.Parent == nil))) and not Flag1 then
				Flag1 = true
				
				if p2.start then
					p2.start()
				end
			end
			if Flag or (CoreModule.owner.isDisposed(v1) or HasParent and (p2.carrier and p2.carrier.Parent == nil)) then return end
			if p2.motion == "spring" then
				p1.Compose.stepSpring(SpringState, TargetResult, Amount, p2.spring.period, p2.spring.damping)
				p2.sample(SpringState.position)
				
				if p1.Compose.springAtRest(SpringState, TargetResult, Copy, 0.001) then
					finish(TargetResult)
					
					return
				end
			else
				Total += Amount
				local Smallest: number = if p2.duration <= 0 then 1 else math.min(1, Total / p2.duration)
				local EaseResult = p2.ease(Smallest)
				
				for i, value in TargetResult do
					SpringState.position[i] = Copy[i] + (value - Copy[i]) * EaseResult
				end
				p2.sample(SpringState.position)
				
				if Smallest >= 1 then
					finish(TargetResult)
				end
			end
		end
	end
	
	if p2.carrier then
		assert(SelfEntry1.carriers[p2.carrier] == nil, "Facet travel carrier is already leased")
		SelfEntry1.carriers[p2.carrier] = config
	end
	table.insert(SelfEntry1.entries, config)
	
	if not SelfEntry1.disconnect then
		SelfEntry1.disconnect = assert(p1.runtime.host.frames, "Facet travel requires a Compose frame clock").onFrame(function(p3)
			-- upvalues: SelfEntry1 (copy)
			for _, value in table.clone(SelfEntry1.entries) do
				value.tick(p3)
			end
		end)
	end
	Callback = function()
		-- upvalues: Flag (ref), config (copy), p2 (copy), SelfEntry1 (copy)
		if Flag then return end
		Flag = true
		config.active = false
		
		if p2.carrier then
			SelfEntry1.carriers[p2.carrier] = nil
		end
		local FoundIndex: number? = table.find(SelfEntry1.entries, config)
		
		if FoundIndex then
			table.remove(SelfEntry1.entries, FoundIndex)
		end
		if #SelfEntry1.entries == 0 and SelfEntry1.disconnect then
			SelfEntry1.disconnect()
			SelfEntry1.disconnect = nil
		end
	end
	
	if p2.carrier then
		p1.runtime.connect(p2.carrier, "Destroying", Callback)
	end
	p1.Compose.cleanup(Callback)
	
	return {
		depth = Depth,
		rebase = function(List)
			-- upvalues: Flag (ref), CoreModule (upval), v1 (copy), HasParent (ref), p2 (copy), SpringState (copy)
			if Flag or (CoreModule.owner.isDisposed(v1) or HasParent and (p2.carrier and p2.carrier.Parent == nil)) then return end
			for i, value in List do
				SpringState.position[i] = value
			end
		end,
		snap = function(Tbl)
			-- upvalues: Flag (ref), CoreModule (upval), v1 (copy), HasParent (ref), p2 (copy), SpringState (copy), Copy (ref), config (copy)
			if Flag or (CoreModule.owner.isDisposed(v1) or HasParent and (p2.carrier and p2.carrier.Parent == nil)) then return end
			for i, value in Tbl do
				SpringState.position[i] = value
				SpringState.velocity[i] = 0
			end
			Copy = table.clone(Tbl)
			config.active = false
			p2.sample(SpringState.position)
			
			if p2.carrier and p2.carrier.Parent ~= nil then
				HasParent = true
			end
		end,
		retarget = function()
			-- upvalues: Flag (ref), CoreModule (upval), v1 (copy), HasParent (ref), p2 (copy), config (copy), Flag1 (ref), Copy (ref), SpringState (copy), DelayResult (ref), Total (ref), finish (copy)
			if Flag or (CoreModule.owner.isDisposed(v1) or HasParent and (p2.carrier and p2.carrier.Parent == nil)) then return end
			local Flag1_1 = config.active and Flag1
			Copy = table.clone(SpringState.position)
			DelayResult = if Flag1_1 or p2.delay == nil then 0 else p2.delay()
			assert(DelayResult >= 0 and DelayResult < 1e999, "Facet travel delay must be finite and nonnegative")
			Total = 0
			config.active = true
			Flag1 = false
			
			if (DelayResult == 0 or p2.reduced()) and (not Flag and (not CoreModule.owner.isDisposed(v1) and not (HasParent and (p2.carrier and p2.carrier.Parent == nil))) and not Flag1) then
				Flag1 = true
				
				if p2.start then
					p2.start()
				end
			end
			if p2.reduced() or p2.motion == "ease" and p2.duration <= 0 and DelayResult == 0 then
				finish(p2.target())
			end
		end,
		stop = Callback,
		velocity = function()
			-- upvalues: SpringState (copy)
			return table.clone(SpringState.velocity)
		end
	}
end