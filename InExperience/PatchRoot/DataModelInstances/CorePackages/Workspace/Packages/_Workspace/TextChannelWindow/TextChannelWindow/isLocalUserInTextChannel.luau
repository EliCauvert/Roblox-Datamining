local findLocalTextSourceModule = require(script.Parent.findLocalTextSource)

return function(p0, p1)
	-- upvalues: findLocalTextSourceModule (ref)
	return findLocalTextSourceModule(p0, p1) ~= nil
end