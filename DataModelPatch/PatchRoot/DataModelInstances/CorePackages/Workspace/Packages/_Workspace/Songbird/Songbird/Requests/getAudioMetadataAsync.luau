local Songbird = script:FindFirstAncestor("Songbird")
local AssetService = game:GetService("AssetService")
local CryoModule = require(Songbird.Parent.Cryo)
local _ = require(Songbird.types)

return function(IdList)
	-- upvalues: AssetService (copy), CryoModule (copy)
	return CryoModule.List.map(AssetService:GetAudioMetadataAsync(IdList), function(Tbl)
		local Copy = table.clone(Tbl)
		Copy.AlbumArt = "rbxassetid://11204867732"
		
		return Copy
	end)
end