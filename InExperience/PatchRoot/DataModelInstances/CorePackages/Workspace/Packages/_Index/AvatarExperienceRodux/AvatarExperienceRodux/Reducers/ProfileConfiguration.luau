local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local _ = require(avatarExperienceRodux.Types.RoduxTypes)
local fFlagAXBackgroundsPersistence = require(parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return roduxModule.createReducer({}, {
	[require(avatarExperienceRodux.Actions.ApplyProfileConfiguration).name] = function(p0, p1) --[[ line: 37 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, p1.profileConfiguration)
	end,
	[avatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p2, p3) --[[ line: 43 ]]
		-- upvalues: fFlagAXBackgroundsPersistence (ref)
		return if fFlagAXBackgroundsPersistence and p3.equipped then { BackgroundAssetId = p3.equipped.BackgroundAssetId } else p2
	end
})