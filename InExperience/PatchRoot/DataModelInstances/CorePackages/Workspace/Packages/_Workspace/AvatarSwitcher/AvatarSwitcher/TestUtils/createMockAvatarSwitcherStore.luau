local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local Jest = require(Parent.Dev.JestGlobals).jest
local SignalsModule = require(Parent.Signals)
local _ = require(AvatarSwitcher.Enums.ExperienceAvatarSupportType)
local _ = require(AvatarSwitcher.types)

return function() --[[ Line: 54 | Named "createMockAvatarSwitcherStore" ]]
	-- upvalues: SignalsModule (copy), Jest (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal(false)
	local Signal6, Signal2_5 = SignalsModule.createSignal(false)
	local Signal7, Signal2_6 = SignalsModule.createSignal(false)
	local Signal8, Signal2_7 = SignalsModule.createSignal(nil)
	local Signal9, Signal2_8 = SignalsModule.createSignal(nil)
	local Signal10, Signal2_9 = SignalsModule.createSignal(nil)
	
	return {
		store = {
			getOutfits = Signal,
			getLastPageReached = Signal1,
			getSelectedOutfitId = Signal3,
			getSelectedOutfitDetails = Signal4,
			getRespawnPromptShown = Signal5,
			getIsSwitching = Signal6,
			getIsEmpty = Signal7,
			getExperienceAvatarSupportType = Signal8,
			getExperienceAvatarType = Signal9,
			getPendingAvatarName = Signal10,
			toggleRespawnPrompt = Jest.fn(),
			selectOutfit = Jest.fn(),
			fetchNextOutfitsPage = Jest.fn(),
			switchAvatar = Jest.fn(),
			fetchExperienceAvatarSupportType = Jest.fn(),
			clearPendingAvatarName = Jest.fn()
		},
		setOutfits = Signal2,
		setLastPageReached = Signal2_1,
		setSelectedOutfitId = Signal2_2,
		setSelectedOutfitDetails = Signal2_3,
		setRespawnPromptShown = Signal2_4,
		setIsSwitching = Signal2_5,
		setIsEmpty = Signal2_6,
		setExperienceAvatarSupportType = Signal2_7,
		setExperienceAvatarType = Signal2_8,
		setPendingAvatarName = Signal2_9
	}
end