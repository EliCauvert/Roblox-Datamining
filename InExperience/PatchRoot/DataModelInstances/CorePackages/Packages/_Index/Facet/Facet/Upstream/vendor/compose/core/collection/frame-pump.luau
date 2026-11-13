local DiagnosticsModule = require("../diagnostics")
local _ = require("../host")
local _ = require("../ownership/owner")
local _ = require("../reactive/types")
local FrameModule = require("../ownership/frame")

return function(p1, p2, p3, Primitive)
	-- upvalues: FrameModule (copy), DiagnosticsModule (copy)
	local FrameModuleResult = FrameModule(p1, function(p4)
		-- upvalues: p2 (copy), DiagnosticsModule (upval), Primitive (copy)
		local Frames = p2.frames
		
		return if Frames == nil then DiagnosticsModule.raise("collection/no-frames", Primitive .. " has pending admission work but its host has no frames", {
			contract = "admission over time requires host.frames.onFrame",
			fix = "implement host.frames or remove the admission budget",
			primitive = Primitive
		}) else Frames.onFrame(p4)
	end, function()
		-- upvalues: p3 (copy)
		p3:update(function(p4: number): number
			return p4 + 1
		end)
	end)
	
	return {
		update = function(p4)
			-- upvalues: FrameModuleResult (copy)
			if p4 then
				FrameModuleResult.start()
				
				return
			else
				FrameModuleResult.stop()
			end
		end
	}
end