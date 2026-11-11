local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.withStyle

return function(p1)
	-- upvalues: WithStyleFunction (copy), ReactModule (copy), CryoModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: ReactModule (upval), CryoModule (upval), p1 (copy)
		return ReactModule.createElement("Frame", CryoModule.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p1, {
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.Divider.Color,
			BackgroundTransparency = p2.Theme.Divider.Transparency
		}))
	end)
end