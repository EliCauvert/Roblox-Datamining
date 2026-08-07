local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local withStyle = UIBloxModule.Core.Style.withStyle

return function(p0) --[[ line: 17 | named "Divider" ]]
	-- upvalues: withStyle (ref), reactModule (ref), cryoModule (ref)
	return withStyle(function(p1) --[[ line: 18 ]]
		-- upvalues: reactModule (copy), cryoModule (copy), p0 (ref)
		return reactModule.createElement("Frame", cryoModule.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p0, {
			BorderSizePixel = 0,
			BackgroundColor3 = p1.Theme.Divider.Color,
			BackgroundTransparency = p1.Theme.Divider.Transparency
		}))
	end)
end