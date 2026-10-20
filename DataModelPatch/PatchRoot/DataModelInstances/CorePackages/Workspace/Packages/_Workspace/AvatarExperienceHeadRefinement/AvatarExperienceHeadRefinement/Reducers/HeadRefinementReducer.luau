local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local Parent = AvatarExperienceHeadRefinement.Parent
local CryoModule = require(Parent.Cryo)
local HeadShapeModule = require(AvatarExperienceHeadRefinement.Enums.HeadShape)

local function _()
	-- upvalues: HeadShapeModule (copy)
	return {
		availableHeadShapes = {},
		lastSelectedHeadShape = HeadShapeModule.Default
	}
end

return require(Parent.Rodux).createReducer({
	availableHeadShapes = {},
	lastSelectedHeadShape = HeadShapeModule.Default
}, {
	[require(AvatarExperienceHeadRefinement.Actions.SetAvailableHeadShapes).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { availableHeadShapes = p2.headShapes })
	end,
	[require(AvatarExperienceHeadRefinement.Actions.SetLastSelectedHeadShape).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { lastSelectedHeadShape = p2.headShape })
	end
})