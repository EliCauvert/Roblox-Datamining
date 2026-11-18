local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Parent.DataHydration.AvatarInventory)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local CreateAvatarStateFromOutfitDetailModule = require(AvatarWorkshop.Utils.createAvatarStateFromOutfitDetail)
local t = {}

return function(Key, OutfitDetail)
	-- upvalues: t (copy), CreateAvatarStateFromOutfitDetailModule (copy)
	local Entry = t[Key]
	
	if Entry and Entry.outfitDetail == OutfitDetail then
		return Entry.avatarState
	else
		local Frozen = table.freeze(CreateAvatarStateFromOutfitDetailModule(OutfitDetail))
		t[Key] = { outfitDetail = OutfitDetail, avatarState = Frozen }
		
		return Frozen
	end
end