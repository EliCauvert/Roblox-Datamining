local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local _ = require(AvatarExperienceRodux.Types.RoduxTypes)
local ApplyProfileConfigurationModule = require(AvatarExperienceRodux.Actions.ApplyProfileConfiguration)
local CharacterHistoryStateChangeButtonActivated = AvatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated
local FFlagAXBackgroundsPersistence = AvatarExperienceFlagsModule.FFlagAXBackgroundsPersistence

return RoduxModule.createReducer({}, {
	[ApplyProfileConfigurationModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, p2.profileConfiguration)
	end,
	[CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: FFlagAXBackgroundsPersistence (copy)
		return if FFlagAXBackgroundsPersistence and p2.equipped then { BackgroundAssetId = p2.equipped.BackgroundAssetId } else p1
	end
})