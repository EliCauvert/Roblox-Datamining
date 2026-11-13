local _ = require("../types")
local ReactorModule = require("../reactive/reactor")
local DiagnosticsModule = require("../diagnostics")
local _ = require("../host")
local OwnerModule = require("../ownership/owner")
local FrameModule = require("../ownership/frame")
local CellModule = require("../reactive/cell")

local function positive(Option, Duration: number)
	-- upvalues: DiagnosticsModule (copy)
	if Duration == Duration and Duration > 0 and (not (Duration == 1e999) or Option == "repeats") then return end
	return DiagnosticsModule.raise("animation/timeline-option", ("timeline %s must be greater than zero"):format(Option), {
		expected = "a number greater than zero",
		option = Option,
		actual = tostring(Duration)
	})
end

return {
	createTimelines = function(p1, Callback)
		-- upvalues: DiagnosticsModule (copy), positive (copy), CellModule (copy), ReactorModule (copy), OwnerModule (copy), FrameModule (copy)
		return {
			timeline = function(p2)
				-- upvalues: p1 (copy), DiagnosticsModule (upval), Callback (copy), positive (upval), CellModule (upval), ReactorModule (upval), OwnerModule (upval), FrameModule (upval)
				local Frames = p1.frames
				
				if Frames == nil then
					return DiagnosticsModule.raise("animation/no-frames", ("host %q cannot drive a timeline"):format(p1.name), {
						contract = "a timeline needs a frame loop, which is the host frames capability",
						fix = "implement host.frames.onFrame and host.frames.now, or drive time outside Compose"
					})
				end
				local Timeline = Callback("timeline")
				local T = if p2 == nil then {} else p2
				local Duration = if T.duration == nil then 1 else T.duration
				local Delay = if T.delay == nil then 0 else T.delay
				local Repeats = if T.repeats == nil then 1 else T.repeats
				local Normal = if T.direction == nil then "normal" else T.direction
				local Scale = if T.scale == nil then 1 else T.scale
				positive("duration", Duration)
				positive("repeats", Repeats)
				positive("scale", Scale)
				
				if Delay < 0 or Delay ~= Delay then
					return DiagnosticsModule.raise("animation/timeline-option", "timeline delay must not be negative", {
						option = "delay",
						expected = "zero or more seconds",
						actual = tostring(Delay)
					})
				else
					local CellResult = CellModule.cell(0)
					local CellResult1 = CellModule.cell(0)
					local CellResult2 = CellModule.cell(false)
					local CellResult3 = CellModule.cell(false)
					local NewLargest = 0
					
					local function publish(): boolean
						-- upvalues: NewLargest (ref), Delay (copy), CellResult (copy), CellResult1 (copy), Duration (copy), Repeats (copy), Normal (copy)
						local NewLargestDelta = NewLargest - Delay
						
						if NewLargestDelta < 0 then
							CellResult:set(0)
							CellResult1:set(0)
							
							return false
						end
						CellResult1:set(NewLargestDelta)
						local Value = NewLargestDelta / Duration
						local IsValueAbove = Value >= Repeats
						local ValueDelta = nil
						local Floored1 = nil
						
						if IsValueAbove then
							local Floored = math.floor(Repeats)
							
							if Repeats == Floored then
								Floored1 = Floored - 1
								ValueDelta = 1
							else
								Floored1 = Floored
								ValueDelta = Repeats - Floored
							end
						else
							Floored1 = math.floor(Value)
							ValueDelta = Value - Floored1
						end
						if Normal == "alternate" and Floored1 % 2 == 1 then
							ValueDelta = 1 - ValueDelta
						end
						CellResult:set(ValueDelta)
						
						return IsValueAbove
					end
					
					local v1 = nil
					
					local function stop()
						-- upvalues: v1 (ref), CellResult2 (copy)
						v1.stop()
						
						if CellResult2:peek() then
							CellResult2:set(false)
						end
					end
					
					local function _(p3)
						-- upvalues: ReactorModule (upval), OwnerModule (upval), Timeline (copy)
						ReactorModule.batch(OwnerModule.reactorOf(Timeline), p3)
					end
					
					local function start()
						-- upvalues: OwnerModule (upval), Timeline (copy), CellResult2 (copy), CellResult3 (copy), v1 (ref)
						if not OwnerModule.isDisposed(Timeline) and not CellResult2:peek() and not CellResult3:peek() then
							v1.start()
							CellResult2:set(true)
							
							return
						end
					end
					
					v1 = FrameModule(Timeline, Frames.onFrame, function(p3)
						-- upvalues: NewLargest (ref), Scale (ref), publish (copy), CellResult3 (copy), v1 (ref), CellResult2 (copy), ReactorModule (upval), OwnerModule (upval), Timeline (copy)
						ReactorModule.batch(OwnerModule.reactorOf(Timeline), function()
							-- upvalues: NewLargest (upval), p3 (copy), Scale (upval), publish (upval), CellResult3 (upval), v1 (upval), CellResult2 (upval)
							NewLargest += p3 * Scale
							
							if publish() then
								CellResult3:set(true)
								v1.stop()
								
								if CellResult2:peek() then
									CellResult2:set(false)
								end
							end
						end)
					end)
					OwnerModule.own(Timeline, stop)
					
					local function play()
						-- upvalues: start (copy), ReactorModule (upval), OwnerModule (upval), Timeline (copy)
						ReactorModule.batch(OwnerModule.reactorOf(Timeline), start)
					end
					
					local function pause()
						-- upvalues: stop (copy), ReactorModule (upval), OwnerModule (upval), Timeline (copy)
						ReactorModule.batch(OwnerModule.reactorOf(Timeline), stop)
					end
					
					local function seek(_, p3)
						-- upvalues: OwnerModule (upval), Timeline (copy), NewLargest (ref), Delay (copy), publish (copy), CellResult3 (copy), v1 (ref), CellResult2 (copy), ReactorModule (upval)
						if not OwnerModule.isDisposed(Timeline) then
							ReactorModule.batch(OwnerModule.reactorOf(Timeline), function()
								-- upvalues: NewLargest (upval), p3 (copy), Delay (upval), publish (upval), CellResult3 (upval), v1 (upval), CellResult2 (upval)
								NewLargest = math.max(0, p3) + Delay
								local PublishResult = publish()
								CellResult3:set(PublishResult)
								
								if PublishResult then
									v1.stop()
									
									if CellResult2:peek() then
										CellResult2:set(false)
									end
								end
							end)
							
							return
						end
					end
					
					local function restart()
						-- upvalues: OwnerModule (upval), Timeline (copy), NewLargest (ref), CellResult3 (copy), publish (copy), CellResult2 (copy), v1 (ref), ReactorModule (upval)
						if not OwnerModule.isDisposed(Timeline) then
							ReactorModule.batch(OwnerModule.reactorOf(Timeline), function()
								-- upvalues: NewLargest (upval), CellResult3 (upval), publish (upval), OwnerModule (upval), Timeline (upval), CellResult2 (upval), v1 (upval)
								NewLargest = 0
								CellResult3:set(false)
								publish()
								
								if not OwnerModule.isDisposed(Timeline) and not CellResult2:peek() then
									if CellResult3:peek() then return end
									v1.start()
									CellResult2:set(true)
								end
							end)
							
							return
						end
					end
					
					local function setScale(_, Value)
						-- upvalues: positive (upval), Scale (ref)
						positive("scale", Value)
						Scale = Value
					end
					
					ReactorModule.batch(OwnerModule.reactorOf(Timeline), function()
						-- upvalues: publish (copy), T (copy), OwnerModule (upval), Timeline (copy), CellResult2 (copy), CellResult3 (copy), v1 (ref)
						publish()
						
						if T.autoplay ~= false and not OwnerModule.isDisposed(Timeline) and not CellResult2:peek() then
							if CellResult3:peek() then return end
							v1.start()
							CellResult2:set(true)
						end
					end)
					
					return {
						progress = CellResult,
						elapsed = CellResult1,
						moving = CellResult2,
						completed = CellResult3,
						play = play,
						pause = pause,
						seek = seek,
						restart = restart,
						setScale = setScale
					}
				end
			end
		}
	end
}