local Parent = script:FindFirstAncestor("Loggers").Parent
local RobloxAppEventsModule = require(Parent.RobloxAppEvents)
local FFlagDebugUnmuteLuaErrors = require(Parent.SharedFlags).Debug.FFlagDebugUnmuteLuaErrors

local function _()
	return game:GetService("RunService"):IsStudio()
end

return function(p1: string, p2)
	-- upvalues: FFlagDebugUnmuteLuaErrors (copy), RobloxAppEventsModule (copy)
	if type(p1) ~= "string" then
		warn("mutedError: errorMessage should be a string!")
		local Success, _ = pcall(function()
			-- upvalues: p1 (ref)
			p1 = tostring(p1)
		end)
		
		if not Success then
			p1 = "mutedError"
		end
	end
	if FFlagDebugUnmuteLuaErrors or game:GetService("RunService"):IsStudio() or _G.__TESTEZ_RUNNING_TEST__ then
		error(p1)
	else
		if type(p2) == "table" and type(p2.stacks) == "table" then
			table.insert(p2.stacks, debug.traceback())
		end
		RobloxAppEventsModule.ReportMutedError:fire(p1, debug.traceback(), script, p2)
	end
end