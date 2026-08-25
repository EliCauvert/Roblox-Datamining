local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local parent = virtualEvents.Parent
local reactModule = require(parent.React)
local gameTileModule = require(parent.GameTile)
local _ = require(parent.GraphQLServer)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useLocalization = require(parent.Localization).Hooks.useLocalization
local gamePlayButtonModule = require(parent.GamePlayButton)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local useTextSizeOffset = require(parent.UIBlox).Core.Style.useTextSizeOffset
local useDesignTokens = require(parent.Style).useDesignTokens
local holdDetector = require(parent.HoldToPlay).HoldDetector
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local gameTileView = gameTileModule.GameTileView
local gridTileTextFooter = gameTileModule.GridTileTextFooter
local gameTileThumbnailBadges = gameTileModule.GameTileThumbnailBadges
local footerCornerButtonStyle = gameTileModule.FooterCornerButtonStyle
local usePlayButtonState = gamePlayButtonModule.usePlayButtonState
local playButtonStates = gamePlayButtonModule.PlayButtonStates
local formatDateLocalizedModule = require(virtualEvents.Common.formatDateLocalized)
local getVirtualEventDatesModule = require(virtualEvents.Common.getVirtualEventDates)
local fetchEventThumbnailModule = require(virtualEvents.Common.fetchEventThumbnail)
local getEventCtaButtonStateModule = require(virtualEvents.Common.getEventCtaButtonState)
local eventWideFooterButtonModule = require(virtualEvents.Components.EventsListCarousel.EventWideFooterButton)
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local useMemo = reactModule.useMemo
local useCallback = reactModule.useCallback
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagLuaAppSduiEventDetailsEnabled = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled
local fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable = require(parent.SharedFlags).FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable
local fFlagLuaAppGameViewTileBackgroundColorOverride = require(parent.SharedFlags).FFlagLuaAppGameViewTileBackgroundColorOverride

local var10 = function() end

return function(p0)
	-- upvalues: useDesignTokens (ref), useTextSizeOffset (ref), getVirtualEventDatesModule (ref), useMemo (ref), footerCornerButtonStyle (ref), useRoactService (ref), roactNetworking (ref), usePlayButtonState (ref), playButtonStates (ref), getFFlagIsSquadEnabled (ref), useLocalization (ref), useCallback (ref), reactModule (ref), useEffect (ref), fFlagLuaAppSduiEventDetailsEnabled (ref), formatDateLocalizedModule (ref), notificationModalsManagerModule (ref), useState (ref), fetchEventThumbnailModule (ref), impressionsTagUtility (ref), fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable (ref), getEventCtaButtonStateModule (ref), focusNavigationEventNameEnum (ref), var10 (ref), gameTileView (ref), fFlagLuaAppGameViewTileBackgroundColorOverride (ref), gridTileTextFooter (ref), gameTileThumbnailBadges (ref), eventWideFooterButtonModule (ref), holdDetector (ref)
	local var11 = useDesignTokens()
	local var12 = useTextSizeOffset()
	local event = p0.Event
	local var13 = getVirtualEventDatesModule(event)
	local var14 = var13.startDate.UnixTimestamp <= DateTime.now().UnixTimestamp
	local isGoing = event.userRsvpStatus == "going"
	local var16 = useMemo(function()
		-- upvalues: var14 (ref), footerCornerButtonStyle (copy), isGoing (ref)
		return if var14 then footerCornerButtonStyle.Play elseif isGoing then footerCornerButtonStyle.Following else footerCornerButtonStyle.Follow
	end, { var14, isGoing })
	local var17 = useRoactService(roactNetworking)
	local var18 = usePlayButtonState(var17, p0.Event.universeId or "")
	local var19 = if var18.playButtonState ~= playButtonStates.Playable then getFFlagIsSquadEnabled() and var18.playButtonState == playButtonStates.PlayableWithParty else true
	local var20 = useLocalization({
		HappeningNow = "Feature.Home.Label.HappeningNow",
		DateAtTime = "Feature.VirtualEvents.Label.DateAtTime",
		ToastText = "Feature.VirtualEvents.Label.ReminderSetForEventTime"
	})
	local var21 = useCallback(function()
		-- upvalues: var19 (ref), var14 (ref), p0 (ref), event (ref)
		if not var19 then return end
		if var14 then
			p0.onJoinEvent(event)
			
			return
		end
		local var32 = if event.userRsvpStatus ~= "going" then "notGoing" else "going"
		
		if p0.onRsvpChanged then
			p0.onRsvpChanged(event, var32)
		end
	end, {
		var14, p0.onJoinEvent, p0.onRsvpChanged, event.userRsvpStatus, event, var19
	})
	local var22 = reactModule.useRef(event.userRsvpStatus)
	useEffect(function()
		-- upvalues: fFlagLuaAppSduiEventDetailsEnabled (copy), p0 (ref), var22 (ref), event (ref), formatDateLocalizedModule (copy), var20 (ref), var13 (ref), notificationModalsManagerModule (copy)
		if (not fFlagLuaAppSduiEventDetailsEnabled or not p0.suppressRsvpReminderToastBecauseEventDetailsFocused) and (var22.current and var22.current ~= "going") and event.userRsvpStatus == "going" then
			notificationModalsManagerModule.SetUIBloxToast({
				toastTitle = var20.ToastText:gsub("{(.-)}", {
					eventName = event.displayTitle,
					eventTime = formatDateLocalizedModule(var20.DateAtTime, var13.startDate)
				}),
				sequenceNumber = DateTime.now().UnixTimestamp
			})
		end
		var22.current = event.userRsvpStatus
	end, {
		event.userRsvpStatus, event.displayTitle, var13.startDate, var20.DateAtTime,
		var20.ToastText,
		if fFlagLuaAppSduiEventDetailsEnabled then p0.suppressRsvpReminderToastBecauseEventDetailsFocused else nil
	})
	local var23, var24 = useState(nil)
	useEffect(function()
		-- upvalues: fetchEventThumbnailModule (copy), var17 (ref), event (ref), p0 (ref), var24 (ref)
		local var33 = true
		fetchEventThumbnailModule(var17, event.id, p0.DefaultThumbnail):andThen(function(p1)
			-- upvalues: var33 (write), var24 (copy)
			if var33 then
				var24(p1)
			end
		end)
		
		return function()
			-- upvalues: var33 (write)
			var33 = false
		end
	end, { event.id, p0.DefaultThumbnail })
	local var25 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var25 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var25, p0.impressionsTag, p0.layoutOrder)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var25 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var25, p0.impressionsTag, p0.layoutOrder)
		end
	end, { var25, p0.impressionsTag, p0.layoutOrder })
	local _ = nil
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useRef(false)
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (ref)
		var27.current = p2
	end, {})
	local isRsvpDisabled = nil
	local isJoinEventDisabled = nil
	
	if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
		local var29 = getEventCtaButtonStateModule(var18)
		isJoinEventDisabled = var29.isJoinEventDisabled
		isRsvpDisabled = var29.isRsvpDisabled
	end
	local holdToNotifyMe
	local var30 = nil
	
	if var16 == footerCornerButtonStyle.Follow then
		holdToNotifyMe = focusNavigationEventNameEnum.HoldToNotifyMe
		
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
			var30 = isRsvpDisabled
		end
	elseif var16 == footerCornerButtonStyle.Following then
		holdToNotifyMe = focusNavigationEventNameEnum.HoldToUnfollowEvent
		
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
			var30 = isRsvpDisabled
		end
	else
		holdToNotifyMe = focusNavigationEventNameEnum.HoldToJoinEvent
		
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
			var30 = isJoinEventDisabled
		end
	end
	local var31 = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable and var30 then var10 else var21
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		Size = p0.size,
		ref = var25
	}, {
		GameTile = reactModule.createElement(gameTileView, {
			imageAspectRatio = 1.777777777778,
			isContained = true,
			hidePlayButton = true,
			isHovered = false,
			forwardRef = var26,
			image = var23,
			backgroundStyle = if fFlagLuaAppGameViewTileBackgroundColorOverride then p0.backgroundStyle else nil,
			Size = UDim2.fromScale(1, 1),
			title = event.displayTitle or "",
			onActivated = useCallback(function()
				-- upvalues: var27 (ref), p0 (ref)
				if var27.current then
					return
				end
				p0.onTileActivated(p0.Event)
			end, { p0.onTileActivated, p0.Event }),
			footerMetadata = reactModule.createElement(gridTileTextFooter, {
				useLargerFont = true,
				text = event.displaySubtitle or (event.displayDescription or "")
			}),
			thumbnailOverlay = reactModule.createElement(gameTileThumbnailBadges, {
				tileBadgesByPosition = {
					ImageTopLeft = {
						{
							tileBadgeType = "Text",
							text = if var14 then var20.HappeningNow else formatDateLocalizedModule(var20.DateAtTime, var13.startDate)
						}
					}
				}
			}),
			extraFooterSpace = if not p0.disableButtons then var11.Size.Size_700 + var11.Size.Size_200 else nil,
			extraFooterContent = if not p0.disableButtons then reactModule.createElement(eventWideFooterButtonModule, {
				key = "WideFooterButton",
				buttonStyle = var16,
				disabled = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then var30 else not var19,
				onActivated = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then var31 else var21
			}) else nil,
			textSizeOffset = var12
		}),
		HoldDetector = if var26 and var26.current then reactModule.createElement(holdDetector, {
			guiObject = var26.current,
			onHoldDetected = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then var31 else var21,
			setDisabledForHold = var28,
			keyCode = Enum.KeyCode.ButtonA,
			focusNavigationEventName = holdToNotifyMe
		}) else nil
	})
end