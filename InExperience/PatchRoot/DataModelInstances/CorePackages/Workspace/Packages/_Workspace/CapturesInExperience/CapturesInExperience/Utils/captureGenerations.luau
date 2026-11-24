local ConstantsModule = require(script.Parent.Parent.Constants)
local Count = 0
local v1 = nil
local v2 = nil
local List = {}
local List1 = {}

local function dropLapsed(List)
	-- upvalues: ConstantsModule (copy)
	while #List > 0 and ConstantsModule.CaptureSaveTimeout < os.clock() - List[1].expectedAt do
		table.remove(List, 1)
	end
end

local function _(List, CaptureGeneration)
	-- upvalues: dropLapsed (copy)
	dropLapsed(List)
	table.insert(List, {
		captureGeneration = CaptureGeneration,
		expectedAt = os.clock()
	})
end

return {
	startScreenshot = function(): number
		-- upvalues: Count (ref), v1 (ref), List (copy), dropLapsed (copy)
		Count += 1
		v1 = Count
		local CaptureGeneration: number = Count
		dropLapsed(List)
		table.insert(List, {
			captureGeneration = CaptureGeneration,
			expectedAt = os.clock()
		})
		
		return Count
	end,
	getLatestScreenshot = function()
		-- upvalues: v1 (ref)
		return v1
	end,
	startRecording = function(): number
		-- upvalues: Count (ref), v2 (ref)
		Count += 1
		v2 = Count
		
		return Count
	end,
	endRecording = function()
		-- upvalues: v2 (ref), List1 (copy), dropLapsed (copy)
		local CaptureGeneration = v2
		v2 = nil
		dropLapsed(List1)
		table.insert(List1, {
			captureGeneration = CaptureGeneration,
			expectedAt = os.clock()
		})
		
		return CaptureGeneration
	end,
	takeExpectedSave = function(p1)
		-- upvalues: List1 (copy), List (copy), dropLapsed (copy)
		local List2 = if p1 then List1 else List
		dropLapsed(List2)
		local Removed = table.remove(List2, 1)
		
		return if Removed then Removed.captureGeneration else nil
	end
}