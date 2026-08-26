local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local tutilsModule = require(parent.tutils)

return function(p1)
	-- upvalues: useSelector (ref), tutilsModule (ref)
	return useSelector(function(p2)
		-- upvalues: p1 (ref)
		return if p1 then p2.creatingExperiences[tostring(p1)] else nil
	end, tutilsModule.deepEqual)
end