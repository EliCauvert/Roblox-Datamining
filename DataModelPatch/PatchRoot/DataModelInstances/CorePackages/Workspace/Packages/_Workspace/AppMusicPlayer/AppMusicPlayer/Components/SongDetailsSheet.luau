local AppMusicPlayer = script:FindFirstAncestor("AppMusicPlayer")
local CryoModule = require(AppMusicPlayer.Parent.Cryo)
local FoundationModule = require(AppMusicPlayer.Parent.Foundation)
local ReactModule = require(AppMusicPlayer.Parent.React)
local SongbirdModule = require(AppMusicPlayer.Parent.Songbird)
local AudioPlayer = SongbirdModule.AudioPlayer
local AudioPlayerActions = SongbirdModule.AudioPlayerActions
local CreateNextOrderFunction = require(AppMusicPlayer.Parent.ReactUtils).createNextOrder
local config = { disablePortal = false, hasBackdrop = true }

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), CreateNextOrderFunction (copy), ReactModule (copy), FoundationModule (copy), AudioPlayer (copy), AudioPlayerActions (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local NextOrder = CreateNextOrderFunction()
	local Audio = {
		title = JoinResult.title,
		artist = JoinResult.artist,
		assetId = tostring(JoinResult.assetId),
		thumbnail = JoinResult.albumArt,
		isLiked = JoinResult.isLiked
	}
	
	return if JoinResult.isOpen then ReactModule.createElement(FoundationModule.Dialog.Root, {
		disablePortal = JoinResult.disablePortal,
		hasBackdrop = JoinResult.hasBackdrop,
		onClose = JoinResult.onClose
	}, {
		Title = ReactModule.createElement(FoundationModule.Dialog.Title, { text = "" }),
		Content = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy col gap-xxlarge align-x-center" }, {
			MusicPlayer = ReactModule.createElement(AudioPlayer, { audio = Audio, LayoutOrder = NextOrder() }),
			MusicPlayerActions = ReactModule.createElement(AudioPlayerActions, {
				audio = Audio,
				onLike = JoinResult.onLike,
				onUnlike = JoinResult.onUnlike,
				onReport = JoinResult.onReport,
				LayoutOrder = NextOrder()
			})
		})
	}) else nil
end)