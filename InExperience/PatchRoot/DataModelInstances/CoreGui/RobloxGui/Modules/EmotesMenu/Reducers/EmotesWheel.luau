local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local actions = script.Parent.Parent.Actions
local t = { focusedSegmentIndex = 0 }

return roduxModule.createReducer(t, {
	[require(actions.FocusSegment).name] = function(p0, p1) --[[ line: 18 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { focusedSegmentIndex = p1.segmentIndex })
	end,
	[require(actions.HideMenu).name] = function(p2, _) --[[ line: 25 ]]
		-- upvalues: cryoModule (ref), t (ref)
		return cryoModule.Dictionary.join(p2, t)
	end
})