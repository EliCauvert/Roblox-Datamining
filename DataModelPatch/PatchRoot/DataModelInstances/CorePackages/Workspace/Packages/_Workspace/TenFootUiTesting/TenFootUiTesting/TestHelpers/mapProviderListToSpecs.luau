local Parent = script:FindFirstAncestor("TenFootUiTesting").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.Dev.RoactUtils)

return function(p1)
	-- upvalues: CryoModule (copy)
	return CryoModule.List.map(p1, function(Class)
		return { class = Class }
	end)
end