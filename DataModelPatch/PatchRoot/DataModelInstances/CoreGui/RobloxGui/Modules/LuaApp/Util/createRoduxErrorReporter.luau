local Modules = game:GetService("CoreGui").RobloxGui.Modules
local InspectFunction = require(Modules.LuaApp.Util.inspect).inspect
local TableDiffModule = require(Modules.LuaApp.Util.tableDiff)

local function backtraceDetails(p1, p2, Rodux_actions, p3)
	-- upvalues: TableDiffModule (copy)
	if type(p3.thrownValue) == "string" then
		local v1: number = p3.thrownValue:find("\n")
		
		return if v1 then {
			message = p3.message .. "\n" .. p3.thrownValue:sub(1, v1 - 1),
			stacks = p3.thrownValue:sub(v1 + 1):split("\n\n"),
			annotations = {
				rodux_actions = Rodux_actions,
				rodux_diff = TableDiffModule(p1, p2) or {}
			}
		} else nil
	else
		return nil
	end
end

return function(Callback)
	-- upvalues: InspectFunction (copy), backtraceDetails (copy), TableDiffModule (copy)
	return {
		reportReducerError = function(_, p1, p2)
			-- upvalues: InspectFunction (upval), Callback (copy), backtraceDetails (upval)
			Callback(string.format("%s\n\nAction:\n%s\n\nError contents:\n%s", p2.message, InspectFunction(p1), (tostring(p2.thrownValue))), (backtraceDetails({}, {}, { p1 }, p2)))
		end,
		reportUpdateError = function(p1, p2, Rodux_actions, p3)
			-- upvalues: InspectFunction (upval), TableDiffModule (upval), Callback (copy), backtraceDetails (upval)
			Callback(string.format("%s\n\nStore changes in the last flush:\n%s\n\nMost recent actions (starting with the oldest):\n%s\n\nError contents:\n%s", p3.message, InspectFunction(TableDiffModule(p1, p2)), InspectFunction(Rodux_actions), (tostring(p3.thrownValue))), (backtraceDetails(p1, p2, Rodux_actions, p3)))
		end
	}
end