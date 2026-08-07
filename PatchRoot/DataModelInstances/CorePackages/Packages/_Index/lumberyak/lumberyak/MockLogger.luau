-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:45 2026 Pacific Standard Time.

local t = {
	Levels = {
		Error = "MockError",
		Warning = "MockWarning",
		Info = "MockInfo",
		Debug = "MockDebug",
		Trace = "MockTrace",
		fromString = function() --[[ line: 12 ]]
			return "MockInfo"
		end
	}
}
t.__index = t

function t.new() --[[ line: 19 ]]
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t.setParent() --[[ line: 23 ]] end

function t.setContext() --[[ line: 26 ]] end

function t.addSink() --[[ line: 29 ]] end

function t.error() --[[ line: 32 ]] end

function t.warning() --[[ line: 35 ]] end

function t.info() --[[ line: 38 ]] end

function t.debug() --[[ line: 41 ]] end

function t.trace() --[[ line: 44 ]] end

return t