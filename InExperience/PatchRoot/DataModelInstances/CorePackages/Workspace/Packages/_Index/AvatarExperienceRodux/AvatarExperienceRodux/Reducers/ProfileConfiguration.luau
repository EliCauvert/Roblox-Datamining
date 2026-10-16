local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(AvatarExperienceRodux.Types.RoduxTypes)
local FFlagAXBackgroundsPersistence = require(Parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return require(Parent.Rodux).createReducer({}, {
	[require(AvatarExperienceRodux.Actions.ApplyProfileConfiguration).name] = function(p1, p2) --[[ Line: 37 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, p2.profileConfiguration)
	end,
	[require(Parent.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2) --[[ Line: 43 ]]
		-- upvalues: FFlagAXBackgroundsPersistence (copy)
		return if FFlagAXBackgroundsPersistence and p2.equipped then { BackgroundAssetId = p2.equipped.BackgroundAssetId } else p1
	end
})