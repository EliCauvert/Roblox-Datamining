local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ inputType = nil, screenSize = Vector2.new(0, 0) }, {
	[require(script.Parent.Parent.Actions.SetScreenSize).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { screenSize = p1.screenSize })
	end
})