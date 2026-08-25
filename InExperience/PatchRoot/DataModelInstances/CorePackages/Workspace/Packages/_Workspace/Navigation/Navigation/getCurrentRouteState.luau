local _ = require(script.Parent.types)
local getCurrentNavigationStateModule = require(script.Parent.getCurrentNavigationState)

return function(p0)
	-- upvalues: getCurrentNavigationStateModule (ref)
	return if p0 then if p0.state then getCurrentNavigationStateModule(p0.state) else nil else nil
end