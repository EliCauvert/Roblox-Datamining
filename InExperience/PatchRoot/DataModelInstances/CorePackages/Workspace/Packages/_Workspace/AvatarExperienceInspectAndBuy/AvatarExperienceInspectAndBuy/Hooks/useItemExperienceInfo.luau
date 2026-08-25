local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local tutilsModule = require(parent.tutils)

return function(p0)
	-- upvalues: useSelector (ref), tutilsModule (ref)
	return useSelector(function(p1)
		-- upvalues: p0 (ref)
		return if p0 then p1.creatingExperiences[tostring(p0)] else nil
	end, tutilsModule.deepEqual)
end