local songbird = script:FindFirstAncestor("Songbird")
local constantsModule = require(songbird.constants)
local cryoModule = require(songbird.Parent.Cryo)
local foundationModule = require(songbird.Parent.Foundation)
local reactModule = require(songbird.Parent.React)
local reactUtilsModule = require(songbird.Parent.ReactUtils)
local localizationModule = require(songbird.Parent.Localization)
local chromeWindowFrameModule = require(songbird.Components.ChromeWindowFrame)
local marqueeScrollerModule = require(songbird.Components.MarqueeScroller)
local musicIconModule = require(songbird.Components.MusicIcon)
local likeButtonModule = require(songbird.Components.LikeButton)
local trackingAudioIconModule = require(songbird.Components.TrackingAudioIcon)
local useLocalization = localizationModule.Hooks.useLocalization
local createNextOrder = reactUtilsModule.createNextOrder
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local _ = {
	Loading = "Loading",
	Unverified = "Unverified",
	MeetsCriteria = "MeetsCriteria"
}
local t = { isLoading = false, maxSize = Vector2.new(300, 1e999) }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), createNextOrder (ref), useMemo (ref), useLocalization (ref), useCallback (ref), reactModule (ref), foundationModule (ref), likeButtonModule (ref), chromeWindowFrameModule (ref), constantsModule (ref), trackingAudioIconModule (ref), musicIconModule (ref), marqueeScrollerModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = createNextOrder()
	local var3 = useMemo(function()
		-- upvalues: var1 (ref)
		return if var1.isLoading then "Loading" elseif var1.song then if var1.song.meetsCriteria then "MeetsCriteria" else "Unverified" else "Loading"
	end, { var1.isLoading, var1.song })
	local isNotMeetsCriteria = var3 ~= "MeetsCriteria"
	local var4 = useLocalization({
		windowTitle = "CoreScripts.TopBar.Music",
		musicLoading = "CoreScripts.TopBar.MusicLoading",
		musicUnverified = "CoreScripts.TopBar.MusicNotVerified"
	})
	
	return reactModule.createElement(chromeWindowFrameModule, {
		title = var4.windowTitle,
		maxSize = var1.maxSize,
		actions = if not isNotMeetsCriteria then {
			LikeButtonWrapper = reactModule.createElement(foundationModule.View, { tag = "auto-xy padding-right-xsmall" }, {
				LikeButton = reactModule.createElement(likeButtonModule, {
					isFavorited = if var1.song then var1.song.isLiked else false,
					onFavorite = useCallback(function()
						-- upvalues: var1 (ref)
						if var1.onToggleLike then
							var1.onToggleLike()
						end
					end, { var1.onToggleLike })
				})
			})
		} else {},
		isFocused = var1.isFocused,
		onClose = var1.onClose,
		onUnfocus = var1.onUnfocus
	}, {
		Body = reactModule.createElement(foundationModule.View, {
			tag = "col auto-x align-y-center",
			Size = UDim2.new(1, 0, 0, constantsModule.WINDOW_HEIGHT)
		}, {
			InvalidAudio = if var3 ~= "MeetsCriteria" then nil else reactModule.createElement(foundationModule.View, { tag = "auto-x size-0-full gap-medium row align-y-center" }, {
				Icon = reactModule.createElement(trackingAudioIconModule, { isMoving = var3 == "Unverified" }),
				Alert = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-medium content-emphasis shrink text-wrap text-align-x-left text-align-y-center",
					Text = if var3 == "Unverified" then var4.musicUnverified else var4.musicLoading,
					LayoutOrder = var2()
				})
			}),
			NowPlaying = var3 == "MeetsCriteria" and reactModule.createElement(foundationModule.View, {
				tag = "auto-xy row gap-medium flex-between align-y-center"
			}, {
				Icon = reactModule.createElement(musicIconModule, {
					layoutOrder = var2(),
					thumbnailUrl = if var1.song then var1.song.thumbnailUrl else nil
				}),
				SongInfo = reactModule.createElement(foundationModule.View, {
					tag = "auto-xy col gap-xsmall shrink clip",
					LayoutOrder = var2()
				}, {
					Title = reactModule.createElement(marqueeScrollerModule, {
						speed = if isNotMeetsCriteria then 0 else nil,
						LayoutOrder = var2()
					}, {
						Label = reactModule.createElement(foundationModule.Text, {
							tag = "auto-xy shrink text-title-medium content-emphasis",
							Text = if var1.song then var1.song.title else ""
						})
					}),
					Artists = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy shrink text-body-small content-default",
						Text = useMemo(function()
							-- upvalues: var1 (ref)
							return if var1.song then table.concat(var1.song.artists, ", ") else nil
						end, { var1.song }),
						TextTruncate = Enum.TextTruncate.AtEnd,
						LayoutOrder = var2()
					})
				})
			})
		})
	})
end