local httpService = game:GetService("HttpService")
local roact = require(script.Parent.Parent.Parent.dependencies).Roact
local mockProvidersModule = require(script.Parent.mockProviders)

return function(p1, p2)
	-- upvalues: httpService (ref), mockProvidersModule (ref), roact (ref)
	p2 = p2 or {}
	local parent = p2.parent
	
	if parent == nil then
		parent = Instance.new("Frame")
		parent.Name = httpService:GenerateGUID(false)
	end
	local var1 = roact.mount(mockProvidersModule(p1, p2), parent)
	
	return parent, function()
		-- upvalues: roact (copy), var1 (ref), parent (write)
		roact.unmount(var1)
		parent:Destroy()
	end
end