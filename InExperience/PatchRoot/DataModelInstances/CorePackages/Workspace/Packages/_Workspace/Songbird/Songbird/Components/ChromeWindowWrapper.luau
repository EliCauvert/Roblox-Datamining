local songbird = script:FindFirstAncestor("Songbird")
local reactModule = require(songbird.Parent.React)
local chromeWindowModule = require(songbird.Components.ChromeWindow)
local useCurrentSongModule = require(songbird.Hooks.useCurrentSong)
local getFFlagSongbirdMusicIconThumbnailModule = require(songbird.Flags.getFFlagSongbirdMusicIconThumbnail)
local useSongAlbumArtModule = require(songbird.Hooks.useSongAlbumArt)
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo

return function(p1)
	-- upvalues: useCurrentSongModule (ref), useMemo (ref), getFFlagSongbirdMusicIconThumbnailModule (ref), useSongAlbumArtModule (ref), useCallback (ref), reactModule (ref), chromeWindowModule (ref)
	local var1 = useCurrentSongModule()
	local meetsCriteria = getFFlagSongbirdMusicIconThumbnailModule() and (var1 and var1.meetsCriteria)
	
	return reactModule.createElement(chromeWindowModule, {
		song = if var1 then {
			title = var1.metadata.Title,
			artists = { var1.metadata.Artist },
			isLiked = var1.isFavorited,
			meetsCriteria = var1.meetsCriteria,
			thumbnailUrl = if meetsCriteria then useSongAlbumArtModule(if meetsCriteria then useMemo(function()
				-- upvalues: var1 (ref)
				return if var1 then tonumber(var1.metadata.AssetId) else nil
			end, { var1 }) else nil).value else nil
		} else nil,
		isFocused = p1.isFocused,
		maxSize = p1.maxSize,
		onToggleLike = useCallback(function()
			-- upvalues: var1 (ref)
			if var1 then
				var1.toggleFavorite()
			end
		end, { var1 }),
		onClose = p1.onClose,
		onUnfocus = p1.onUnfocus
	})
end