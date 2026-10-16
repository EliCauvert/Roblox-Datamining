local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local Log = nil
local _ = require(script.Parent.ReactFiberLane)
local EnableDebugTracing = require(Parent.Shared).ReactFeatureFlags.enableDebugTracing
local Log1 = nil
local List = {}
local Count = 0

function decimalToBinaryString(p1: number): string --[[ Line: 40 ]]
	local Text = ""
	repeat
		local FractionalPart
		p1, FractionalPart = math.modf(p1 / 2)
		Text = math.ceil(FractionalPart) .. Text
	until p1 == 0
	return string.rep("0", 31 - string.len(Text)) .. Text
end

local function _(p1): string --[[ Line: 53 | Named "formatLanes" ]]
	return "0b" .. decimalToBinaryString(p1)
end

local function group(...) --[[ Line: 59 ]]
	-- upvalues: List (copy), Log1 (ref), Console (copy), Log (ref)
	for _, value in { ... } do
		table.insert(List, value)
	end
	if Log1 == nil then
		Log1 = Console.log
		Console.log = Log
	end
end

local function groupEnd() --[[ Line: 69 ]]
	-- upvalues: List (copy), Count (ref), Console (copy), Log1 (ref)
	table.remove(List, 1)
	while #List < Count do
		Console.groupEnd()
		Count -= 1
	end
	if #List == 0 then
		Console.log = Log1
		Log1 = nil
	end
end

Log = function(...) --[[ Line: 81 | Named "log" ]]
	-- upvalues: Count (ref), List (copy), Console (copy), Log1 (ref)
	if Count < #List then
		for i = Count + 1, #List do
			Console.group(List[i])
		end
		Count = #List
	end
	if typeof(Log1) == "function" then
		Log1(...)
		
		return
	else
		Console.log(...)
	end
end

return {
	logCommitStarted = function(p1) --[[ Line: 99 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), group (copy)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			group(string.format("* commit (%s)", "0b" .. decimalToBinaryString(p1)), "", "", "")
		end
	end,
	logCommitStopped = function() --[[ Line: 114 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), groupEnd (copy)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			groupEnd()
		end
	end,
	logComponentSuspended = function(p1, Promise) --[[ Line: 142 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), Log (ref)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			Log(string.format("* %s suspended", p1))
			Promise:andThen(function() --[[ Line: 156 ]]
				-- upvalues: Log (upval), p1 (copy)
				Log(string.format("* %s resolved", p1))
			end, function() --[[ Line: 165 ]]
				-- upvalues: Log (upval), p1 (copy)
				Log(string.format("* %s rejected", p1))
			end)
		end
	end,
	logLayoutEffectsStarted = function(p1) --[[ Line: 180 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), group (copy)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			group(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(p1)))
		end
	end,
	logLayoutEffectsStopped = function() --[[ Line: 195 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), groupEnd (copy)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			groupEnd()
		end
	end,
	logPassiveEffectsStarted = function(p1) --[[ Line: 204 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), group (copy)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			group(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(p1)))
		end
	end,
	logPassiveEffectsStopped = function() --[[ Line: 219 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), groupEnd (copy)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			groupEnd()
		end
	end,
	logRenderStarted = function(p1) --[[ Line: 228 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), group (copy)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			group(string.format("* render (%s)", "0b" .. decimalToBinaryString(p1)))
		end
	end,
	logRenderStopped = function() --[[ Line: 243 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), groupEnd (copy)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			groupEnd()
		end
	end,
	logForceUpdateScheduled = function(p1, p2) --[[ Line: 252 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), Log (ref)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			Log(string.format("* %s forced update (%s)", p1, "0b" .. decimalToBinaryString(p2)))
		end
	end,
	logStateUpdateScheduled = function(p1, p2, _) --[[ Line: 267 ]]
		-- upvalues: ReactGlobalsModule (copy), EnableDebugTracing (copy), Log (ref)
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing then
			Log(string.format("* %s updated state (%s)", p1, "0b" .. decimalToBinaryString(p2)))
		end
	end
}