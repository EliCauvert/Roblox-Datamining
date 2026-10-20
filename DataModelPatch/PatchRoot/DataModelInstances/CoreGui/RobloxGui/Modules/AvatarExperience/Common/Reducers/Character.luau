local Parent = script.Parent
local AvatarExperienceRoduxModule = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceRodux)
local CurrentCharacterFunction = AvatarExperienceRoduxModule.Reducers.CurrentCharacter
local PlayingSwimAnimationFunction = AvatarExperienceRoduxModule.Reducers.PlayingSwimAnimation
local ShouldDelaySaveManagerFunction = AvatarExperienceRoduxModule.Reducers.ShouldDelaySaveManager
local CharacterVersionModule = require(Parent.CharacterVersion)
local CharacterModelVersionModule = require(Parent.CharacterModelVersion)
local TryOnCharacterModelVersionModule = require(Parent.TryOnCharacterModelVersion)
local SavedCharacterModelVersionModule = require(Parent.SavedCharacterModelVersion)
local ApplyingLayeredClothingModule = require(Parent.ApplyingLayeredClothing)
local WaitingOnLayeredClothingUpdatesModule = require(Parent.WaitingOnLayeredClothingUpdates)

return function(p1, p2)
	-- upvalues: CharacterVersionModule (copy), CurrentCharacterFunction (copy), PlayingSwimAnimationFunction (copy), ApplyingLayeredClothingModule (copy), CharacterModelVersionModule (copy), TryOnCharacterModelVersionModule (copy), SavedCharacterModelVersionModule (copy), ShouldDelaySaveManagerFunction (copy), WaitingOnLayeredClothingUpdatesModule (copy)
	local P0 = p1 or {}
	
	return {
		CharacterVersion = CharacterVersionModule(P0.CharacterVersion, p2),
		CurrentCharacter = CurrentCharacterFunction(P0.CurrentCharacter, p2),
		PlayingSwimAnimation = PlayingSwimAnimationFunction(P0.PlayingSwimAnimation, p2),
		ApplyingLayeredClothing = ApplyingLayeredClothingModule(P0.ApplyingLayeredClothing, p2),
		CharacterModelVersion = CharacterModelVersionModule(P0.CharacterModelVersion, p2),
		TryOnCharacterModelVersion = TryOnCharacterModelVersionModule(P0.TryOnCharacterModelVersion, p2),
		SavedCharacterModelVersion = SavedCharacterModelVersionModule(P0.SavedCharacterModelVersion, p2),
		ShouldDelaySaveManager = ShouldDelaySaveManagerFunction(P0.ShouldDelaySaveManager, p2),
		WaitingOnLayeredClothingUpdates = WaitingOnLayeredClothingUpdatesModule(P0.WaitingOnLayeredClothingUpdates, p2)
	}
end