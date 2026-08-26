local roact = require(script.Parent.Parent.Parent.dependencies).Roact
local mockProvidersModule = require(script.Parent.mockProviders)

return function(p1, p2)
	-- upvalues: mockProvidersModule (ref), roact (ref)
	if p2 == nil then
		p2 = Instance.new("Frame")
	end
	local var1 = roact.mount(mockProvidersModule(p1), p2)
	
	return p2, function()
		-- upvalues: roact (copy), var1 (ref), p2 (write)
		roact.unmount(var1)
		p2:Destroy()
	end
end