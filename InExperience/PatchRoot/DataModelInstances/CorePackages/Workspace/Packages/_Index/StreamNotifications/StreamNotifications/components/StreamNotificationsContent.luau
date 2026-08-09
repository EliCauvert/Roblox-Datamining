local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local components = streamNotifications.components
local playersService = game:GetService("Players")
local parent = streamNotifications.Parent
local constantsModule = require(streamNotifications.constants)
local cryoModule = require(parent.Cryo)
local var4 = require(parent.Analytics).AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))
local sessionService = game:GetService("SessionService")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local emptyNotificationsModule = require(components.EmptyNotifications)
local metaActionsMenuModule = require(components.MetaActionsMenu)
local streamNotificationAnimationWrapperModule = require(components.StreamNotificationAnimationWrapper)
local streamNotificationBundleWrapperModule = require(components.StreamNotificationBundleWrapper)
local reactModule = require(parent.React)
local notificationsCommonModule = require(parent.NotificationsCommon)
local joinExperience = notificationsCommonModule.JoinExperience
local type = notificationsCommonModule.type
local notificationHelper = notificationsCommonModule.NotificationHelper
local enumStreamNotificationsDisplayStateModule = require(streamNotifications.EnumStreamNotificationsDisplayState)
local enumStreamNotificationsLoadingMoreStateModule = require(streamNotifications.EnumStreamNotificationsLoadingMoreState)
local httpRequestModule = require(parent.HttpRequest)
local var18 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = if require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("StreamNotificationsContentHttpRetryCount", 4) else nil
})
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useDeviceType = require(parent.RobloxAppHooks).useDeviceType
local appPage = require(parent.RobloxAppEnums).AppPage
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local useStyle = UIBloxModule.Core.Style.useStyle
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var21 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useClientTriggerEventHandlerModule = require(streamNotifications.eventHandler.useClientTriggerEventHandler)
local getStreamNotificationsModule = require(streamNotifications.utils.getStreamNotifications)
local clearUnreadNotificationsModule = require(streamNotifications.utils.clearUnreadNotifications)
local postNotificationsApiModule = require(streamNotifications.utils.postNotificationsApi)
local postReportNotificationModule = require(streamNotifications.utils.postReportNotification)
local reportEventModule = require(streamNotifications.utils.reportEvent)
local sortNotificationsModule = require(streamNotifications.utils.sortNotifications)
local eventStream = require(streamNotifications.analytics.analyticsService).EventStream
local analyticsConstantsModule = require(streamNotifications.analytics.analyticsConstants)
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local luaAppNewStreamNotificationsLogFix = game:DefineFastFlag("LuaAppNewStreamNotificationsLogFix", false)
local sharedFlagsModule = require(parent.SharedFlags)
local getFStringPCGDKFilteredNotificationTypes = sharedFlagsModule.GetFStringPCGDKFilteredNotificationTypes
local fFlagFixNotificationReportsMobile = sharedFlagsModule.FFlagFixNotificationReportsMobile
local fFlagStreamNotificationsStandardizeClickEvents = sharedFlagsModule.FFlagStreamNotificationsStandardizeClickEvents
local fFlagStreamNotificationImpressionLogging = sharedFlagsModule.FFlagStreamNotificationImpressionLogging
local frameBoundsImpressionsTracker = require(parent.Impressions).FrameBoundsImpressionsTracker

local function _() --[[ line: 87 | named "GetIsFriendCommunicationRestricted" ]]
	-- upvalues: thirdPartyUserService (ref)
	return thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
end

local streamNotificationDropdownExperimentationModule = require(streamNotifications.StreamNotificationDropdownExperimentation)

local function createImpressionSignal() --[[ line: 123 ]]
	local bindableEvent = Instance.new("BindableEvent")
	
	return {
		connect = function(_, p0) --[[ line: 126 ]]
			-- upvalues: bindableEvent (ref)
			return bindableEvent.Event:Connect(p0)
		end,
		fire = function() --[[ line: 129 ]]
			-- upvalues: bindableEvent (ref)
			bindableEvent:Fire()
		end,
		destroy = function() --[[ line: 132 ]]
			-- upvalues: bindableEvent (ref)
			bindableEvent:Destroy()
		end
	}
end

return function(p1) --[[ line: 138 ]]
	-- upvalues: useStyle (ref), streamNotificationDropdownExperimentationModule (ref), useDispatch (ref), useDeviceType (ref), useClientTriggerEventHandlerModule (ref), reactModule (ref), enumStreamNotificationsDisplayStateModule (ref), enumStreamNotificationsLoadingMoreStateModule (ref), fFlagStreamNotificationImpressionLogging (ref), createImpressionSignal (ref), userInputService (ref), constantsModule (ref), getStreamNotificationsModule (ref), var18 (ref), sortNotificationsModule (ref), getFStringPCGDKFilteredNotificationTypes (ref), thirdPartyUserService (ref), cryoModule (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref), fFlagStreamNotificationsStandardizeClickEvents (ref), clearUnreadNotificationsModule (ref), postReportNotificationModule (ref), fFlagFixNotificationReportsMobile (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), playersService (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var21 (ref), navigateDown (ref), luaAppNewStreamNotificationsLogFix (ref), type (ref), joinExperience (ref), sessionService (ref), reportEventModule (ref), var4 (ref), postNotificationsApiModule (ref), notificationsCommonModule (ref), metaActionsMenuModule (ref), loading (ref), iconSize (ref), streamNotificationBundleWrapperModule (ref), streamNotificationAnimationWrapperModule (ref), emptyNotificationsModule (ref), guiService (ref), frameBoundsImpressionsTracker (ref)
	local var37 = useStyle()
	local dropdownEnabled = streamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local var39 = useDispatch()
	local var40 = useDeviceType()
	local var41 = useClientTriggerEventHandlerModule()
	local var42, var43 = reactModule.useState({})
	local var44, var45 = reactModule.useState(nil)
	local var46, var47 = reactModule.useState(enumStreamNotificationsDisplayStateModule.Initializing)
	local var48 = nil
	local var49 = nil
	local var50 = nil
	local showOverlay = p1.showOverlay or function(_) --[[ line: 160 ]] end
	local var52 = reactModule.useRef(enumStreamNotificationsLoadingMoreStateModule.Loading)
	local var53, var54 = reactModule.useState(enumStreamNotificationsLoadingMoreStateModule.Loading)
	local var55 = reactModule.useRef(0)
	local var56 = reactModule.useRef(nil)
	local var57 = reactModule.useRef(if fFlagStreamNotificationImpressionLogging then createImpressionSignal() else nil)
	local var58 = constantsModule.Modal.HeaderHeight + (if userInputService.StatusBarSize then userInputService.StatusBarSize.Y else 0)
	local var59 = reactModule.useMemo(function() --[[ line: 176 ]]
		-- upvalues: fFlagStreamNotificationImpressionLogging (copy), var42 (ref)
		if not fFlagStreamNotificationImpressionLogging then
			return { byNotificationId = {}, byIndex = {} }
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in ipairs(var42) do
			if v.notificationSourceType == "Sendr" then
				local bundleKey = v.content.bundleKey
				local var72 = nil
				
				if bundleKey and bundleKey ~= "" then
					var72 = (t_2[bundleKey] or 0) + 1
					t_2[bundleKey] = var72
				end
				local t_3 = {
					impressionIndex = i,
					bundlePosition = var72,
					notification = v
				}
				t_1[i] = t_3
				
				if v.id then
					t[v.id] = t_3
				end
			end
		end
		return { byNotificationId = t, byIndex = t_1 }
	end, { var42 })
	reactModule.useEffect(function() --[[ line: 213 ]]
		-- upvalues: var48 (write)
		var48()
	end, {})
	reactModule.useEffect(function() --[[ line: 217 ]]
		-- upvalues: fFlagStreamNotificationImpressionLogging (copy), var57 (ref)
		if fFlagStreamNotificationImpressionLogging then
			return function() --[[ line: 221 ]]
				-- upvalues: var57 (copy)
				if var57.current then
					var57.current:destroy()
				end
			end
		end
	end, {})
	
	local _ = function(p2) --[[ line: 228 ]]
		-- upvalues: var52 (ref), var54 (ref)
		var52.current = p2
		var54(p2)
	end
	
	var48 = function() --[[ line: 233 ]]
		-- upvalues: var52 (ref), enumStreamNotificationsLoadingMoreStateModule (copy), var54 (ref), getStreamNotificationsModule (copy), var18 (copy), constantsModule (copy), var55 (ref), sortNotificationsModule (copy), getFStringPCGDKFilteredNotificationTypes (copy), thirdPartyUserService (copy), var43 (ref), cryoModule (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy), var47 (ref), enumStreamNotificationsDisplayStateModule (copy), clearUnreadNotificationsModule (copy), var42 (ref), var48 (write)
		if var52.current == enumStreamNotificationsLoadingMoreStateModule.NoMoreNotifications then
			return
		end
		local loading = enumStreamNotificationsLoadingMoreStateModule.Loading
		var52.current = loading
		var54(loading)
		getStreamNotificationsModule(var18, constantsModule.DefaultMaxRows, var55.current):andThen(function(p3) --[[ line: 241 ]]
			-- upvalues: sortNotificationsModule (copy), getFStringPCGDKFilteredNotificationTypes (copy), thirdPartyUserService (copy), var43 (copy), cryoModule (copy), enumStreamNotificationsLoadingMoreStateModule (copy), var52 (copy), var54 (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), constantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy), var47 (copy), enumStreamNotificationsDisplayStateModule (copy), clearUnreadNotificationsModule (copy), var18 (copy), var55 (copy), var42 (copy), var48 (copy)
			p3 = sortNotificationsModule(p3)
			local var74 = getFStringPCGDKFilteredNotificationTypes()
			local t = {}
			
			for i, v in ipairs(p3) do
				if not var74[v.content.notificationType] or (not thirdPartyUserService or (not thirdPartyUserService:IsChatRestrictionSupported() or thirdPartyUserService.FriendCommunicationRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted)) then
					table.insert(t, v)
				end
			end
			var76 = t
			
			if var76 and #var76 > 0 then
				var43(function(p4) --[[ line: 263 ]]
					-- upvalues: cryoModule (copy), var76 (write)
					return cryoModule.List.join(p4, var76)
				end)
				local default = enumStreamNotificationsLoadingMoreStateModule.Default
				var52.current = default
				var54(default)
				
				for i, v in ipairs(var76) do
					notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.fetched, analyticsConstantsModule.EventNames.notificationRetrieved, cryoModule.Dictionary.join(v.content.clientEventsPayload or {}, {
						sendrVersion = constantsModule.SENDRVersion,
						notificationType = v.content.notificationType or nil,
						notificationId = v.id or nil,
						notificationState = if fFlagStreamNotificationsStandardizeClickEvents then v.content.currentState or nil else nil
					}))
				end
			else
				local noMoreNotifications = enumStreamNotificationsLoadingMoreStateModule.NoMoreNotifications
				var52.current = noMoreNotifications
				var54(noMoreNotifications)
			end
			var47(enumStreamNotificationsDisplayStateModule.Default)
			clearUnreadNotificationsModule(var18)
			var55.current = (tonumber(var55.current) or 0) + constantsModule.DefaultMaxRows
			
			if var42 and #var42 < constantsModule.DefaultMaxRows then
				var48()
			end
		end):catch(function(_) --[[ line: 296 ]]
			-- upvalues: var47 (copy), enumStreamNotificationsDisplayStateModule (copy)
			var47(enumStreamNotificationsDisplayStateModule.ErrorRetrieving)
		end)
	end
	
	local var60 = function(p5, p6) --[[ line: 301 ]]
		-- upvalues: dropdownEnabled (ref), p1 (ref), postReportNotificationModule (copy), var18 (copy), var49 (write), var47 (ref), enumStreamNotificationsDisplayStateModule (copy), fFlagFixNotificationReportsMobile (copy), var39 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), var40 (ref), playersService (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var21 (copy), navigateDown (copy)
		if dropdownEnabled then
			p1.displayStream(false)
		end
		local var77 = function() --[[ line: 313 ]]
			-- upvalues: postReportNotificationModule (copy), var18 (copy), p6 (ref), var49 (copy), p5 (ref), dropdownEnabled (copy), p1 (copy), var47 (copy), enumStreamNotificationsDisplayStateModule (copy)
			postReportNotificationModule(var18, p6.id):andThen(function(_) --[[ line: 315 ]] end):catch(function(_) --[[ line: 316 ]] end)
			var49(p5, p6)
			
			if not dropdownEnabled then
				p1.setDisplayScreenGuiEnabled(true)
			end
			var47(enumStreamNotificationsDisplayStateModule.Default)
		end
		
		local var78 = function() --[[ line: 327 ]]
			-- upvalues: dropdownEnabled (copy), p1 (copy), var47 (copy), enumStreamNotificationsDisplayStateModule (copy)
			if dropdownEnabled then
				p1.displayStream(true)
			else
				p1.setDisplayScreenGuiEnabled(true)
			end
			var47(enumStreamNotificationsDisplayStateModule.Default)
		end
		
		if fFlagFixNotificationReportsMobile then
			var39(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.Notifications,
				targetId = p6.id,
				onSubmit = var77,
				onClose = function() --[[ line: 341 ]]
					-- upvalues: var39 (copy), closeCentralOverlay (copy), dropdownEnabled (copy), p1 (copy), var47 (copy), enumStreamNotificationsDisplayStateModule (copy)
					var39(closeCentralOverlay())
					
					if dropdownEnabled then
						p1.displayStream(true)
					else
						p1.setDisplayScreenGuiEnabled(true)
					end
					var47(enumStreamNotificationsDisplayStateModule.Default)
				end
			}))
			
			return
		end
		p1.setDisplayScreenGuiEnabled(false)
		local t = {
			name = appPage.ReportDialog,
			reportData = {
				reportEntryPoint = "Notification",
				assetId = p6.id,
				reportSurface = string.lower(var40),
				submissionEntryPoint = string.lower(var40),
				submitterUserId = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil,
				onSubmitReportCallback = var77,
				onCloseCallback = var78
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var21.down(var21.fromLegacyPage(t))
			
			return
		end
		var39(navigateDown(t))
	end
	
	local _ = function(p7) --[[ line: 371 ]]
		-- upvalues: var50 (write), var42 (ref), cryoModule (copy), var43 (ref)
		var50()
		
		if var42 and p7 then
			var43(cryoModule.List.map(var42, function(p8) --[[ line: 374 ]]
				-- upvalues: p7 (ref)
				if p8.id == p7 then
					p8.dismiss = true
				end
				return p8
			end))
		end
	end
	
	local var61 = reactModule.useCallback(function(p9) --[[ line: 385 ]]
		-- upvalues: var42 (ref), cryoModule (copy), var43 (ref)
		if var42 and p9 then
			var43(cryoModule.List.filter(var42, function(p10) --[[ line: 387 ]]
				-- upvalues: p9 (ref)
				return p10.id ~= p9 and p10.dismiss ~= true
			end))
		end
	end)
	local var62 = reactModule.useCallback(function(p11) --[[ line: 396 ]]
		-- upvalues: fFlagStreamNotificationImpressionLogging (copy), var59 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), cryoModule (copy), constantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy)
		if not fFlagStreamNotificationImpressionLogging then return end
		for i, v in ipairs(p11) do
			local var80 = var59.byIndex[v]
			local var81 = if var80 then var80.notification else nil
			
			if var81 then
				notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.impression, analyticsConstantsModule.EventNames.notificationImpression, cryoModule.Dictionary.join(var81.content.clientEventsPayload or {}, {
					sendrVersion = constantsModule.SENDRVersion,
					notificationType = var81.content.notificationType or nil,
					notificationId = var81.id or nil,
					notificationState = if fFlagStreamNotificationsStandardizeClickEvents then var81.content.currentState or nil else nil,
					bundlePosition = var80.bundlePosition or nil,
					bundleKey = var81.content.bundleKey or nil
				}))
			end
		end
	end, { var59 })
	local var63 = reactModule.useCallback(function(p12, p13) --[[ line: 426 ]]
		-- upvalues: var44 (ref), var45 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), cryoModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy), luaAppNewStreamNotificationsLogFix (copy), constantsModule (copy), type (copy), joinExperience (copy), p1 (ref), sessionService (copy), reportEventModule (copy), var4 (copy), postNotificationsApiModule (copy), var18 (copy), var49 (write), var50 (write), var47 (ref), enumStreamNotificationsDisplayStateModule (copy), var60 (ref), var42 (ref), var43 (ref), var41 (ref)
		p13 = p13 or var44
		var45(p13)
		notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, p12.eventName or "", cryoModule.Dictionary.join(p12.clientEventsPayload or {}, {
			notifType = if fFlagStreamNotificationsStandardizeClickEvents then nil elseif luaAppNewStreamNotificationsLogFix then p13 and (p13.content and p13.content.notificationType) else nil,
			notifId = if fFlagStreamNotificationsStandardizeClickEvents then nil elseif luaAppNewStreamNotificationsLogFix then p13 and p13.id else nil,
			notificationType = if fFlagStreamNotificationsStandardizeClickEvents then p13 and (p13.content and p13.content.notificationType) else nil,
			notificationId = if fFlagStreamNotificationsStandardizeClickEvents then p13 and p13.id else nil,
			notificationState = if fFlagStreamNotificationsStandardizeClickEvents then p13 and (p13.content and p13.content.currentState) else nil,
			visualItemType = p12.visualItemType or nil,
			visualItemName = p12.visualItemName or nil,
			sendrVersion = constantsModule.SENDRVersion
		}))
		
		if p12.actions and #p12.actions > 0 and p13 then
			for i, v in ipairs(p12.actions) do
				if v.actionType then
					if v.actionType == type.ActionTypeEnum.Deeplink then
						if joinExperience(v.path, false) then
							p1.displayStream(false)
							sessionService:SetSession(constantsModule.StreamSessionStructuralIdentifier.Level1, constantsModule.StreamSessionStructuralIdentifier.StreamNotification, constantsModule.StreamSessionStructuralIdentifier.StreamNotification)
							sessionService:SetMetadata(constantsModule.StreamSessionStructuralIdentifier.StreamNotification, constantsModule.StreamSessionStructuralIdentifier.DeleteOnGameLeave, "True")
							reportEventModule(var4, {
								action_type = v.actionType,
								delivery_channel = constantsModule.DeliveryChannel,
								notification_type = p13.notificationSourceType,
								notification_id = p13.id
							})
						end
					elseif v.actionType == type.ActionTypeEnum.NotificationApi then
						postNotificationsApiModule(var18, if p13 then p13.id else nil, v.path or nil):andThen(function(_) --[[ line: 499 ]]
							-- upvalues: v (ref), var49 (copy), p13 (ref)
							if v.nextState ~= nil and v.nextState ~= "" then
								var49(v.nextState, p13)
							end
						end):catch(function(_) --[[ line: 504 ]] end)
						var50()
					elseif v.actionType == type.ActionTypeEnum.Report then
						var47(enumStreamNotificationsDisplayStateModule.AbuseReport)
						var60(v.nextState, p13)
					elseif v.actionType == type.ActionTypeEnum.Dismiss then
						local id = p13.id
						var50()
						
						if var42 and id then
							var43(cryoModule.List.map(var42, function(p14) --[[ line: 374 ]]
								-- upvalues: id (ref)
								if p14.id == id then
									p14.dismiss = true
								end
								return p14
							end))
						end
					elseif v.actionType == type.ActionTypeEnum.ClientTrigger then
						if v.path == "TrustedContactsDoubleOptInModal" then
							p1.displayStream(false)
						end
						var41(v.path, {
							clientEventsPayload = p13.content.clientEventsPayload,
							callback = function() --[[ line: 525 ]]
								-- upvalues: var49 (copy), v (ref), p13 (ref)
								var49(v.nextState, p13)
							end
						})
					end
				end
			end
		end
	end)
	
	local var64 = function(p15) --[[ line: 536 ]]
		-- upvalues: var45 (ref), var47 (ref), enumStreamNotificationsDisplayStateModule (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), notificationsCommonModule (copy), constantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy)
		var45(p15)
		var47(enumStreamNotificationsDisplayStateModule.MetaActions)
		notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.openMetaActions, {
			visualItemType = notificationsCommonModule.type.VisualItemTypeEnum.MetaAction,
			sendrVersion = constantsModule.SENDRVersion,
			notificationState = if fFlagStreamNotificationsStandardizeClickEvents then p15 and (p15.content and (p15.content.currentState or nil)) else nil
		})
	end
	
	var50 = function() --[[ line: 558 ]]
		-- upvalues: showOverlay (ref), var45 (ref), var46 (ref), enumStreamNotificationsDisplayStateModule (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), notificationsCommonModule (copy), constantsModule (copy), var47 (ref)
		showOverlay(true)
		var45(nil)
		
		if var46 == enumStreamNotificationsDisplayStateModule.MetaActions then
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeMetaActions, {
				visualItemType = notificationsCommonModule.type.VisualItemTypeEnum.MetaAction,
				sendrVersion = constantsModule.SENDRVersion
			})
		end
		var47(enumStreamNotificationsDisplayStateModule.Default)
	end
	
	var49 = function(p16, p17) --[[ line: 575 ]]
		-- upvalues: var42 (ref), var43 (ref)
		local t = {}
		
		if var42 and p17 then
			for i, v in ipairs(var42) do
				if v.id == p17.id then
					v.content.currentState = p16
				end
				table.insert(t, v)
			end
		end
		var43(t)
	end
	
	local var65 = reactModule.useMemo(function() --[[ line: 591 ]]
		-- upvalues: reactModule (copy), metaActionsMenuModule (copy), var46 (ref), var44 (ref), p1 (ref), var63 (ref), var50 (write)
		return reactModule.createElement(metaActionsMenuModule, {
			displayState = var46,
			activeNotification = var44,
			isSmallScreen = p1.isSmallScreen,
			handleActions = var63,
			closeNotificationDisplay = var50
		})
	end, { var46, var44 })
	local var66 = reactModule.useMemo(function() --[[ line: 601 ]]
		-- upvalues: var46 (ref), enumStreamNotificationsDisplayStateModule (copy), reactModule (copy), loading (copy), iconSize (copy), var42 (ref), dropdownEnabled (ref), constantsModule (copy), streamNotificationBundleWrapperModule (copy), var61 (ref), var63 (ref), var64 (ref), fFlagStreamNotificationImpressionLogging (copy), var59 (ref), streamNotificationAnimationWrapperModule (copy), var52 (ref), enumStreamNotificationsLoadingMoreStateModule (copy), var58 (ref), emptyNotificationsModule (copy)
		if var46 == enumStreamNotificationsDisplayStateModule.Initializing then
			return reactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		elseif var42 and #var42 > 0 then
			local t = {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = if dropdownEnabled then UDim.new(0, constantsModule.Dropdown.CardGap) else nil
				})
			}
			
			if dropdownEnabled then
				t.UIPadding = reactModule.createElement("UIPadding", {
					PaddingRight = UDim.new(0, constantsModule.Dropdown.ScrollBarThickness)
				})
			end
			local var85 = false
			local t_1 = {}
			
			for i, v in ipairs(var42) do
				if v.notificationSourceType == "Sendr" then
					var85 = true
					local bundleKey = v.content.bundleKey
					
					if bundleKey and bundleKey ~= "" then
						if t_1[bundleKey] then
							table.insert(t_1[bundleKey], v)
						else
							t_1[bundleKey] = { v }
						end
					end
				end
			end
			for i_1, v_1 in ipairs(var42) do
				if v_1.notificationSourceType == "Sendr" then
					local bundleKey = v_1.content.bundleKey
					
					if not bundleKey or bundleKey == "" or #t_1[bundleKey] <= 1 then
						local var87 = if fFlagStreamNotificationImpressionLogging then var59.byNotificationId[v_1.id] else nil
						t[v_1.id] = reactModule.createElement(streamNotificationAnimationWrapperModule, {
							collapsed = false,
							layoutOrder = i_1,
							notification = v_1,
							finishDismissNotification = var61,
							handleActions = var63,
							openMetaActions = var64,
							impressionsTag = if fFlagStreamNotificationImpressionLogging then "StreamNotificationImpression" else nil,
							impressionIndex = if fFlagStreamNotificationImpressionLogging then if var87 then var87.impressionIndex else nil else nil
						}, {})
					elseif not t[bundleKey] then
						t[bundleKey] = reactModule.createElement(streamNotificationBundleWrapperModule, {
							layoutOrder = i_1,
							notifications = t_1[bundleKey],
							finishDismissNotification = var61,
							handleActions = var63,
							openMetaActions = var64,
							impressionsTag = if fFlagStreamNotificationImpressionLogging then "StreamNotificationImpression" else nil,
							impressionMetadataByNotificationId = if fFlagStreamNotificationImpressionLogging then var59.byNotificationId else nil
						}, {})
					end
				end
			end
			if var52.current == enumStreamNotificationsLoadingMoreStateModule.Loading then
				t.LoadingMore = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1e999,
					Size = UDim2.new(1, 0, 0, constantsModule.LoadingMoreNotifications.Size)
				}, {
					LoadingMoreSpinner = reactModule.createElement(loading, {
						size = iconSize.Small,
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				})
			end
			return if var85 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = if dropdownEnabled then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, -var58),
				AutomaticSize = Enum.AutomaticSize.Y
			}, t) else reactModule.createElement(emptyNotificationsModule)
		end
	end, {
		var42,
		var46,
		var53,
		dropdownEnabled,
		var59
	})
	
	local var67 = function(p18) --[[ line: 742 ]]
		-- upvalues: var46 (ref), enumStreamNotificationsDisplayStateModule (copy), fFlagStreamNotificationImpressionLogging (copy), var57 (ref), constantsModule (copy), var52 (ref), enumStreamNotificationsLoadingMoreStateModule (copy), var48 (write)
		local y = p18.AbsoluteCanvasSize.Y
		local y_1 = p18.AbsoluteWindowSize.Y
		local y_2 = p18.CanvasPosition.Y
		
		if y_1 == 0 or y == 0 or var46 ~= enumStreamNotificationsDisplayStateModule.Default then return end
		if fFlagStreamNotificationImpressionLogging and var57.current then
			var57.current:fire()
		end
		if y - y_1 - constantsModule.LoadingMoreNotifications.TriggerDistance <= y_2 and var52.current == enumStreamNotificationsLoadingMoreStateModule.Default then
			var48()
		end
	end
	
	local var68 = if p1.isSmallScreen then math.max(if userInputService.BottomBarSize then userInputService.BottomBarSize.Y else 0, if guiService:GetSafeZoneOffsets() then guiService:GetSafeZoneOffsets().bottom else 0) else 0
	
	return if dropdownEnabled then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		MetaActionsOpen = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Visible = var46 == enumStreamNotificationsDisplayStateModule.MetaActions,
			BackgroundTransparency = var37.Theme.Overlay.Transparency,
			BackgroundColor3 = var37.Theme.Overlay.Color,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 2,
			[reactModule.Event.Activated] = var50,
			BorderSizePixel = 0,
			Selectable = false
		}, { var65 }),
		NotificationsList = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, (p1.dropdownHeight or constantsModule.Dropdown.MaxHeight) - constantsModule.Dropdown.HeaderMinHeight - constantsModule.Dropdown.HeaderBodyGap),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			ScrollBarThickness = constantsModule.Dropdown.ScrollBarThickness,
			BorderSizePixel = 0,
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
			ScrollBarImageColor3 = var37.Theme.UIEmphasis.Color,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingEnabled = var46 == enumStreamNotificationsDisplayStateModule.Default,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[reactModule.Change.CanvasPosition] = var67,
			Selectable = false
		}, var66)
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0)
	}, {
		MetaActionsOpen = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Visible = var46 == enumStreamNotificationsDisplayStateModule.MetaActions,
			BackgroundTransparency = var37.Theme.Overlay.Transparency,
			BackgroundColor3 = var37.Theme.Overlay.Color,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 2,
			[reactModule.Event.Activated] = var50,
			BorderSizePixel = 0,
			Selectable = false
		}, { var65 }),
		NotificationsList = reactModule.createElement("ScrollingFrame", {
			ref = if fFlagStreamNotificationImpressionLogging then var56 else nil,
			Size = UDim2.new(1, 0, 1, -(var58 + constantsModule.DefaultPadding + var68)),
			CanvasSize = UDim2.new(1, 0, 1, -(var58 + constantsModule.DefaultPadding + var68)),
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, var58),
			AnchorPoint = Vector2.new(0, 0),
			ScrollBarThickness = 4,
			BorderSizePixel = 0,
			VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
			VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
			ScrollBarImageColor3 = var37.Theme.UIEmphasis.Color,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingEnabled = var46 == enumStreamNotificationsDisplayStateModule.Default,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[reactModule.Change.CanvasPosition] = var67,
			Selectable = false
		}, var66),
		ImpressionTracker = if fFlagStreamNotificationImpressionLogging then reactModule.createElement(frameBoundsImpressionsTracker, {
			pageContext = nil,
			impressionsTag = "StreamNotificationImpression",
			parentRef = var56,
			scrollViewPositionChangedSignal = var57.current,
			sendImpressions = var62
		}) else nil
	})
end