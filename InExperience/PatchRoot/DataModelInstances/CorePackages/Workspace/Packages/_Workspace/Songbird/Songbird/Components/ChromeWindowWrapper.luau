local songbird = script:FindFirstAncestor("Songbird")
local reactModule = require(songbird.Parent.React)
local chromeWindowModule = require(songbird.Components.ChromeWindow)
local useCurrentSongModule = require(songbird.Hooks.useCurrentSong)
local getFFlagSongbirdMusicIconThumbnailModule = require(songbird.Flags.getFFlagSongbirdMusicIconThumbnail)
local useSongAlbumArtModule = require(songbird.Hooks.useSongAlbumArt)
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo

return function(p0)
	-- upvalues: useCurrentSongModule (ref), useMemo (ref), getFFlagSongbirdMusicIconThumbnailModule (ref), useSongAlbumArtModule (ref), useCallback (ref), reactModule (ref), chromeWindowModule (ref)
	local var6 = useCurrentSongModule()
	local meetsCriteria = getFFlagSongbirdMusicIconThumbnailModule() and (var6 and var6.meetsCriteria)
	
	return reactModule.createElement(chromeWindowModule, {
		song = if var6 then {
			title = var6.metadata.Title,
			artists = { var6.metadata.Artist },
			isLiked = var6.isFavorited,
			meetsCriteria = var6.meetsCriteria,
			thumbnailUrl = if meetsCriteria then useSongAlbumArtModule(if meetsCriteria then useMemo(function()
				-- upvalues: var6 (ref)
				return if var6 then tonumber(var6.metadata.AssetId) else nil
			end, { var6 }) else nil).value else nil
		} else nil,
		isFocused = p0.isFocused,
		maxSize = p0.maxSize,
		onToggleLike = useCallback(function()
			-- upvalues: var6 (ref)
			if var6 then
				var6.toggleFavorite()
			end
		end, { var6 }),
		onClose = p0.onClose,
		onUnfocus = p0.onUnfocus
	})
end