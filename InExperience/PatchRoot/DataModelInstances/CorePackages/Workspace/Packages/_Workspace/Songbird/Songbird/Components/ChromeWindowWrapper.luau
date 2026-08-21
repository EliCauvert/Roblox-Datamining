local songbird = script:FindFirstAncestor("Songbird")
local reactModule = require(songbird.Parent.React)
local chromeWindowModule = require(songbird.Components.ChromeWindow)
local useCurrentSongModule = require(songbird.Hooks.useCurrentSong)
local analyticActionsModule = require(songbird.Analytics.AnalyticActions)
local sendChromeWindowAnalyticsModule = require(songbird.Analytics.sendChromeWindowAnalytics)
local getFFlagSongbirdMusicIconThumbnailModule = require(songbird.Flags.getFFlagSongbirdMusicIconThumbnail)
local useSongAlbumArtModule = require(songbird.Hooks.useSongAlbumArt)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local reportAudioPopupContextModule = require(songbird.Components.ReportAudioPopupContext)

return function(p0) --[[ line: 28 | named "ChromeWindowWrapper" ]]
	-- upvalues: useCurrentSongModule (ref), reportAudioPopupContextModule (ref), useMemo (ref), getFFlagSongbirdMusicIconThumbnailModule (ref), useSongAlbumArtModule (ref), useEffect (ref), useCallback (ref), sendChromeWindowAnalyticsModule (ref), analyticActionsModule (ref), reactModule (ref), chromeWindowModule (ref)
	local var9 = useCurrentSongModule()
	local var10 = reportAudioPopupContextModule.use()
	local var11 = useMemo(function() --[[ line: 32 ]]
		-- upvalues: var9 (ref)
		return if var9 then tonumber(var9.metadata.AssetId) else nil
	end, { var9 })
	local meetsCriteria = getFFlagSongbirdMusicIconThumbnailModule() and (var9 and var9.meetsCriteria)
	local var13 = if meetsCriteria then useSongAlbumArtModule(if meetsCriteria then var11 else nil).value else nil
	useEffect(function() --[[ line: 40 ]]
		-- upvalues: var10 (ref), var11 (ref)
		var10.setAssetId(var11)
		
		return function() --[[ line: 43 ]]
			-- upvalues: var10 (copy)
			var10.setAssetId(nil)
		end
	end, { var11, var10.setAssetId })
	useEffect(function() --[[ line: 48 ]]
		-- upvalues: var10 (ref), var13 (ref)
		var10.setHasThumbnail(var13 ~= nil)
		
		return function() --[[ line: 51 ]]
			-- upvalues: var10 (copy)
			var10.setHasThumbnail(false)
		end
	end, { var13, var10.setHasThumbnail })
	
	return reactModule.createElement(chromeWindowModule, {
		song = if var9 then {
			title = var9.metadata.Title,
			artists = { var9.metadata.Artist },
			isLiked = var9.isFavorited,
			meetsCriteria = var9.meetsCriteria,
			thumbnailUrl = var13
		} else nil,
		isFocused = p0.isFocused,
		maxSize = p0.maxSize,
		onToggleLike = useCallback(function() --[[ line: 65 ]]
			-- upvalues: var9 (ref)
			if var9 then
				var9.toggleFavorite()
			end
		end, { var9 }),
		onReport = useCallback(function() --[[ line: 56 ]]
			-- upvalues: var10 (ref), sendChromeWindowAnalyticsModule (copy), var11 (ref), analyticActionsModule (copy), p0 (ref)
			var10.setVisibility(true)
			sendChromeWindowAnalyticsModule({
				assetId = var11,
				action = analyticActionsModule.OpenReport
			})
			
			if p0.onReport then
				p0.onReport()
			end
		end, { p0.onReport, var11, var10.setVisibility }),
		onClose = p0.onClose,
		onUnfocus = p0.onUnfocus
	})
end