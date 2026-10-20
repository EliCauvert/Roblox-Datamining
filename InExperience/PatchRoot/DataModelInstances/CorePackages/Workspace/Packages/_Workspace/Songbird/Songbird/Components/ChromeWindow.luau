local Songbird = script:FindFirstAncestor("Songbird")
local ConstantsModule = require(Songbird.constants)
local CryoModule = require(Songbird.Parent.Cryo)
local FoundationModule = require(Songbird.Parent.Foundation)
local ReactModule = require(Songbird.Parent.React)
local ChromeWindowFrameModule = require(Songbird.Components.ChromeWindowFrame)
local MarqueeScrollerModule = require(Songbird.Components.MarqueeScroller)
local MusicIconModule = require(Songbird.Components.MusicIcon)
local LikeButtonModule = require(Songbird.Components.LikeButton)
local TrackingAudioIconModule = require(Songbird.Components.TrackingAudioIcon)
local UseLocalizationFunction = require(Songbird.Parent.Localization).Hooks.useLocalization
local CreateNextOrderFunction = require(Songbird.Parent.ReactUtils).createNextOrder
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local config = { isLoading = false, maxSize = Vector2.new(300, 1e999) }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), CreateNextOrderFunction (copy), UseMemoFunction (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), ReactModule (copy), FoundationModule (copy), LikeButtonModule (copy), ChromeWindowFrameModule (copy), ConstantsModule (copy), TrackingAudioIconModule (copy), MusicIconModule (copy), MarqueeScrollerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local NextOrder = CreateNextOrderFunction()
	local UseMemoResult = UseMemoFunction(function(): string
		-- upvalues: JoinResult (copy)
		return if JoinResult.isLoading then "Loading" elseif JoinResult.song then if JoinResult.song.meetsCriteria then "MeetsCriteria" else "Unverified" else "Loading"
	end, { JoinResult.isLoading, JoinResult.song })
	local IsNotMeetsCriteria = UseMemoResult ~= "MeetsCriteria"
	local UseLocalizationResult = UseLocalizationFunction({
		windowTitle = "CoreScripts.TopBar.Music",
		musicLoading = "CoreScripts.TopBar.MusicLoading",
		musicUnverified = "CoreScripts.TopBar.MusicNotVerified"
	})
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: JoinResult (copy)
		if JoinResult.onToggleLike then
			JoinResult.onToggleLike()
		end
	end, { JoinResult.onToggleLike })
	local UseMemoResult1 = UseMemoFunction(function()
		-- upvalues: JoinResult (copy)
		return if JoinResult.song then table.concat(JoinResult.song.artists, ", ") else nil
	end, { JoinResult.song })
	
	return ReactModule.createElement(ChromeWindowFrameModule, {
		title = UseLocalizationResult.windowTitle,
		maxSize = JoinResult.maxSize,
		actions = if IsNotMeetsCriteria then {} else {
			LikeButtonWrapper = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy padding-right-xsmall" }, {
				LikeButton = ReactModule.createElement(LikeButtonModule, {
					isFavorited = if JoinResult.song then JoinResult.song.isLiked else false,
					onFavorite = UseCallbackResult
				})
			})
		},
		isFocused = JoinResult.isFocused,
		onClose = JoinResult.onClose,
		onUnfocus = JoinResult.onUnfocus
	}, {
		Body = ReactModule.createElement(FoundationModule.View, {
			tag = "col auto-x align-y-center",
			Size = UDim2.new(1, 0, 0, ConstantsModule.WINDOW_HEIGHT)
		}, {
			InvalidAudio = if UseMemoResult == "MeetsCriteria" then nil else ReactModule.createElement(FoundationModule.View, { tag = "auto-x size-0-full gap-medium row align-y-center" }, {
				Icon = ReactModule.createElement(TrackingAudioIconModule, { isMoving = UseMemoResult == "Unverified" }),
				Alert = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-body-medium content-emphasis shrink text-wrap text-align-x-left text-align-y-center",
					Text = if UseMemoResult == "Unverified" then UseLocalizationResult.musicUnverified else UseLocalizationResult.musicLoading,
					LayoutOrder = NextOrder()
				})
			}),
			NowPlaying = UseMemoResult == "MeetsCriteria" and ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy row gap-medium flex-between align-y-center"
			}, {
				Icon = ReactModule.createElement(MusicIconModule, {
					layoutOrder = NextOrder(),
					thumbnailUrl = if JoinResult.song then JoinResult.song.thumbnailUrl else nil
				}),
				SongInfo = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy col gap-xsmall shrink clip",
					LayoutOrder = NextOrder()
				}, {
					Title = ReactModule.createElement(MarqueeScrollerModule, {
						speed = if IsNotMeetsCriteria then 0 else nil,
						LayoutOrder = NextOrder()
					}, {
						Label = ReactModule.createElement(FoundationModule.Text, {
							tag = "auto-xy shrink text-title-medium content-emphasis",
							Text = if JoinResult.song then JoinResult.song.title else ""
						})
					}),
					Artists = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy shrink text-body-small content-default",
						Text = UseMemoResult1,
						TextTruncate = Enum.TextTruncate.AtEnd,
						LayoutOrder = NextOrder()
					})
				})
			})
		})
	})
end