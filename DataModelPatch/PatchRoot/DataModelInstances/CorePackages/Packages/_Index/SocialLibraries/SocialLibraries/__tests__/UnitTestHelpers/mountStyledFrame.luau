local Roact = require(script.Parent.Parent.Parent.dependencies).Roact
local MockProvidersModule = require(script.Parent.mockProviders)

return function(p1, Frame: Frame)
	-- upvalues: MockProvidersModule (copy), Roact (copy)
	if Frame == nil then
		Frame = Instance.new("Frame")
	end
	local MountResult = Roact.mount(MockProvidersModule(p1), Frame)
	
	return Frame, function()
		-- upvalues: Roact (upval), MountResult (copy), Frame (ref)
		Roact.unmount(MountResult)
		Frame:Destroy()
	end
end