local parent = script.Parent.Parent
local REACT_PORTAL_TYPE = require(parent.Shared).ReactSymbols.REACT_PORTAL_TYPE
local _ = require(parent.Shared)

return {
	createPortal = function(p1, p2, p3, p4)
		-- upvalues: REACT_PORTAL_TYPE (ref)
		if p4 ~= nil then
			p4 = tostring(p4)
		end
		return {
			["$$typeof"] = REACT_PORTAL_TYPE,
			key = p4,
			children = p1,
			containerInfo = p2,
			implementation = p3
		}
	end
}