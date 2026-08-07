local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

return roduxModule.createReducer({ addedAssets = nil, removedAssets = nil }, {
	[require(parent.Actions.AddAnalyticsInfo).name] = function(p0, p1) --[[ line: 18 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, p1.info)
	end,
	[require(parent.Actions.CloseOpenPrompt).name] = function(_, _) --[[ line: 22 ]]
		return {}
	end
})