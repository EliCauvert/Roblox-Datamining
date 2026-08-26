local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(parent.Shared)

return function(p1, p2)
	-- upvalues: reactGlobalsModule (ref)
	local t = {
		_workInProgressVersionPrimary = nil,
		_workInProgressVersionSecondary = nil,
		_getVersion = p2,
		_source = p1
	}
	
	if reactGlobalsModule.__DEV__ then
		t._currentPrimaryRenderer = nil
		t._currentSecondaryRenderer = nil
	end
	return t
end