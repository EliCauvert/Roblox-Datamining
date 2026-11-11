local HttpService = game:GetService("HttpService")
local RoactModule = require(script.Parent.Parent.Roact)
local MockProvidersModule = require(script.Parent.mockProviders)

return function(p1, p2)
	-- upvalues: HttpService (copy), MockProvidersModule (copy), RoactModule (copy)
	local P1 = p2 or {}
	local Parent = P1.parent
	
	if Parent == nil then
		Parent = Instance.new("Frame")
		Parent.Size = UDim2.fromScale(1, 1)
		Parent.Name = HttpService:GenerateGUID(false)
	end
	local MountResult = RoactModule.mount(MockProvidersModule(p1, P1), Parent)
	
	return Parent, function()
		-- upvalues: RoactModule (upval), MountResult (copy), Parent (ref)
		RoactModule.unmount(MountResult)
		Parent:Destroy()
	end
end