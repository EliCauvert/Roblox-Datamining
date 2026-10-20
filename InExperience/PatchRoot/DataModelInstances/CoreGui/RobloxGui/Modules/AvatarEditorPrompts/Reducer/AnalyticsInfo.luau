local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent

return (require(CorePackages.Packages.Rodux).createReducer({ addedAssets = nil, removedAssets = nil }, {
	[require(Parent.Actions.AddAnalyticsInfo).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, p2.info)
	end,
	[require(Parent.Actions.CloseOpenPrompt).name] = function(_, _)
		return {}
	end
}))