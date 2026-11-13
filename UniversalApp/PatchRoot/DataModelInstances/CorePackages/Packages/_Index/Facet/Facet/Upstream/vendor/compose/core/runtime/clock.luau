local _ = require("../types")
local _ = require("../host")
local OwnerModule = require("../ownership/owner")
local _ = require("../reactive/types")
local GraphModule = require("../reactive/graph")
local CellModule = require("../reactive/cell")
local FrameModule = require("../ownership/frame")

return function(p1, Callback)
	-- upvalues: CellModule (copy), GraphModule (copy), FrameModule (copy), OwnerModule (copy)
	return function(p2)
		-- upvalues: Callback (copy), p1 (copy), CellModule (upval), GraphModule (upval), FrameModule (upval), OwnerModule (upval)
		local Clock = Callback("clock")
		local ComposeClockRequiresHostFrames = assert(p1.frames, "Compose clock requires host.frames")
		local P1 = p2 or {}
		local Duration: number = P1.duration
		local Deadline: number = P1.deadline
		local Start: number = P1.start
		local Interval = P1.interval or 0
		local Step: number = P1.step
		local Total1: boolean = Step == nil or Step > 0 and Step < 1e999 and Interval == 0
		assert(Total1, "Compose clock step must be finite and positive, and exclusive of interval")
		Total1 = Duration == nil or Deadline == nil
		assert(Total1, "Compose clock accepts duration or deadline")
		Total1 = Start == nil or Duration == nil and (Deadline == nil and Start == Start) and math.abs(Start) < 1e999
		assert(Total1, "Compose clock start must be finite and exclusive of duration and deadline")
		Total1 = Interval >= 0 and Interval < 1e999
		assert(Total1, "Compose clock interval must be finite and nonnegative")
		Total1 = Duration == nil or Duration >= 0 and Duration < 1e999
		assert(Total1, "Compose clock duration must be finite and nonnegative")
		Total1 = Deadline == nil or Deadline == Deadline and math.abs(Deadline) < 1e999
		assert(Total1, "Compose clock deadline must be finite")
		local Total = 0
		Total1 = 0
		
		local function _()
			-- upvalues: Start (copy), ComposeClockRequiresHostFrames (copy), Deadline (copy), Duration (copy), Total (ref)
			return if Start then math.max(0, ComposeClockRequiresHostFrames.now() - Start) elseif Deadline then math.max(0, Deadline - ComposeClockRequiresHostFrames.now()) elseif Duration then math.max(0, Duration - Total) else Total
		end
		
		local CellResult = CellModule.cell(if Start then math.max(0, ComposeClockRequiresHostFrames.now() - Start) elseif Deadline then math.max(0, Deadline - ComposeClockRequiresHostFrames.now()) elseif Duration then math.max(0, Duration - Total) else Total)
		local NodeOfResult = GraphModule.nodeOf(CellResult)
		
		local _ = function(p3): boolean
			-- upvalues: Duration (copy), Deadline (copy)
			return if Duration == nil then Deadline ~= nil and p3 == 0 else p3 == 0
		end
		
		local v1 = nil
		v1 = FrameModule(Clock, ComposeClockRequiresHostFrames.onFrame, function(Amount: number)
			-- upvalues: Total (ref), Total1 (ref), Start (copy), ComposeClockRequiresHostFrames (copy), Deadline (copy), Duration (copy), Step (copy), CellResult (copy), Interval (copy), v1 (ref)
			Total += Amount
			Total1 += Amount
			local Largest = if Start then math.max(0, ComposeClockRequiresHostFrames.now() - Start) elseif Deadline then math.max(0, Deadline - ComposeClockRequiresHostFrames.now()) elseif Duration then math.max(0, Duration - Total) else Total
			local IsLargestMatch: boolean = if Duration == nil then Deadline ~= nil and Largest == 0 else Largest == 0
			
			if Step then
				if IsLargestMatch or math.floor(Largest / Step) ~= math.floor(CellResult:peek() / Step) then
					CellResult:set(Largest)
				end
			elseif Interval <= Total1 or IsLargestMatch then
				Total1 = if Interval > 0 then Total1 % Interval else 0
				CellResult:set(Largest)
			end
			if IsLargestMatch then
				v1.stop()
			end
		end)
		GraphModule.observe(NodeOfResult, function(p3)
			-- upvalues: v1 (ref), OwnerModule (upval), Clock (copy), CellResult (copy), Start (copy), ComposeClockRequiresHostFrames (copy), Deadline (copy), Duration (copy), Total (ref)
			v1.stop()
			
			if p3 and not OwnerModule.isDisposed(Clock) then
				CellResult:set(if Start then math.max(0, ComposeClockRequiresHostFrames.now() - Start) elseif Deadline then math.max(0, Deadline - ComposeClockRequiresHostFrames.now()) elseif Duration then math.max(0, Duration - Total) else Total)
				local PeekResult = CellResult:peek()
				
				if not (if Duration == nil then Deadline ~= nil and PeekResult == 0 else PeekResult == 0) then
					v1.start()
				end
			end
		end)
		OwnerModule.own(Clock, function()
			-- upvalues: GraphModule (upval), NodeOfResult (copy)
			GraphModule.observe(NodeOfResult, nil)
		end)
		
		return CellResult
	end
end