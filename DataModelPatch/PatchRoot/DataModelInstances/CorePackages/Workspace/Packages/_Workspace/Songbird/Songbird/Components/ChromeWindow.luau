local Songbird = script:FindFirstAncestor("Songbird")
local UserInputService = game:GetService("UserInputService")
local ConstantsModule = require(Songbird.constants)
local CryoModule = require(Songbird.Parent.Cryo)
local FoundationModule = require(Songbird.Parent.Foundation)
local ReactModule = require(Songbird.Parent.React)
local ReactUtilsModule = require(Songbird.Parent.ReactUtils)
local ChromeWindowFrameModule = require(Songbird.Components.ChromeWindowFrame)
local MarqueeScrollerModule = require(Songbird.Components.MarqueeScroller)
local MusicIconModule = require(Songbird.Components.MusicIcon)
local LikeButtonModule = require(Songbird.Components.LikeButton)
local TrackingAudioIconModule = require(Songbird.Components.TrackingAudioIcon)
local AnalyticActionsModule = require(Songbird.Analytics.AnalyticActions)
local SendChromeWindowAnalyticsModule = require(Songbird.Analytics.sendChromeWindowAnalytics)
local IsInputInsideObjectModule = require(Songbird.Internal.isInputInsideObject)
local GetFFlagSongbirdPopoverSubmenuModule = require(Songbird.Flags.getFFlagSongbirdPopoverSubmenu)
local UseLocalizationFunction = require(Songbird.Parent.Localization).Hooks.useLocalization
local CreateNextOrderFunction = ReactUtilsModule.createNextOrder
local UseEventConnectionFunction = ReactUtilsModule.useEventConnection
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local config = { isLoading = false, maxSize = Vector2.new(300, 1e999) }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), CreateNextOrderFunction (copy), UseMemoFunction (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), UseStateFunction (copy), SendChromeWindowAnalyticsModule (copy), AnalyticActionsModule (copy), GetFFlagSongbirdPopoverSubmenuModule (copy), UseRefFunction (copy), UseEventConnectionFunction (copy), UserInputService (copy), IsInputInsideObjectModule (copy), FoundationModule (copy), ReactModule (copy), LikeButtonModule (copy), ConstantsModule (copy), ChromeWindowFrameModule (copy), TrackingAudioIconModule (copy), MusicIconModule (copy), MarqueeScrollerModule (copy)
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
		musicUnverified = "CoreScripts.TopBar.MusicNotVerified",
		report = "CoreScripts.TopBar.Label.Report"
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
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy), SendChromeWindowAnalyticsModule (upval), AnalyticActionsModule (upval)
		UseStateResult2(function(p2): boolean
			return not p2
		end)
		SendChromeWindowAnalyticsModule({ action = AnalyticActionsModule.SeeMore })
	end, {})
	local v1 = nil
	
	if not GetFFlagSongbirdPopoverSubmenuModule() then
		v1 = UseRefFunction(nil)
		UseEventConnectionFunction(UserInputService.InputBegan, function(p2)
			-- upvalues: UseStateResult (copy), IsInputInsideObjectModule (upval), v1 (ref), UseStateResult2 (copy)
			if UseStateResult and not IsInputInsideObjectModule(p2.Position, v1.current) then
				UseStateResult2(false)
			end
		end, { UseStateResult })
	end
	local UseCallbackResult2 = UseCallbackFunction(function(Pressed)
		-- upvalues: FoundationModule (upval), JoinResult (copy), UseCallbackResult1 (copy)
		if Pressed == FoundationModule.Enums.ControlState.Pressed then
			if JoinResult.onReport then
				JoinResult.onReport()
			end
			UseCallbackResult1()
		end
	end, { JoinResult.onReport })
	local Config = if GetFFlagSongbirdPopoverSubmenuModule() then nil else {
		Menu = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y col gap-small",
			Size = UDim2.fromOffset(ConstantsModule.SUBMENU_WIDTH, 0),
			sizeConstraint = {
				MaxSize = Vector2.new(ConstantsModule.SUBMENU_WIDTH, 1e999)
			}
		}, {
			ReportButton = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y row gap-small align-y-center radius-medium",
				onStateChanged = UseCallbackResult2
			}, {
				Icon = ReactModule.createElement(FoundationModule.Icon, {
					name = "icons/actions/feedback",
					LayoutOrder = NextOrder()
				}),
				Label = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-title-medium content-emphasis",
					Text = UseLocalizationResult.report,
					LayoutOrder = NextOrder()
				})
			})
		})
	}
	local List = if GetFFlagSongbirdPopoverSubmenuModule() then {
		{
			id = "report",
			icon = "icons/actions/feedback",
			text = UseLocalizationResult.report,
			onActivated = function()
				-- upvalues: JoinResult (copy), UseStateResult2 (copy)
				if JoinResult.onReport then
					JoinResult.onReport()
				end
				UseStateResult2(false)
			end
		}
	} else nil
	
	return ReactModule.createElement(ChromeWindowFrameModule, {
		title = UseLocalizationResult.windowTitle,
		maxSize = JoinResult.maxSize,
		actions = if IsNotMeetsCriteria then {} else {
			LikeButton = ReactModule.createElement(LikeButtonModule, {
				isFavorited = if JoinResult.song then JoinResult.song.isLiked else false,
				onFavorite = UseCallbackResult
			})
		},
		menuItems = if GetFFlagSongbirdPopoverSubmenuModule() and (UseMemoResult == "MeetsCriteria" or UseMemoResult == "Unverified") then List else nil,
		submenu = if GetFFlagSongbirdPopoverSubmenuModule() then nil elseif UseMemoResult == "MeetsCriteria" or UseMemoResult == "Unverified" then Config else nil,
		isSubMenuOpen = UseStateResult,
		isFocused = JoinResult.isFocused,
		onToggleSubMenu = UseCallbackResult1,
		onClose = JoinResult.onClose,
		onUnfocus = JoinResult.onUnfocus,
		overflowButtonRef = if GetFFlagSongbirdPopoverSubmenuModule() then nil else v1
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