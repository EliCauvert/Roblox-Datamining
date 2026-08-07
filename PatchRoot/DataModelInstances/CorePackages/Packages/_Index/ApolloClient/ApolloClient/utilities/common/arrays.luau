-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local t = {}
local array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array

function t.isNonEmptyArray(p0) --[[ line: 14 ]]
	-- upvalues: array (ref)
	return (function() --[[ line: 15 ]]
		-- upvalues: array (copy), p0 (ref)
		return if array.isArray(p0) then #p0 > 0 else array.isArray(p0)
	end)()
end

return t