local Parent = script.Parent.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.Dev.React)

return function(p1, p2)
	-- upvalues: CryoModule (copy), ReactModule (copy)
	return CryoModule.List.foldRight(p2, function(ProviderChildren, p3)
		-- upvalues: ReactModule (upval)
		return ReactModule.createElement(p3, nil, { ProviderChildren = ProviderChildren })
	end, p1)
end