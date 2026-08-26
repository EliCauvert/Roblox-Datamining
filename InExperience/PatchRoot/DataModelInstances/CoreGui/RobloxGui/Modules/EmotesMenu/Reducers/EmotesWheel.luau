local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local actions = script.Parent.Parent.Actions
local t = { focusedSegmentIndex = 0 }

return roduxModule.createReducer(t, {
	[require(actions.FocusSegment).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { focusedSegmentIndex = p2.segmentIndex })
	end,
	[require(actions.HideMenu).name] = function(p1, _)
		-- upvalues: cryoModule (ref), t (ref)
		return cryoModule.Dictionary.join(p1, t)
	end
})