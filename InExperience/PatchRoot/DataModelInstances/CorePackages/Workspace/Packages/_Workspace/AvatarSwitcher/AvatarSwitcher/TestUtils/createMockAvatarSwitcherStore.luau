local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local jest = require(parent.Dev.JestGlobals).jest
local signalsModule = require(parent.Signals)
local _ = require(avatarSwitcher.Enums.ExperienceAvatarSupportType)
local _ = require(avatarSwitcher.types)

return function()
	-- upvalues: signalsModule (ref), jest (ref)
	local var1, var2 = signalsModule.createSignal({})
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(nil)
	local var7, var8 = signalsModule.createSignal(nil)
	local var9, var10 = signalsModule.createSignal(false)
	local var11, var12 = signalsModule.createSignal(false)
	local var13, var14 = signalsModule.createSignal(false)
	local var15, var16 = signalsModule.createSignal(nil)
	local var17, var18 = signalsModule.createSignal(nil)
	local var19, var20 = signalsModule.createSignal(nil)
	
	return {
		store = {
			getOutfits = var1,
			getLastPageReached = var3,
			getSelectedOutfitId = var5,
			getSelectedOutfitDetails = var7,
			getRespawnPromptShown = var9,
			getIsSwitching = var11,
			getIsEmpty = var13,
			getExperienceAvatarSupportType = var15,
			getExperienceAvatarType = var17,
			getPendingAvatarName = var19,
			toggleRespawnPrompt = jest.fn(),
			selectOutfit = jest.fn(),
			fetchNextOutfitsPage = jest.fn(),
			switchAvatar = jest.fn(),
			fetchExperienceAvatarSupportType = jest.fn(),
			clearPendingAvatarName = jest.fn()
		},
		setOutfits = var2,
		setLastPageReached = var4,
		setSelectedOutfitId = var6,
		setSelectedOutfitDetails = var8,
		setRespawnPromptShown = var10,
		setIsSwitching = var12,
		setIsEmpty = var14,
		setExperienceAvatarSupportType = var16,
		setExperienceAvatarType = var18,
		setPendingAvatarName = var20
	}
end