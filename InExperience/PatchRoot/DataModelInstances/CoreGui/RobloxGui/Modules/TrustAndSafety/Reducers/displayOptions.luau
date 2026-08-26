local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

return roduxModule.createReducer({
	inputType = nil,
	visible = true,
	screenSize = Vector2.new(0, 0)
}, {
	[require(parent.Actions.SetScreenSize).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { screenSize = p2.screenSize })
	end,
	[require(parent.Actions.Hide).name] = function(p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { visible = false })
	end,
	[require(parent.Actions.Show).name] = function(p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { visible = true })
	end
})