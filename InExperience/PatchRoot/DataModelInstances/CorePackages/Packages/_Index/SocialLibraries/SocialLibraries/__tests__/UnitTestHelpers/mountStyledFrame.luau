local roact = require(script.Parent.Parent.Parent.dependencies).Roact
local mockProvidersModule = require(script.Parent.mockProviders)

return function(p0, p1)
	-- upvalues: mockProvidersModule (ref), roact (ref)
	if p1 == nil then
		p1 = Instance.new("Frame")
	end
	local var1 = roact.mount(mockProvidersModule(p0), p1)
	
	return p1, function()
		-- upvalues: roact (copy), var1 (ref), p1 (write)
		roact.unmount(var1)
		p1:Destroy()
	end
end