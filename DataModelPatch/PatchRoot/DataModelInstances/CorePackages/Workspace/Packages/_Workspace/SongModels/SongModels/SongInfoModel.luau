local Parent = script:FindFirstAncestor("SongModels").Parent
local ResultModule = require(Parent.Result)
local _ = require(Parent.DiscoveryTypes)
local SongInfoModelModule = {
	fromBaseJson = function(p1)
		-- upvalues: ResultModule (copy)
		if type(p1.assetId) ~= "number" and type(p1.assetId) ~= "string" then
			return ResultModule.error("SongInfoModel expects assetId to be a number or a string")
		end
		if type(p1.title) ~= "string" or p1.title == "" then
			return ResultModule.error("SongInfoModel expects title to be a non-empty string")
		end
		if type(p1.artist) ~= "string" or p1.artist == "" then
			return ResultModule.error("SongInfoModel expects artist to be a non-empty string")
		end
		local config = {
			assetId = tostring(p1.assetId),
			title = p1.title,
			artist = p1.artist
		}
		
		if type(p1.albumArtAssetId) == "number" or type(p1.albumArtAssetId) == "string" then
			config.albumArtAssetId = tostring(p1.albumArtAssetId)
		end
		if type(p1.duration) == "number" then
			config.duration = p1.duration
		end
		if type(p1.album) == "string" and p1.album ~= "" then
			config.album = p1.album
		end
		if type(p1.isPrivate) == "boolean" then
			config.isPrivate = p1.isPrivate
		end
		return ResultModule.success(config)
	end
}

function SongInfoModelModule.fromExploreApi(p1)
	-- upvalues: SongInfoModelModule (copy)
	return SongInfoModelModule.fromBaseJson(p1)
end

return SongInfoModelModule