local httpService = game:GetService("HttpService")
local roact = require(script.Parent.Parent.Parent.dependencies).Roact
local mockProvidersModule = require(script.Parent.mockProviders)

return function(p0, p1) --[[ line: 17 ]]
	-- upvalues: httpService (ref), mockProvidersModule (ref), roact (ref)
	p1 = p1 or {}
	local parent = p1.parent
	
	if parent == nil then
		parent = Instance.new("Frame")
		parent.Name = httpService:GenerateGUID(false)
	end
	local var2 = roact.mount(mockProvidersModule(p0, p1), parent)
	
	return parent, function() --[[ line: 28 ]]
		-- upvalues: roact (copy), var2 (ref), parent (write)
		roact.unmount(var2)
		parent:Destroy()
	end
end