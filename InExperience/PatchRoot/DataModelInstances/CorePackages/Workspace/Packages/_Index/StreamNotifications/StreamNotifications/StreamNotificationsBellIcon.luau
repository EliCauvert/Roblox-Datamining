local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local reactModule = require(parent.React)
local streamNotificationsModule = require(streamNotifications.StreamNotifications)
local streamNotificationStoreModule = require(streamNotifications.StreamNotificationStore)
local sharedFlagsModule = require(parent.SharedFlags)
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local httpService = game:GetService("HttpService")
local UIBloxModule = require(parent.UIBlox)
local badge = UIBloxModule.App.Indicator.Badge
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.Constant.IconSize
local images = UIBloxModule.App.ImageSet.Images
local badgeVariant = UIBloxModule.App.Indicator.Enum.BadgeVariant
local utilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local foundationModule = require(parent.Foundation)
local popover = foundationModule.Popover
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local useTokens = foundationModule.Hooks.useTokens
local eventStream = require(streamNotifications.analytics.analyticsService).EventStream
local notificationHelper = require(parent.NotificationsCommon).NotificationHelper
local ixpHelper = require(parent.NotificationsCommon).ixpHelper
local constantsModule = require(streamNotifications.constants)
local analyticsConstantsModule = require(streamNotifications.analytics.analyticsConstants)
local getFStringNotificationsStreamNotificationUXLayer = require(parent.SharedFlags).GetFStringNotificationsStreamNotificationUXLayer
local isAppNavEnabled = require(parent.SharedFlags).isAppNavEnabled
local useSignalState = require(parent.SignalsReact).useSignalState
local streamNotificationDropdownExperimentationModule = require(streamNotifications.StreamNotificationDropdownExperimentation)
local roactAppPolicy = require(parent.UniversalAppPolicy).RoactAppPolicy
local getFFlagNotificationsComplianceShouldRestrictStream = sharedFlagsModule.GetFFlagNotificationsComplianceShouldRestrictStream
local fFlagEnableNotificationsDeeplink = sharedFlagsModule.FFlagEnableNotificationsDeeplink
local fFlagStreamNotificationBellEntryPoint = sharedFlagsModule.FFlagStreamNotificationBellEntryPoint
local fFlagEnableHeaderBarButtonsUpdate = sharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local fFlagStreamNotificationDropdownSingleOwner = sharedFlagsModule.FFlagStreamNotificationDropdownSingleOwner
local fFlagStreamNotificationDropdownFocusedOwner = sharedFlagsModule.FFlagStreamNotificationDropdownFocusedOwner
local notificationOff = images["icons/common/notificationOff"]

local function _() --[[ line: 46 | named "GetIsFriendCommunicationRestricted" ]]
	-- upvalues: thirdPartyUserService (ref)
	return thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
end

local var12 = function(p0) --[[ line: 66 ]]
	-- upvalues: reactModule (ref), fFlagStreamNotificationDropdownSingleOwner (ref), fFlagStreamNotificationDropdownFocusedOwner (ref), httpService (ref), streamNotificationStoreModule (ref), fFlagEnableNotificationsDeeplink (ref), useSignalState (ref), streamNotificationDropdownExperimentationModule (ref), useTokens (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref), constantsModule (ref), fFlagStreamNotificationBellEntryPoint (ref), streamNotificationsModule (ref), getFFlagNotificationsComplianceShouldRestrictStream (ref), thirdPartyUserService (ref), ixpHelper (ref), getFStringNotificationsStreamNotificationUXLayer (ref), fFlagEnableHeaderBarButtonsUpdate (ref), foundationModule (ref), isAppNavEnabled (ref), popover (ref), popoverSide (ref), popoverAlign (ref), notificationOff (ref), utilityActionIcon (ref), iconButton (ref), iconSize (ref), badge (ref), badgeVariant (ref)
	local var13, var14 = reactModule.useState(false)
	local current = nil
	
	if fFlagStreamNotificationDropdownSingleOwner then
		local var15 = reactModule.useRef(nil)
		
		if var15.current == nil then
			var15.current = if fFlagStreamNotificationDropdownFocusedOwner then httpService:GenerateGUID(false) elseif p0.isPrimary then streamNotificationStoreModule.PrimaryBellId else httpService:GenerateGUID(false)
		end
		current = var15.current
	end
	local var16 = var13
	local var17 = nil
	local var18 = p0.isFocused ~= false
	local var19 = var13
	
	if fFlagEnableNotificationsDeeplink then
		var16 = useSignalState(streamNotificationStoreModule.getStreamPresented)
		
		if fFlagStreamNotificationDropdownSingleOwner then
			var17 = useSignalState(streamNotificationStoreModule.getActiveBellId)
			var19 = if fFlagStreamNotificationDropdownFocusedOwner then streamNotificationStoreModule.isBellActive(var16, var17, current, p0.isPrimary, var18) else streamNotificationStoreModule.isBellActive(var16, var17, current, p0.isPrimary)
		else
			var19 = var16
		end
	end
	if fFlagStreamNotificationDropdownFocusedOwner and not var18 then
		var19 = false
	end
	local dropdownEnabled = streamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local var21 = useTokens()
	local notificationCount = p0.notificationCount and tonumber(p0.notificationCount) or 0
	local layoutOrder = p0.layoutOrder
	local var23 = if p0.compactWidth then 34 else 44
	
	if fFlagStreamNotificationDropdownFocusedOwner then
		reactModule.useEffect(function() --[[ line: 121 ]]
			-- upvalues: var18 (ref), fFlagEnableNotificationsDeeplink (copy), var17 (write), current (write), var16 (write), streamNotificationStoreModule (copy), var13 (ref), var14 (ref)
			if var18 then return end
			if fFlagEnableNotificationsDeeplink and var17 == current then
				if var16 then
					streamNotificationStoreModule.setActiveBellId(nil)
					streamNotificationStoreModule.setStreamPresented(false)
					
					return
				end
				streamNotificationStoreModule.setActiveBellId(streamNotificationStoreModule.PrimaryBellId)
				
				return
			elseif not fFlagEnableNotificationsDeeplink and var13 then
				var14(false)
			end
		end, {
			var17,
			current,
			var18,
			var16,
			var13
		})
	end
	reactModule.useEffect(function() --[[ line: 143 ]]
		-- upvalues: notificationCount (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), constantsModule (copy), fFlagStreamNotificationBellEntryPoint (copy), p0 (ref)
		if notificationCount > 0 then
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.seen, analyticsConstantsModule.EventNames.openCTAShown, {
				count = notificationCount,
				sendrVersion = constantsModule.SENDRVersion,
				entryPoint = if fFlagStreamNotificationBellEntryPoint then p0.entryPoint else nil
			})
		end
	end, { notificationCount })
	local var24 = reactModule.useMemo(function() --[[ line: 158 ]]
		-- upvalues: var19 (write), reactModule (copy), streamNotificationsModule (copy), fFlagEnableNotificationsDeeplink (copy), streamNotificationStoreModule (copy), var14 (ref)
		return if var19 then reactModule.createElement(streamNotificationsModule, {
			displayStream = if fFlagEnableNotificationsDeeplink then streamNotificationStoreModule.setStreamPresented else var14
		}) else nil
	end, { var19 })
	
	if getFFlagNotificationsComplianceShouldRestrictStream() and p0.shouldRestrictStream then
		return nil
	end
	local var25 = if thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted) then nil elseif notificationCount > 0 then notificationCount else nil
	
	local function onBellActivated() --[[ line: 186 ]]
		-- upvalues: streamNotificationDropdownExperimentationModule (copy), ixpHelper (copy), getFStringNotificationsStreamNotificationUXLayer (copy), dropdownEnabled (ref), fFlagEnableNotificationsDeeplink (copy), fFlagStreamNotificationDropdownSingleOwner (copy), streamNotificationStoreModule (copy), var19 (write), current (write), var14 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), notificationCount (ref), constantsModule (copy), fFlagStreamNotificationBellEntryPoint (copy), p0 (ref)
		streamNotificationDropdownExperimentationModule.logExposure()
		ixpHelper.logUserLayerExposure(getFStringNotificationsStreamNotificationUXLayer())
		
		if dropdownEnabled then
			if fFlagEnableNotificationsDeeplink then
				if fFlagStreamNotificationDropdownSingleOwner then
					streamNotificationStoreModule.setActiveBellId(if var19 then nil else current)
				end
				streamNotificationStoreModule.setStreamPresented(not var19)
			else
				var14(not var19)
			end
			if var19 then
				notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeContent, {
					closeMethod = analyticsConstantsModule.CloseMethod.bellIcon
				})
				
				return
			end
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.openContent, {
				countOfUnreadNotification = notificationCount,
				sendrVersion = constantsModule.SENDRVersion,
				entryPoint = if fFlagStreamNotificationBellEntryPoint then p0.entryPoint else nil
			})
			
			return
		elseif fFlagEnableNotificationsDeeplink then
			if fFlagStreamNotificationDropdownSingleOwner then
				streamNotificationStoreModule.setActiveBellId(current)
			end
			streamNotificationStoreModule.setStreamPresented(true)
		else
			var14(true)
		end
		notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.openContent, {
			countOfUnreadNotification = notificationCount,
			sendrVersion = constantsModule.SENDRVersion,
			entryPoint = if fFlagStreamNotificationBellEntryPoint then p0.entryPoint else nil
		})
	end
	
	local function onPopoverDismiss() --[[ line: 250 ]]
		-- upvalues: fFlagEnableNotificationsDeeplink (copy), fFlagStreamNotificationDropdownSingleOwner (copy), streamNotificationStoreModule (copy), var14 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy)
		if fFlagEnableNotificationsDeeplink then
			if fFlagStreamNotificationDropdownSingleOwner then
				streamNotificationStoreModule.setActiveBellId(nil)
			end
			streamNotificationStoreModule.setStreamPresented(false)
		else
			var14(false)
		end
		notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeContent, {
			closeMethod = analyticsConstantsModule.CloseMethod.backgroundOverlay
		})
	end
	
	if fFlagEnableHeaderBarButtonsUpdate then
		local var29 = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy radius-circle",
			LayoutOrder = layoutOrder or 3,
			ref = p0.buttonRef,
			testId = p0.testId
		}, {
			IconButton = reactModule.createElement(foundationModule.IconButton, {
				ZIndex = 1,
				isCircular = true,
				icon = foundationModule.Enums.IconName.Bell,
				onActivated = onBellActivated
			}),
			Badge = if thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted) then nil elseif notificationCount > 0 then reactModule.createElement(foundationModule.StatusIndicator, {
				ZIndex = 2,
				max = 99,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				variant = foundationModule.Enums.StatusIndicatorVariant.Alert,
				value = notificationCount
			}) else nil,
			DisplayStreamNotifications = if not dropdownEnabled then var24 else nil
		})
		
		return if isAppNavEnabled() and dropdownEnabled then reactModule.createElement(popover.Root, { isOpen = var19 }, {
			Anchor = reactModule.createElement(popover.Anchor, nil, { BellIcon = var29 }),
			Content = reactModule.createElement(popover.Content, {
				hasArrow = true,
				side = popoverSide.Bottom,
				align = popoverAlign.End,
				onPressedOutside = onPopoverDismiss,
				backgroundStyle = var21.Color.Surface.Surface_200
			}, { DisplayStreamNotifications = var24 })
		}) else var29
	elseif not isAppNavEnabled() then
		return reactModule.createElement(iconButton, {
			size = UDim2.new(0, var23, 1, 0),
			icon = notificationOff,
			iconSize = iconSize.Medium,
			layoutOrder = layoutOrder or 3,
			onActivated = onBellActivated,
			buttonRef = p0.buttonRef
		}, {
			notificationBadge = if thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted) then nil elseif notificationCount > 0 then reactModule.createElement(badge, {
				position = UDim2.new(0.5, 0, 0.5, 0),
				anchorPoint = Vector2.new(0, 1),
				value = notificationCount,
				badgeVariant = badgeVariant.Alert
			}) else nil
		}, { var24 })
	end
	local var28 = if dropdownEnabled and var19 then constantsModule.Dropdown.BellIconOpen else notificationOff
	
	return if dropdownEnabled then reactModule.createElement(popover.Root, { isOpen = var19 }, {
		Anchor = reactModule.createElement(popover.Anchor, nil, {
			BellIcon = reactModule.createElement(utilityActionIcon, {
				icon = var28,
				onActivated = onBellActivated,
				badgeValue = var25,
				buttonRef = p0.buttonRef
			})
		}),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = true,
			side = popoverSide.Bottom,
			align = popoverAlign.End,
			onPressedOutside = onPopoverDismiss,
			backgroundStyle = var21.Color.Surface.Surface_200
		}, { DisplayStreamNotifications = var24 })
	}) else reactModule.createElement(utilityActionIcon, {
		icon = var28,
		onActivated = onBellActivated,
		badgeValue = var25,
		buttonRef = p0.buttonRef
	}, { DisplayStreamNotifications = var24 })
end

if getFFlagNotificationsComplianceShouldRestrictStream() then
	var12 = roactAppPolicy.connect(function(p1, _) --[[ line: 383 ]]
		return {
			shouldRestrictStream = p1.getNotificationsCanReceiveStream() or false
		}
	end)(var12)
end
return var12