local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local signalsReactModule = require(avatarSwitcher.Parent.SignalsReact)
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)
local _ = require(avatarSwitcher.types)
local experienceAvatarSupportTypeModule = require(avatarSwitcher.Enums.ExperienceAvatarSupportType)
local avatarSwitcherShimmerTiles = game:DefineFastInt("AvatarSwitcherShimmerTiles", 12)

return function()
	-- upvalues: signalsReactModule (ref), getAvatarSwitcherStoreModule (ref), experienceAvatarSupportTypeModule (ref), avatarSwitcherShimmerTiles (ref)
	local var5 = signalsReactModule.useSignalState(getAvatarSwitcherStoreModule)
	local var6 = signalsReactModule.useSignalState(var5.getOutfits)
	local var7 = signalsReactModule.useSignalState(var5.getLastPageReached)
	local var8 = signalsReactModule.useSignalState(var5.getExperienceAvatarSupportType) == experienceAvatarSupportTypeModule.NoSupport
	
	if #var6 == 0 and not var7 then
		var6 = {}
		
		for _ = 1, avatarSwitcherShimmerTiles do
			table.insert(var6, {})
		end
	end
	return {
		outfits = var6,
		lastPageReached = var7,
		fetchNextOutfitsPage = var5.fetchNextOutfitsPage,
		disabled = var8
	}
end