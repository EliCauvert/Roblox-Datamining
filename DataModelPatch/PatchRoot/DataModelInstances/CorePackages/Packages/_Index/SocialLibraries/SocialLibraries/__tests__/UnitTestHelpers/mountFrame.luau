local HttpService = game:GetService("HttpService")
local Roact = require(script.Parent.Parent.Parent.dependencies).Roact
local MockProvidersModule = require(script.Parent.mockProviders)

return function(p1, p2)
	-- upvalues: HttpService (copy), MockProvidersModule (copy), Roact (copy)
	local P1 = p2 or {}
	local Parent = P1.parent
	
	if Parent == nil then
		Parent = Instance.new("Frame")
		Parent.Name = HttpService:GenerateGUID(false)
	end
	local MountResult = Roact.mount(MockProvidersModule(p1, P1), Parent)
	
	return Parent, function()
		-- upvalues: Roact (upval), MountResult (copy), Parent (ref)
		Roact.unmount(MountResult)
		Parent:Destroy()
	end
end