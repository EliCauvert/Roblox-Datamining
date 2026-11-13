local ReducedFunction = require("./motion").reduced
local SettleModule = require("./settle")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local InputContactsModule = require("./input_contacts")

return function(p1, p2, ScrollFrame, p3, p4, p5, Callback1, Callback2, Callback)
	-- upvalues: ReducedFunction (copy), SettleModule (copy), InputContactsModule (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local v1 = assert(Runtime.host.frames)
	local NowFunction = v1.now
	local Total = 0
	local v2 = 0
	local ReducedResult = ReducedFunction(p1)
	local SettleModuleResult = SettleModule(p1, function()
		-- upvalues: v2 (ref)
		return v2
	end, p1.motionSpring("control"), function()
		-- upvalues: p2 (copy), ReducedResult (copy), p1 (copy)
		return if p2.reducedMotion == nil then ReducedResult() else p1.read(p2.reducedMotion) == true
	end)
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	local Flag3 = false
	local OnFrameResult: (() -> ())? = nil
	local v3 = 0
	local NowResult = NowFunction()
	local Value = 0
	local v4 = 0
	
	local function cancel()
		-- upvalues: Flag1 (ref), Flag3 (ref), SettleModuleResult (copy), OnFrameResult (ref)
		Flag1 = false
		Flag3 = false
		SettleModuleResult.halt()
		
		if OnFrameResult then
			OnFrameResult()
			OnFrameResult = nil
		end
	end
	
	local function _(p6)
		-- upvalues: Flag2 (ref), Callback1 (copy), v3 (ref)
		Flag2 = true
		Callback1(p6)
		Flag2 = false
		v3 = p6
	end
	
	local function lowerBound(Offset, Total: number): number
		-- upvalues: p3 (copy)
		local v5 = 1
		local NewTotal = Total + 1
		while v5 < NewTotal do
			local Floored = math.floor((v5 + NewTotal) / 2)
			
			if assert(p3.placementOf)(Floored).offset < Offset then
				v5 = Floored + 1
			else
				NewTotal = Floored
			end
		end
		return v5
	end
	
	local function settle()
		-- upvalues: Flag3 (ref), Callback (copy), p4 (copy), p5 (copy), lowerBound (copy), p3 (copy), Value (ref), NowFunction (copy), NowResult (ref), v4 (ref), v2 (ref), Flag1 (ref), SettleModuleResult (copy), Flag2 (ref), Callback1 (copy), v3 (ref)
		local Flag: boolean = Flag3
		Flag3 = false
		
		if Callback and not Callback() then return end
		local PeekResult = p4:peek()
		local PeekResult1 = p5:peek()
		
		if PeekResult == nil or PeekResult.total == nil or PeekResult.total == 0 then return end
		local Largest = math.max(0, PeekResult.extent - PeekResult1.size)
		local LowerBoundResult: number = lowerBound(PeekResult1.offset, PeekResult.total)
		
		if PeekResult1.size < assert(p3.placementOf)((math.max(1, LowerBoundResult - 1))).size or LowerBoundResult <= PeekResult.total and PeekResult1.size < assert(p3.placementOf)(LowerBoundResult).size then return end
		local Offset = Largest
		local Magnitude = math.abs(Largest - PeekResult1.offset)
		
		for _, value in {
			math.max(1, LowerBoundResult - 1),
			(math.min(PeekResult.total, LowerBoundResult))
		} do
			local ClampedValue = math.clamp(assert(p3.placementOf)(value).offset, 0, Largest)
			local Magnitude1 = math.abs(ClampedValue - PeekResult1.offset)
			
			if Magnitude1 < Magnitude then
				Offset = ClampedValue
				Magnitude = Magnitude1
			end
		end
		if Flag and math.abs(Value) > 350 and NowFunction() - NowResult < 0.25 then
			if Value > 0 and Offset <= v4 then
				local LowerBoundResult1 = lowerBound(v4 + 0.01, PeekResult.total)
				Offset = if LowerBoundResult1 <= PeekResult.total then math.min(Largest, assert(p3.placementOf)(LowerBoundResult1).offset) else Largest
			elseif Value < 0 and v4 <= Offset then
				local LowerBoundResultDelta = lowerBound(v4, PeekResult.total) - 1
				Offset = if LowerBoundResultDelta > 0 then assert(p3.placementOf)(LowerBoundResultDelta).offset else 0
			end
		end
		Value = 0
		
		if math.abs(Offset - PeekResult1.offset) < 0.5 then return end
		v2 = Offset
		Flag1 = true
		
		if not SettleModuleResult.launch(PeekResult1.offset, 0) then
			Flag1 = false
			Flag2 = true
			Callback1(Offset)
			Flag2 = false
			v3 = Offset
		end
	end
	
	local _ = function()
		-- upvalues: Total (ref), OnFrameResult (ref), v1 (copy), Flag (ref), settle (copy)
		Total = 0
		
		if not OnFrameResult then
			OnFrameResult = v1.onFrame(function(Amount: number)
				-- upvalues: Total (upval), Flag (upval), OnFrameResult (upval), settle (upval)
				Total += Amount
				
				if Total >= 0.12 and not Flag then
					local OnFrameResult = OnFrameResult
					OnFrameResult = nil
					assert(OnFrameResult)()
					settle()
				end
			end)
			
			return
		end
	end
	
	Compose.watch(function(Callback)
		-- upvalues: SettleModuleResult (copy), Flag1 (ref), v2 (ref), Flag2 (ref), Callback1 (copy), v3 (ref)
		local CallbackResult = Callback(SettleModuleResult.value)
		
		if Flag1 then
			local CallbackResult1 = CallbackResult or v2
			Flag2 = true
			Callback1(CallbackResult1)
			Flag2 = false
			v3 = CallbackResult1
			
			if CallbackResult == nil then
				Flag1 = false
			end
		end
	end)
	Compose.cleanup(assert(Runtime.host.observation).observeProperty(ScrollFrame, "CanvasPosition", function()
		-- upvalues: p2 (copy), ScrollFrame (copy), Flag2 (ref), Callback2 (copy), Flag1 (ref), Flag3 (ref), SettleModuleResult (copy), OnFrameResult (ref), v3 (ref), Value (ref), v4 (ref), Flag (ref), NowFunction (copy), NowResult (ref), Total (ref), v1 (copy), settle (copy)
		local X = if p2.direction == "horizontal" then ScrollFrame.CanvasPosition.X else ScrollFrame.CanvasPosition.Y
		
		if Flag2 then return end
		if Callback2() then
			Flag1 = false
			Flag3 = false
			SettleModuleResult.halt()
			
			if OnFrameResult then
				OnFrameResult()
				OnFrameResult = nil
			end
			v3 = X
			Value = 0
			v4 = X
			
			return
		else
			if Flag1 then
				Flag1 = false
				Flag3 = false
				SettleModuleResult.halt()
				
				if OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
			end
			if not Flag and OnFrameResult == nil then
				v4 = v3
			end
			local NowResult1 = NowFunction()
			
			if Flag then
				Flag3 = true
			end
			if NowResult < NowResult1 then
				Value = (X - v3) / (NowResult1 - NowResult)
			end
			v3 = X
			NowResult = NowResult1
			
			if not Flag then
				Total = 0
				
				if OnFrameResult then return end
				OnFrameResult = v1.onFrame(function(Amount: number)
					-- upvalues: Total (upval), Flag (upval), OnFrameResult (upval), settle (upval)
					Total += Amount
					
					if Total >= 0.12 and not Flag then
						local OnFrameResult = OnFrameResult
						OnFrameResult = nil
						assert(OnFrameResult)()
						settle()
					end
				end)
			end
		end
	end))
	InputContactsModule(p1, ScrollFrame, function()
		-- upvalues: Flag1 (ref), Flag3 (ref), SettleModuleResult (copy), OnFrameResult (ref), Flag (ref), v4 (ref), v3 (ref), NowResult (ref), Value (ref), p5 (copy), NowFunction (copy)
		Flag1 = false
		Flag3 = false
		SettleModuleResult.halt()
		
		if OnFrameResult then
			OnFrameResult()
			OnFrameResult = nil
		end
		local Offset = p5:peek().offset
		local Offset1 = p5:peek().offset
		local NowResult1 = NowFunction()
		Flag = true
		v4 = Offset
		v3 = Offset1
		NowResult = NowResult1
		Value = 0
	end, function(p6)
		-- upvalues: Flag (ref), Flag1 (ref), Flag3 (ref), SettleModuleResult (copy), OnFrameResult (ref), Total (ref), v1 (copy), settle (copy)
		if Flag then
			Flag = false
			
			if p6 then
				Flag1 = false
				Flag3 = false
				SettleModuleResult.halt()
				
				if OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
					
					return
				end
			else
				Total = 0
				
				if OnFrameResult then return end
				OnFrameResult = v1.onFrame(function(Amount: number)
					-- upvalues: Total (upval), Flag (upval), OnFrameResult (upval), settle (upval)
					Total += Amount
					
					if Total >= 0.12 and not Flag then
						local OnFrameResult = OnFrameResult
						OnFrameResult = nil
						assert(OnFrameResult)()
						settle()
					end
				end)
			end
		end
	end)
	Compose.cleanup(cancel)
end