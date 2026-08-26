local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local components = streamNotifications.components
local parent = streamNotifications.Parent
local constantsModule = require(streamNotifications.constants)
local cryoModule = require(parent.Cryo)
local var1 = require(parent.Analytics).AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))
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
local var2 = httpRequestModule.config({
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
		connect = function(_, p1)
			-- upvalues: bindableEvent (ref)
			return bindableEvent.Event:Connect(p1)
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
	-- upvalues: useStyle (ref), streamNotificationDropdownExperimentationModule (ref), useDispatch (ref), useClientTriggerEventHandlerModule (ref), reactModule (ref), enumStreamNotificationsDisplayStateModule (ref), enumStreamNotificationsLoadingMoreStateModule (ref), fFlagStreamNotificationImpressionLogging (ref), createImpressionSignal (ref), userInputService (ref), constantsModule (ref), getStreamNotificationsModule (ref), var2 (ref), sortNotificationsModule (ref), getFStringPCGDKFilteredNotificationTypes (ref), thirdPartyUserService (ref), cryoModule (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref), fFlagStreamNotificationsStandardizeClickEvents (ref), clearUnreadNotificationsModule (ref), postReportNotificationModule (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), luaAppNewStreamNotificationsLogFix (ref), type (ref), joinExperience (ref), sessionService (ref), reportEventModule (ref), var1 (ref), postNotificationsApiModule (ref), notificationsCommonModule (ref), metaActionsMenuModule (ref), loading (ref), iconSize (ref), streamNotificationBundleWrapperModule (ref), streamNotificationAnimationWrapperModule (ref), emptyNotificationsModule (ref), guiService (ref), frameBoundsImpressionsTracker (ref)
	local var3 = useStyle()
	local dropdownEnabled = streamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local var4 = useDispatch()
	local var5 = useClientTriggerEventHandlerModule()
	local var6, var7 = reactModule.useState({})
	local var8, var9 = reactModule.useState(nil)
	local var10, var11 = reactModule.useState(enumStreamNotificationsDisplayStateModule.Initializing)
	local var12 = nil
	local var13 = nil
	local var14 = nil
	local showOverlay = p1.showOverlay or function(_) end
	local var15 = reactModule.useRef(enumStreamNotificationsLoadingMoreStateModule.Loading)
	local var16, var17 = reactModule.useState(enumStreamNotificationsLoadingMoreStateModule.Loading)
	local var18 = reactModule.useRef(0)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(if fFlagStreamNotificationImpressionLogging then createImpressionSignal() else nil)
	local var21 = constantsModule.Modal.HeaderHeight + (if userInputService.StatusBarSize then userInputService.StatusBarSize.Y else 0)
	local var22 = reactModule.useMemo(function()
		-- upvalues: fFlagStreamNotificationImpressionLogging (copy), var6 (ref)
		if not fFlagStreamNotificationImpressionLogging then
			return { byNotificationId = {}, byIndex = {} }
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in ipairs(var6) do
			if v.notificationSourceType == "Sendr" then
				local bundleKey = v.content.bundleKey
				local var23 = nil
				
				if bundleKey and bundleKey ~= "" then
					var23 = (t_2[bundleKey] or 0) + 1
					t_2[bundleKey] = var23
				end
				local t_3 = {
					impressionIndex = i,
					bundlePosition = var23,
					notification = v
				}
				t_1[i] = t_3
				
				if v.id then
					t[v.id] = t_3
				end
			end
		end
		return { byNotificationId = t, byIndex = t_1 }
	end, { var6 })
	reactModule.useEffect(function()
		-- upvalues: var12 (write)
		var12()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagStreamNotificationImpressionLogging (copy), var20 (ref)
		if fFlagStreamNotificationImpressionLogging then
			return function()
				-- upvalues: var20 (copy)
				if var20.current then
					var20.current:destroy()
				end
			end
		end
	end, {})
	
	local _ = function(p2)
		-- upvalues: var15 (ref), var17 (ref)
		var15.current = p2
		var17(p2)
	end
	
	var12 = function()
		-- upvalues: var15 (ref), enumStreamNotificationsLoadingMoreStateModule (copy), var17 (ref), getStreamNotificationsModule (copy), var2 (copy), constantsModule (copy), var18 (ref), sortNotificationsModule (copy), getFStringPCGDKFilteredNotificationTypes (copy), thirdPartyUserService (copy), var7 (ref), cryoModule (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy), var11 (ref), enumStreamNotificationsDisplayStateModule (copy), clearUnreadNotificationsModule (copy), var6 (ref), var12 (write)
		if var15.current == enumStreamNotificationsLoadingMoreStateModule.NoMoreNotifications then
			return
		end
		local loading = enumStreamNotificationsLoadingMoreStateModule.Loading
		var15.current = loading
		var17(loading)
		getStreamNotificationsModule(var2, constantsModule.DefaultMaxRows, var18.current):andThen(function(p2)
			-- upvalues: sortNotificationsModule (copy), getFStringPCGDKFilteredNotificationTypes (copy), thirdPartyUserService (copy), var7 (copy), cryoModule (copy), enumStreamNotificationsLoadingMoreStateModule (copy), var15 (copy), var17 (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), constantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy), var11 (copy), enumStreamNotificationsDisplayStateModule (copy), clearUnreadNotificationsModule (copy), var2 (copy), var18 (copy), var6 (copy), var12 (copy)
			p2 = sortNotificationsModule(p2)
			local var24 = getFStringPCGDKFilteredNotificationTypes()
			local t = {}
			
			for i, v in ipairs(p2) do
				if not var24[v.content.notificationType] or (not thirdPartyUserService or (not thirdPartyUserService:IsChatRestrictionSupported() or thirdPartyUserService.FriendCommunicationRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted)) then
					table.insert(t, v)
				end
			end
			var73 = t
			
			if var73 and #var73 > 0 then
				var7(function(p3)
					-- upvalues: cryoModule (copy), var73 (write)
					return cryoModule.List.join(p3, var73)
				end)
				local default = enumStreamNotificationsLoadingMoreStateModule.Default
				var15.current = default
				var17(default)
				
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
				var15.current = noMoreNotifications
				var17(noMoreNotifications)
			end
			var11(enumStreamNotificationsDisplayStateModule.Default)
			clearUnreadNotificationsModule(var2)
			var18.current = (tonumber(var18.current) or 0) + constantsModule.DefaultMaxRows
			
			if var6 and #var6 < constantsModule.DefaultMaxRows then
				var12()
			end
		end):catch(function(_)
			-- upvalues: var11 (copy), enumStreamNotificationsDisplayStateModule (copy)
			var11(enumStreamNotificationsDisplayStateModule.ErrorRetrieving)
		end)
	end
	
	local var25 = function(p3, p4)
		-- upvalues: dropdownEnabled (ref), p1 (ref), postReportNotificationModule (copy), var2 (copy), var13 (write), var11 (ref), enumStreamNotificationsDisplayStateModule (copy), var4 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy)
		if dropdownEnabled then
			p1.displayStream(false)
		end
		local _ = function()
			-- upvalues: dropdownEnabled (copy), p1 (copy), var11 (copy), enumStreamNotificationsDisplayStateModule (copy)
			if dropdownEnabled then
				p1.displayStream(true)
			else
				p1.setDisplayScreenGuiEnabled(true)
			end
			var11(enumStreamNotificationsDisplayStateModule.Default)
		end
		
		var4(openDynamicAbuseReportModule({
			abuseVector = abuseVectorModule.Notifications,
			targetId = p4.id,
			onSubmit = function()
				-- upvalues: postReportNotificationModule (copy), var2 (copy), p4 (ref), var13 (copy), p3 (ref), dropdownEnabled (copy), p1 (copy), var11 (copy), enumStreamNotificationsDisplayStateModule (copy)
				postReportNotificationModule(var2, p4.id):andThen(function(_) end):catch(function(_) end)
				var13(p3, p4)
				
				if not dropdownEnabled then
					p1.setDisplayScreenGuiEnabled(true)
				end
				var11(enumStreamNotificationsDisplayStateModule.Default)
			end,
			onClose = function()
				-- upvalues: var4 (copy), closeCentralOverlay (copy), dropdownEnabled (copy), p1 (copy), var11 (copy), enumStreamNotificationsDisplayStateModule (copy)
				var4(closeCentralOverlay())
				
				if dropdownEnabled then
					p1.displayStream(true)
				else
					p1.setDisplayScreenGuiEnabled(true)
				end
				var11(enumStreamNotificationsDisplayStateModule.Default)
			end
		}))
	end
	
	local _ = function(p3)
		-- upvalues: var14 (write), var6 (ref), cryoModule (copy), var7 (ref)
		var14()
		
		if var6 and p3 then
			var7(cryoModule.List.map(var6, function(p4)
				-- upvalues: p3 (ref)
				if p4.id == p3 then
					p4.dismiss = true
				end
				return p4
			end))
		end
	end
	
	local var26 = reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref), cryoModule (copy), var7 (ref)
		if var6 and p3 then
			var7(cryoModule.List.filter(var6, function(p4)
				-- upvalues: p3 (ref)
				return p4.id ~= p3 and p4.dismiss ~= true
			end))
		end
	end)
	local var27 = reactModule.useCallback(function(p3)
		-- upvalues: fFlagStreamNotificationImpressionLogging (copy), var22 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), cryoModule (copy), constantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy)
		if not fFlagStreamNotificationImpressionLogging then return end
		for i, v in ipairs(p3) do
			local var28 = var22.byIndex[v]
			local var29 = if var28 then var28.notification else nil
			
			if var29 then
				notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.impression, analyticsConstantsModule.EventNames.notificationImpression, cryoModule.Dictionary.join(var29.content.clientEventsPayload or {}, {
					sendrVersion = constantsModule.SENDRVersion,
					notificationType = var29.content.notificationType or nil,
					notificationId = var29.id or nil,
					notificationState = if fFlagStreamNotificationsStandardizeClickEvents then var29.content.currentState or nil else nil,
					bundlePosition = var28.bundlePosition or nil,
					bundleKey = var29.content.bundleKey or nil
				}))
			end
		end
	end, { var22 })
	local var30 = reactModule.useCallback(function(p4, p5)
		-- upvalues: var8 (ref), var9 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), cryoModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy), luaAppNewStreamNotificationsLogFix (copy), constantsModule (copy), type (copy), joinExperience (copy), p1 (ref), sessionService (copy), reportEventModule (copy), var1 (copy), postNotificationsApiModule (copy), var2 (copy), var13 (write), var14 (write), var11 (ref), enumStreamNotificationsDisplayStateModule (copy), var25 (ref), var6 (ref), var7 (ref), var5 (ref)
		p5 = p5 or var8
		var9(p5)
		notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, p4.eventName or "", cryoModule.Dictionary.join(p4.clientEventsPayload or {}, {
			notifType = if fFlagStreamNotificationsStandardizeClickEvents then nil elseif luaAppNewStreamNotificationsLogFix then p5 and (p5.content and p5.content.notificationType) else nil,
			notifId = if fFlagStreamNotificationsStandardizeClickEvents then nil elseif luaAppNewStreamNotificationsLogFix then p5 and p5.id else nil,
			notificationType = if fFlagStreamNotificationsStandardizeClickEvents then p5 and (p5.content and p5.content.notificationType) else nil,
			notificationId = if fFlagStreamNotificationsStandardizeClickEvents then p5 and p5.id else nil,
			notificationState = if fFlagStreamNotificationsStandardizeClickEvents then p5 and (p5.content and p5.content.currentState) else nil,
			visualItemType = p4.visualItemType or nil,
			visualItemName = p4.visualItemName or nil,
			sendrVersion = constantsModule.SENDRVersion
		}))
		
		if p4.actions and #p4.actions > 0 and p5 then
			for i, v in ipairs(p4.actions) do
				if v.actionType then
					if v.actionType == type.ActionTypeEnum.Deeplink then
						if joinExperience(v.path, false) then
							p1.displayStream(false)
							sessionService:SetSession(constantsModule.StreamSessionStructuralIdentifier.Level1, constantsModule.StreamSessionStructuralIdentifier.StreamNotification, constantsModule.StreamSessionStructuralIdentifier.StreamNotification)
							sessionService:SetMetadata(constantsModule.StreamSessionStructuralIdentifier.StreamNotification, constantsModule.StreamSessionStructuralIdentifier.DeleteOnGameLeave, "True")
							reportEventModule(var1, {
								action_type = v.actionType,
								delivery_channel = constantsModule.DeliveryChannel,
								notification_type = p5.notificationSourceType,
								notification_id = p5.id
							})
						end
					elseif v.actionType == type.ActionTypeEnum.NotificationApi then
						postNotificationsApiModule(var2, if p5 then p5.id else nil, v.path or nil):andThen(function(_)
							-- upvalues: v (ref), var13 (copy), p5 (ref)
							if v.nextState ~= nil and v.nextState ~= "" then
								var13(v.nextState, p5)
							end
						end):catch(function(_) end)
						var14()
					elseif v.actionType == type.ActionTypeEnum.Report then
						var11(enumStreamNotificationsDisplayStateModule.AbuseReport)
						var25(v.nextState, p5)
					elseif v.actionType == type.ActionTypeEnum.Dismiss then
						local id = p5.id
						var14()
						
						if var6 and id then
							var7(cryoModule.List.map(var6, function(p6)
								-- upvalues: id (ref)
								if p6.id == id then
									p6.dismiss = true
								end
								return p6
							end))
						end
					elseif v.actionType == type.ActionTypeEnum.ClientTrigger then
						if v.path == "TrustedContactsDoubleOptInModal" then
							p1.displayStream(false)
						end
						var5(v.path, {
							clientEventsPayload = p5.content.clientEventsPayload,
							callback = function()
								-- upvalues: var13 (copy), v (ref), p5 (ref)
								var13(v.nextState, p5)
							end
						})
					end
				end
			end
		end
	end)
	
	local var31 = function(p6)
		-- upvalues: var9 (ref), var11 (ref), enumStreamNotificationsDisplayStateModule (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), notificationsCommonModule (copy), constantsModule (copy), fFlagStreamNotificationsStandardizeClickEvents (copy)
		var9(p6)
		var11(enumStreamNotificationsDisplayStateModule.MetaActions)
		notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.openMetaActions, {
			visualItemType = notificationsCommonModule.type.VisualItemTypeEnum.MetaAction,
			sendrVersion = constantsModule.SENDRVersion,
			notificationState = if fFlagStreamNotificationsStandardizeClickEvents then p6 and (p6.content and (p6.content.currentState or nil)) else nil
		})
	end
	
	var14 = function()
		-- upvalues: showOverlay (ref), var9 (ref), var10 (ref), enumStreamNotificationsDisplayStateModule (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), notificationsCommonModule (copy), constantsModule (copy), var11 (ref)
		showOverlay(true)
		var9(nil)
		
		if var10 == enumStreamNotificationsDisplayStateModule.MetaActions then
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeMetaActions, {
				visualItemType = notificationsCommonModule.type.VisualItemTypeEnum.MetaAction,
				sendrVersion = constantsModule.SENDRVersion
			})
		end
		var11(enumStreamNotificationsDisplayStateModule.Default)
	end
	
	var13 = function(p6, p7)
		-- upvalues: var6 (ref), var7 (ref)
		local t = {}
		
		if var6 and p7 then
			for i, v in ipairs(var6) do
				if v.id == p7.id then
					v.content.currentState = p6
				end
				table.insert(t, v)
			end
		end
		var7(t)
	end
	
	local var32 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), metaActionsMenuModule (copy), var10 (ref), var8 (ref), p1 (ref), var30 (ref), var14 (write)
		return reactModule.createElement(metaActionsMenuModule, {
			displayState = var10,
			activeNotification = var8,
			isSmallScreen = p1.isSmallScreen,
			handleActions = var30,
			closeNotificationDisplay = var14
		})
	end, { var10, var8 })
	local var33 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), enumStreamNotificationsDisplayStateModule (copy), reactModule (copy), loading (copy), iconSize (copy), var6 (ref), dropdownEnabled (ref), constantsModule (copy), streamNotificationBundleWrapperModule (copy), var26 (ref), var30 (ref), var31 (ref), fFlagStreamNotificationImpressionLogging (copy), var22 (ref), streamNotificationAnimationWrapperModule (copy), var15 (ref), enumStreamNotificationsLoadingMoreStateModule (copy), var21 (ref), emptyNotificationsModule (copy)
		if var10 == enumStreamNotificationsDisplayStateModule.Initializing then
			return reactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		elseif var6 and #var6 > 0 then
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
			local var34 = false
			local t_1 = {}
			
			for i, v in ipairs(var6) do
				if v.notificationSourceType == "Sendr" then
					var34 = true
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
			for i_1, v_1 in ipairs(var6) do
				if v_1.notificationSourceType == "Sendr" then
					local bundleKey = v_1.content.bundleKey
					
					if not bundleKey or bundleKey == "" or #t_1[bundleKey] <= 1 then
						local var35 = if fFlagStreamNotificationImpressionLogging then var22.byNotificationId[v_1.id] else nil
						t[v_1.id] = reactModule.createElement(streamNotificationAnimationWrapperModule, {
							collapsed = false,
							layoutOrder = i_1,
							notification = v_1,
							finishDismissNotification = var26,
							handleActions = var30,
							openMetaActions = var31,
							impressionsTag = if fFlagStreamNotificationImpressionLogging then "StreamNotificationImpression" else nil,
							impressionIndex = if fFlagStreamNotificationImpressionLogging then if var35 then var35.impressionIndex else nil else nil
						}, {})
					elseif not t[bundleKey] then
						t[bundleKey] = reactModule.createElement(streamNotificationBundleWrapperModule, {
							layoutOrder = i_1,
							notifications = t_1[bundleKey],
							finishDismissNotification = var26,
							handleActions = var30,
							openMetaActions = var31,
							impressionsTag = if fFlagStreamNotificationImpressionLogging then "StreamNotificationImpression" else nil,
							impressionMetadataByNotificationId = if fFlagStreamNotificationImpressionLogging then var22.byNotificationId else nil
						}, {})
					end
				end
			end
			if var15.current == enumStreamNotificationsLoadingMoreStateModule.Loading then
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
			return if var34 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = if dropdownEnabled then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, -var21),
				AutomaticSize = Enum.AutomaticSize.Y
			}, t) else reactModule.createElement(emptyNotificationsModule)
		end
	end, {
		var6,
		var10,
		var16,
		dropdownEnabled,
		var22
	})
	
	local var36 = function(p8)
		-- upvalues: var10 (ref), enumStreamNotificationsDisplayStateModule (copy), fFlagStreamNotificationImpressionLogging (copy), var20 (ref), constantsModule (copy), var15 (ref), enumStreamNotificationsLoadingMoreStateModule (copy), var12 (write)
		local y = p8.AbsoluteCanvasSize.Y
		local y_1 = p8.AbsoluteWindowSize.Y
		local y_2 = p8.CanvasPosition.Y
		
		if y_1 == 0 or y == 0 or var10 ~= enumStreamNotificationsDisplayStateModule.Default then return end
		if fFlagStreamNotificationImpressionLogging and var20.current then
			var20.current:fire()
		end
		if y - y_1 - constantsModule.LoadingMoreNotifications.TriggerDistance <= y_2 and var15.current == enumStreamNotificationsLoadingMoreStateModule.Default then
			var12()
		end
	end
	
	local var37 = if p1.isSmallScreen then math.max(if userInputService.BottomBarSize then userInputService.BottomBarSize.Y else 0, if guiService:GetSafeZoneOffsets() then guiService:GetSafeZoneOffsets().bottom else 0) else 0
	
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
			Visible = var10 == enumStreamNotificationsDisplayStateModule.MetaActions,
			BackgroundTransparency = var3.Theme.Overlay.Transparency,
			BackgroundColor3 = var3.Theme.Overlay.Color,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 2,
			[reactModule.Event.Activated] = var14,
			BorderSizePixel = 0,
			Selectable = false
		}, { var32 }),
		NotificationsList = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, (p1.dropdownHeight or constantsModule.Dropdown.MaxHeight) - constantsModule.Dropdown.HeaderMinHeight - constantsModule.Dropdown.HeaderBodyGap),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			ScrollBarThickness = constantsModule.Dropdown.ScrollBarThickness,
			BorderSizePixel = 0,
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
			ScrollBarImageColor3 = var3.Theme.UIEmphasis.Color,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingEnabled = var10 == enumStreamNotificationsDisplayStateModule.Default,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[reactModule.Change.CanvasPosition] = var36,
			Selectable = false
		}, var33)
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
			Visible = var10 == enumStreamNotificationsDisplayStateModule.MetaActions,
			BackgroundTransparency = var3.Theme.Overlay.Transparency,
			BackgroundColor3 = var3.Theme.Overlay.Color,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 2,
			[reactModule.Event.Activated] = var14,
			BorderSizePixel = 0,
			Selectable = false
		}, { var32 }),
		NotificationsList = reactModule.createElement("ScrollingFrame", {
			ref = if fFlagStreamNotificationImpressionLogging then var19 else nil,
			Size = UDim2.new(1, 0, 1, -(var21 + constantsModule.DefaultPadding + var37)),
			CanvasSize = UDim2.new(1, 0, 1, -(var21 + constantsModule.DefaultPadding + var37)),
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, var21),
			AnchorPoint = Vector2.new(0, 0),
			ScrollBarThickness = 4,
			BorderSizePixel = 0,
			VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
			VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
			ScrollBarImageColor3 = var3.Theme.UIEmphasis.Color,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingEnabled = var10 == enumStreamNotificationsDisplayStateModule.Default,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[reactModule.Change.CanvasPosition] = var36,
			Selectable = false
		}, var33),
		ImpressionTracker = if fFlagStreamNotificationImpressionLogging then reactModule.createElement(frameBoundsImpressionsTracker, {
			pageContext = nil,
			impressionsTag = "StreamNotificationImpression",
			parentRef = var19,
			scrollViewPositionChangedSignal = var20.current,
			sendImpressions = var27
		}) else nil
	})
end