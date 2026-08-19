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

return function(p0) --[[ line: 52 | named "ChromeWindow" ]]
	-- upvalues: cryoModule (ref), t (ref), createNextOrder (ref), useMemo (ref), useLocalization (ref), useCallback (ref), reactModule (ref), foundationModule (ref), likeButtonModule (ref), chromeWindowFrameModule (ref), constantsModule (ref), trackingAudioIconModule (ref), musicIconModule (ref), marqueeScrollerModule (ref)
	local var13 = cryoModule.Dictionary.join(t, p0)
	local var14 = createNextOrder()
	local var15 = useMemo(function() --[[ line: 56 ]]
		-- upvalues: var13 (ref)
		return if var13.isLoading then "Loading" elseif var13.song then if var13.song.meetsCriteria then "MeetsCriteria" else "Unverified" else "Loading"
	end, { var13.isLoading, var13.song })
	local isNotMeetsCriteria = var15 ~= "MeetsCriteria"
	local var17 = useLocalization({
		windowTitle = "CoreScripts.TopBar.Music",
		musicLoading = "CoreScripts.TopBar.MusicLoading",
		musicUnverified = "CoreScripts.TopBar.MusicNotVerified"
	})
	
	return reactModule.createElement(chromeWindowFrameModule, {
		title = var17.windowTitle,
		maxSize = var13.maxSize,
		actions = if not isNotMeetsCriteria then {
			LikeButtonWrapper = reactModule.createElement(foundationModule.View, { tag = "auto-xy padding-right-xsmall" }, {
				LikeButton = reactModule.createElement(likeButtonModule, {
					isFavorited = if var13.song then var13.song.isLiked else false,
					onFavorite = useCallback(function() --[[ line: 80 ]]
						-- upvalues: var13 (ref)
						if var13.onToggleLike then
							var13.onToggleLike()
						end
					end, { var13.onToggleLike })
				})
			})
		} else {},
		isFocused = var13.isFocused,
		onClose = var13.onClose,
		onUnfocus = var13.onUnfocus
	}, {
		Body = reactModule.createElement(foundationModule.View, {
			tag = "col auto-x align-y-center",
			Size = UDim2.new(1, 0, 0, constantsModule.WINDOW_HEIGHT)
		}, {
			InvalidAudio = if var15 ~= "MeetsCriteria" then nil else reactModule.createElement(foundationModule.View, { tag = "auto-x size-0-full gap-medium row align-y-center" }, {
				Icon = reactModule.createElement(trackingAudioIconModule, { isMoving = var15 == "Unverified" }),
				Alert = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-medium content-emphasis shrink text-wrap text-align-x-left text-align-y-center",
					Text = if var15 == "Unverified" then var17.musicUnverified else var17.musicLoading,
					LayoutOrder = var14()
				})
			}),
			NowPlaying = var15 == "MeetsCriteria" and reactModule.createElement(foundationModule.View, {
				tag = "auto-xy row gap-medium flex-between align-y-center"
			}, {
				Icon = reactModule.createElement(musicIconModule, {
					layoutOrder = var14(),
					thumbnailUrl = if var13.song then var13.song.thumbnailUrl else nil
				}),
				SongInfo = reactModule.createElement(foundationModule.View, {
					tag = "auto-xy col gap-xsmall shrink clip",
					LayoutOrder = var14()
				}, {
					Title = reactModule.createElement(marqueeScrollerModule, {
						speed = if isNotMeetsCriteria then 0 else nil,
						LayoutOrder = var14()
					}, {
						Label = reactModule.createElement(foundationModule.Text, {
							tag = "auto-xy shrink text-title-medium content-emphasis",
							Text = if var13.song then var13.song.title else ""
						})
					}),
					Artists = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy shrink text-body-small content-default",
						Text = useMemo(function() --[[ line: 86 ]]
							-- upvalues: var13 (ref)
							return if var13.song then table.concat(var13.song.artists, ", ") else nil
						end, { var13.song }),
						TextTruncate = Enum.TextTruncate.AtEnd,
						LayoutOrder = var14()
					})
				})
			})
		})
	})
end