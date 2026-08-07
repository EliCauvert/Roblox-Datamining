-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:37 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local REACT_PORTAL_TYPE = require(parent.Shared).ReactSymbols.REACT_PORTAL_TYPE
local _ = require(parent.Shared)

return {
	createPortal = function(p0, p1, p2, p3) --[[ line: 19 ]]
		-- upvalues: REACT_PORTAL_TYPE (ref)
		if p3 ~= nil then
			p3 = tostring(p3)
		end
		return {
			["$$typeof"] = REACT_PORTAL_TYPE,
			key = p3,
			children = p0,
			containerInfo = p1,
			implementation = p2
		}
	end
}