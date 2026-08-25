local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local t = {}
local log = nil
local _ = require(script.Parent.ReactFiberLane)
local enableDebugTracing = require(parent.Shared).ReactFeatureFlags.enableDebugTracing
local var3 = nil
local t_1 = {}
local var5 = 0

function decimalToBinaryString(p0)
	local var8 = ""
	repeat
		local var9, var10 = math.modf(p0 / 2)
		p0 = var9
		var8 = math.ceil(var10) .. var8
	until p0 == 0
	return string.rep("0", 31 - string.len(var8)) .. var8
end

local function _(p1)
	return "0b" .. decimalToBinaryString(p1)
end

local function group(...)
	-- upvalues: t_1 (ref), var3 (write), console (ref), log (write)
	for i, v in { ... } do
		table.insert(t_1, v)
	end
	if var3 == nil then
		var3 = console.log
		console.log = log
	end
end

local function groupEnd()
	-- upvalues: t_1 (ref), var5 (write), console (ref), var3 (write)
	table.remove(t_1, 1)
	while #t_1 < var5 do
		console.groupEnd()
		var5 -= 1
	end
	if #t_1 == 0 then
		console.log = var3
		var3 = nil
	end
end

log = function(...)
	-- upvalues: var5 (write), t_1 (ref), console (ref), var3 (write)
	if var5 < #t_1 then
		for i = var5 + 1, #t_1 do
			console.group(t_1[i])
		end
		var5 = #t_1
	end
	if typeof(var3) == "function" then
		var3(...)
		
		return
	end
	console.log(...)
end

function t.logCommitStarted(p2)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), group (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		group(string.format("* commit (%s)", "0b" .. decimalToBinaryString(p2)), "", "", "")
	end
end

function t.logCommitStopped()
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), groupEnd (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		groupEnd()
	end
end

function t.logComponentSuspended(p3, p4)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), log (write)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		log(string.format("* %s suspended", p3))
		p4:andThen(function()
			-- upvalues: log (copy), p3 (ref)
			log(string.format("* %s resolved", p3))
		end, function()
			-- upvalues: log (copy), p3 (ref)
			log(string.format("* %s rejected", p3))
		end)
	end
end

function t.logLayoutEffectsStarted(p5)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), group (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		group(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(p5)))
	end
end

function t.logLayoutEffectsStopped()
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), groupEnd (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		groupEnd()
	end
end

function t.logPassiveEffectsStarted(p6)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), group (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		group(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(p6)))
	end
end

function t.logPassiveEffectsStopped()
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), groupEnd (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		groupEnd()
	end
end

function t.logRenderStarted(p7)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), group (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		group(string.format("* render (%s)", "0b" .. decimalToBinaryString(p7)))
	end
end

function t.logRenderStopped()
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), groupEnd (ref)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		groupEnd()
	end
end

function t.logForceUpdateScheduled(p8, p9)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), log (write)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		log(string.format("* %s forced update (%s)", p8, "0b" .. decimalToBinaryString(p9)))
	end
end

function t.logStateUpdateScheduled(p10, p11, _)
	-- upvalues: reactGlobalsModule (ref), enableDebugTracing (ref), log (write)
	if reactGlobalsModule.__DEV__ and enableDebugTracing then
		log(string.format("* %s updated state (%s)", p10, "0b" .. decimalToBinaryString(p11)))
	end
end

return t