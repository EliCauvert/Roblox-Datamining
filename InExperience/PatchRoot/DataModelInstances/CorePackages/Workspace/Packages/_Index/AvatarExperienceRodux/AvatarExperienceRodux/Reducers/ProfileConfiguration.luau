local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local _ = require(avatarExperienceRodux.Types.RoduxTypes)
local fFlagAXBackgroundsPersistence = require(parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return roduxModule.createReducer({}, {
	[require(avatarExperienceRodux.Actions.ApplyProfileConfiguration).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, p2.profileConfiguration)
	end,
	[avatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: fFlagAXBackgroundsPersistence (ref)
		return if fFlagAXBackgroundsPersistence and p2.equipped then { BackgroundAssetId = p2.equipped.BackgroundAssetId } else p1
	end
})