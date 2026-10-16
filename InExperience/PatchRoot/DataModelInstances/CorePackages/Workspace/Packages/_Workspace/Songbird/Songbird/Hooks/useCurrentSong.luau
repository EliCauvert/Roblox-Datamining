local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local UseAudioMetadataModule = require(Songbird.Hooks.useAudioMetadata)
local GetAssetIdForAudioSourceModule = require(Songbird.Common.getAssetIdForAudioSource)
local _ = require(Songbird.types)
local LoggerModule = require(Songbird.logger)
local AnalyticActionsModule = require(Songbird.Analytics.AnalyticActions)
local SendChromeWindowAnalyticsModule = require(Songbird.Analytics.sendChromeWindowAnalytics)
local UseMemoFunction = require(Songbird.Parent.React).useMemo
local UseAudibleSoundsFunction = require(Songbird.Parent.ReactSceneUnderstanding).useAudibleSounds
local UseAssetFavoritingFunction = require(Songbird.Parent.AssetFavorites).useAssetFavoriting

return function() --[[ Line: 21 | Named "useCurrentSong" ]]
	-- upvalues: UseAudibleSoundsFunction (copy), UseMemoFunction (copy), CryoModule (copy), GetAssetIdForAudioSourceModule (copy), UseAudioMetadataModule (copy), UseAssetFavoritingFunction (copy), LoggerModule (copy), SendChromeWindowAnalyticsModule (copy), AnalyticActionsModule (copy)
	local UseAudibleSoundsResult = UseAudibleSoundsFunction()
	local UseMemoResult = UseMemoFunction(function() --[[ Line: 30 ]]
		-- upvalues: CryoModule (upval), UseAudibleSoundsResult (copy), GetAssetIdForAudioSourceModule (upval)
		return CryoModule.List.filter(UseAudibleSoundsResult, function(p1): boolean --[[ Line: 31 ]]
			-- upvalues: GetAssetIdForAudioSourceModule (upval)
			return GetAssetIdForAudioSourceModule(p1) ~= nil
		end)
	end, { UseAudibleSoundsResult })
	local UseMemoResult1 = UseMemoFunction(function() --[[ Line: 36 ]]
		-- upvalues: CryoModule (upval), UseMemoResult (copy), GetAssetIdForAudioSourceModule (upval)
		return CryoModule.List.map(UseMemoResult, function(p1) --[[ Line: 37 ]]
			-- upvalues: GetAssetIdForAudioSourceModule (upval)
			return GetAssetIdForAudioSourceModule(p1)
		end)
	end, { UseMemoResult })
	local UseAudioMetadataModuleResult = UseAudioMetadataModule(UseMemoResult1)
	local UseAssetFavoritingResult = UseAssetFavoritingFunction(UseMemoResult1)
	
	return (UseMemoFunction(function() --[[ Line: 47 ]]
		-- upvalues: LoggerModule (upval), UseMemoResult (copy), GetAssetIdForAudioSourceModule (upval), UseAudioMetadataModuleResult (copy), UseAssetFavoritingResult (copy), SendChromeWindowAnalyticsModule (upval), AnalyticActionsModule (upval)
		LoggerModule:info(`determining currently playing song from {#UseMemoResult} audio sources...`)
		local AssetIdForAudioSourceModule = nil
		local ByAssetId = nil
		local MeetsCriteria = nil
		
		for _, Sound in UseMemoResult do
			AssetIdForAudioSourceModule = GetAssetIdForAudioSourceModule(Sound)
			
			if AssetIdForAudioSourceModule then
				ByAssetId = UseAudioMetadataModuleResult.getByAssetId(AssetIdForAudioSourceModule)
				MeetsCriteria = true
				LoggerModule:info(`processing audio source: {Sound} (AssetId: {AssetIdForAudioSourceModule}, Path: {Sound:GetFullName()})`)
				
				if not ByAssetId then
					LoggerModule:warning("no metadata found. skipping...")
				elseif not ByAssetId.AudioType then
					LoggerModule:debug(`{ByAssetId.Title} has no AudioSubType classification. skipping...`)
				elseif ByAssetId.AudioType == Enum.AudioSubType.Music then
					LoggerModule:debug(`{ByAssetId.Title} is classified as music. checking if it meets criteria...`)
					
					if not ByAssetId.RecordingCode or ByAssetId.RecordingCode == "" then
						LoggerModule:debug(`{ByAssetId.Title} does not meet criteria (no recording code found)`)
						MeetsCriteria = false
					end
					if MeetsCriteria then
						LoggerModule:info(`{ByAssetId.Title} meets criteria`)
					end
					return {
						sound = Sound,
						metadata = ByAssetId,
						meetsCriteria = MeetsCriteria,
						isFavorited = UseAssetFavoritingResult.getByAssetId(AssetIdForAudioSourceModule),
						toggleFavorite = function() --[[ Line: 93 ]]
							-- upvalues: UseAssetFavoritingResult (upval), AssetIdForAudioSourceModule (copy), SendChromeWindowAnalyticsModule (upval), AnalyticActionsModule (upval), LoggerModule (upval)
							return UseAssetFavoritingResult.toggleFavorite(AssetIdForAudioSourceModule):andThen(function(Result) --[[ Line: 96 ]]
								-- upvalues: SendChromeWindowAnalyticsModule (upval), AssetIdForAudioSourceModule (upval), AnalyticActionsModule (upval)
								if Result then
									SendChromeWindowAnalyticsModule({
										assetId = AssetIdForAudioSourceModule,
										action = AnalyticActionsModule.Like
									})
									
									return
								else
									SendChromeWindowAnalyticsModule({
										assetId = AssetIdForAudioSourceModule,
										action = AnalyticActionsModule.Unlike
									})
								end
							end):catch(function(Err) --[[ Line: 103 ]]
								-- upvalues: LoggerModule (upval)
								LoggerModule:warning(Err)
							end)
						end
					}
				else
					LoggerModule:debug(`{ByAssetId.Title} is not classified as music. instead classified as: {ByAssetId.AudioType.Name}. skipping...`)
					continue
				end
			end
		end
		return nil
	end, {
		UseAudioMetadataModuleResult.getByAssetId,
		UseMemoResult,
		UseAssetFavoritingResult.getByAssetId,
		UseAssetFavoritingResult.toggleFavorite
	}))
end