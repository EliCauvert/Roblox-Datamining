local _ = require("./types")
local _ = require("./effect_types")
local ReducedFunction = require("./motion").reduced

return function(p1, p2)
	-- upvalues: ReducedFunction (copy)
	function p2.shake(p3, p4)
		-- upvalues: p1 (copy), ReducedFunction (upval), p2 (copy)
		local ReadFunction = p1.read
		local Intensity = if p4 and p4.intensity ~= nil then p4.intensity else 1
		assert(Intensity >= 0 and Intensity < 1e999, "Facet shake intensity must be finite and nonnegative")
		local Rotations = {}
		local DestroyingConnections = {}
		local Flag = true
		local ReducedResult = ReducedFunction(p1)
		local ScaledMotionDistancesShakeAngle = 0
		local MotionMaterializeShakeCycles = 0
		
		local function restore()
			-- upvalues: DestroyingConnections (copy), Rotations (copy)
			for _, destroyingConnection in DestroyingConnections do
				destroyingConnection:Disconnect()
			end
			table.clear(DestroyingConnections)
			
			for i, rotation in Rotations do
				pcall(function()
					-- upvalues: i (copy), rotation (copy)
					i.Rotation = rotation
				end)
			end
			table.clear(Rotations)
		end
		
		local SequenceResult = p2.sequence({
			steps = {
				{
					duration = "shake",
					easing = "shake",
					sample = function(Value: number)
						-- upvalues: ReducedResult (copy), MotionMaterializeShakeCycles (ref), ScaledMotionDistancesShakeAngle (ref), Rotations (copy)
						if ReducedResult() then return end
						local ClampedValue = math.clamp(Value, 0, 1)
						local ScaledSine = if ClampedValue == 0 or ClampedValue == 1 then 0 else math.sin(ClampedValue * 2 * 3.141592653589793 * MotionMaterializeShakeCycles) * (1 - ClampedValue) * ScaledMotionDistancesShakeAngle
						for i, rotation in Rotations do
							i.Rotation = rotation + ScaledSine
						end
					end,
					onEnd = restore
				}
			}
		})
		
		local function cancel()
			-- upvalues: SequenceResult (copy), restore (copy)
			SequenceResult.cancel()
			restore()
		end
		
		p1.Compose.watch(function(p5)
			-- upvalues: p1 (upval), p3 (copy), Rotations (copy), SequenceResult (copy), restore (copy)
			p1.read(p3, p5)
			
			if next(Rotations) ~= nil then
				SequenceResult.cancel()
				restore()
			end
		end)
		p1.Compose.cleanup(function()
			-- upvalues: Flag (ref), SequenceResult (copy), restore (copy)
			Flag = false
			SequenceResult.cancel()
			restore()
		end)
		
		return {
			running = SequenceResult.running,
			completed = SequenceResult.completed,
			cancel = cancel,
			finish = SequenceResult.finish,
			play = function()
				-- upvalues: Flag (ref), SequenceResult (copy), restore (copy), ReadFunction (copy), p3 (copy), ScaledMotionDistancesShakeAngle (ref), p1 (upval), Intensity (copy), MotionMaterializeShakeCycles (ref), ReducedResult (copy), Rotations (copy), DestroyingConnections (copy), cancel (copy)
				if not Flag then return end
				SequenceResult.cancel()
				restore()
				local ReadResult = ReadFunction(p3)
				
				for _, Gui in ReadResult do
					assert(Gui:IsA("GuiObject"), "Facet shake requires GuiObject targets")
				end
				ScaledMotionDistancesShakeAngle = p1.metric("motion.distances.shakeAngle") * Intensity
				assert(ScaledMotionDistancesShakeAngle < 1e999, "Facet shake angle must be finite")
				MotionMaterializeShakeCycles = p1.metric("motion.materialize.shakeCycles")
				
				if not ReducedResult() then
					for _, value in ReadResult do
						if Rotations[value] == nil then
							Rotations[value] = value.Rotation
							table.insert(DestroyingConnections, value.Destroying:Connect(cancel))
						end
					end
				end
				SequenceResult.play()
			end
		}
	end
end