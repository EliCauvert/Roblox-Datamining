local songbird = script:FindFirstAncestor("Songbird")
local assetService = game:GetService("AssetService")
local cryoModule = require(songbird.Parent.Cryo)
local _ = require(songbird.types)

return function(p0) --[[ line: 12 | named "getAudioMetadataAsync" ]]
	-- upvalues: assetService (ref), cryoModule (ref)
	return cryoModule.List.map(assetService:GetAudioMetadataAsync(p0), function(p1) --[[ line: 15 ]]
		local cloned = table.clone(p1)
		cloned.AlbumArt = "rbxassetid://11204867732"
		
		return cloned
	end)
end