local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)

return function(p1, p2, Size)
	-- upvalues: RoactModule (copy), UIBloxModule (copy)
	local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	local MountResult = RoactModule.mount(RoactModule.createFragment({
		styleProvider = RoactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, {
			myElement = if Size then RoactModule.createElement("Frame", { Size = Size }, { testElement = RoactModule.createElement(p1, p2) }) else RoactModule.createElement(p1, p2)
		})
	}), ScreenGui)
	
	return ScreenGui, function()
		-- upvalues: RoactModule (upval), MountResult (copy), ScreenGui (copy)
		RoactModule.unmount(MountResult)
		ScreenGui:Destroy()
	end
end