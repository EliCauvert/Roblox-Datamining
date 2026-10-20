local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local SignalsReactModule = require(AvatarSwitcher.Parent.SignalsReact)
local GetAvatarSwitcherStoreModule = require(AvatarSwitcher.Stores.getAvatarSwitcherStore)
local _ = require(AvatarSwitcher.types)
local ExperienceAvatarSupportTypeModule = require(AvatarSwitcher.Enums.ExperienceAvatarSupportType)
local AvatarSwitcherShimmerTiles = game:DefineFastInt("AvatarSwitcherShimmerTiles", 12)

return function()
	-- upvalues: SignalsReactModule (copy), GetAvatarSwitcherStoreModule (copy), ExperienceAvatarSupportTypeModule (copy), AvatarSwitcherShimmerTiles (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetAvatarSwitcherStoreModule)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseSignalStateResult.getOutfits)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseSignalStateResult.getLastPageReached)
	local IsUseSignalStateResultMatch = SignalsReactModule.useSignalState(UseSignalStateResult.getExperienceAvatarSupportType) == ExperienceAvatarSupportTypeModule.NoSupport
	
	if #UseSignalStateResult1 == 0 and not UseSignalStateResult2 then
		UseSignalStateResult1 = {}
		
		for _ = 1, AvatarSwitcherShimmerTiles do
			table.insert(UseSignalStateResult1, {})
		end
	end
	return {
		outfits = UseSignalStateResult1,
		lastPageReached = UseSignalStateResult2,
		fetchNextOutfitsPage = UseSignalStateResult.fetchNextOutfitsPage,
		disabled = IsUseSignalStateResultMatch
	}
end