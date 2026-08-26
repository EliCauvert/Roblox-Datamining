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

local function _()
	-- upvalues: thirdPartyUserService (ref)
	return thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
end

local var1 = function(p1)
	-- upvalues: reactModule (ref), fFlagStreamNotificationDropdownSingleOwner (ref), fFlagStreamNotificationDropdownFocusedOwner (ref), httpService (ref), streamNotificationStoreModule (ref), fFlagEnableNotificationsDeeplink (ref), useSignalState (ref), streamNotificationDropdownExperimentationModule (ref), useTokens (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref), constantsModule (ref), fFlagStreamNotificationBellEntryPoint (ref), streamNotificationsModule (ref), getFFlagNotificationsComplianceShouldRestrictStream (ref), thirdPartyUserService (ref), ixpHelper (ref), getFStringNotificationsStreamNotificationUXLayer (ref), fFlagEnableHeaderBarButtonsUpdate (ref), foundationModule (ref), isAppNavEnabled (ref), popover (ref), popoverSide (ref), popoverAlign (ref), notificationOff (ref), utilityActionIcon (ref), iconButton (ref), iconSize (ref), badge (ref), badgeVariant (ref)
	local var2, var3 = reactModule.useState(false)
	local current = nil
	
	if fFlagStreamNotificationDropdownSingleOwner then
		local var4 = reactModule.useRef(nil)
		
		if var4.current == nil then
			var4.current = if fFlagStreamNotificationDropdownFocusedOwner then httpService:GenerateGUID(false) elseif p1.isPrimary then streamNotificationStoreModule.PrimaryBellId else httpService:GenerateGUID(false)
		end
		current = var4.current
	end
	local var5 = var2
	local var6 = nil
	local var7 = p1.isFocused ~= false
	local var8 = var2
	
	if fFlagEnableNotificationsDeeplink then
		var5 = useSignalState(streamNotificationStoreModule.getStreamPresented)
		
		if fFlagStreamNotificationDropdownSingleOwner then
			var6 = useSignalState(streamNotificationStoreModule.getActiveBellId)
			var8 = if fFlagStreamNotificationDropdownFocusedOwner then streamNotificationStoreModule.isBellActive(var5, var6, current, p1.isPrimary, var7) else streamNotificationStoreModule.isBellActive(var5, var6, current, p1.isPrimary)
		else
			var8 = var5
		end
	end
	if fFlagStreamNotificationDropdownFocusedOwner and not var7 then
		var8 = false
	end
	local dropdownEnabled = streamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local var9 = useTokens()
	local notificationCount = p1.notificationCount and tonumber(p1.notificationCount) or 0
	local layoutOrder = p1.layoutOrder
	local var10 = if p1.compactWidth then 34 else 44
	
	if fFlagStreamNotificationDropdownFocusedOwner then
		reactModule.useEffect(function()
			-- upvalues: var7 (ref), fFlagEnableNotificationsDeeplink (copy), var6 (write), current (write), var5 (write), streamNotificationStoreModule (copy), var2 (ref), var3 (ref)
			if var7 then return end
			if fFlagEnableNotificationsDeeplink and var6 == current then
				if var5 then
					streamNotificationStoreModule.setActiveBellId(nil)
					streamNotificationStoreModule.setStreamPresented(false)
					
					return
				end
				streamNotificationStoreModule.setActiveBellId(streamNotificationStoreModule.PrimaryBellId)
				
				return
			elseif not fFlagEnableNotificationsDeeplink and var2 then
				var3(false)
			end
		end, {
			var6,
			current,
			var7,
			var5,
			var2
		})
	end
	reactModule.useEffect(function()
		-- upvalues: notificationCount (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), constantsModule (copy), fFlagStreamNotificationBellEntryPoint (copy), p1 (ref)
		if notificationCount > 0 then
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.seen, analyticsConstantsModule.EventNames.openCTAShown, {
				count = notificationCount,
				sendrVersion = constantsModule.SENDRVersion,
				entryPoint = if fFlagStreamNotificationBellEntryPoint then p1.entryPoint else nil
			})
		end
	end, { notificationCount })
	local var11 = reactModule.useMemo(function()
		-- upvalues: var8 (write), reactModule (copy), streamNotificationsModule (copy), fFlagEnableNotificationsDeeplink (copy), streamNotificationStoreModule (copy), var3 (ref)
		return if var8 then reactModule.createElement(streamNotificationsModule, {
			displayStream = if fFlagEnableNotificationsDeeplink then streamNotificationStoreModule.setStreamPresented else var3
		}) else nil
	end, { var8 })
	
	if getFFlagNotificationsComplianceShouldRestrictStream() and p1.shouldRestrictStream then
		return nil
	end
	local var12 = if thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted) then nil elseif notificationCount > 0 then notificationCount else nil
	
	local function onBellActivated()
		-- upvalues: streamNotificationDropdownExperimentationModule (copy), ixpHelper (copy), getFStringNotificationsStreamNotificationUXLayer (copy), dropdownEnabled (ref), fFlagEnableNotificationsDeeplink (copy), fFlagStreamNotificationDropdownSingleOwner (copy), streamNotificationStoreModule (copy), var8 (write), current (write), var3 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), notificationCount (ref), constantsModule (copy), fFlagStreamNotificationBellEntryPoint (copy), p1 (ref)
		streamNotificationDropdownExperimentationModule.logExposure()
		ixpHelper.logUserLayerExposure(getFStringNotificationsStreamNotificationUXLayer())
		
		if dropdownEnabled then
			if fFlagEnableNotificationsDeeplink then
				if fFlagStreamNotificationDropdownSingleOwner then
					streamNotificationStoreModule.setActiveBellId(if var8 then nil else current)
				end
				streamNotificationStoreModule.setStreamPresented(not var8)
			else
				var3(not var8)
			end
			if var8 then
				notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeContent, {
					closeMethod = analyticsConstantsModule.CloseMethod.bellIcon
				})
				
				return
			end
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.openContent, {
				countOfUnreadNotification = notificationCount,
				sendrVersion = constantsModule.SENDRVersion,
				entryPoint = if fFlagStreamNotificationBellEntryPoint then p1.entryPoint else nil
			})
			
			return
		elseif fFlagEnableNotificationsDeeplink then
			if fFlagStreamNotificationDropdownSingleOwner then
				streamNotificationStoreModule.setActiveBellId(current)
			end
			streamNotificationStoreModule.setStreamPresented(true)
		else
			var3(true)
		end
		notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.openContent, {
			countOfUnreadNotification = notificationCount,
			sendrVersion = constantsModule.SENDRVersion,
			entryPoint = if fFlagStreamNotificationBellEntryPoint then p1.entryPoint else nil
		})
	end
	
	local function onPopoverDismiss()
		-- upvalues: fFlagEnableNotificationsDeeplink (copy), fFlagStreamNotificationDropdownSingleOwner (copy), streamNotificationStoreModule (copy), var3 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy)
		if fFlagEnableNotificationsDeeplink then
			if fFlagStreamNotificationDropdownSingleOwner then
				streamNotificationStoreModule.setActiveBellId(nil)
			end
			streamNotificationStoreModule.setStreamPresented(false)
		else
			var3(false)
		end
		notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeContent, {
			closeMethod = analyticsConstantsModule.CloseMethod.backgroundOverlay
		})
	end
	
	if fFlagEnableHeaderBarButtonsUpdate then
		local var13 = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy radius-circle",
			LayoutOrder = layoutOrder or 3,
			ref = p1.buttonRef,
			testId = p1.testId
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
				variant = if not foundationModule.Utility.Flags.FoundationStatusIndicatorVariantExperiment then foundationModule.Enums.StatusIndicatorVariant.Emphasis else foundationModule.Enums.StatusIndicatorVariant.Alert,
				value = notificationCount
			}) else nil,
			DisplayStreamNotifications = if not dropdownEnabled then var11 else nil
		})
		
		return if isAppNavEnabled() and dropdownEnabled then reactModule.createElement(popover.Root, { isOpen = var8 }, {
			Anchor = reactModule.createElement(popover.Anchor, nil, { BellIcon = var13 }),
			Content = reactModule.createElement(popover.Content, {
				hasArrow = true,
				side = popoverSide.Bottom,
				align = popoverAlign.End,
				onPressedOutside = onPopoverDismiss,
				backgroundStyle = var9.Color.Surface.Surface_200
			}, { DisplayStreamNotifications = var11 })
		}) else var13
	elseif not isAppNavEnabled() then
		return reactModule.createElement(iconButton, {
			size = UDim2.new(0, var10, 1, 0),
			icon = notificationOff,
			iconSize = iconSize.Medium,
			layoutOrder = layoutOrder or 3,
			onActivated = onBellActivated,
			buttonRef = p1.buttonRef
		}, {
			notificationBadge = if thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted) then nil elseif notificationCount > 0 then reactModule.createElement(badge, {
				position = UDim2.new(0.5, 0, 0.5, 0),
				anchorPoint = Vector2.new(0, 1),
				value = notificationCount,
				badgeVariant = badgeVariant.Alert
			}) else nil
		}, { var11 })
	end
	local var14 = if dropdownEnabled and var8 then constantsModule.Dropdown.BellIconOpen else notificationOff
	
	return if dropdownEnabled then reactModule.createElement(popover.Root, { isOpen = var8 }, {
		Anchor = reactModule.createElement(popover.Anchor, nil, {
			BellIcon = reactModule.createElement(utilityActionIcon, {
				icon = var14,
				onActivated = onBellActivated,
				badgeValue = var12,
				buttonRef = p1.buttonRef
			})
		}),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = true,
			side = popoverSide.Bottom,
			align = popoverAlign.End,
			onPressedOutside = onPopoverDismiss,
			backgroundStyle = var9.Color.Surface.Surface_200
		}, { DisplayStreamNotifications = var11 })
	}) else reactModule.createElement(utilityActionIcon, {
		icon = var14,
		onActivated = onBellActivated,
		badgeValue = var12,
		buttonRef = p1.buttonRef
	}, { DisplayStreamNotifications = var11 })
end

if getFFlagNotificationsComplianceShouldRestrictStream() then
	var1 = roactAppPolicy.connect(function(p1, _)
		return {
			shouldRestrictStream = p1.getNotificationsCanReceiveStream() or false
		}
	end)(var1)
end
return var1