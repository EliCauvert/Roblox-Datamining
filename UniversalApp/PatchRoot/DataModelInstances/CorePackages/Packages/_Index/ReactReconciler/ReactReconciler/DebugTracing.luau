local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local t = {}
local log = nil
local _ = require(script.Parent.ReactFiberLane)
local enableDebugTracing = require(parent.Shared).ReactFeatureFlags.enableDebugTracing
local var1 = nil
local t_1 = {}
local var2 = 0

function decimalToBinaryString(p1)
	local var3 = ""
	repeat
		local var4, var5 = math.modf(p1 / 2)
		p1 = var4
		var3 = math.ceil(var5) .. var8
	until p1 == 0
	return string.rep("0", 31 - string.len(var3)) .. var8
end

local function _(p1)
	return "0b" .. decimalToBinaryString(p1)
end

local function group(...)
	-- upvalues: t_1 (ref), var1 (write), console (ref), log (write)
	for i, v in { ... } do
		table.insert(t_1, v)
	end
	if var1 == nil then
		var1 = console.log
		console.log = log
	end
end

local function groupEnd()
	-- upvalues: t_1 (ref), var2 (write), console (ref), var1 (write)
	table.remove(t_1, 1)
	while #t_1 < var2 do
		console.groupEnd()
		var2 -= 1
	end
	if #t_1 == 0 then
		console.log = var1
		var1 = nil
	end
end

log = function(...)
	-- upvalues: var2 (write), t_1 (ref), console (ref), var1 (write)
	if var2 < #t_1 then
		for i = var2 + 1, #t_1 do
			console.group(t_1[i])
		end
		var2 = #t_1
	end
	if typeof(var1) == "function" then
		var1(...)
		
		return
	end
	console.log(...)
end

function t.logCommitStarted(p1)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), group (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		group(string.format("* commit (%s)", "0b" .. decimalToBinaryString(p1)), "", "", "")
	end
end

function t.logCommitStopped()
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), groupEnd (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		groupEnd()
	end
end

function t.logComponentSuspended(p1, p2)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), log (write)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		log(string.format("* %s suspended", p1))
		p2:andThen(function()
			-- upvalues: log (copy), p1 (ref)
			log(string.format("* %s resolved", p1))
		end, function()
			-- upvalues: log (copy), p1 (ref)
			log(string.format("* %s rejected", p1))
		end)
	end
end

function t.logLayoutEffectsStarted(p1)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), group (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		group(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(p1)))
	end
end

function t.logLayoutEffectsStopped()
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), groupEnd (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		groupEnd()
	end
end

function t.logPassiveEffectsStarted(p1)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), group (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		group(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(p1)))
	end
end

function t.logPassiveEffectsStopped()
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), groupEnd (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		groupEnd()
	end
end

function t.logRenderStarted(p1)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), group (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		group(string.format("* render (%s)", "0b" .. decimalToBinaryString(p1)))
	end
end

function t.logRenderStopped()
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), groupEnd (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		groupEnd()
	end
end

function t.logForceUpdateScheduled(p1, p2)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), log (write)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		log(string.format("* %s forced update (%s)", p1, "0b" .. decimalToBinaryString(p2)))
	end
end

function t.logStateUpdateScheduled(p1, p2, _)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), log (write)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		log(string.format("* %s updated state (%s)", p1, "0b" .. decimalToBinaryString(p2)))
	end
end

return t