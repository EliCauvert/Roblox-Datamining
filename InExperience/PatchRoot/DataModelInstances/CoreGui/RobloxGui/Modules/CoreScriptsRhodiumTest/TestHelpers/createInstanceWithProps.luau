local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)

return function(p1, p2, p3)
	-- upvalues: roactModule (ref), UIBloxModule (ref)
	local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	local var1 = roactModule.mount(roactModule.createFragment({
		styleProvider = roactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, {
			myElement = if not p3 then roactModule.createElement(p1, p2) else roactModule.createElement("Frame", { Size = p3 }, { testElement = roactModule.createElement(p1, p2) })
		})
	}), screenGui)
	
	return screenGui, function()
		-- upvalues: roactModule (copy), var1 (ref), screenGui (ref)
		roactModule.unmount(var1)
		screenGui:Destroy()
	end
end