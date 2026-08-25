local parent = script:FindFirstAncestor("Loggers").Parent
local robloxAppEventsModule = require(parent.RobloxAppEvents)
local fFlagDebugUnmuteLuaErrors = require(parent.SharedFlags).Debug.FFlagDebugUnmuteLuaErrors

local function _()
	return game:GetService("RunService"):IsStudio()
end

return function(p0, p1)
	-- upvalues: fFlagDebugUnmuteLuaErrors (ref), robloxAppEventsModule (ref)
	if type(p0) ~= "string" then
		warn("mutedError: errorMessage should be a string!")
		local ok, _ = pcall(function()
			-- upvalues: p0 (write)
			p0 = tostring(p0)
		end)
		
		if not ok then
			p0 = "mutedError"
		end
	end
	if fFlagDebugUnmuteLuaErrors or game:GetService("RunService"):IsStudio() or _G.__TESTEZ_RUNNING_TEST__ then
		error(p0)
	elseif type(p1) == "table" and type(p1.stacks) == "table" then
		table.insert(p1.stacks, debug.traceback())
	end
	robloxAppEventsModule.ReportMutedError:fire(p0, debug.traceback(), script, p1)
end