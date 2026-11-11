local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Cryo = InGameMenuDependenciesModule.Cryo
local UIBlox = InGameMenuDependenciesModule.UIBlox
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local AssetsModule = require(script.Parent.Parent.Resources.Assets)

local function _(p1)
	-- upvalues: Roact (copy), AssetsModule (copy), Cryo (copy)
	return Roact.forwardRef(function(p2, p3)
		-- upvalues: AssetsModule (upval), Cryo (upval), Roact (upval), p1 (copy)
		local Image = AssetsModule.Images[p2.imageKey]
		
		return Roact.createElement(p1, Cryo.Dictionary.join(Cryo.Dictionary.join(p2, { imageKey = Cryo.None }, if typeof(Image) == "string" then { Image = Image } else Image, { BackgroundTransparency = 1 }), { [Roact.Ref] = p3 }))
	end)
end

return {
	Label = Roact.forwardRef(function(p1, p2)
		-- upvalues: AssetsModule (copy), Cryo (copy), Roact (copy), ImageSetLabel (copy)
		local Image = AssetsModule.Images[p1.imageKey]
		
		return Roact.createElement(ImageSetLabel, Cryo.Dictionary.join(Cryo.Dictionary.join(p1, { imageKey = Cryo.None }, if typeof(Image) == "string" then { Image = Image } else Image, { BackgroundTransparency = 1 }), { [Roact.Ref] = p2 }))
	end),
	Button = Roact.forwardRef(function(p1, p2)
		-- upvalues: AssetsModule (copy), Cryo (copy), Roact (copy), ImageSetButton (copy)
		local Image = AssetsModule.Images[p1.imageKey]
		
		return Roact.createElement(ImageSetButton, Cryo.Dictionary.join(Cryo.Dictionary.join(p1, { imageKey = Cryo.None }, if typeof(Image) == "string" then { Image = Image } else Image, { BackgroundTransparency = 1 }), { [Roact.Ref] = p2 }))
	end)
}