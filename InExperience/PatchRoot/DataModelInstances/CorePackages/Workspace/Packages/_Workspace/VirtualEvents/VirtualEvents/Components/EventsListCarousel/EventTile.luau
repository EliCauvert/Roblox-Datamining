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
local fFlagLuaAppGameViewTileBackgroundColorOverride = require(parent.SharedFlags).FFlagLuaAppGameViewTileBackgroundColorOverride

local var1 = function() end

return function(p1)
	-- upvalues: useDesignTokens (ref), useTextSizeOffset (ref), getVirtualEventDatesModule (ref), useMemo (ref), footerCornerButtonStyle (ref), useRoactService (ref), roactNetworking (ref), usePlayButtonState (ref), playButtonStates (ref), getFFlagIsSquadEnabled (ref), useLocalization (ref), useCallback (ref), reactModule (ref), useEffect (ref), fFlagLuaAppSduiEventDetailsEnabled (ref), formatDateLocalizedModule (ref), notificationModalsManagerModule (ref), useState (ref), fetchEventThumbnailModule (ref), impressionsTagUtility (ref), getEventCtaButtonStateModule (ref), focusNavigationEventNameEnum (ref), var1 (ref), gameTileView (ref), fFlagLuaAppGameViewTileBackgroundColorOverride (ref), gridTileTextFooter (ref), gameTileThumbnailBadges (ref), eventWideFooterButtonModule (ref), holdDetector (ref)
	local holdToNotifyMe, var2
	local var3 = useDesignTokens()
	local var4 = useTextSizeOffset()
	local event = p1.Event
	local var5 = getVirtualEventDatesModule(event)
	local var6 = var5.startDate.UnixTimestamp <= DateTime.now().UnixTimestamp
	local isGoing = event.userRsvpStatus == "going"
	local var7 = useMemo(function()
		-- upvalues: var6 (ref), footerCornerButtonStyle (copy), isGoing (ref)
		return if var6 then footerCornerButtonStyle.Play elseif isGoing then footerCornerButtonStyle.Following else footerCornerButtonStyle.Follow
	end, { var6, isGoing })
	local var8 = useRoactService(roactNetworking)
	local var9 = usePlayButtonState(var8, p1.Event.universeId or "")
	local var10 = if var9.playButtonState ~= playButtonStates.Playable then getFFlagIsSquadEnabled() and var9.playButtonState == playButtonStates.PlayableWithParty else true
	local var11 = useLocalization({
		HappeningNow = "Feature.Home.Label.HappeningNow",
		DateAtTime = "Feature.VirtualEvents.Label.DateAtTime",
		ToastText = "Feature.VirtualEvents.Label.ReminderSetForEventTime"
	})
	local var12 = useCallback(function()
		-- upvalues: var10 (ref), var6 (ref), p1 (ref), event (ref)
		if not var10 then return end
		if var6 then
			p1.onJoinEvent(event)
			
			return
		end
		local var13 = if event.userRsvpStatus ~= "going" then "notGoing" else "going"
		
		if p1.onRsvpChanged then
			p1.onRsvpChanged(event, var13)
		end
	end, {
		var6, p1.onJoinEvent, p1.onRsvpChanged, event.userRsvpStatus, event, var10
	})
	local var13 = reactModule.useRef(event.userRsvpStatus)
	useEffect(function()
		-- upvalues: fFlagLuaAppSduiEventDetailsEnabled (copy), p1 (ref), var13 (ref), event (ref), formatDateLocalizedModule (copy), var11 (ref), var5 (ref), notificationModalsManagerModule (copy)
		if (not fFlagLuaAppSduiEventDetailsEnabled or not p1.suppressRsvpReminderToastBecauseEventDetailsFocused) and (var13.current and var13.current ~= "going") and event.userRsvpStatus == "going" then
			notificationModalsManagerModule.SetUIBloxToast({
				toastTitle = var11.ToastText:gsub("{(.-)}", {
					eventName = event.displayTitle,
					eventTime = formatDateLocalizedModule(var11.DateAtTime, var5.startDate)
				}),
				sequenceNumber = DateTime.now().UnixTimestamp
			})
		end
		var13.current = event.userRsvpStatus
	end, {
		event.userRsvpStatus, event.displayTitle, var5.startDate, var11.DateAtTime,
		var11.ToastText,
		if fFlagLuaAppSduiEventDetailsEnabled then p1.suppressRsvpReminderToastBecauseEventDetailsFocused else nil
	})
	local var14, var15 = useState(nil)
	useEffect(function()
		-- upvalues: fetchEventThumbnailModule (copy), var8 (ref), event (ref), p1 (ref), var15 (ref)
		local var16 = true
		fetchEventThumbnailModule(var8, event.id, p1.DefaultThumbnail):andThen(function(p2)
			-- upvalues: var16 (write), var15 (copy)
			if var16 then
				var15(p2)
			end
		end)
		
		return function()
			-- upvalues: var16 (write)
			var16 = false
		end
	end, { event.id, p1.DefaultThumbnail })
	local var16 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var16 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var16, p1.impressionsTag, p1.layoutOrder)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var16 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var16, p1.impressionsTag, p1.layoutOrder)
		end
	end, { var16, p1.impressionsTag, p1.layoutOrder })
	local _ = nil
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(false)
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var18 (ref)
		var18.current = p2
	end, {})
	local var20 = getEventCtaButtonStateModule(var9)
	local isJoinEventDisabled = var20.isJoinEventDisabled
	local isRsvpDisabled = var20.isRsvpDisabled
	local _ = nil
	
	if var7 == footerCornerButtonStyle.Follow then
		holdToNotifyMe = focusNavigationEventNameEnum.HoldToNotifyMe
		var2 = isRsvpDisabled
	elseif var7 == footerCornerButtonStyle.Following then
		holdToNotifyMe = focusNavigationEventNameEnum.HoldToUnfollowEvent
		var2 = isRsvpDisabled
	else
		holdToNotifyMe = focusNavigationEventNameEnum.HoldToJoinEvent
		var2 = isJoinEventDisabled
	end
	local var21 = if var2 then var1 else var12
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = p1.size,
		ref = var16
	}, {
		GameTile = reactModule.createElement(gameTileView, {
			imageAspectRatio = 1.777777777778,
			isContained = true,
			hidePlayButton = true,
			isHovered = false,
			forwardRef = var17,
			image = var14,
			backgroundStyle = if fFlagLuaAppGameViewTileBackgroundColorOverride then p1.backgroundStyle else nil,
			Size = UDim2.fromScale(1, 1),
			title = event.displayTitle or "",
			onActivated = useCallback(function()
				-- upvalues: var18 (ref), p1 (ref)
				if var18.current then
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
							text = if var6 then var11.HappeningNow else formatDateLocalizedModule(var11.DateAtTime, var5.startDate)
						}
					}
				}
			}),
			extraFooterSpace = if not p1.disableButtons then var3.Size.Size_700 + var3.Size.Size_200 else nil,
			extraFooterContent = if not p1.disableButtons then reactModule.createElement(eventWideFooterButtonModule, {
				key = "WideFooterButton",
				buttonStyle = var7,
				disabled = var2,
				onActivated = var21
			}) else nil,
			textSizeOffset = var4
		}),
		HoldDetector = if var17 and var17.current then reactModule.createElement(holdDetector, {
			guiObject = var17.current,
			onHoldDetected = var21,
			setDisabledForHold = var19,
			keyCode = Enum.KeyCode.ButtonA,
			focusNavigationEventName = holdToNotifyMe
		}) else nil
	})
end