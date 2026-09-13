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

local var1 = function() end

return function(p1)
	-- upvalues: useDesignTokens (ref), useTextSizeOffset (ref), getVirtualEventDatesModule (ref), useMemo (ref), footerCornerButtonStyle (ref), useRoactService (ref), roactNetworking (ref), usePlayButtonState (ref), playButtonStates (ref), getFFlagIsSquadEnabled (ref), useLocalization (ref), useCallback (ref), reactModule (ref), useEffect (ref), fFlagLuaAppSduiEventDetailsEnabled (ref), formatDateLocalizedModule (ref), notificationModalsManagerModule (ref), useState (ref), fetchEventThumbnailModule (ref), impressionsTagUtility (ref), fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable (ref), getEventCtaButtonStateModule (ref), focusNavigationEventNameEnum (ref), var1 (ref), gameTileView (ref), fFlagLuaAppGameViewTileBackgroundColorOverride (ref), gridTileTextFooter (ref), gameTileThumbnailBadges (ref), eventWideFooterButtonModule (ref), holdDetector (ref)
	local var2 = useDesignTokens()
	local var3 = useTextSizeOffset()
	local event = p1.Event
	local var4 = getVirtualEventDatesModule(event)
	local var5 = var4.startDate.UnixTimestamp <= DateTime.now().UnixTimestamp
	local isGoing = event.userRsvpStatus == "going"
	local var6 = useMemo(function()
		-- upvalues: var5 (ref), footerCornerButtonStyle (copy), isGoing (ref)
		return if var5 then footerCornerButtonStyle.Play elseif isGoing then footerCornerButtonStyle.Following else footerCornerButtonStyle.Follow
	end, { var5, isGoing })
	local var7 = useRoactService(roactNetworking)
	local var8 = usePlayButtonState(var7, p1.Event.universeId or "")
	local var9 = if var8.playButtonState ~= playButtonStates.Playable then getFFlagIsSquadEnabled() and var8.playButtonState == playButtonStates.PlayableWithParty else true
	local var10 = useLocalization({
		HappeningNow = "Feature.Home.Label.HappeningNow",
		DateAtTime = "Feature.VirtualEvents.Label.DateAtTime",
		ToastText = "Feature.VirtualEvents.Label.ReminderSetForEventTime"
	})
	local var11 = useCallback(function()
		-- upvalues: var9 (ref), var5 (ref), p1 (ref), event (ref)
		if not var9 then return end
		if var5 then
			p1.onJoinEvent(event)
			
			return
		end
		local var12 = if event.userRsvpStatus ~= "going" then "notGoing" else "going"
		
		if p1.onRsvpChanged then
			p1.onRsvpChanged(event, var12)
		end
	end, {
		var5, p1.onJoinEvent, p1.onRsvpChanged, event.userRsvpStatus, event, var9
	})
	local var12 = reactModule.useRef(event.userRsvpStatus)
	useEffect(function()
		-- upvalues: fFlagLuaAppSduiEventDetailsEnabled (copy), p1 (ref), var12 (ref), event (ref), formatDateLocalizedModule (copy), var10 (ref), var4 (ref), notificationModalsManagerModule (copy)
		if (not fFlagLuaAppSduiEventDetailsEnabled or not p1.suppressRsvpReminderToastBecauseEventDetailsFocused) and (var12.current and var12.current ~= "going") and event.userRsvpStatus == "going" then
			notificationModalsManagerModule.SetUIBloxToast({
				toastTitle = var10.ToastText:gsub("{(.-)}", {
					eventName = event.displayTitle,
					eventTime = formatDateLocalizedModule(var10.DateAtTime, var4.startDate)
				}),
				sequenceNumber = DateTime.now().UnixTimestamp
			})
		end
		var12.current = event.userRsvpStatus
	end, {
		event.userRsvpStatus, event.displayTitle, var4.startDate, var10.DateAtTime,
		var10.ToastText,
		if fFlagLuaAppSduiEventDetailsEnabled then p1.suppressRsvpReminderToastBecauseEventDetailsFocused else nil
	})
	local var13, var14 = useState(nil)
	useEffect(function()
		-- upvalues: fetchEventThumbnailModule (copy), var7 (ref), event (ref), p1 (ref), var14 (ref)
		local var15 = true
		fetchEventThumbnailModule(var7, event.id, p1.DefaultThumbnail):andThen(function(p2)
			-- upvalues: var15 (write), var14 (copy)
			if var15 then
				var14(p2)
			end
		end)
		
		return function()
			-- upvalues: var15 (write)
			var15 = false
		end
	end, { event.id, p1.DefaultThumbnail })
	local var15 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var15 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var15, p1.impressionsTag, p1.layoutOrder)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var15 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var15, p1.impressionsTag, p1.layoutOrder)
		end
	end, { var15, p1.impressionsTag, p1.layoutOrder })
	local _ = nil
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useRef(false)
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref)
		var17.current = p2
	end, {})
	local isRsvpDisabled = nil
	local isJoinEventDisabled = nil
	
	if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
		local var19 = getEventCtaButtonStateModule(var8)
		isJoinEventDisabled = var19.isJoinEventDisabled
		isRsvpDisabled = var19.isRsvpDisabled
	end
	local holdToNotifyMe
	local var20 = nil
	
	if var6 == footerCornerButtonStyle.Follow then
		holdToNotifyMe = focusNavigationEventNameEnum.HoldToNotifyMe
		
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
			var20 = isRsvpDisabled
		end
	elseif var6 == footerCornerButtonStyle.Following then
		holdToNotifyMe = focusNavigationEventNameEnum.HoldToUnfollowEvent
		
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
			var20 = isRsvpDisabled
		end
	else
		holdToNotifyMe = focusNavigationEventNameEnum.HoldToJoinEvent
		
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
			var20 = isJoinEventDisabled
		end
	end
	local var21 = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable and var20 then var1 else var11
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = p1.size,
		ref = var15
	}, {
		GameTile = reactModule.createElement(gameTileView, {
			imageAspectRatio = 1.777777777778,
			isContained = true,
			hidePlayButton = true,
			isHovered = false,
			forwardRef = var16,
			image = var13,
			backgroundStyle = if fFlagLuaAppGameViewTileBackgroundColorOverride then p1.backgroundStyle else nil,
			Size = UDim2.fromScale(1, 1),
			title = event.displayTitle or "",
			onActivated = useCallback(function()
				-- upvalues: var17 (ref), p1 (ref)
				if var17.current then
					return
				end
				p1.onTileActivated(p1.Event)
			end, { p1.onTileActivated, p1.Event }),
			footerMetadata = reactModule.createElement(gridTileTextFooter, {
				useLargerFont = true,
				text = event.displaySubtitle or (event.displayDescription or "")
			}),
			thumbnailOverlay = reactModule.createElement(gameTileThumbnailBadges, {
				tileBadgesByPosition = {
					ImageTopLeft = {
						{
							tileBadgeType = "Text",
							text = if var5 then var10.HappeningNow else formatDateLocalizedModule(var10.DateAtTime, var4.startDate)
						}
					}
				}
			}),
			extraFooterSpace = if not p1.disableButtons then var2.Size.Size_700 + var2.Size.Size_200 else nil,
			extraFooterContent = if not p1.disableButtons then reactModule.createElement(eventWideFooterButtonModule, {
				key = "WideFooterButton",
				buttonStyle = var6,
				disabled = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then var20 else not var9,
				onActivated = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then var21 else var11
			}) else nil,
			textSizeOffset = var3
		}),
		HoldDetector = if var16 and var16.current then reactModule.createElement(holdDetector, {
			guiObject = var16.current,
			onHoldDetected = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then var21 else var11,
			setDisabledForHold = var18,
			keyCode = Enum.KeyCode.ButtonA,
			focusNavigationEventName = holdToNotifyMe
		}) else nil
	})
end