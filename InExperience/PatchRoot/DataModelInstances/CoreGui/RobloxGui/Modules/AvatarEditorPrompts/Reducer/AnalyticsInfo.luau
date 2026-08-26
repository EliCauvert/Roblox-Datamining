local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

return roduxModule.createReducer({ addedAssets = nil, removedAssets = nil }, {
	[require(parent.Actions.AddAnalyticsInfo).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, p2.info)
	end,
	[require(parent.Actions.CloseOpenPrompt).name] = function(_, _)
		return {}
	end
})