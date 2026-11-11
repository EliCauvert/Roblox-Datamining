local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local _ = require(Parent.Shared)

return function(_source, _getVersion)
	-- upvalues: ReactGlobalsModule (copy)
	local config = {
		_workInProgressVersionPrimary = nil,
		_workInProgressVersionSecondary = nil,
		_getVersion = _getVersion,
		_source = _source
	}
	
	if ReactGlobalsModule.__DEV__ then
		config._currentPrimaryRenderer = nil
		config._currentSecondaryRenderer = nil
	end
	return config
end