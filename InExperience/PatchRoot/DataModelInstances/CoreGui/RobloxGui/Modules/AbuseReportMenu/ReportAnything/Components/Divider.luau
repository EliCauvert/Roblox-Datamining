local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local withStyle = UIBloxModule.Core.Style.withStyle

return function(p1)
	-- upvalues: withStyle (ref), reactModule (ref), cryoModule (ref)
	return withStyle(function(p2)
		-- upvalues: reactModule (copy), cryoModule (copy), p1 (ref)
		return reactModule.createElement("Frame", cryoModule.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p1, {
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.Divider.Color,
			BackgroundTransparency = p2.Theme.Divider.Transparency
		}))
	end)
end