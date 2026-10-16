local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Components = StreamNotifications.components
local Parent = StreamNotifications.Parent
local ConstantsModule = require(StreamNotifications.constants)
local CryoModule = require(Parent.Cryo)
local NewResult = require(Parent.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))
local SessionService = game:GetService("SessionService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local EmptyNotificationsModule = require(Components.EmptyNotifications)
local MetaActionsMenuModule = require(Components.MetaActionsMenu)
local StreamNotificationAnimationWrapperModule = require(Components.StreamNotificationAnimationWrapper)
local StreamNotificationBundleWrapperModule = require(Components.StreamNotificationBundleWrapper)
local ReactModule = require(Parent.React)
local NotificationsCommonModule = require(Parent.NotificationsCommon)
local JoinExperienceFunction = NotificationsCommonModule.JoinExperience
local Type = NotificationsCommonModule.type
local NotificationHelper = NotificationsCommonModule.NotificationHelper
local EnumStreamNotificationsDisplayStateModule = require(StreamNotifications.EnumStreamNotificationsDisplayState)
local EnumStreamNotificationsLoadingMoreStateModule = require(StreamNotifications.EnumStreamNotificationsLoadingMoreState)
local HttpRequestModule = require(Parent.HttpRequest)
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("StreamNotificationsContentHttpRetryCount", 4) else nil
})
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseClientTriggerEventHandlerModule = require(StreamNotifications.eventHandler.useClientTriggerEventHandler)
local GetStreamNotificationsModule = require(StreamNotifications.utils.getStreamNotifications)
local ClearUnreadNotificationsModule = require(StreamNotifications.utils.clearUnreadNotifications)
local PostNotificationsApiModule = require(StreamNotifications.utils.postNotificationsApi)
local PostReportNotificationModule = require(StreamNotifications.utils.postReportNotification)
local ReportEventModule = require(StreamNotifications.utils.reportEvent)
local SortNotificationsModule = require(StreamNotifications.utils.sortNotifications)
local EventStream = require(StreamNotifications.analytics.analyticsService).EventStream
local AnalyticsConstantsModule = require(StreamNotifications.analytics.analyticsConstants)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local LuaAppNewStreamNotificationsLogFix = game:DefineFastFlag("LuaAppNewStreamNotificationsLogFix", false)
local StreamNotificationFixInitialPageFill = game:DefineFastFlag("StreamNotificationFixInitialPageFill", false)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFStringPCGDKFilteredNotificationTypesFunction = SharedFlagsModule.GetFStringPCGDKFilteredNotificationTypes
local FFlagStreamNotificationsStandardizeClickEvents = SharedFlagsModule.FFlagStreamNotificationsStandardizeClickEvents
local FFlagStreamNotificationImpressionLogging = SharedFlagsModule.FFlagStreamNotificationImpressionLogging
local FrameBoundsImpressionsTracker = require(Parent.Impressions).FrameBoundsImpressionsTracker

local function _(): boolean --[[ Line: 77 | Named "GetIsFriendCommunicationRestricted" ]]
	-- upvalues: ThirdPartyUserService (copy)
	return ThirdPartyUserService and (ThirdPartyUserService:IsChatRestrictionSupported() and ThirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
end

local StreamNotificationDropdownExperimentationModule = require(StreamNotifications.StreamNotificationDropdownExperimentation)

local function createImpressionSignal() --[[ Line: 113 ]]
	local BindableEvent = Instance.new("BindableEvent")
	
	return {
		connect = function(_, Callback) --[[ Line: 116 ]]
			-- upvalues: BindableEvent (copy)
			return BindableEvent.Event:Connect(Callback)
		end,
		fire = function() --[[ Line: 119 ]]
			-- upvalues: BindableEvent (copy)
			BindableEvent:Fire()
		end,
		destroy = function() --[[ Line: 122 ]]
			-- upvalues: BindableEvent (copy)
			BindableEvent:Destroy()
		end
	}
end

return function(p1) --[[ Line: 128 ]]
	-- upvalues: UseStyleFunction (copy), StreamNotificationDropdownExperimentationModule (copy), UseDispatchFunction (copy), UseClientTriggerEventHandlerModule (copy), ReactModule (copy), EnumStreamNotificationsDisplayStateModule (copy), EnumStreamNotificationsLoadingMoreStateModule (copy), FFlagStreamNotificationImpressionLogging (copy), createImpressionSignal (copy), UserInputService (copy), ConstantsModule (copy), GetStreamNotificationsModule (copy), ConfigResult (copy), SortNotificationsModule (copy), GetFStringPCGDKFilteredNotificationTypesFunction (copy), ThirdPartyUserService (copy), StreamNotificationFixInitialPageFill (copy), CryoModule (copy), NotificationHelper (copy), EventStream (copy), AnalyticsConstantsModule (copy), FFlagStreamNotificationsStandardizeClickEvents (copy), ClearUnreadNotificationsModule (copy), PostReportNotificationModule (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), LuaAppNewStreamNotificationsLogFix (copy), Type (copy), JoinExperienceFunction (copy), SessionService (copy), ReportEventModule (copy), NewResult (copy), PostNotificationsApiModule (copy), NotificationsCommonModule (copy), MetaActionsMenuModule (copy), Loading (copy), IconSize (copy), StreamNotificationBundleWrapperModule (copy), StreamNotificationAnimationWrapperModule (copy), EmptyNotificationsModule (copy), GuiService (copy), FrameBoundsImpressionsTracker (copy)
	local UseStyleResult = UseStyleFunction()
	local DropdownEnabled = StreamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local UseDispatchResult = UseDispatchFunction()
	local UseClientTriggerEventHandlerModuleResult = UseClientTriggerEventHandlerModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(EnumStreamNotificationsDisplayStateModule.Initializing)
	local Callback = nil
	local Callback1 = nil
	local Callback2 = nil
	local ShowOverlay = p1.showOverlay or function(_) --[[ Line: 149 ]] end
	local UseRefResult = ReactModule.useRef(EnumStreamNotificationsLoadingMoreStateModule.Loading)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(EnumStreamNotificationsLoadingMoreStateModule.Loading)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef({})
	local UseRefResult3 = ReactModule.useRef(0)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(if FFlagStreamNotificationImpressionLogging then createImpressionSignal() else nil)
	local NewHeaderHeight = ConstantsModule.Modal.HeaderHeight + (if UserInputService.StatusBarSize then UserInputService.StatusBarSize.Y else 0)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 169 ]]
		-- upvalues: FFlagStreamNotificationImpressionLogging (upval), UseStateResult (copy)
		if not FFlagStreamNotificationImpressionLogging then
			return { byNotificationId = {}, byIndex = {} }
		end
		local ByNotificationId = {}
		local ByIndex = {}
		local BundlePositions = {}
		
		for ImpressionIndex, Notification in ipairs(UseStateResult) do
			if Notification.notificationSourceType == "Sendr" then
				local BundleKey = Notification.content.bundleKey
				local BundlePosition: number? = nil
				
				if BundleKey and BundleKey ~= "" then
					BundlePosition = (BundlePositions[BundleKey] or 0) + 1
					BundlePositions[BundleKey] = BundlePosition
				end
				local config = {
					impressionIndex = ImpressionIndex,
					bundlePosition = BundlePosition,
					notification = Notification
				}
				ByIndex[ImpressionIndex] = config
				
				if Notification.id then
					ByNotificationId[Notification.id] = config
				end
			end
		end
		return { byNotificationId = ByNotificationId, byIndex = ByIndex }
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 206 ]]
		-- upvalues: Callback (ref)
		Callback()
	end, {})
	ReactModule.useEffect(function() --[[ Line: 210 ]]
		-- upvalues: FFlagStreamNotificationImpressionLogging (upval), UseRefResult5 (copy)
		if not FFlagStreamNotificationImpressionLogging then return end
		return function() --[[ Line: 214 ]]
			-- upvalues: UseRefResult5 (upval)
			if UseRefResult5.current then
				UseRefResult5.current:destroy()
			end
		end
	end, {})
	
	local function _(Current) --[[ Line: 221 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2_3 (copy)
		UseRefResult.current = Current
		UseStateResult2_3(Current)
	end
	
	Callback = function() --[[ Line: 226 ]]
		-- upvalues: UseRefResult (copy), EnumStreamNotificationsLoadingMoreStateModule (upval), UseStateResult2_3 (copy), GetStreamNotificationsModule (upval), ConfigResult (upval), ConstantsModule (upval), UseRefResult1 (copy), SortNotificationsModule (upval), GetFStringPCGDKFilteredNotificationTypesFunction (upval), ThirdPartyUserService (upval), StreamNotificationFixInitialPageFill (upval), UseRefResult2 (copy), UseRefResult3 (copy), UseStateResult2 (copy), CryoModule (upval), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), FFlagStreamNotificationsStandardizeClickEvents (upval), UseStateResult2_2 (copy), EnumStreamNotificationsDisplayStateModule (upval), ClearUnreadNotificationsModule (upval), Callback (ref), UseStateResult (copy)
		if UseRefResult.current ~= EnumStreamNotificationsLoadingMoreStateModule.NoMoreNotifications then
			local Loading = EnumStreamNotificationsLoadingMoreStateModule.Loading
			UseRefResult.current = Loading
			UseStateResult2_3(Loading)
			GetStreamNotificationsModule(ConfigResult, ConstantsModule.DefaultMaxRows, UseRefResult1.current):andThen(function(Result) --[[ Line: 234 ]]
				-- upvalues: SortNotificationsModule (upval), GetFStringPCGDKFilteredNotificationTypesFunction (upval), ThirdPartyUserService (upval), StreamNotificationFixInitialPageFill (upval), UseRefResult2 (upval), UseRefResult3 (upval), UseStateResult2 (upval), CryoModule (upval), EnumStreamNotificationsLoadingMoreStateModule (upval), UseRefResult (upval), UseStateResult2_3 (upval), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), ConstantsModule (upval), FFlagStreamNotificationsStandardizeClickEvents (upval), UseStateResult2_2 (upval), EnumStreamNotificationsDisplayStateModule (upval), ClearUnreadNotificationsModule (upval), ConfigResult (upval), UseRefResult1 (upval), Callback (upval), UseStateResult (upval)
				local SortNotificationsModuleResult = SortNotificationsModule(Result)
				local FStringPCGDKFilteredNotificationTypes = GetFStringPCGDKFilteredNotificationTypesFunction()
				local List = {}
				
				for _, value in ipairs(SortNotificationsModuleResult) do
					if not FStringPCGDKFilteredNotificationTypes[value.content.notificationType] or (not ThirdPartyUserService or (not ThirdPartyUserService:IsChatRestrictionSupported() or ThirdPartyUserService.FriendCommunicationRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted)) then
						table.insert(List, value)
					end
				end
				local List1 = List
				
				if List1 and #List1 > 0 then
					if StreamNotificationFixInitialPageFill then
						for _, value1 in ipairs(List1) do
							if value1.notificationSourceType == "Sendr" then
								local BundleKey = value1.content.bundleKey
								local BundleKey1 = if BundleKey and BundleKey ~= "" then BundleKey else value1.id
								
								if BundleKey1 and not UseRefResult2.current[BundleKey1] then
									UseRefResult2.current[BundleKey1] = true
									UseRefResult3.current += 1
								end
							end
						end
					end
					UseStateResult2(function(p2) --[[ Line: 270 ]]
						-- upvalues: CryoModule (upval), List1 (ref)
						return (CryoModule.List.join(p2, List1))
					end)
					local Default = EnumStreamNotificationsLoadingMoreStateModule.Default
					UseRefResult.current = Default
					UseStateResult2_3(Default)
					
					for _, value2 in ipairs(List1) do
						NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.fetched, AnalyticsConstantsModule.EventNames.notificationRetrieved, CryoModule.Dictionary.join(value2.content.clientEventsPayload or {}, {
							sendrVersion = ConstantsModule.SENDRVersion,
							notificationType = value2.content.notificationType or nil,
							notificationId = value2.id or nil,
							notificationState = FFlagStreamNotificationsStandardizeClickEvents and value2.content.currentState or nil
						}))
					end
				else
					local NoMoreNotifications = EnumStreamNotificationsLoadingMoreStateModule.NoMoreNotifications
					UseRefResult.current = NoMoreNotifications
					UseStateResult2_3(NoMoreNotifications)
				end
				UseStateResult2_2(EnumStreamNotificationsDisplayStateModule.Default)
				ClearUnreadNotificationsModule(ConfigResult)
				UseRefResult1.current = (tonumber(UseRefResult1.current) or 0) + ConstantsModule.DefaultMaxRows
				
				if StreamNotificationFixInitialPageFill then
					if UseRefResult3.current < ConstantsModule.DefaultMaxRows then
						Callback()
					end
				elseif UseStateResult and #UseStateResult < ConstantsModule.DefaultMaxRows then
					Callback()
				end
			end):catch(function(_) --[[ Line: 307 ]]
				-- upvalues: UseStateResult2_2 (upval), EnumStreamNotificationsDisplayStateModule (upval)
				UseStateResult2_2(EnumStreamNotificationsDisplayStateModule.ErrorRetrieving)
			end)
			
			return
		end
	end
	
	local function v68(CurrentState, p2) --[[ Line: 312 ]]
		-- upvalues: DropdownEnabled (copy), p1 (copy), PostReportNotificationModule (upval), ConfigResult (upval), Callback1 (ref), UseStateResult2_2 (copy), EnumStreamNotificationsDisplayStateModule (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval)
		if DropdownEnabled then
			p1.displayStream(false)
		end
		local function _() --[[ Line: 338 ]]
			-- upvalues: DropdownEnabled (upval), p1 (upval), UseStateResult2_2 (upval), EnumStreamNotificationsDisplayStateModule (upval)
			if DropdownEnabled then
				p1.displayStream(true)
			else
				p1.setDisplayScreenGuiEnabled(true)
			end
			UseStateResult2_2(EnumStreamNotificationsDisplayStateModule.Default)
		end
		
		UseDispatchResult(OpenDynamicAbuseReportModule({
			abuseVector = AbuseVectorModule.Notifications,
			targetId = p2.id,
			onSubmit = function() --[[ Line: 324 ]]
				-- upvalues: PostReportNotificationModule (upval), ConfigResult (upval), p2 (copy), Callback1 (upval), CurrentState (copy), DropdownEnabled (upval), p1 (upval), UseStateResult2_2 (upval), EnumStreamNotificationsDisplayStateModule (upval)
				PostReportNotificationModule(ConfigResult, p2.id):andThen(function(_) --[[ Line: 326 ]] end):catch(function(_) --[[ Line: 327 ]] end)
				Callback1(CurrentState, p2)
				
				if not DropdownEnabled then
					p1.setDisplayScreenGuiEnabled(true)
				end
				UseStateResult2_2(EnumStreamNotificationsDisplayStateModule.Default)
			end,
			onClose = function() --[[ Line: 350 ]]
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval), DropdownEnabled (upval), p1 (upval), UseStateResult2_2 (upval), EnumStreamNotificationsDisplayStateModule (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
				
				if DropdownEnabled then
					p1.displayStream(true)
				else
					p1.setDisplayScreenGuiEnabled(true)
				end
				UseStateResult2_2(EnumStreamNotificationsDisplayStateModule.Default)
			end
		}))
	end
	
	local _ = function(p2) --[[ Line: 358 ]]
		-- upvalues: Callback2 (ref), UseStateResult (copy), CryoModule (upval), UseStateResult2 (copy)
		Callback2()
		
		if UseStateResult and p2 then
			UseStateResult2((CryoModule.List.map(UseStateResult, function(p3) --[[ Line: 361 ]]
				-- upvalues: p2 (copy)
				if p3.id == p2 then
					p3.dismiss = true
				end
				return p3
			end)))
		end
	end
	
	local UseResult = ReactModule.useCallback(function(Id) --[[ Line: 372 ]]
		-- upvalues: UseStateResult (copy), CryoModule (upval), UseStateResult2 (copy)
		if UseStateResult and Id then
			UseStateResult2((CryoModule.List.filter(UseStateResult, function(p2): boolean --[[ Line: 374 ]]
				-- upvalues: Id (copy)
				return p2.id ~= Id and p2.dismiss ~= true
			end)))
		end
	end)
	local UseResult1 = ReactModule.useCallback(function(List) --[[ Line: 383 ]]
		-- upvalues: FFlagStreamNotificationImpressionLogging (upval), UseMemoResult (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), CryoModule (upval), ConstantsModule (upval), FFlagStreamNotificationsStandardizeClickEvents (upval)
		if not FFlagStreamNotificationImpressionLogging then return end
		for _, value in ipairs(List) do
			local ByIndexEntry = UseMemoResult.byIndex[value]
			local Notification = if ByIndexEntry then ByIndexEntry.notification else nil
			
			if Notification then
				NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.impression, AnalyticsConstantsModule.EventNames.notificationImpression, CryoModule.Dictionary.join(Notification.content.clientEventsPayload or {}, {
					sendrVersion = ConstantsModule.SENDRVersion,
					notificationType = Notification.content.notificationType or nil,
					notificationId = Notification.id or nil,
					notificationState = FFlagStreamNotificationsStandardizeClickEvents and Notification.content.currentState or nil,
					bundlePosition = ByIndexEntry.bundlePosition or nil,
					bundleKey = Notification.content.bundleKey or nil
				}))
			end
		end
	end, { UseMemoResult })
	local UseResult2 = ReactModule.useCallback(function(p2, p3) --[[ Line: 413 ]]
		-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), CryoModule (upval), FFlagStreamNotificationsStandardizeClickEvents (upval), LuaAppNewStreamNotificationsLogFix (upval), ConstantsModule (upval), Type (upval), JoinExperienceFunction (upval), p1 (copy), SessionService (upval), ReportEventModule (upval), NewResult (upval), PostNotificationsApiModule (upval), ConfigResult (upval), Callback1 (ref), Callback2 (ref), UseStateResult2_2 (copy), EnumStreamNotificationsDisplayStateModule (upval), v68 (copy), UseStateResult (copy), UseStateResult2 (copy), UseClientTriggerEventHandlerModuleResult (copy)
		local P18 = p3 or UseStateResult1
		UseStateResult2_1(P18)
		NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, p2.eventName or "", CryoModule.Dictionary.join(p2.clientEventsPayload or {}, {
			notifType = if FFlagStreamNotificationsStandardizeClickEvents then nil elseif LuaAppNewStreamNotificationsLogFix then P18 and (P18.content and P18.content.notificationType) else nil,
			notifId = if FFlagStreamNotificationsStandardizeClickEvents then nil elseif LuaAppNewStreamNotificationsLogFix then P18 and P18.id else nil,
			notificationType = if FFlagStreamNotificationsStandardizeClickEvents then P18 and (P18.content and P18.content.notificationType) else nil,
			notificationId = if FFlagStreamNotificationsStandardizeClickEvents then P18 and P18.id else nil,
			notificationState = if FFlagStreamNotificationsStandardizeClickEvents then P18 and (P18.content and P18.content.currentState) else nil,
			visualItemType = p2.visualItemType or nil,
			visualItemName = p2.visualItemName or nil,
			sendrVersion = ConstantsModule.SENDRVersion
		}))
		
		if p2.actions and #p2.actions > 0 and P18 then
			for _, action in ipairs(p2.actions) do
				if action.actionType then
					if action.actionType == Type.ActionTypeEnum.Deeplink then
						if JoinExperienceFunction(action.path, false) then
							p1.displayStream(false)
							SessionService:SetSession(ConstantsModule.StreamSessionStructuralIdentifier.Level1, ConstantsModule.StreamSessionStructuralIdentifier.StreamNotification, ConstantsModule.StreamSessionStructuralIdentifier.StreamNotification)
							SessionService:SetMetadata(ConstantsModule.StreamSessionStructuralIdentifier.StreamNotification, ConstantsModule.StreamSessionStructuralIdentifier.DeleteOnGameLeave, "True")
							ReportEventModule(NewResult, {
								action_type = action.actionType,
								delivery_channel = ConstantsModule.DeliveryChannel,
								notification_type = P18.notificationSourceType,
								notification_id = P18.id
							})
						end
					elseif action.actionType == Type.ActionTypeEnum.NotificationApi then
						PostNotificationsApiModule(ConfigResult, P18 and P18.id or nil, action.path or nil):andThen(function(_) --[[ Line: 486 ]]
							-- upvalues: action (copy), Callback1 (upval), P18 (copy)
							if action.nextState ~= nil and action.nextState ~= "" then
								Callback1(action.nextState, P18)
							end
						end):catch(function(_) --[[ Line: 491 ]] end)
						Callback2()
					elseif action.actionType == Type.ActionTypeEnum.Report then
						UseStateResult2_2(EnumStreamNotificationsDisplayStateModule.AbuseReport)
						v68(action.nextState, P18)
					elseif action.actionType == Type.ActionTypeEnum.Dismiss then
						local Id = P18.id
						Callback2()
						
						if UseStateResult and Id then
							UseStateResult2((CryoModule.List.map(UseStateResult, function(p4) --[[ Line: 361 ]]
								-- upvalues: Id (copy)
								if p4.id == Id then
									p4.dismiss = true
								end
								return p4
							end)))
						end
					elseif action.actionType == Type.ActionTypeEnum.ClientTrigger then
						if action.path == "TrustedContactsDoubleOptInModal" then
							p1.displayStream(false)
						end
						UseClientTriggerEventHandlerModuleResult(action.path, {
							clientEventsPayload = P18.content.clientEventsPayload,
							callback = function() --[[ Line: 512 ]]
								-- upvalues: Callback1 (upval), action (copy), P18 (copy)
								Callback1(action.nextState, P18)
							end
						})
					end
				end
			end
		end
	end)
	
	local function OpenMetaActions(p4) --[[ Line: 523 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy), EnumStreamNotificationsDisplayStateModule (upval), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), NotificationsCommonModule (upval), ConstantsModule (upval), FFlagStreamNotificationsStandardizeClickEvents (upval)
		UseStateResult2_1(p4)
		UseStateResult2_2(EnumStreamNotificationsDisplayStateModule.MetaActions)
		NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.openMetaActions, {
			visualItemType = NotificationsCommonModule.type.VisualItemTypeEnum.MetaAction,
			sendrVersion = ConstantsModule.SENDRVersion,
			notificationState = FFlagStreamNotificationsStandardizeClickEvents and (p4 and p4.content and p4.content.currentState) or nil
		})
	end
	
	Callback2 = function() --[[ Line: 545 ]]
		-- upvalues: ShowOverlay (copy), UseStateResult2_1 (copy), UseStateResult3 (copy), EnumStreamNotificationsDisplayStateModule (upval), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), NotificationsCommonModule (upval), ConstantsModule (upval), UseStateResult2_2 (copy)
		ShowOverlay(true)
		UseStateResult2_1(nil)
		
		if UseStateResult3 == EnumStreamNotificationsDisplayStateModule.MetaActions then
			NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.closeMetaActions, {
				visualItemType = NotificationsCommonModule.type.VisualItemTypeEnum.MetaAction,
				sendrVersion = ConstantsModule.SENDRVersion
			})
		end
		UseStateResult2_2(EnumStreamNotificationsDisplayStateModule.Default)
	end
	
	Callback1 = function(CurrentState, p4) --[[ Line: 562 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		local List = {}
		
		if UseStateResult and p4 then
			for _, value in ipairs(UseStateResult) do
				if value.id == p4.id then
					value.content.currentState = CurrentState
				end
				table.insert(List, value)
			end
		end
		UseStateResult2(List)
	end
	
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 578 ]]
		-- upvalues: ReactModule (upval), MetaActionsMenuModule (upval), UseStateResult3 (copy), UseStateResult1 (copy), p1 (copy), UseResult2 (copy), Callback2 (ref)
		return ReactModule.createElement(MetaActionsMenuModule, {
			displayState = UseStateResult3,
			activeNotification = UseStateResult1,
			isSmallScreen = p1.isSmallScreen,
			handleActions = UseResult2,
			closeNotificationDisplay = Callback2
		})
	end, { UseStateResult3, UseStateResult1 })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 588 ]]
		-- upvalues: UseStateResult3 (copy), EnumStreamNotificationsDisplayStateModule (upval), ReactModule (upval), Loading (upval), IconSize (upval), UseStateResult (copy), DropdownEnabled (copy), ConstantsModule (upval), StreamNotificationBundleWrapperModule (upval), UseResult (copy), UseResult2 (copy), OpenMetaActions (copy), FFlagStreamNotificationImpressionLogging (upval), UseMemoResult (copy), StreamNotificationAnimationWrapperModule (upval), UseRefResult (copy), EnumStreamNotificationsLoadingMoreStateModule (upval), NewHeaderHeight (copy), EmptyNotificationsModule (upval)
		if UseStateResult3 == EnumStreamNotificationsDisplayStateModule.Initializing then
			return ReactModule.createElement(Loading, {
				size = IconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		end
		if UseStateResult and #UseStateResult > 0 then
			local Elements = {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = if DropdownEnabled then UDim.new(0, ConstantsModule.Dropdown.CardGap) else nil
				})
			}
			
			if DropdownEnabled then
				Elements.UIPadding = ReactModule.createElement("UIPadding", {
					PaddingRight = UDim.new(0, ConstantsModule.Dropdown.ScrollBarThickness)
				})
			end
			local Flag = false
			local t = {}
			
			for _, value in ipairs(UseStateResult) do
				if value.notificationSourceType == "Sendr" then
					Flag = true
					local BundleKey = value.content.bundleKey
					
					if BundleKey and BundleKey ~= "" then
						if t[BundleKey] then
							table.insert(t[BundleKey], value)
						else
							t[BundleKey] = { value }
						end
					end
				end
			end
			for LayoutOrder, Notification in ipairs(UseStateResult) do
				if Notification.notificationSourceType == "Sendr" then
					local BundleKey = Notification.content.bundleKey
					
					if not BundleKey or BundleKey == "" or #t[BundleKey] <= 1 then
						local ByNotificationIdEntry = if FFlagStreamNotificationImpressionLogging then UseMemoResult.byNotificationId[Notification.id] else nil
						Elements[Notification.id] = ReactModule.createElement(StreamNotificationAnimationWrapperModule, {
							collapsed = false,
							layoutOrder = LayoutOrder,
							notification = Notification,
							finishDismissNotification = UseResult,
							handleActions = UseResult2,
							openMetaActions = OpenMetaActions,
							impressionsTag = if FFlagStreamNotificationImpressionLogging then "StreamNotificationImpression" else nil,
							impressionIndex = FFlagStreamNotificationImpressionLogging and (ByNotificationIdEntry and ByNotificationIdEntry.impressionIndex) or nil
						}, {})
					elseif not Elements[BundleKey] then
						Elements[BundleKey] = ReactModule.createElement(StreamNotificationBundleWrapperModule, {
							layoutOrder = LayoutOrder,
							notifications = t[BundleKey],
							finishDismissNotification = UseResult,
							handleActions = UseResult2,
							openMetaActions = OpenMetaActions,
							impressionsTag = if FFlagStreamNotificationImpressionLogging then "StreamNotificationImpression" else nil,
							impressionMetadataByNotificationId = if FFlagStreamNotificationImpressionLogging then UseMemoResult.byNotificationId else nil
						}, {})
					end
				end
			end
			if UseRefResult.current == EnumStreamNotificationsLoadingMoreStateModule.Loading then
				Elements.LoadingMore = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1e999,
					Size = UDim2.new(1, 0, 0, ConstantsModule.LoadingMoreNotifications.Size)
				}, {
					LoadingMoreSpinner = ReactModule.createElement(Loading, {
						size = IconSize.Small,
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				})
			end
			if Flag then
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = if DropdownEnabled then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, -NewHeaderHeight),
					AutomaticSize = Enum.AutomaticSize.Y
				}, Elements)
			end
		end
		return ReactModule.createElement(EmptyNotificationsModule)
	end, {
		UseStateResult,
		UseStateResult3,
		UseStateResult4,
		DropdownEnabled,
		UseMemoResult
	})
	
	local function v76(ScrollFrame) --[[ Line: 729 ]]
		-- upvalues: UseStateResult3 (copy), EnumStreamNotificationsDisplayStateModule (upval), FFlagStreamNotificationImpressionLogging (upval), UseRefResult5 (copy), ConstantsModule (upval), UseRefResult (copy), EnumStreamNotificationsLoadingMoreStateModule (upval), Callback (ref)
		local Y = ScrollFrame.AbsoluteCanvasSize.Y
		local Y1 = ScrollFrame.AbsoluteWindowSize.Y
		local Y2 = ScrollFrame.CanvasPosition.Y
		
		if Y1 == 0 or Y == 0 or UseStateResult3 ~= EnumStreamNotificationsDisplayStateModule.Default then return end
		if FFlagStreamNotificationImpressionLogging and UseRefResult5.current then
			UseRefResult5.current:fire()
		end
		if Y - Y1 - ConstantsModule.LoadingMoreNotifications.TriggerDistance <= Y2 and UseRefResult.current == EnumStreamNotificationsLoadingMoreStateModule.Default then
			Callback()
		end
	end
	
	local Y = if UserInputService.BottomBarSize then UserInputService.BottomBarSize.Y else 0
	local Bottom = if GuiService:GetSafeZoneOffsets() then GuiService:GetSafeZoneOffsets().bottom else 0
	local Largest: number = if p1.isSmallScreen then math.max(Y, Bottom) else 0
	
	return if DropdownEnabled then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		MetaActionsOpen = ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Visible = UseStateResult3 == EnumStreamNotificationsDisplayStateModule.MetaActions,
			BackgroundTransparency = UseStyleResult.Theme.Overlay.Transparency,
			BackgroundColor3 = UseStyleResult.Theme.Overlay.Color,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 2,
			[ReactModule.Event.Activated] = Callback2,
			BorderSizePixel = 0,
			Selectable = false
		}, { UseMemoResult1 }),
		NotificationsList = ReactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, (p1.dropdownHeight or ConstantsModule.Dropdown.MaxHeight) - ConstantsModule.Dropdown.HeaderMinHeight - ConstantsModule.Dropdown.HeaderBodyGap),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			ScrollBarThickness = ConstantsModule.Dropdown.ScrollBarThickness,
			BorderSizePixel = 0,
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
			ScrollBarImageColor3 = UseStyleResult.Theme.UIEmphasis.Color,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingEnabled = UseStateResult3 == EnumStreamNotificationsDisplayStateModule.Default,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[ReactModule.Change.CanvasPosition] = v76,
			Selectable = false
		}, UseMemoResult2)
	}) else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0)
	}, {
		MetaActionsOpen = ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Visible = UseStateResult3 == EnumStreamNotificationsDisplayStateModule.MetaActions,
			BackgroundTransparency = UseStyleResult.Theme.Overlay.Transparency,
			BackgroundColor3 = UseStyleResult.Theme.Overlay.Color,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 2,
			[ReactModule.Event.Activated] = Callback2,
			BorderSizePixel = 0,
			Selectable = false
		}, { UseMemoResult1 }),
		NotificationsList = ReactModule.createElement("ScrollingFrame", {
			ref = if FFlagStreamNotificationImpressionLogging then UseRefResult4 else nil,
			Size = UDim2.new(1, 0, 1, -(NewHeaderHeight + ConstantsModule.DefaultPadding + Largest)),
			CanvasSize = UDim2.new(1, 0, 1, -(NewHeaderHeight + ConstantsModule.DefaultPadding + Largest)),
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, NewHeaderHeight),
			AnchorPoint = Vector2.new(0, 0),
			ScrollBarThickness = 4,
			BorderSizePixel = 0,
			VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
			VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
			ScrollBarImageColor3 = UseStyleResult.Theme.UIEmphasis.Color,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingEnabled = UseStateResult3 == EnumStreamNotificationsDisplayStateModule.Default,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[ReactModule.Change.CanvasPosition] = v76,
			Selectable = false
		}, UseMemoResult2),
		ImpressionTracker = if FFlagStreamNotificationImpressionLogging then ReactModule.createElement(FrameBoundsImpressionsTracker, {
			pageContext = nil,
			impressionsTag = "StreamNotificationImpression",
			parentRef = UseRefResult4,
			scrollViewPositionChangedSignal = UseRefResult5.current,
			sendImpressions = UseResult1
		}) else nil
	})
end