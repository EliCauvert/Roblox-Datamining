local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local Parent = VirtualEvents.Parent
local ReactModule = require(Parent.React)
local GameTileModule = require(Parent.GameTile)
local _ = require(Parent.GraphQLServer)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GamePlayButtonModule = require(Parent.GamePlayButton)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local HoldDetector = require(Parent.HoldToPlay).HoldDetector
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local GameTileView = GameTileModule.GameTileView
local GridTileTextFooter = GameTileModule.GridTileTextFooter
local GameTileThumbnailBadges = GameTileModule.GameTileThumbnailBadges
local FooterCornerButtonStyle = GameTileModule.FooterCornerButtonStyle
local UsePlayButtonStateFunction = GamePlayButtonModule.usePlayButtonState
local PlayButtonStates = GamePlayButtonModule.PlayButtonStates
local FormatDateLocalizedModule = require(VirtualEvents.Common.formatDateLocalized)
local GetVirtualEventDatesModule = require(VirtualEvents.Common.getVirtualEventDates)
local FetchEventThumbnailModule = require(VirtualEvents.Common.fetchEventThumbnail)
local GetEventCtaButtonStateModule = require(VirtualEvents.Common.getEventCtaButtonState)
local EventWideFooterButtonModule = require(VirtualEvents.Components.EventsListCarousel.EventWideFooterButton)
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState
local UseMemoFunction = ReactModule.useMemo
local UseCallbackFunction = ReactModule.useCallback
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppSduiEventDetailsEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled
local FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable = require(Parent.SharedFlags).FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable

local function v23() end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseTextSizeOffsetFunction (copy), GetVirtualEventDatesModule (copy), UseMemoFunction (copy), FooterCornerButtonStyle (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UsePlayButtonStateFunction (copy), PlayButtonStates (copy), GetFFlagIsSquadEnabledFunction (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), ReactModule (copy), UseEffectFunction (copy), FFlagLuaAppSduiEventDetailsEnabled (copy), FormatDateLocalizedModule (copy), NotificationModalsManagerModule (copy), UseStateFunction (copy), FetchEventThumbnailModule (copy), ImpressionsTagUtility (copy), FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable (copy), GetEventCtaButtonStateModule (copy), FocusNavigationEventNameEnum (copy), v23 (copy), GameTileView (copy), GridTileTextFooter (copy), GameTileThumbnailBadges (copy), EventWideFooterButtonModule (copy), HoldDetector (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local Event = p1.Event
	local VirtualEventDatesModule = GetVirtualEventDatesModule(Event)
	local IsUnixTimestampBelow = VirtualEventDatesModule.startDate.UnixTimestamp <= DateTime.now().UnixTimestamp
	local IsGoing = Event.userRsvpStatus == "going"
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: IsUnixTimestampBelow (copy), FooterCornerButtonStyle (upval), IsGoing (copy)
		return if IsUnixTimestampBelow then FooterCornerButtonStyle.Play elseif IsGoing then FooterCornerButtonStyle.Following else FooterCornerButtonStyle.Follow
	end, { IsUnixTimestampBelow, IsGoing })
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(UseRoactServiceResult, p1.Event.universeId or "")
	local IsPlayButtonStateMatch: boolean = UsePlayButtonStateResult.playButtonState == PlayButtonStates.Playable or GetFFlagIsSquadEnabledFunction() and UsePlayButtonStateResult.playButtonState == PlayButtonStates.PlayableWithParty
	local UseLocalizationResult = UseLocalizationFunction({
		HappeningNow = "Feature.Home.Label.HappeningNow",
		DateAtTime = "Feature.VirtualEvents.Label.DateAtTime",
		ToastText = "Feature.VirtualEvents.Label.ReminderSetForEventTime"
	})
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: IsPlayButtonStateMatch (copy), IsUnixTimestampBelow (copy), p1 (copy), Event (copy)
		if not IsPlayButtonStateMatch then return end
		if IsUnixTimestampBelow then
			p1.onJoinEvent(Event)
			
			return
		end
		local NotGoing: string = if Event.userRsvpStatus == "going" then "notGoing" else "going"
		
		if p1.onRsvpChanged then
			p1.onRsvpChanged(Event, NotGoing)
		end
	end, {
		IsUnixTimestampBelow, p1.onJoinEvent, p1.onRsvpChanged, Event.userRsvpStatus,
		Event, IsPlayButtonStateMatch
	})
	local UseRefResult = ReactModule.useRef(Event.userRsvpStatus)
	UseEffectFunction(function()
		-- upvalues: FFlagLuaAppSduiEventDetailsEnabled (upval), p1 (copy), UseRefResult (copy), Event (copy), FormatDateLocalizedModule (upval), UseLocalizationResult (copy), VirtualEventDatesModule (copy), NotificationModalsManagerModule (upval)
		if (not FFlagLuaAppSduiEventDetailsEnabled or not p1.suppressRsvpReminderToastBecauseEventDetailsFocused) and UseRefResult.current and UseRefResult.current ~= "going" and Event.userRsvpStatus == "going" then
			NotificationModalsManagerModule.SetUIBloxToast({
				toastTitle = UseLocalizationResult.ToastText:gsub("{(.-)}", {
					eventName = Event.displayTitle,
					eventTime = FormatDateLocalizedModule(UseLocalizationResult.DateAtTime, VirtualEventDatesModule.startDate)
				}),
				sequenceNumber = DateTime.now().UnixTimestamp
			})
		end
		UseRefResult.current = Event.userRsvpStatus
	end, {
		Event.userRsvpStatus, Event.displayTitle, VirtualEventDatesModule.startDate,
		UseLocalizationResult.DateAtTime, UseLocalizationResult.ToastText,
		if FFlagLuaAppSduiEventDetailsEnabled then p1.suppressRsvpReminderToastBecauseEventDetailsFocused else nil
	})
	local UseStateResult, UseStateResult2 = UseStateFunction(nil)
	UseEffectFunction(function()
		-- upvalues: FetchEventThumbnailModule (upval), UseRoactServiceResult (copy), Event (copy), p1 (copy), UseStateResult2 (copy)
		local Flag = true
		FetchEventThumbnailModule(UseRoactServiceResult, Event.id, p1.DefaultThumbnail):andThen(function(Result)
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if Flag then
				UseStateResult2(Result)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, { Event.id, p1.DefaultThumbnail })
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult1 (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult1, p1.impressionsTag, p1.layoutOrder)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult1 (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult1, p1.impressionsTag, p1.layoutOrder)
		end
	end, { UseRefResult1, p1.impressionsTag, p1.layoutOrder })
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult3 (copy)
		UseRefResult3.current = Current
	end, {})
	local IsRsvpDisabled = nil
	local IsJoinEventDisabled = nil
	
	if FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
		local EventCtaButtonStateModule = GetEventCtaButtonStateModule(UsePlayButtonStateResult)
		IsJoinEventDisabled = EventCtaButtonStateModule.isJoinEventDisabled
		IsRsvpDisabled = EventCtaButtonStateModule.isRsvpDisabled
	end
	local v1 = nil
	local HoldToNotifyMe = nil
	
	if UseMemoResult == FooterCornerButtonStyle.Follow then
		HoldToNotifyMe = FocusNavigationEventNameEnum.HoldToNotifyMe
		
		if FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
			v1 = IsRsvpDisabled
		end
	elseif UseMemoResult == FooterCornerButtonStyle.Following then
		HoldToNotifyMe = FocusNavigationEventNameEnum.HoldToUnfollowEvent
		
		if FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
			v1 = IsRsvpDisabled
		end
	else
		HoldToNotifyMe = FocusNavigationEventNameEnum.HoldToJoinEvent
		
		if FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
			v1 = IsJoinEventDisabled
		end
	end
	local UseCallbackResult1 = if FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable and v1 then v23 else UseCallbackResult
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = p1.size,
		ref = UseRefResult1
	}, {
		GameTile = ReactModule.createElement(GameTileView, {
			imageAspectRatio = 1.7777777777777777,
			isContained = true,
			hidePlayButton = true,
			isHovered = false,
			forwardRef = UseRefResult2,
			image = UseStateResult,
			Size = UDim2.fromScale(1, 1),
			title = Event.displayTitle or "",
			onActivated = UseCallbackFunction(function()
				-- upvalues: UseRefResult3 (copy), p1 (copy)
				if not UseRefResult3.current then
					p1.onTileActivated(p1.Event)
					
					return
				end
			end, { p1.onTileActivated, p1.Event }),
			footerMetadata = ReactModule.createElement(GridTileTextFooter, {
				useLargerFont = true,
				text = Event.displaySubtitle or (Event.displayDescription or "")
			}),
			thumbnailOverlay = ReactModule.createElement(GameTileThumbnailBadges, {
				tileBadgesByPosition = {
					ImageTopLeft = {
						{
							tileBadgeType = "Text",
							text = if IsUnixTimestampBelow then UseLocalizationResult.HappeningNow else FormatDateLocalizedModule(UseLocalizationResult.DateAtTime, VirtualEventDatesModule.startDate)
						}
					}
				}
			}),
			extraFooterSpace = if p1.disableButtons then nil else UseDesignTokensResult.Size.Size_700 + UseDesignTokensResult.Size.Size_200,
			extraFooterContent = if p1.disableButtons then nil else ReactModule.createElement(EventWideFooterButtonModule, {
				key = "WideFooterButton",
				buttonStyle = UseMemoResult,
				disabled = if FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then v1 else not IsPlayButtonStateMatch,
				onActivated = if FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then UseCallbackResult1 else UseCallbackResult
			}),
			textSizeOffset = UseTextSizeOffsetResult
		}),
		HoldDetector = if UseRefResult2 and UseRefResult2.current then ReactModule.createElement(HoldDetector, {
			guiObject = UseRefResult2.current,
			onHoldDetected = if FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then UseCallbackResult1 else UseCallbackResult,
			setDisabledForHold = UseResult,
			keyCode = Enum.KeyCode.ButtonA,
			focusNavigationEventName = HoldToNotifyMe
		}) else nil
	})
end