local Parent = script.Parent.Parent
local REACTPORTALTYPE = require(Parent.Shared).ReactSymbols.REACT_PORTAL_TYPE
local _ = require(Parent.Shared)

return {
	createPortal = function(Children, ContainerInfo, Implementation, Key: string) --[[ Line: 19 ]]
		-- upvalues: REACTPORTALTYPE (copy)
		if Key ~= nil then
			Key = tostring(Key)
		end
		return {
			["$$typeof"] = REACTPORTALTYPE,
			key = Key,
			children = Children,
			containerInfo = ContainerInfo,
			implementation = Implementation
		}
	end
}