local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

return roduxModule.createReducer({
	inputType = nil,
	visible = true,
	screenSize = Vector2.new(0, 0)
}, {
	[require(parent.Actions.SetScreenSize).name] = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { screenSize = p1.screenSize })
	end,
	[require(parent.Actions.Hide).name] = function(p2) --[[ line: 21 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { visible = false })
	end,
	[require(parent.Actions.Show).name] = function(p3) --[[ line: 26 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p3, { visible = true })
	end
})