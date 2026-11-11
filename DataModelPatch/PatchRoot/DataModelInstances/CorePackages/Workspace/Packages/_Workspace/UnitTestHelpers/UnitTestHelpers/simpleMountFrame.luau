local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local RoactModule = require(Parent.Parent.Roact)
local MockStyleModule = require(Parent.mockStyle)

return function(p1)
	-- upvalues: HttpService (copy), MockStyleModule (copy), RoactModule (copy)
	local Frame = Instance.new("Frame")
	Frame.Name = HttpService:GenerateGUID(false)
	local MountResult = RoactModule.mount(MockStyleModule(p1), Frame)
	
	return Frame, function()
		-- upvalues: RoactModule (upval), MountResult (copy), Frame (copy)
		RoactModule.unmount(MountResult)
		Frame:Destroy()
	end
end