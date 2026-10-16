local Parent = script.Parent.Parent.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)

return function(Callback) --[[ Line: 15 | Named "createLazyComponent" ]]
	-- upvalues: ReactModule (copy), CryoModule (copy)
	return ReactModule.forwardRef(function(p1, Ref) --[[ Line: 18 ]]
		-- upvalues: ReactModule (upval), Callback (copy), CryoModule (upval)
		return ReactModule.createElement(Callback(), CryoModule.Dictionary.join(p1, { ref = Ref }))
	end)
end