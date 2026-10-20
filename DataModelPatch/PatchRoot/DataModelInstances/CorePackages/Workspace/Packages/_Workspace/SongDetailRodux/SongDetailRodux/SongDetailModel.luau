local Parent = script:FindFirstAncestor("SongDetailRodux").Parent
local _ = require(Parent.DiscoveryTypes)
local ResultModule = require(Parent.Result)

return {
	fromJsonData = function(p1)
		-- upvalues: ResultModule (copy)
		if type(p1.assetId) ~= "number" and type(p1.assetId) ~= "string" then
			return ResultModule.error("SongDetailModel.fromJsonData expects assetId to be a number or a string")
		end
		if type(p1.name) ~= "string" or p1.name == "" then
			return ResultModule.error("SongDetailModel.fromJsonData expects name to be a non-empty string")
		end
		if type(p1.artistName) ~= "string" or p1.artistName == "" then
			return ResultModule.error("SongDetailModel.fromJsonData expects artistName to be a non-empty string")
		end
		if type(p1.creatorName) ~= "string" or p1.creatorName == "" then
			return ResultModule.error("SongDetailModel.fromJsonData expects creatorName to be a non-empty string")
		end
		if type(p1.creatorId) ~= "number" and type(p1.creatorId) ~= "string" then
			return ResultModule.error("SongDetailModel.fromJsonData expects creatorId to be a number or a string")
		end
		local config = {
			assetId = tostring(p1.assetId),
			artistName = p1.artistName,
			creatorId = tostring(p1.creatorId),
			creatorName = p1.creatorName,
			name = p1.name
		}
		
		if typeof(p1.description) == "string" and p1.description ~= "" then
			config.description = p1.description
		end
		if type(p1.genre) == "string" and p1.genre ~= "" then
			config.genre = p1.genre
		end
		if type(p1.durationSeconds) == "number" then
			config.durationSeconds = p1.durationSeconds
		end
		if type(p1.uploadedTime) == "string" and p1.uploadedTime ~= "" then
			config.uploadedTime = p1.uploadedTime
		end
		if type(p1.songMetrics) == "table" then
			config.songMetrics = {
				artistSongsCount = if type(p1.songMetrics.artistSongsCount) == "number" then p1.songMetrics.artistSongsCount else nil,
				experiencesPlayed = if type(p1.songMetrics.experiencesPlayed) == "number" then p1.songMetrics.experiencesPlayed else nil,
				monthlyListeners = if type(p1.songMetrics.monthlyListeners) == "number" then p1.songMetrics.monthlyListeners else nil
			}
		end
		return ResultModule.success(config)
	end
}