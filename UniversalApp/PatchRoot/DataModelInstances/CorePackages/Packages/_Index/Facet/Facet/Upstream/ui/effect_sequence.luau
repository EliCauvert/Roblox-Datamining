local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./effect_types")
local MotionModule = require("./motion")
local ReducedFunction = MotionModule.reduced

return function(p1, p2)
	-- upvalues: ReducedFunction (copy), MotionModule (copy)
	local Runtime = p1.runtime
	
	function p2.countUp(p3)
		-- upvalues: Runtime (copy), p1 (copy), ReducedFunction (upval)
		return Runtime.tween(function(p4): number
			-- upvalues: p1 (upval), p3 (copy)
			local ReadResult: number = p1.read(p3, p4)
			assert(ReadResult == ReadResult and math.abs(ReadResult) < 1e999, "Facet countUp requires a finite value")
			
			return ReadResult
		end, {
			seconds = p1.metric("motion.durations.countUp"),
			ease = p1.motionEase("countUp"),
			reducedMotion = ReducedFunction(p1)
		})
	end
	
	function p2.follow(p3, p4)
		-- upvalues: p1 (copy), MotionModule (upval), ReducedFunction (upval)
		local MotionSpringResult = p1.motionSpring(p4)
		
		return MotionModule.forValue(p1, (p1.read(p3))).spring(function(p5)
			-- upvalues: p1 (upval), p3 (copy)
			return p1.read(p3, p5)
		end, {
			period = MotionSpringResult.period,
			damping = MotionSpringResult.damping,
			reducedMotion = ReducedFunction(p1)
		})
	end
	
	function p2.toward(p3, Value: number)
		assert(Value == Value and math.abs(Value) < 1e999, "Facet toward requires a finite target")
		local v1 = nil
		
		return function(p4: number)
			-- upvalues: v1 (ref), p3 (copy), Value (copy)
			local v2 = (if p4 <= 0 then nil else v1) or p3:peek()
			v1 = if p4 >= 1 then nil else v2
			p3:set(v2 + (Value - v2) * p4)
		end
	end
	
	function p2.sequence(p3)
		-- upvalues: p1 (copy), Runtime (copy), ReducedFunction (upval)
		local function _(Text)
			-- upvalues: p1 (upval)
			local MetricResult = if Text then p1.metric("motion.durations." .. Text) else 0
			assert(MetricResult >= 0 and MetricResult < 1e999, "Facet sequence timing must be finite and nonnegative")
			
			return MetricResult
		end
		
		local _ = nil
		
		local function v11(p4)
			-- upvalues: p1 (upval), v11 (ref)
			local Duration = p4.duration
			local MetricResult = if Duration then p1.metric("motion.durations." .. Duration) else 0
			assert(MetricResult >= 0 and MetricResult < 1e999, "Facet sequence timing must be finite and nonnegative")
			local Parallel = {}
			local Parallel1 = p4.parallel or {}
			for _, value in Parallel1 do
				local v1, v2 = v11(value)
				table.insert(Parallel, v1)
				MetricResult = math.max(MetricResult, v2)
			end
			local Delay = p4.delay
			local MetricResult1 = if Delay then p1.metric("motion.durations." .. Delay) else 0
			assert(MetricResult1 >= 0 and MetricResult1 < 1e999, "Facet sequence timing must be finite and nonnegative")
			
			return {
				steps = {
					{ wait = MetricResult1 },
					{
						run = p4.onStart,
						onComplete = p4.onEnd,
						tween = {
							seconds = MetricResult,
							ease = p1.motionEase(p4.easing or "sequence")
						},
						sample = p4.sample,
						parallel = Parallel
					}
				}
			}, MetricResult1 + MetricResult
		end
		
		local Steps = {}
		
		for _, step in p3.steps do
			table.insert(Steps, (v11(step)))
		end
		local SequenceResult = Runtime.sequence({
			autoplay = false,
			steps = Steps,
			reducedMotion = ReducedFunction(p1)
		})
		
		if p3.onCompleted then
			local BindOwnerResult = p1.Compose.bindOwner(p3.onCompleted)
			p1.Compose.watch(function(Callback)
				-- upvalues: SequenceResult (copy), BindOwnerResult (copy)
				if Callback(SequenceResult.completed) then
					BindOwnerResult()
				end
			end)
		end
		return SequenceResult
	end
end