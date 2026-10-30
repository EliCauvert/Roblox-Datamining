local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local ReactModule = require(Parent.React)
local StreamNotificationsModule = require(StreamNotifications.StreamNotifications)
local StreamNotificationStoreModule = require(StreamNotifications.StreamNotificationStore)
local SharedFlagsModule = require(Parent.SharedFlags)
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local HttpService = game:GetService("HttpService")
local UIBloxModule = require(Parent.UIBlox)
local Badge = UIBloxModule.App.Indicator.Badge
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.Constant.IconSize
local BadgeVariant = UIBloxModule.App.Indicator.Enum.BadgeVariant
local UtilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local FoundationModule = require(Parent.Foundation)
local Popover = FoundationModule.Popover
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local UseTokensFunction = FoundationModule.Hooks.useTokens
local EventStream = require(StreamNotifications.analytics.analyticsService).EventStream
local NotificationHelper = require(Parent.NotificationsCommon).NotificationHelper
local IxpHelper = require(Parent.NotificationsCommon).ixpHelper
local ConstantsModule = require(StreamNotifications.constants)
local AnalyticsConstantsModule = require(StreamNotifications.analytics.analyticsConstants)
local GetFStringNotificationsStreamNotificationUXLayerFunction = require(Parent.SharedFlags).GetFStringNotificationsStreamNotificationUXLayer
local IsAppNavEnabledFunction = require(Parent.SharedFlags).isAppNavEnabled
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local StreamNotificationDropdownExperimentationModule = require(StreamNotifications.StreamNotificationDropdownExperimentation)
local RoactAppPolicy = require(Parent.UniversalAppPolicy).RoactAppPolicy
local GetFFlagNotificationsComplianceShouldRestrictStreamFunction = SharedFlagsModule.GetFFlagNotificationsComplianceShouldRestrictStream
local FFlagEnableNotificationsDeeplink = SharedFlagsModule.FFlagEnableNotificationsDeeplink
local FFlagStreamNotificationBellEntryPoint = SharedFlagsModule.FFlagStreamNotificationBellEntryPoint
local FFlagSignalsNavP3bTopBar = SharedFlagsModule.FFlagSignalsNavP3bTopBar
local FFlagEnableHeaderBarButtonsUpdate = SharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local FFlagStreamNotificationDropdownSingleOwner = SharedFlagsModule.FFlagStreamNotificationDropdownSingleOwner
local FFlagStreamNotificationDropdownFocusedOwner = SharedFlagsModule.FFlagStreamNotificationDropdownFocusedOwner
local IconsCommonNotificationOff = UIBloxModule.App.ImageSet.Images["icons/common/notificationOff"]

local function _(): boolean
	-- upvalues: ThirdPartyUserService (copy)
	return ThirdPartyUserService and (ThirdPartyUserService:IsChatRestrictionSupported() and ThirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
end

local function v33(p1)
	-- upvalues: ReactModule (copy), FFlagStreamNotificationDropdownSingleOwner (copy), FFlagStreamNotificationDropdownFocusedOwner (copy), HttpService (copy), StreamNotificationStoreModule (copy), FFlagEnableNotificationsDeeplink (copy), UseSignalStateFunction (copy), StreamNotificationDropdownExperimentationModule (copy), UseTokensFunction (copy), FFlagStreamNotificationBellEntryPoint (copy), FFlagSignalsNavP3bTopBar (copy), NotificationHelper (copy), EventStream (copy), AnalyticsConstantsModule (copy), ConstantsModule (copy), StreamNotificationsModule (copy), GetFFlagNotificationsComplianceShouldRestrictStreamFunction (copy), ThirdPartyUserService (copy), IxpHelper (copy), GetFStringNotificationsStreamNotificationUXLayerFunction (copy), FFlagEnableHeaderBarButtonsUpdate (copy), FoundationModule (copy), IsAppNavEnabledFunction (copy), Popover (copy), PopoverSide (copy), PopoverAlign (copy), IconsCommonNotificationOff (copy), UtilityActionIcon (copy), IconButton (copy), IconSize (copy), Badge (copy), BadgeVariant (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Current = nil
	
	if FFlagStreamNotificationDropdownSingleOwner then
		local UseRefResult = ReactModule.useRef(nil)
		
		if UseRefResult.current == nil then
			UseRefResult.current = if FFlagStreamNotificationDropdownFocusedOwner then HttpService:GenerateGUID(false) elseif p1.isPrimary then StreamNotificationStoreModule.PrimaryBellId else HttpService:GenerateGUID(false)
		end
		Current = UseRefResult.current
	end
	local UseStateResult1 = UseStateResult
	local Current1 = nil
	local IsIsFocused = p1.isFocused ~= false
	local IsOpen = UseStateResult
	
	if FFlagEnableNotificationsDeeplink then
		UseStateResult1 = UseSignalStateFunction(StreamNotificationStoreModule.getStreamPresented)
		
		if FFlagStreamNotificationDropdownSingleOwner then
			Current1 = UseSignalStateFunction(StreamNotificationStoreModule.getActiveBellId)
			IsOpen = if FFlagStreamNotificationDropdownFocusedOwner then StreamNotificationStoreModule.isBellActive(UseStateResult1, Current1, Current, p1.isPrimary, IsIsFocused) else StreamNotificationStoreModule.isBellActive(UseStateResult1, Current1, Current, p1.isPrimary)
		else
			IsOpen = UseStateResult1
		end
	end
	if FFlagStreamNotificationDropdownFocusedOwner and not IsIsFocused then
		IsOpen = false
	end
	local DropdownEnabled = StreamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local UseTokensResult = UseTokensFunction()
	local Number: number = p1.notificationCount and tonumber(p1.notificationCount) or 0
	local LayoutOrder = p1.layoutOrder
	local XOffset: number = if p1.compactWidth then 34 else 44
	
	if FFlagStreamNotificationDropdownFocusedOwner then
		ReactModule.useEffect(function()
			-- upvalues: IsIsFocused (copy), FFlagEnableNotificationsDeeplink (upval), Current1 (ref), Current (ref), UseStateResult1 (ref), StreamNotificationStoreModule (upval), UseStateResult (copy), UseStateResult2 (copy)
			if IsIsFocused then return end
			if FFlagEnableNotificationsDeeplink and Current1 == Current then
				if UseStateResult1 then
					StreamNotificationStoreModule.setActiveBellId(nil)
					StreamNotificationStoreModule.setStreamPresented(false)
					
					return
				else
					StreamNotificationStoreModule.setActiveBellId(StreamNotificationStoreModule.PrimaryBellId)
					
					return
				end
			elseif not FFlagEnableNotificationsDeeplink and UseStateResult then
				UseStateResult2(false)
			end
		end, {
			Current1,
			Current,
			IsIsFocused,
			UseStateResult1,
			UseStateResult
		})
	end
	local function _()
		-- upvalues: FFlagStreamNotificationBellEntryPoint (upval), FFlagSignalsNavP3bTopBar (upval), p1 (copy)
		return if FFlagStreamNotificationBellEntryPoint then if FFlagSignalsNavP3bTopBar and p1.getEntryPoint then p1.getEntryPoint() else p1.entryPoint else nil
	end
	
	ReactModule.useEffect(function()
		-- upvalues: Number (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), ConstantsModule (upval), FFlagStreamNotificationBellEntryPoint (upval), FFlagSignalsNavP3bTopBar (upval), p1 (copy)
		if Number > 0 then
			NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.seen, AnalyticsConstantsModule.EventNames.openCTAShown, {
				count = Number,
				sendrVersion = ConstantsModule.SENDRVersion,
				entryPoint = if FFlagStreamNotificationBellEntryPoint then if FFlagSignalsNavP3bTopBar and p1.getEntryPoint then p1.getEntryPoint() else p1.entryPoint else nil
			})
		end
	end, { Number })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsOpen (ref), ReactModule (upval), StreamNotificationsModule (upval), FFlagEnableNotificationsDeeplink (upval), StreamNotificationStoreModule (upval), UseStateResult2 (copy)
		return if IsOpen then ReactModule.createElement(StreamNotificationsModule, {
			displayStream = if FFlagEnableNotificationsDeeplink then StreamNotificationStoreModule.setStreamPresented else UseStateResult2
		}) else nil
	end, { IsOpen })
	
	if GetFFlagNotificationsComplianceShouldRestrictStreamFunction() and p1.shouldRestrictStream then
		return nil
	end
	local IsNotFriendCommunicationRestrictionStatusMatch: boolean = ThirdPartyUserService and (ThirdPartyUserService:IsChatRestrictionSupported() and ThirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
	local Number1 = if IsNotFriendCommunicationRestrictionStatusMatch then nil elseif Number > 0 then Number else nil
	
	local function onBellActivated()
		-- upvalues: StreamNotificationDropdownExperimentationModule (upval), IxpHelper (upval), GetFStringNotificationsStreamNotificationUXLayerFunction (upval), DropdownEnabled (copy), FFlagEnableNotificationsDeeplink (upval), FFlagStreamNotificationDropdownSingleOwner (upval), StreamNotificationStoreModule (upval), IsOpen (ref), Current (ref), UseStateResult2 (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), Number (copy), ConstantsModule (upval), FFlagStreamNotificationBellEntryPoint (upval), FFlagSignalsNavP3bTopBar (upval), p1 (copy)
		StreamNotificationDropdownExperimentationModule.logExposure()
		IxpHelper.logUserLayerExposure(GetFStringNotificationsStreamNotificationUXLayerFunction())
		
		if DropdownEnabled then
			if FFlagEnableNotificationsDeeplink then
				if FFlagStreamNotificationDropdownSingleOwner then
					StreamNotificationStoreModule.setActiveBellId(if IsOpen then nil else Current)
				end
				StreamNotificationStoreModule.setStreamPresented(not IsOpen)
			else
				UseStateResult2(not IsOpen)
			end
			if IsOpen then
				NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.closeContent, {
					closeMethod = AnalyticsConstantsModule.CloseMethod.bellIcon
				})
			else
				NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.openContent, {
					countOfUnreadNotification = Number,
					sendrVersion = ConstantsModule.SENDRVersion,
					entryPoint = if FFlagStreamNotificationBellEntryPoint then if FFlagSignalsNavP3bTopBar and p1.getEntryPoint then p1.getEntryPoint() else p1.entryPoint else nil
				})
			end
		else
			if FFlagEnableNotificationsDeeplink then
				if FFlagStreamNotificationDropdownSingleOwner then
					StreamNotificationStoreModule.setActiveBellId(Current)
				end
				StreamNotificationStoreModule.setStreamPresented(true)
			else
				UseStateResult2(true)
			end
			NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.openContent, {
				countOfUnreadNotification = Number,
				sendrVersion = ConstantsModule.SENDRVersion,
				entryPoint = if FFlagStreamNotificationBellEntryPoint then if FFlagSignalsNavP3bTopBar and p1.getEntryPoint then p1.getEntryPoint() else p1.entryPoint else nil
			})
		end
		if p1.onActivated then
			p1.onActivated()
		end
	end
	
	local function onPopoverDismiss()
		-- upvalues: FFlagEnableNotificationsDeeplink (upval), FFlagStreamNotificationDropdownSingleOwner (upval), StreamNotificationStoreModule (upval), UseStateResult2 (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval)
		if FFlagEnableNotificationsDeeplink then
			if FFlagStreamNotificationDropdownSingleOwner then
				StreamNotificationStoreModule.setActiveBellId(nil)
			end
			StreamNotificationStoreModule.setStreamPresented(false)
		else
			UseStateResult2(false)
		end
		NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.closeContent, {
			closeMethod = AnalyticsConstantsModule.CloseMethod.backgroundOverlay
		})
	end
	
	if FFlagEnableHeaderBarButtonsUpdate then
		local config = {
			IconButton = ReactModule.createElement(FoundationModule.IconButton, {
				ZIndex = 1,
				isCircular = true,
				icon = FoundationModule.Enums.IconName.Bell,
				onActivated = onBellActivated
			}),
			Badge = if IsNotFriendCommunicationRestrictionStatusMatch then nil elseif Number > 0 then ReactModule.createElement(FoundationModule.StatusIndicator, {
				ZIndex = 2,
				max = 99,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				variant = FoundationModule.Enums.StatusIndicatorVariant.Emphasis,
				value = Number
			}) else nil,
			DisplayStreamNotifications = if DropdownEnabled then nil else UseMemoResult
		}
		local IsNotFriendCommunicationRestrictionStatusMatch1: boolean = ThirdPartyUserService and (ThirdPartyUserService:IsChatRestrictionSupported() and ThirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
		local Element = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy radius-circle",
			LayoutOrder = LayoutOrder or 3,
			ref = p1.buttonRef,
			testId = p1.testId
		}, config)
		
		return if IsAppNavEnabledFunction() and DropdownEnabled then ReactModule.createElement(Popover.Root, { isOpen = IsOpen }, {
			Anchor = ReactModule.createElement(Popover.Anchor, nil, { BellIcon = Element }),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = true,
				side = PopoverSide.Bottom,
				align = PopoverAlign.End,
				onPressedOutside = onPopoverDismiss,
				backgroundStyle = UseTokensResult.Color.Surface.Surface_200
			}, { DisplayStreamNotifications = UseMemoResult })
		}) else Element
	elseif IsAppNavEnabledFunction() then
		local BellIconOpen = if DropdownEnabled and IsOpen then ConstantsModule.Dropdown.BellIconOpen else IconsCommonNotificationOff
		
		return if DropdownEnabled then ReactModule.createElement(Popover.Root, { isOpen = IsOpen }, {
			Anchor = ReactModule.createElement(Popover.Anchor, nil, {
				BellIcon = ReactModule.createElement(UtilityActionIcon, {
					icon = BellIconOpen,
					onActivated = onBellActivated,
					badgeValue = Number1,
					buttonRef = p1.buttonRef
				})
			}),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = true,
				side = PopoverSide.Bottom,
				align = PopoverAlign.End,
				onPressedOutside = onPopoverDismiss,
				backgroundStyle = UseTokensResult.Color.Surface.Surface_200
			}, { DisplayStreamNotifications = UseMemoResult })
		}) else ReactModule.createElement(UtilityActionIcon, {
			icon = BellIconOpen,
			onActivated = onBellActivated,
			badgeValue = Number1,
			buttonRef = p1.buttonRef
		}, { DisplayStreamNotifications = UseMemoResult })
	else
		local config = {
			notificationBadge = if IsNotFriendCommunicationRestrictionStatusMatch1 then nil elseif Number > 0 then ReactModule.createElement(Badge, {
				position = UDim2.new(0.5, 0, 0.5, 0),
				anchorPoint = Vector2.new(0, 1),
				value = Number,
				badgeVariant = BadgeVariant.Alert
			}) else nil
		}
		local IsNotFriendCommunicationRestrictionStatusMatch1: boolean = ThirdPartyUserService and (ThirdPartyUserService:IsChatRestrictionSupported() and ThirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
		
		return (ReactModule.createElement(IconButton, {
			size = UDim2.new(0, XOffset, 1, 0),
			icon = IconsCommonNotificationOff,
			iconSize = IconSize.Medium,
			layoutOrder = LayoutOrder or 3,
			onActivated = onBellActivated,
			buttonRef = p1.buttonRef
		}, config, { UseMemoResult }))
	end
end

if GetFFlagNotificationsComplianceShouldRestrictStreamFunction() then
	v33 = RoactAppPolicy.connect(function(p1, _)
		return {
			shouldRestrictStream = p1.getNotificationsCanReceiveStream() or false
		}
	end)(v33)
end
return v33