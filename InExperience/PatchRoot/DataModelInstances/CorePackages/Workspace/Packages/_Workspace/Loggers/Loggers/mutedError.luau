local parent = script:FindFirstAncestor("Loggers").Parent
local robloxAppEventsModule = require(parent.RobloxAppEvents)
local fFlagDebugUnmuteLuaErrors = require(parent.SharedFlags).Debug.FFlagDebugUnmuteLuaErrors

local function _()
	return game:GetService("RunService"):IsStudio()
end

return function(p1, p2)
	-- upvalues: fFlagDebugUnmuteLuaErrors (ref), robloxAppEventsModule (ref)
	if type(p1) ~= "string" then
		warn("mutedError: errorMessage should be a string!")
		local ok, _ = pcall(function()
			-- upvalues: p1 (write)
			p1 = tostring(p1)
		end)
		
		if not ok then
			p1 = "mutedError"
		end
	end
	if fFlagDebugUnmuteLuaErrors or game:GetService("RunService"):IsStudio() or _G.__TESTEZ_RUNNING_TEST__ then
		error(p1)
	elseif type(p2) == "table" and type(p2.stacks) == "table" then
		table.insert(p2.stacks, debug.traceback())
	end
	robloxAppEventsModule.ReportMutedError:fire(p1, debug.traceback(), script, p2)
end