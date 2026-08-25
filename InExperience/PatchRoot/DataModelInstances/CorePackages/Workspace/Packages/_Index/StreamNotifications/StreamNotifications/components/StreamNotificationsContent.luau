local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local components = streamNotifications.components
local parent = streamNotifications.Parent
local constantsModule = require(streamNotifications.constants)
local cryoModule = require(parent.Cryo)
local var3 = require(parent.Analytics).AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))
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
local var17 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = if require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("StreamNotificationsContentHttpRetryCount", 4) else nil
})
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local useStyle = UIBloxModule.Core.Style.useStyle
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
local fFlagStreamNotificationsStandardizeClickEvents = sharedFlagsModule.FFlagStreamNotificationsStandardizeClickEvents
local fFlagStreamNotificationImpressionLogging = sharedFlagsModule.FFlagStreamNotificationImpressionLogging
local frameBoundsImpressionsTracker = require(parent.Impressions).FrameBoundsImpressionsTracker

local function _()
	-- upvalues: thirdPartyUserService (ref)
	return thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
end

local streamNotificationDropdownExperimentationModule = require(streamNotifications.StreamNotificationDropdownExperimentation)

local function createImpressionSignal()
	local bindableEvent = Instance.new("BindableEvent")
	
	return {
		connect = function(_, p0)
			-- upvalues: bindableEvent (ref)
			return bindableEvent.Event:Connect(p0)
		end,
		fire = function()
			-- upvalues: bindableEvent (ref)
			bindableEvent:Fire()
		end,
		destroy = function()
			-- upvalues: bindableEvent (ref)
			bindableEvent:Destroy()
		end
	}
end

return function(p1)
	-- upvalues: useStyle (ref), streamNotificationDropdownExperimentationModule (ref), useDispatch (ref), useClientTriggerEventHandlerModule (ref), reactModule (ref), enumStreamNotificationsDisplayStateModule (ref), enumStreamNotificationsLoadingMoreStateModule (ref), fFlagStreamNotificationImpressionLogging (ref), createImpressionSignal (ref), userInputService (ref), constantsModule (ref), getStreamNotificationsModule (ref), var17 (ref), sortNotificationsModule (ref), getFStringPCGDKFilteredNotificationTypes (ref), thirdPartyUserService (ref), cryoModule (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref), fFlagStreamNotificationsStandardizeClickEvents (ref), clearUnreadNotificationsModule (ref), postReportNotificationModule (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), luaAppNewStreamNotificationsLogFix (ref), type (ref), joinExperience (ref), sessionService (ref), reportEventModule (ref), var3 (ref), postNotificationsApiModule (ref), notificationsCommonModule (ref), metaActionsMenuModule (ref), loading (ref), iconSize (ref), streamNotificationBundleWrapperModule (ref), streamNotificationAnimationWrapperModule (ref), emptyNotificationsModule (ref), guiService (ref), frameBoundsImpressionsTracker (ref)
	local var35 = useStyle()
	local dropdownEnabled = streamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local var37 = useDispatch()
	local var38 = useClientTriggerEventHandlerModule()
	local var39, var40 = reactModule.useState({})
	local var41, var42 = reactModule.useState(nil)
	local var43, var44 = reactModule.useState(enumStreamNotificationsDisplayStateModule.Initializing)
	local var45 = nil
	local var46 = nil
	local var47 = nil
	local showOverlay = p1.showOverlay or function(_) end
	local var49 = reactModule.useRef(enumStreamNotificationsLoadingMoreStateModule.Loading)
	local var50, var51 = reactModule.useState(enumStreamNotificationsLoadingMoreStateModule.Loading)
	local var52 = reactModule.useRef(0)
	local var53 = reactModule.useRef(nil)
	local var54 = reactModule.useRef(if fFlagStreamNotificationImpressionLogging then createImpressionSignal() else nil)
	local var55 = constantsModule.Modal.HeaderHeight + (if userInputService.StatusBarSize then userInputService.StatusBarSize.Y else 0)
	local var56 = reactModule.useMemo(function()
		-- upvalues: fFlagStreamNotificationImpressionLogging (copy), var39 (ref)
		if not fFlagStreamNotificationImpressionLogging then
			return { byNotificationId = {}, byIndex = {} }
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in ipairs(var39) do
			if v.notificationSourceType == "Sendr" then
				local bundleKey = v.content.bundleKey
				local var69 = nil
				
				if bundleKey and bundleKey ~= "" then
					var69 = (t_2[bundleKey] or 0) + 1
					t_2[bundleKey] = var69
				end
				local t_3 = {
					impressionIndex = i,
					bundlePosition = var69,
					notification = v
				}
				t_1[i] = t_3
				
				if v.id then
					t[v.id] = t_3
				end
			end
		end
		return { byNotificationId = t, byIndex = t_1 }
	end, { var39 })
	reactModule.useEffect(function()
		-- upvalues: var45 (write)
		var45()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagStreamNotificationImpressionLogging (copy), var54 (ref)
		if fFlagStreamNotificationImpressionLogging then
			return function()
				-- upvalues: var54 (copy)
				if var54.current then
					var54.current:destroy()
				end
			end
		end
	end, {})
	
	local _ = function(p2)
		-- upvalues: var49 (ref), var51 (ref)
		var49.current = p2
		var51(p2)
	end
	
	var45 = function()
		-- upvalues: var49 (ref), enumStreamNotificationsLoadingMoreStateModule (copy), var51 (ref), getStreamNotificationsModule (copy), var17 (copy), constantsModule (copy), var52 (ref), sortNotificationsModule (copy), getFStringPCGDKFilteredNotificationTypes (copy), thirdPartyUserService (copy), var40 (ref), cryoModule (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy), var44 (ref), enumStreamNotificationsDisplayStateModule (copy), clearUnreadNotificationsModule (copy), var39 (ref), var45 (write)
		if var49.current == enumStreamNotificationsLoadingMoreStateModule.NoMoreNotifications then
			return
		end
		local loading = enumStreamNotificationsLoadingMoreStateModule.Loading
		var49.current = loading
		var51(loading)
		getStreamNotificationsModule(var17, constantsModule.DefaultMaxRows, var52.current):andThen(function(p3)
			-- upvalues: sortNotificationsModule (copy), getFStringPCGDKFilteredNotificationTypes (copy), thirdPartyUserService (copy), var40 (copy), cryoModule (copy), enumStreamNotificationsLoadingMoreStateModule (copy), var49 (copy), var51 (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), constantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy), var44 (copy), enumStreamNotificationsDisplayStateModule (copy), clearUnreadNotificationsModule (copy), var17 (copy), var52 (copy), var39 (copy), var45 (copy)
			p3 = sortNotificationsModule(p3)
			local var71 = getFStringPCGDKFilteredNotificationTypes()
			local t = {}
			
			for i, v in ipairs(p3) do
				if not var71[v.content.notificationType] or (not thirdPartyUserService or (not thirdPartyUserService:IsChatRestrictionSupported() or thirdPartyUserService.FriendCommunicationRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted)) then
					table.insert(t, v)
				end
			end
			var73 = t
			
			if var73 and #var73 > 0 then
				var40(function(p4)
					-- upvalues: cryoModule (copy), var73 (write)
					return cryoModule.List.join(p4, var73)
				end)
				local default = enumStreamNotificationsLoadingMoreStateModule.Default
				var49.current = default
				var51(default)
				
				for i, v in ipairs(var73) do
					notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.fetched, analyticsConstantsModule.EventNames.notificationRetrieved, cryoModule.Dictionary.join(v.content.clientEventsPayload or {}, {
						sendrVersion = constantsModule.SENDRVersion,
						notificationType = v.content.notificationType or nil,
						notificationId = v.id or nil,
						notificationState = if fFlagStreamNotificationsStandardizeClickEvents then v.content.currentState or nil else nil
					}))
				end
			else
				local noMoreNotifications = enumStreamNotificationsLoadingMoreStateModule.NoMoreNotifications
				var49.current = noMoreNotifications
				var51(noMoreNotifications)
			end
			var44(enumStreamNotificationsDisplayStateModule.Default)
			clearUnreadNotificationsModule(var17)
			var52.current = (tonumber(var52.current) or 0) + constantsModule.DefaultMaxRows
			
			if var39 and #var39 < constantsModule.DefaultMaxRows then
				var45()
			end
		end):catch(function(_)
			-- upvalues: var44 (copy), enumStreamNotificationsDisplayStateModule (copy)
			var44(enumStreamNotificationsDisplayStateModule.ErrorRetrieving)
		end)
	end
	
	local var57 = function(p5, p6)
		-- upvalues: dropdownEnabled (ref), p1 (ref), postReportNotificationModule (copy), var17 (copy), var46 (write), var44 (ref), enumStreamNotificationsDisplayStateModule (copy), var37 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy)
		if dropdownEnabled then
			p1.displayStream(false)
		end
		local _ = function()
			-- upvalues: dropdownEnabled (copy), p1 (copy), var44 (copy), enumStreamNotificationsDisplayStateModule (copy)
			if dropdownEnabled then
				p1.displayStream(true)
			else
				p1.setDisplayScreenGuiEnabled(true)
			end
			var44(enumStreamNotificationsDisplayStateModule.Default)
		end
		
		var37(openDynamicAbuseReportModule({
			abuseVector = abuseVectorModule.Notifications,
			targetId = p6.id,
			onSubmit = function()
				-- upvalues: postReportNotificationModule (copy), var17 (copy), p6 (ref), var46 (copy), p5 (ref), dropdownEnabled (copy), p1 (copy), var44 (copy), enumStreamNotificationsDisplayStateModule (copy)
				postReportNotificationModule(var17, p6.id):andThen(function(_) end):catch(function(_) end)
				var46(p5, p6)
				
				if not dropdownEnabled then
					p1.setDisplayScreenGuiEnabled(true)
				end
				var44(enumStreamNotificationsDisplayStateModule.Default)
			end,
			onClose = function()
				-- upvalues: var37 (copy), closeCentralOverlay (copy), dropdownEnabled (copy), p1 (copy), var44 (copy), enumStreamNotificationsDisplayStateModule (copy)
				var37(closeCentralOverlay())
				
				if dropdownEnabled then
					p1.displayStream(true)
				else
					p1.setDisplayScreenGuiEnabled(true)
				end
				var44(enumStreamNotificationsDisplayStateModule.Default)
			end
		}))
	end
	
	local _ = function(p7)
		-- upvalues: var47 (write), var39 (ref), cryoModule (copy), var40 (ref)
		var47()
		
		if var39 and p7 then
			var40(cryoModule.List.map(var39, function(p8)
				-- upvalues: p7 (ref)
				if p8.id == p7 then
					p8.dismiss = true
				end
				return p8
			end))
		end
	end
	
	local var58 = reactModule.useCallback(function(p9)
		-- upvalues: var39 (ref), cryoModule (copy), var40 (ref)
		if var39 and p9 then
			var40(cryoModule.List.filter(var39, function(p10)
				-- upvalues: p9 (ref)
				return p10.id ~= p9 and p10.dismiss ~= true
			end))
		end
	end)
	local var59 = reactModule.useCallback(function(p11)
		-- upvalues: fFlagStreamNotificationImpressionLogging (copy), var56 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), cryoModule (copy), constantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy)
		if not fFlagStreamNotificationImpressionLogging then return end
		for i, v in ipairs(p11) do
			local var74 = var56.byIndex[v]
			local var75 = if var74 then var74.notification else nil
			
			if var75 then
				notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.impression, analyticsConstantsModule.EventNames.notificationImpression, cryoModule.Dictionary.join(var75.content.clientEventsPayload or {}, {
					sendrVersion = constantsModule.SENDRVersion,
					notificationType = var75.content.notificationType or nil,
					notificationId = var75.id or nil,
					notificationState = if fFlagStreamNotificationsStandardizeClickEvents then var75.content.currentState or nil else nil,
					bundlePosition = var74.bundlePosition or nil,
					bundleKey = var75.content.bundleKey or nil
				}))
			end
		end
	end, { var56 })
	local var60 = reactModule.useCallback(function(p12, p13)
		-- upvalues: var41 (ref), var42 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), cryoModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy), luaAppNewStreamNotificationsLogFix (copy), constantsModule (copy), type (copy), joinExperience (copy), p1 (ref), sessionService (copy), reportEventModule (copy), var3 (copy), postNotificationsApiModule (copy), var17 (copy), var46 (write), var47 (write), var44 (ref), enumStreamNotificationsDisplayStateModule (copy), var57 (ref), var39 (ref), var40 (ref), var38 (ref)
		p13 = p13 or var41
		var42(p13)
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
							reportEventModule(var3, {
								action_type = v.actionType,
								delivery_channel = constantsModule.DeliveryChannel,
								notification_type = p13.notificationSourceType,
								notification_id = p13.id
							})
						end
					elseif v.actionType == type.ActionTypeEnum.NotificationApi then
						postNotificationsApiModule(var17, if p13 then p13.id else nil, v.path or nil):andThen(function(_)
							-- upvalues: v (ref), var46 (copy), p13 (ref)
							if v.nextState ~= nil and v.nextState ~= "" then
								var46(v.nextState, p13)
							end
						end):catch(function(_) end)
						var47()
					elseif v.actionType == type.ActionTypeEnum.Report then
						var44(enumStreamNotificationsDisplayStateModule.AbuseReport)
						var57(v.nextState, p13)
					elseif v.actionType == type.ActionTypeEnum.Dismiss then
						local id = p13.id
						var47()
						
						if var39 and id then
							var40(cryoModule.List.map(var39, function(p14)
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
						var38(v.path, {
							clientEventsPayload = p13.content.clientEventsPayload,
							callback = function()
								-- upvalues: var46 (copy), v (ref), p13 (ref)
								var46(v.nextState, p13)
							end
						})
					end
				end
			end
		end
	end)
	
	local var61 = function(p15)
		-- upvalues: var42 (ref), var44 (ref), enumStreamNotificationsDisplayStateModule (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), notificationsCommonModule (copy), constantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy)
		var42(p15)
		var44(enumStreamNotificationsDisplayStateModule.MetaActions)
		notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.openMetaActions, {
			visualItemType = notificationsCommonModule.type.VisualItemTypeEnum.MetaAction,
			sendrVersion = constantsModule.SENDRVersion,
			notificationState = if fFlagStreamNotificationsStandardizeClickEvents then p15 and (p15.content and (p15.content.currentState or nil)) else nil
		})
	end
	
	var47 = function()
		-- upvalues: showOverlay (ref), var42 (ref), var43 (ref), enumStreamNotificationsDisplayStateModule (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), notificationsCommonModule (copy), constantsModule (copy), var44 (ref)
		showOverlay(true)
		var42(nil)
		
		if var43 == enumStreamNotificationsDisplayStateModule.MetaActions then
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeMetaActions, {
				visualItemType = notificationsCommonModule.type.VisualItemTypeEnum.MetaAction,
				sendrVersion = constantsModule.SENDRVersion
			})
		end
		var44(enumStreamNotificationsDisplayStateModule.Default)
	end
	
	var46 = function(p16, p17)
		-- upvalues: var39 (ref), var40 (ref)
		local t = {}
		
		if var39 and p17 then
			for i, v in ipairs(var39) do
				if v.id == p17.id then
					v.content.currentState = p16
				end
				table.insert(t, v)
			end
		end
		var40(t)
	end
	
	local var62 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), metaActionsMenuModule (copy), var43 (ref), var41 (ref), p1 (ref), var60 (ref), var47 (write)
		return reactModule.createElement(metaActionsMenuModule, {
			displayState = var43,
			activeNotification = var41,
			isSmallScreen = p1.isSmallScreen,
			handleActions = var60,
			closeNotificationDisplay = var47
		})
	end, { var43, var41 })
	local var63 = reactModule.useMemo(function()
		-- upvalues: var43 (ref), enumStreamNotificationsDisplayStateModule (copy), reactModule (copy), loading (copy), iconSize (copy), var39 (ref), dropdownEnabled (ref), constantsModule (copy), streamNotificationBundleWrapperModule (copy), var58 (ref), var60 (ref), var61 (ref), fFlagStreamNotificationImpressionLogging (copy), var56 (ref), streamNotificationAnimationWrapperModule (copy), var49 (ref), enumStreamNotificationsLoadingMoreStateModule (copy), var55 (ref), emptyNotificationsModule (copy)
		if var43 == enumStreamNotificationsDisplayStateModule.Initializing then
			return reactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		elseif var39 and #var39 > 0 then
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
			local var79 = false
			local t_1 = {}
			
			for i, v in ipairs(var39) do
				if v.notificationSourceType == "Sendr" then
					var79 = true
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
			for i_1, v_1 in ipairs(var39) do
				if v_1.notificationSourceType == "Sendr" then
					local bundleKey = v_1.content.bundleKey
					
					if not bundleKey or bundleKey == "" or #t_1[bundleKey] <= 1 then
						local var81 = if fFlagStreamNotificationImpressionLogging then var56.byNotificationId[v_1.id] else nil
						t[v_1.id] = reactModule.createElement(streamNotificationAnimationWrapperModule, {
							collapsed = false,
							layoutOrder = i_1,
							notification = v_1,
							finishDismissNotification = var58,
							handleActions = var60,
							openMetaActions = var61,
							impressionsTag = if fFlagStreamNotificationImpressionLogging then "StreamNotificationImpression" else nil,
							impressionIndex = if fFlagStreamNotificationImpressionLogging then if var81 then var81.impressionIndex else nil else nil
						}, {})
					elseif not t[bundleKey] then
						t[bundleKey] = reactModule.createElement(streamNotificationBundleWrapperModule, {
							layoutOrder = i_1,
							notifications = t_1[bundleKey],
							finishDismissNotification = var58,
							handleActions = var60,
							openMetaActions = var61,
							impressionsTag = if fFlagStreamNotificationImpressionLogging then "StreamNotificationImpression" else nil,
							impressionMetadataByNotificationId = if fFlagStreamNotificationImpressionLogging then var56.byNotificationId else nil
						}, {})
					end
				end
			end
			if var49.current == enumStreamNotificationsLoadingMoreStateModule.Loading then
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
			return if var79 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = if dropdownEnabled then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, -var55),
				AutomaticSize = Enum.AutomaticSize.Y
			}, t) else reactModule.createElement(emptyNotificationsModule)
		end
	end, {
		var39,
		var43,
		var50,
		dropdownEnabled,
		var56
	})
	
	local var64 = function(p18)
		-- upvalues: var43 (ref), enumStreamNotificationsDisplayStateModule (copy), fFlagStreamNotificationImpressionLogging (copy), var54 (ref), constantsModule (copy), var49 (ref), enumStreamNotificationsLoadingMoreStateModule (copy), var45 (write)
		local y = p18.AbsoluteCanvasSize.Y
		local y_1 = p18.AbsoluteWindowSize.Y
		local y_2 = p18.CanvasPosition.Y
		
		if y_1 == 0 or y == 0 or var43 ~= enumStreamNotificationsDisplayStateModule.Default then return end
		if fFlagStreamNotificationImpressionLogging and var54.current then
			var54.current:fire()
		end
		if y - y_1 - constantsModule.LoadingMoreNotifications.TriggerDistance <= y_2 and var49.current == enumStreamNotificationsLoadingMoreStateModule.Default then
			var45()
		end
	end
	
	local var65 = if p1.isSmallScreen then math.max(if userInputService.BottomBarSize then userInputService.BottomBarSize.Y else 0, if guiService:GetSafeZoneOffsets() then guiService:GetSafeZoneOffsets().bottom else 0) else 0
	
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
			Visible = var43 == enumStreamNotificationsDisplayStateModule.MetaActions,
			BackgroundTransparency = var35.Theme.Overlay.Transparency,
			BackgroundColor3 = var35.Theme.Overlay.Color,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 2,
			[reactModule.Event.Activated] = var47,
			BorderSizePixel = 0,
			Selectable = false
		}, { var62 }),
		NotificationsList = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, (p1.dropdownHeight or constantsModule.Dropdown.MaxHeight) - constantsModule.Dropdown.HeaderMinHeight - constantsModule.Dropdown.HeaderBodyGap),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			ScrollBarThickness = constantsModule.Dropdown.ScrollBarThickness,
			BorderSizePixel = 0,
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
			ScrollBarImageColor3 = var35.Theme.UIEmphasis.Color,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingEnabled = var43 == enumStreamNotificationsDisplayStateModule.Default,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[reactModule.Change.CanvasPosition] = var64,
			Selectable = false
		}, var63)
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
			Visible = var43 == enumStreamNotificationsDisplayStateModule.MetaActions,
			BackgroundTransparency = var35.Theme.Overlay.Transparency,
			BackgroundColor3 = var35.Theme.Overlay.Color,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 2,
			[reactModule.Event.Activated] = var47,
			BorderSizePixel = 0,
			Selectable = false
		}, { var62 }),
		NotificationsList = reactModule.createElement("ScrollingFrame", {
			ref = if fFlagStreamNotificationImpressionLogging then var53 else nil,
			Size = UDim2.new(1, 0, 1, -(var55 + constantsModule.DefaultPadding + var65)),
			CanvasSize = UDim2.new(1, 0, 1, -(var55 + constantsModule.DefaultPadding + var65)),
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, var55),
			AnchorPoint = Vector2.new(0, 0),
			ScrollBarThickness = 4,
			BorderSizePixel = 0,
			VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
			VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
			ScrollBarImageColor3 = var35.Theme.UIEmphasis.Color,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingEnabled = var43 == enumStreamNotificationsDisplayStateModule.Default,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[reactModule.Change.CanvasPosition] = var64,
			Selectable = false
		}, var63),
		ImpressionTracker = if fFlagStreamNotificationImpressionLogging then reactModule.createElement(frameBoundsImpressionsTracker, {
			pageContext = nil,
			impressionsTag = "StreamNotificationImpression",
			parentRef = var53,
			scrollViewPositionChangedSignal = var54.current,
			sendImpressions = var59
		}) else nil
	})
end