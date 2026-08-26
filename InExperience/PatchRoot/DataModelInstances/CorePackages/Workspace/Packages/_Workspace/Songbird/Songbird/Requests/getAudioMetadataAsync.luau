local songbird = script:FindFirstAncestor("Songbird")
local assetService = game:GetService("AssetService")
local cryoModule = require(songbird.Parent.Cryo)
local _ = require(songbird.types)

return function(p1)
	-- upvalues: assetService (ref), cryoModule (ref)
	return cryoModule.List.map(assetService:GetAudioMetadataAsync(p1), function(p2)
		local cloned = table.clone(p2)
		cloned.AlbumArt = "rbxassetid://11204867732"
		
		return cloned
	end)
end