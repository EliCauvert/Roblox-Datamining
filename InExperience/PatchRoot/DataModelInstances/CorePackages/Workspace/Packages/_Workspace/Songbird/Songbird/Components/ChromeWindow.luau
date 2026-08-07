local songbird = script:FindFirstAncestor("Songbird")
local userInputService = game:GetService("UserInputService")
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
local analyticActionsModule = require(songbird.Analytics.AnalyticActions)
local sendChromeWindowAnalyticsModule = require(songbird.Analytics.sendChromeWindowAnalytics)
local isInputInsideObjectModule = require(songbird.Internal.isInputInsideObject)
local getFFlagSongbirdPopoverSubmenuModule = require(songbird.Flags.getFFlagSongbirdPopoverSubmenu)
local useLocalization = localizationModule.Hooks.useLocalization
local createNextOrder = reactUtilsModule.createNextOrder
local useEventConnection = reactUtilsModule.useEventConnection
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useState = reactModule.useState
local _ = {
	Loading = "Loading",
	Unverified = "Unverified",
	MeetsCriteria = "MeetsCriteria"
}
local t = { isLoading = false, maxSize = Vector2.new(300, 1e999) }

return function(p0) --[[ line: 64 | named "ChromeWindow" ]]
	-- upvalues: cryoModule (ref), t (ref), createNextOrder (ref), useMemo (ref), useLocalization (ref), useCallback (ref), useState (ref), sendChromeWindowAnalyticsModule (ref), analyticActionsModule (ref), getFFlagSongbirdPopoverSubmenuModule (ref), useRef (ref), useEventConnection (ref), userInputService (ref), isInputInsideObjectModule (ref), foundationModule (ref), reactModule (ref), likeButtonModule (ref), constantsModule (ref), chromeWindowFrameModule (ref), trackingAudioIconModule (ref), musicIconModule (ref), marqueeScrollerModule (ref)
	local var18 = cryoModule.Dictionary.join(t, p0)
	local var19 = createNextOrder()
	local var20 = useMemo(function() --[[ line: 68 ]]
		-- upvalues: var18 (ref)
		return if var18.isLoading then "Loading" elseif var18.song then if var18.song.meetsCriteria then "MeetsCriteria" else "Unverified" else "Loading"
	end, { var18.isLoading, var18.song })
	local isNotMeetsCriteria = var20 ~= "MeetsCriteria"
	local var22 = useLocalization({
		windowTitle = "CoreScripts.TopBar.Music",
		musicLoading = "CoreScripts.TopBar.MusicLoading",
		musicUnverified = "CoreScripts.TopBar.MusicNotVerified",
		report = "CoreScripts.TopBar.Label.Report"
	})
	local var23 = useCallback(function() --[[ line: 93 ]]
		-- upvalues: var18 (ref)
		if var18.onToggleLike then
			var18.onToggleLike()
		end
	end, { var18.onToggleLike })
	local var24 = useMemo(function() --[[ line: 99 ]]
		-- upvalues: var18 (ref)
		return if var18.song then table.concat(var18.song.artists, ", ") else nil
	end, { var18.song })
	local var25, var26 = useState(false)
	local var27 = useCallback(function() --[[ line: 107 ]]
		-- upvalues: var26 (ref), sendChromeWindowAnalyticsModule (copy), analyticActionsModule (copy)
		var26(function(p1) --[[ line: 108 ]]
			return not p1
		end)
		sendChromeWindowAnalyticsModule({ action = analyticActionsModule.SeeMore })
	end, {})
	local var28 = nil
	
	if not getFFlagSongbirdPopoverSubmenuModule() then
		var28 = useRef(nil)
		useEventConnection(userInputService.InputBegan, function(p2) --[[ line: 117 ]]
			-- upvalues: var25 (ref), isInputInsideObjectModule (copy), var28 (write), var26 (ref)
			if var25 and not isInputInsideObjectModule(p2.Position, var28.current) then
				var26(false)
			end
		end, { var25 })
	end
	return reactModule.createElement(chromeWindowFrameModule, {
		title = var22.windowTitle,
		maxSize = var18.maxSize,
		actions = if not isNotMeetsCriteria then {
			LikeButton = reactModule.createElement(likeButtonModule, {
				isFavorited = if var18.song then var18.song.isLiked else false,
				onFavorite = var23
			})
		} else {},
		menuItems = if not getFFlagSongbirdPopoverSubmenuModule() then if var20 == "MeetsCriteria" or var20 == "Unverified" then if getFFlagSongbirdPopoverSubmenuModule() then {
			{
				id = "report",
				icon = "icons/actions/feedback",
				text = var22.report,
				onActivated = function() --[[ line: 180 ]]
					-- upvalues: var18 (ref), var26 (ref)
					if var18.onReport then
						var18.onReport()
					end
					var26(false)
				end
			}
		} else nil else nil else nil,
		submenu = if getFFlagSongbirdPopoverSubmenuModule() then nil elseif var20 == "MeetsCriteria" or var20 == "Unverified" then if getFFlagSongbirdPopoverSubmenuModule() then nil else {
			Menu = reactModule.createElement(foundationModule.View, {
				tag = "auto-y col gap-small",
				Size = UDim2.fromOffset(constantsModule.SUBMENU_WIDTH, 0),
				sizeConstraint = {
					MaxSize = Vector2.new(constantsModule.SUBMENU_WIDTH, 1e999)
				}
			}, {
				ReportButton = reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 auto-y row gap-small align-y-center radius-medium",
					onStateChanged = useCallback(function(p3) --[[ line: 126 ]]
						-- upvalues: foundationModule (copy), var18 (ref), var27 (ref)
						if p3 == foundationModule.Enums.ControlState.Pressed then
							if var18.onReport then
								var18.onReport()
							end
							var27()
						end
					end, { var18.onReport })
				}, {
					Icon = reactModule.createElement(foundationModule.Icon, { name = "icons/actions/feedback", LayoutOrder = var19() }),
					Label = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-title-medium content-emphasis",
						Text = var22.report,
						LayoutOrder = var19()
					})
				})
			})
		} else nil,
		isSubMenuOpen = var25,
		isFocused = var18.isFocused,
		onToggleSubMenu = var27,
		onClose = var18.onClose,
		onUnfocus = var18.onUnfocus,
		overflowButtonRef = if getFFlagSongbirdPopoverSubmenuModule() then nil else var28
	}, {
		Body = reactModule.createElement(foundationModule.View, {
			tag = "col auto-x align-y-center",
			Size = UDim2.new(1, 0, 0, constantsModule.WINDOW_HEIGHT)
		}, {
			InvalidAudio = if var20 ~= "MeetsCriteria" then nil else reactModule.createElement(foundationModule.View, { tag = "auto-x size-0-full gap-medium row align-y-center" }, {
				Icon = reactModule.createElement(trackingAudioIconModule, { isMoving = var20 == "Unverified" }),
				Alert = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-medium content-emphasis shrink text-wrap text-align-x-left text-align-y-center",
					Text = if var20 == "Unverified" then var22.musicUnverified else var22.musicLoading,
					LayoutOrder = var19()
				})
			}),
			NowPlaying = var20 == "MeetsCriteria" and reactModule.createElement(foundationModule.View, {
				tag = "auto-xy row gap-medium flex-between align-y-center"
			}, {
				Icon = reactModule.createElement(musicIconModule, {
					layoutOrder = var19(),
					thumbnailUrl = if var18.song then var18.song.thumbnailUrl else nil
				}),
				SongInfo = reactModule.createElement(foundationModule.View, {
					tag = "auto-xy col gap-xsmall shrink clip",
					LayoutOrder = var19()
				}, {
					Title = reactModule.createElement(marqueeScrollerModule, {
						speed = if isNotMeetsCriteria then 0 else nil,
						LayoutOrder = var19()
					}, {
						Label = reactModule.createElement(foundationModule.Text, {
							tag = "auto-xy shrink text-title-medium content-emphasis",
							Text = if var18.song then var18.song.title else ""
						})
					}),
					Artists = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy shrink text-body-small content-default",
						Text = var24,
						TextTruncate = Enum.TextTruncate.AtEnd,
						LayoutOrder = var19()
					})
				})
			})
		})
	})
end