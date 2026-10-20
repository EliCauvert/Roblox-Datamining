local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local TutilsModule = require(Parent.tutils)

return function(p1)
	-- upvalues: UseSelectorFunction (copy), TutilsModule (copy)
	return (UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		return if p1 then p2.creatingExperiences[tostring(p1)] else nil
	end, TutilsModule.deepEqual))
end