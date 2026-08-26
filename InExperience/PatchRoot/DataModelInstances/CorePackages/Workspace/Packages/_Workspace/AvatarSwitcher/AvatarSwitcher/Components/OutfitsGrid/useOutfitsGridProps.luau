local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local signalsReactModule = require(avatarSwitcher.Parent.SignalsReact)
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)
local _ = require(avatarSwitcher.types)
local experienceAvatarSupportTypeModule = require(avatarSwitcher.Enums.ExperienceAvatarSupportType)
local avatarSwitcherShimmerTiles = game:DefineFastInt("AvatarSwitcherShimmerTiles", 12)

return function()
	-- upvalues: signalsReactModule (ref), getAvatarSwitcherStoreModule (ref), experienceAvatarSupportTypeModule (ref), avatarSwitcherShimmerTiles (ref)
	local var1 = signalsReactModule.useSignalState(getAvatarSwitcherStoreModule)
	local var2 = signalsReactModule.useSignalState(var1.getOutfits)
	local var3 = signalsReactModule.useSignalState(var1.getLastPageReached)
	local var4 = signalsReactModule.useSignalState(var1.getExperienceAvatarSupportType) == experienceAvatarSupportTypeModule.NoSupport
	
	if #var2 == 0 and not var3 then
		var2 = {}
		
		for _ = 1, avatarSwitcherShimmerTiles do
			table.insert(var2, {})
		end
	end
	return {
		outfits = var2,
		lastPageReached = var3,
		fetchNextOutfitsPage = var1.fetchNextOutfitsPage,
		disabled = var4
	}
end