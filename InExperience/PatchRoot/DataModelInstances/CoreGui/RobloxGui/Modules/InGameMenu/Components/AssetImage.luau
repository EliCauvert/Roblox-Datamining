local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local assetsModule = require(parent.Resources.Assets)

local function _(value)
	-- upvalues: roact (ref), assetsModule (ref), cryo (ref)
	return roact.forwardRef(function(p0, p1)
		-- upvalues: assetsModule (copy), cryo (copy), roact (copy), value (ref)
		local imageKey = assetsModule.Images[p0.imageKey]
		
		return roact.createElement(value, cryo.Dictionary.join(cryo.Dictionary.join(p0, { imageKey = cryo.None }, if typeof(imageKey) == "string" then { Image = imageKey } else imageKey, { BackgroundTransparency = 1 }), { [roact.Ref] = p1 }))
	end)
end

return {
	Label = roact.forwardRef(function(p2, p3)
		-- upvalues: assetsModule (ref), cryo (ref), roact (ref), imageSetLabel (ref)
		local imageKey = assetsModule.Images[p2.imageKey]
		
		return roact.createElement(imageSetLabel, cryo.Dictionary.join(cryo.Dictionary.join(p2, { imageKey = cryo.None }, if typeof(imageKey) == "string" then { Image = imageKey } else imageKey, { BackgroundTransparency = 1 }), { [roact.Ref] = p3 }))
	end),
	Button = roact.forwardRef(function(p4, p5)
		-- upvalues: assetsModule (ref), cryo (ref), roact (ref), imageSetButton (ref)
		local imageKey = assetsModule.Images[p4.imageKey]
		
		return roact.createElement(imageSetButton, cryo.Dictionary.join(cryo.Dictionary.join(p4, { imageKey = cryo.None }, if typeof(imageKey) == "string" then { Image = imageKey } else imageKey, { BackgroundTransparency = 1 }), { [roact.Ref] = p5 }))
	end)
}