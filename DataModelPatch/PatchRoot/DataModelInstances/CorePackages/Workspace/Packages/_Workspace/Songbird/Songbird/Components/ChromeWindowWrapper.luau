local Songbird = script:FindFirstAncestor("Songbird")
local ReactModule = require(Songbird.Parent.React)
local ChromeWindowModule = require(Songbird.Components.ChromeWindow)
local UseCurrentSongModule = require(Songbird.Hooks.useCurrentSong)
local AnalyticActionsModule = require(Songbird.Analytics.AnalyticActions)
local SendChromeWindowAnalyticsModule = require(Songbird.Analytics.sendChromeWindowAnalytics)
local GetFFlagSongbirdMusicIconThumbnailModule = require(Songbird.Flags.getFFlagSongbirdMusicIconThumbnail)
local UseSongAlbumArtModule = require(Songbird.Hooks.useSongAlbumArt)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local ReportAudioPopupContextModule = require(Songbird.Components.ReportAudioPopupContext)

return function(p1)
	-- upvalues: UseCurrentSongModule (copy), ReportAudioPopupContextModule (copy), UseMemoFunction (copy), GetFFlagSongbirdMusicIconThumbnailModule (copy), UseSongAlbumArtModule (copy), UseEffectFunction (copy), UseCallbackFunction (copy), SendChromeWindowAnalyticsModule (copy), AnalyticActionsModule (copy), ReactModule (copy), ChromeWindowModule (copy)
	local UseCurrentSongModuleResult = UseCurrentSongModule()
	local UseResult = ReportAudioPopupContextModule.use()
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: UseCurrentSongModuleResult (copy)
		return if UseCurrentSongModuleResult then tonumber(UseCurrentSongModuleResult.metadata.AssetId) else nil
	end, { UseCurrentSongModuleResult })
	local MeetsCriteria = GetFFlagSongbirdMusicIconThumbnailModule() and (UseCurrentSongModuleResult and UseCurrentSongModuleResult.meetsCriteria)
	local UseSongAlbumArtModuleResult = UseSongAlbumArtModule(if MeetsCriteria then UseMemoResult else nil)
	local Value = if MeetsCriteria then UseSongAlbumArtModuleResult.value else nil
	UseEffectFunction(function()
		-- upvalues: UseResult (copy), UseMemoResult (copy)
		UseResult.setAssetId(UseMemoResult)
		
		return function()
			-- upvalues: UseResult (upval)
			UseResult.setAssetId(nil)
		end
	end, { UseMemoResult, UseResult.setAssetId })
	UseEffectFunction(function()
		-- upvalues: UseResult (copy), Value (copy)
		UseResult.setHasThumbnail(Value ~= nil)
		
		return function()
			-- upvalues: UseResult (upval)
			UseResult.setHasThumbnail(false)
		end
	end, { Value, UseResult.setHasThumbnail })
	
	return ReactModule.createElement(ChromeWindowModule, {
		song = if UseCurrentSongModuleResult then {
			title = UseCurrentSongModuleResult.metadata.Title,
			artists = { UseCurrentSongModuleResult.metadata.Artist },
			isLiked = UseCurrentSongModuleResult.isFavorited,
			meetsCriteria = UseCurrentSongModuleResult.meetsCriteria,
			thumbnailUrl = Value
		} else nil,
		isFocused = p1.isFocused,
		maxSize = p1.maxSize,
		onToggleLike = UseCallbackFunction(function()
			-- upvalues: UseCurrentSongModuleResult (copy)
			if UseCurrentSongModuleResult then
				UseCurrentSongModuleResult.toggleFavorite()
			end
		end, { UseCurrentSongModuleResult }),
		onReport = UseCallbackFunction(function()
			-- upvalues: UseResult (copy), SendChromeWindowAnalyticsModule (upval), UseMemoResult (copy), AnalyticActionsModule (upval), p1 (copy)
			UseResult.setVisibility(true)
			SendChromeWindowAnalyticsModule({
				assetId = UseMemoResult,
				action = AnalyticActionsModule.OpenReport
			})
			
			if p1.onReport then
				p1.onReport()
			end
		end, { p1.onReport, UseMemoResult, UseResult.setVisibility }),
		onClose = p1.onClose,
		onUnfocus = p1.onUnfocus
	})
end