local RoactModule = require(script.Parent.Parent.Roact)
local MockProvidersModule = require(script.Parent.mockProviders)

return function(p1, Frame: Frame)
	-- upvalues: MockProvidersModule (copy), RoactModule (copy)
	if Frame == nil then
		Frame = Instance.new("Frame")
	end
	local MountResult = RoactModule.mount(MockProvidersModule(p1), Frame)
	
	return Frame, function()
		-- upvalues: RoactModule (upval), MountResult (copy), Frame (ref)
		RoactModule.unmount(MountResult)
		Frame:Destroy()
	end
end