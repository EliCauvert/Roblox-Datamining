local Songbird = script:FindFirstAncestor("Songbird")
local ReactModule = require(Songbird.Parent.React)
local ChromeWindowModule = require(Songbird.Components.ChromeWindow)
local UseCurrentSongModule = require(Songbird.Hooks.useCurrentSong)
local GetFFlagSongbirdMusicIconThumbnailModule = require(Songbird.Flags.getFFlagSongbirdMusicIconThumbnail)
local UseSongAlbumArtModule = require(Songbird.Hooks.useSongAlbumArt)
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo

return function(p1) --[[ Line: 21 | Named "ChromeWindowWrapper" ]]
	-- upvalues: UseCurrentSongModule (copy), UseMemoFunction (copy), GetFFlagSongbirdMusicIconThumbnailModule (copy), UseSongAlbumArtModule (copy), UseCallbackFunction (copy), ReactModule (copy), ChromeWindowModule (copy)
	local UseCurrentSongModuleResult = UseCurrentSongModule()
	local UseMemoResult = UseMemoFunction(function() --[[ Line: 24 ]]
		-- upvalues: UseCurrentSongModuleResult (copy)
		return if UseCurrentSongModuleResult then tonumber(UseCurrentSongModuleResult.metadata.AssetId) else nil
	end, { UseCurrentSongModuleResult })
	local MeetsCriteria = GetFFlagSongbirdMusicIconThumbnailModule() and (UseCurrentSongModuleResult and UseCurrentSongModuleResult.meetsCriteria)
	local UseSongAlbumArtModuleResult = UseSongAlbumArtModule(if MeetsCriteria then UseMemoResult else nil)
	local Value = if MeetsCriteria then UseSongAlbumArtModuleResult.value else nil
	
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
		onToggleLike = UseCallbackFunction(function() --[[ Line: 32 ]]
			-- upvalues: UseCurrentSongModuleResult (copy)
			if UseCurrentSongModuleResult then
				UseCurrentSongModuleResult.toggleFavorite()
			end
		end, { UseCurrentSongModuleResult }),
		onClose = p1.onClose,
		onUnfocus = p1.onUnfocus
	})
end