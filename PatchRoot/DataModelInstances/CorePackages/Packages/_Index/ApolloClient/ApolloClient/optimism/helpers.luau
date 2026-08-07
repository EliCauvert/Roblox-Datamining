-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.Parent.LuauPolyfill)
local _ = require(script.Parent.helpers_types)

return {
	hasOwnProperty = require(parent.luaUtils.hasOwnProperty),
	toArray = function(p0) --[[ line: 23 ]]
		if p0._array then
			return table.clone(p0._array)
		end
		local t = {}
		p0:forEach(function(p1) --[[ line: 31 ]]
			-- upvalues: t (ref)
			table.insert(t, p1)
		end)
		
		return t
	end,
	maybeUnsubscribe = function(p2) --[[ line: 41 ]]
		local unsubscribe = p2.unsubscribe
		
		if type(unsubscribe) == "function" then
			p2.unsubscribe = nil
			unsubscribe()
		end
	end
}