local _ = require("../types")
local ReactorModule = require("../reactive/reactor")
local ActiveModule = require("../ownership/active")
local OwnerModule = require("../ownership/owner")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")
local _ = require("../animation/timeline")
local SupportModule = require("../structure/support")
local WatchModule = require("../reactive/watch")

return function(Callback1, Callback)
	-- upvalues: OwnerModule (copy), CellModule (copy), SupportModule (copy), ActiveModule (copy), ReactorModule (copy), WatchModule (copy)
	return function(p1)
		-- upvalues: Callback (copy), OwnerModule (upval), Callback1 (copy), CellModule (upval), SupportModule (upval), ActiveModule (upval), ReactorModule (upval), WatchModule (upval)
		local Child = OwnerModule.createChild((Callback("sequence")))
		local Success, Result = pcall(ActiveModule.withOwner, Child, function()
			-- upvalues: Callback1 (upval), p1 (copy), CellModule (upval), OwnerModule (upval), Child (copy), SupportModule (upval), ActiveModule (upval), ReactorModule (upval), WatchModule (upval)
			local List = {}
			local List1 = {}
			
			local function _(Phase, At, Start)
				-- upvalues: List1 (copy)
				table.insert(List1, {
					at = At,
					order = #List1 + 1,
					phase = Phase,
					start = Start
				})
			end
			
			local _ = nil
			
			local function v16(Step, At: number)
				-- upvalues: Callback1 (upval), List (copy), List1 (copy), v16 (ref)
				local Wait = Step.wait or 0
				local Clock = nil
				
				if Step.tween and Step.tween.seconds == 0 then
					Wait = 0
				elseif Step.timeline or Step.tween then
					local Timeline = if Step.timeline then Step.timeline else { duration = assert(Step.tween).seconds }
					local config = {
						autoplay = false,
						duration = Timeline.duration,
						delay = Timeline.delay,
						scale = Timeline.scale,
						repeats = Timeline.repeats,
						direction = Timeline.direction
					}
					Clock = Callback1(config)
					Wait = ((config.delay or 0) + (config.duration or 1) * (config.repeats or 1)) / (config.scale or 1)
				end
				assert(Wait >= 0 and Wait < 1e999, "Compose sequence steps need finite nonnegative timing")
				local Phase = {
					ended = false,
					started = false,
					start = At,
					finish = At + Wait,
					step = Step,
					clock = Clock
				}
				table.insert(List, Phase)
				table.insert(List1, { start = true, at = At, order = #List1 + 1, phase = Phase })
				local Steps = Step.steps or {}
				for _, step in Steps do
					Phase.finish = v16(step, Phase.finish)
				end
				local Parallel = Step.parallel or {}
				for _, value in Parallel do
					Phase.finish = math.max(Phase.finish, v16(value, At))
				end
				table.insert(List1, {
					start = false,
					at = Phase.finish,
					order = #List1 + 1,
					phase = Phase
				})
				
				return Phase.finish
			end
			
			local At = 0
			
			for _, step in p1.steps do
				At = v16(step, At)
			end
			table.sort(List1, function(A, B): boolean
				return if A.at == B.at then A.order < B.order else A.at < B.at
			end)
			local CallbackResult = Callback1({ autoplay = false, duration = math.max(At, 0.000000001) })
			local CellResult = CellModule.cell(false)
			local CellResult1 = CellModule.cell(false)
			local Count = 0
			local Count1 = 1
			
			local function cancel()
				-- upvalues: Count (ref), CallbackResult (copy), CellResult (copy), CellResult1 (copy)
				Count += 1
				CallbackResult:pause()
				CellResult:set(false)
				CellResult1:set(false)
			end
			
			OwnerModule.own(Child, cancel)
			local Sequence = if p1.reducedMotion then SupportModule.sourceOf(p1.reducedMotion, "sequence", "reducedMotion") else nil
			
			local _ = function(p2)
				-- upvalues: ActiveModule (upval), Child (upval), Count (ref), CallbackResult (copy), CellResult (copy), CellResult1 (copy)
				local Success, Result = pcall(function()
					-- upvalues: ActiveModule (upval), Child (upval), p2 (copy)
					ActiveModule.withOwner(Child, p2)
					
					return nil
				end)
				
				if not Success then
					Count += 1
					CallbackResult:pause()
					CellResult:set(false)
					CellResult1:set(false)
					error(Result, 0)
				end
			end
			
			local function sample(Phase, Finish)
				-- upvalues: ActiveModule (upval), Child (upval), Count (ref), CallbackResult (copy), CellResult (copy), CellResult1 (copy)
				local SampleFunction = Phase.step.sample
				
				if SampleFunction == nil or Phase.clock == nil and Phase.step.tween == nil then return end
				local PeekResult = 1
				
				if Phase.clock then
					local Timeline = Phase.step.timeline
					Phase.clock:seek((math.max(0, (Finish - Phase.start) * (Timeline and Timeline.scale or 1) - (Timeline and Timeline.delay or 0))))
					PeekResult = Phase.clock.progress:peek()
				end
				local Tween = Phase.step.tween
				
				local function v42()
					-- upvalues: SampleFunction (copy), Phase (copy), Tween (copy), PeekResult (ref)
					SampleFunction(if Phase.clock and Tween and Tween.ease then Tween.ease(PeekResult) else PeekResult)
				end
				
				local Success, Result = pcall(function()
					-- upvalues: ActiveModule (upval), Child (upval), v42 (copy)
					ActiveModule.withOwner(Child, v42)
					
					return nil
				end)
				
				if not Success then
					Count += 1
					CallbackResult:pause()
					CellResult:set(false)
					CellResult1:set(false)
					error(Result, 0)
				end
			end
			
			local function advance(At1)
				-- upvalues: CellResult (copy), OwnerModule (upval), Child (upval), Count (ref), Count1 (ref), List1 (copy), ActiveModule (upval), CallbackResult (copy), CellResult1 (copy), sample (copy), List (copy), At (ref)
				if not CellResult:peek() or OwnerModule.isDisposed(Child) then return end
				local Count2: number = Count
				while Count1 <= #List1 and List1[Count1].at <= At1 do
					local Entry = List1[Count1]
					Count1 += 1
					local Phase = Entry.phase
					
					if Entry.start then
						Phase.started = true
						
						if Phase.step.run then
							local Run = Phase.step.run
							local Success, Result = pcall(function()
								-- upvalues: ActiveModule (upval), Child (upval), Run (copy)
								ActiveModule.withOwner(Child, Run)
								
								return nil
							end)
							
							if not Success then
								Count += 1
								CallbackResult:pause()
								CellResult:set(false)
								CellResult1:set(false)
								error(Result, 0)
							end
						end
					else
						sample(Phase, Phase.finish)
						
						if Count2 ~= Count or OwnerModule.isDisposed(Child) then return end
						Phase.ended = true
						
						if Phase.step.onComplete then
							local OnComplete = Phase.step.onComplete
							local Success1, Result1 = pcall(function()
								-- upvalues: ActiveModule (upval), Child (upval), OnComplete (copy)
								ActiveModule.withOwner(Child, OnComplete)
								
								return nil
							end)
							
							if not Success1 then
								Count += 1
								CallbackResult:pause()
								CellResult:set(false)
								CellResult1:set(false)
								error(Result1, 0)
							end
						end
					end
					if Count2 ~= Count or OwnerModule.isDisposed(Child) then return end
				end
				for _, Phase in List do
					if Phase.started and not Phase.ended then
						sample(Phase, At1)
						
						if Count2 ~= Count or OwnerModule.isDisposed(Child) then return end
					end
				end
				if At <= At1 then
					CallbackResult:pause()
					CellResult:set(false)
					CellResult1:set(true)
				end
			end
			
			local function finish()
				-- upvalues: advance (copy), At (ref)
				advance(At)
			end
			
			OwnerModule.watch(Child, function(Callback)
				-- upvalues: CallbackResult (copy), Sequence (copy), advance (copy), At (ref)
				local CallbackResult1 = Callback(CallbackResult.elapsed)
				local IsSequenceResult: boolean = Sequence ~= nil and Sequence(Callback) == true
				advance(if IsSequenceResult then At else CallbackResult1)
			end)
			
			local function play()
				-- upvalues: OwnerModule (upval), Child (upval), ReactorModule (upval), Count (ref), CallbackResult (copy), CellResult (copy), CellResult1 (copy), Count1 (ref), List (copy), Sequence (copy), WatchModule (upval), advance (copy), At (ref)
				if not OwnerModule.isDisposed(Child) then
					ReactorModule.batch(OwnerModule.reactorOf(Child), function()
						-- upvalues: Count (upval), CallbackResult (upval), CellResult (upval), CellResult1 (upval), Count1 (upval), List (upval), Sequence (upval), WatchModule (upval), advance (upval), At (upval)
						Count += 1
						CallbackResult:pause()
						CellResult:set(false)
						CellResult1:set(false)
						Count1 = 1
						
						for _, Phase in List do
							Phase.ended = false
							Phase.started = false
						end
						CallbackResult:seek(0)
						CellResult:set(true)
						local IsSampleResult: boolean = Sequence ~= nil and WatchModule.sample(function()
							-- upvalues: Sequence (upval)
							return assert(Sequence)(function(p2)
								return p2:peek()
							end)
						end) == true
						advance(if IsSampleResult then At else 0)
						
						if CellResult:peek() then
							CallbackResult:play()
						end
					end)
					
					return
				end
			end
			
			if p1.autoplay ~= false and not OwnerModule.isDisposed(Child) then
				ReactorModule.batch(OwnerModule.reactorOf(Child), function()
					-- upvalues: Count (ref), CallbackResult (copy), CellResult (copy), CellResult1 (copy), Count1 (ref), List (copy), Sequence (copy), WatchModule (upval), advance (copy), At (ref)
					Count += 1
					CallbackResult:pause()
					CellResult:set(false)
					CellResult1:set(false)
					Count1 = 1
					
					for _, Phase in List do
						Phase.ended = false
						Phase.started = false
					end
					CallbackResult:seek(0)
					CellResult:set(true)
					local IsSampleResult: boolean = Sequence ~= nil and WatchModule.sample(function()
						-- upvalues: Sequence (upval)
						return assert(Sequence)(function(p2)
							return p2:peek()
						end)
					end) == true
					advance(if IsSampleResult then At else 0)
					
					if CellResult:peek() then
						CallbackResult:play()
					end
				end)
			end
			return {
				running = CellResult,
				completed = CellResult1,
				play = play,
				cancel = cancel,
				finish = finish
			}
		end)
		
		if not Success then
			OwnerModule.dispose(Child)
			error(Result, 0)
		end
		return Result
	end
end