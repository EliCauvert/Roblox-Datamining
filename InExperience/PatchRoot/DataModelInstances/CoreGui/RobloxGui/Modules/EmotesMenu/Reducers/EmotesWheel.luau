local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Actions = script.Parent.Parent.Actions
local config = { focusedSegmentIndex = 0 }

return require(CorePackages.Packages.Rodux).createReducer(config, {
	[require(Actions.FocusSegment).name] = function(p1, p2) --[[ Line: 18 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { focusedSegmentIndex = p2.segmentIndex })
	end,
	[require(Actions.HideMenu).name] = function(p1, _) --[[ Line: 25 ]]
		-- upvalues: CryoModule (copy), config (copy)
		return CryoModule.Dictionary.join(p1, config)
	end
})