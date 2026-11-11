local Parent = script:FindFirstAncestor("LazyRequire").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)

return function(Callback)
	-- upvalues: ReactModule (copy), CryoModule (copy)
	return ReactModule.forwardRef(function(p1, Ref)
		-- upvalues: ReactModule (upval), Callback (copy), CryoModule (upval)
		return ReactModule.createElement(Callback(), CryoModule.Dictionary.join(p1, { ref = Ref }))
	end)
end