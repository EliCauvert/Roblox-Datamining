local SongDetails = script:FindFirstAncestor("SongDetails")
local Parent = SongDetails.Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseAbbreviatedNumberLocalizationFunction = LocalizationModule.Hooks.useAbbreviatedNumberLocalization
local _ = require(Parent.DiscoveryTypes)
local FormattingModule = require(SongDetails.Helpers.formatting)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseAbbreviatedNumberLocalizationFunction (copy), ReactModule (copy), FormattingModule (copy)
	local ArtistName = p1 and p1.artistName or ""
	local UseLocalizationResult = UseLocalizationFunction({
		dateUploadedLabel = "Feature.SongDetails.Label.DateUploaded",
		experiencesFeaturingLabel = "Feature.SongDetails.Label.ExperiencesFeaturing",
		lengthLabel = "Feature.SongDetails.Label.Length",
		monthlyListenersLabel = "Feature.SongDetails.Label.MonthlyListeners",
		thousandPlusLabel = "Feature.SongDetails.Label.ThousandPlus",
		vendorLabel = "Feature.SongDetails.Label.Vendor",
		genreLabel = "Feature.SongDetails.Label.Genre",
		songsAvailableByArtistLabel = {
			"Feature.SongDetails.Label.SongsAvailableBy",
			artistName = ArtistName
		}
	})
	local UseAbbreviatedNumberLocalizationResult = UseAbbreviatedNumberLocalizationFunction(p1 and p1.songMetrics and p1.songMetrics.monthlyListeners or nil)
	
	return {
		rows = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), UseLocalizationResult (copy), FormattingModule (upval), UseAbbreviatedNumberLocalizationResult (copy), ArtistName (copy)
			if not p1 then
				return {}
			end
			local List = {}
			
			if p1.genre and p1.genre ~= "" then
				table.insert(List, {
					infoName = UseLocalizationResult.genreLabel,
					infoData = p1.genre
				})
			end
			if p1.durationSeconds and p1.durationSeconds > 0 then
				table.insert(List, {
					infoName = UseLocalizationResult.lengthLabel,
					infoData = FormattingModule.formatDuration(p1.durationSeconds)
				})
			end
			if p1.uploadedTime and p1.uploadedTime ~= "" then
				table.insert(List, {
					infoName = UseLocalizationResult.dateUploadedLabel,
					infoData = FormattingModule.formatDate(p1.uploadedTime)
				})
			end
			if p1.songMetrics then
				if p1.songMetrics.monthlyListeners and p1.songMetrics.monthlyListeners > 0 and UseAbbreviatedNumberLocalizationResult then
					table.insert(List, {
						infoName = UseLocalizationResult.monthlyListenersLabel,
						infoData = UseAbbreviatedNumberLocalizationResult
					})
				end
				if p1.songMetrics.experiencesPlayed and p1.songMetrics.experiencesPlayed > 0 then
					table.insert(List, {
						infoName = UseLocalizationResult.experiencesFeaturingLabel,
						infoData = tostring(p1.songMetrics.experiencesPlayed)
					})
				end
				if p1.songMetrics.artistSongsCount and p1.songMetrics.artistSongsCount > 0 and ArtistName and ArtistName ~= "" then
					table.insert(List, {
						infoName = UseLocalizationResult.songsAvailableByArtistLabel,
						infoData = if p1.songMetrics.artistSongsCount < 1000 then tostring(p1.songMetrics.artistSongsCount) else UseLocalizationResult.thousandPlusLabel
					})
				end
			end
			if p1.creatorName and p1.creatorName ~= "" then
				table.insert(List, {
					infoName = UseLocalizationResult.vendorLabel,
					infoData = p1.creatorName
				})
			end
			return List
		end, {
			ArtistName, UseLocalizationResult.dateUploadedLabel,
			UseLocalizationResult.experiencesFeaturingLabel,
			UseLocalizationResult.genreLabel, UseLocalizationResult.lengthLabel,
			UseLocalizationResult.monthlyListenersLabel,
			UseLocalizationResult.songsAvailableByArtistLabel,
			UseLocalizationResult.thousandPlusLabel, UseLocalizationResult.vendorLabel,
			UseAbbreviatedNumberLocalizationResult, p1
		})
	}
end