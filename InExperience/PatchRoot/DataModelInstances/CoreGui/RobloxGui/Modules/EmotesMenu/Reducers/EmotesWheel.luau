local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoduxModule = require(CorePackages.Packages.Rodux)
local Actions = script.Parent.Parent.Actions
local FocusSegmentModule = require(Actions.FocusSegment)
local HideMenuModule = require(Actions.HideMenu)
local config = { focusedSegmentIndex = 0 }

return RoduxModule.createReducer(config, {
	[FocusSegmentModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { focusedSegmentIndex = p2.segmentIndex })
	end,
	[HideMenuModule.name] = function(p1, _)
		-- upvalues: CryoModule (copy), config (copy)
		return CryoModule.Dictionary.join(p1, config)
	end
})