local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local jest = require(parent.Dev.JestGlobals).jest
local signalsModule = require(parent.Signals)
local _ = require(avatarSwitcher.Enums.ExperienceAvatarSupportType)
local _ = require(avatarSwitcher.types)

return function()
	-- upvalues: signalsModule (ref), jest (ref)
	local var2, var3 = signalsModule.createSignal({})
	local var4, var5 = signalsModule.createSignal(false)
	local var6, var7 = signalsModule.createSignal(nil)
	local var8, var9 = signalsModule.createSignal(nil)
	local var10, var11 = signalsModule.createSignal(false)
	local var12, var13 = signalsModule.createSignal(false)
	local var14, var15 = signalsModule.createSignal(false)
	local var16, var17 = signalsModule.createSignal(nil)
	local var18, var19 = signalsModule.createSignal(nil)
	local var20, var21 = signalsModule.createSignal(nil)
	
	return {
		store = {
			getOutfits = var2,
			getLastPageReached = var4,
			getSelectedOutfitId = var6,
			getSelectedOutfitDetails = var8,
			getRespawnPromptShown = var10,
			getIsSwitching = var12,
			getIsEmpty = var14,
			getExperienceAvatarSupportType = var16,
			getExperienceAvatarType = var18,
			getPendingAvatarName = var20,
			toggleRespawnPrompt = jest.fn(),
			selectOutfit = jest.fn(),
			fetchNextOutfitsPage = jest.fn(),
			switchAvatar = jest.fn(),
			fetchExperienceAvatarSupportType = jest.fn(),
			clearPendingAvatarName = jest.fn()
		},
		setOutfits = var3,
		setLastPageReached = var5,
		setSelectedOutfitId = var7,
		setSelectedOutfitDetails = var9,
		setRespawnPromptShown = var11,
		setIsSwitching = var13,
		setIsEmpty = var15,
		setExperienceAvatarSupportType = var17,
		setExperienceAvatarType = var19,
		setPendingAvatarName = var21
	}
end