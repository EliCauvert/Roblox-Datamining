local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local loggerModule = require(script.Parent.Logger)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useLayerCollector = require(parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatDetailsTelemetryEventsModule = require(appChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local chatDialogTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local menu = foundationModule.Menu
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local inputSize = foundationModule.Enums.InputSize
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local fFlagAppChatParticipantDialogGamepadFocusModule = require(appChat.Flags.FFlagAppChatParticipantDialogGamepadFocus)
local uDim = UDim.new(0, 400)
local t = {
	conversationId = nil,
	participantId = nil,
	anchorRef = nil,
	showRemoveUserButton = false,
	showViewProfileButton = true,
	showChatButton = false,
	showTrustedFriendButton = false,
	isWideMode = false,
	unitTestScreenSize = nil,
	viewProfileText = "localizedText.ViewProfile",
	chatText = "localizedText.Chat",
	reportUserText = "localizedText.ReportUser",
	removeFromGroupText = "localizedText.RemoveFromGroup",
	trustedFriendText = "localizedText.AddTrustedFriend",
	isTrustedFriendButtonDisabled = false,
	openViewProfile = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openViewProfile was not passed to ParticipantDialog")
	end,
	openChat = function(...)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openChat was not passed to ParticipantDialog")
	end,
	openReportUser = function(...)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openReportUser was not passed to ParticipantDialog")
	end,
	openRemoveUserDialog = function(...)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openRemoveUserDialog was not passed to ParticipantDialog")
	end,
	openTrustedFriend = function(...)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openTrustedFriend was not passed to ParticipantDialog")
	end,
	onDismiss = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onDismiss was not passed to ParticipantDialog")
	end
}

function ParticipantDialog(p1)
	-- upvalues: cryoModule (ref), t (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), reactModule (ref), useLayerCollector (ref), fFlagAppChatParticipantDialogGamepadFocusModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), loggerModule (ref), chatDetailsTelemetryEventsModule (ref), popoverSide (ref), menu (ref), popoverAlign (ref), inputSize (ref), uDim (ref), foundationModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useTelemetryModule(chatDialogTelemetryLayerModule.Context)
	local var3 = reactModule.useRef(nil)
	local var4 = useLayerCollector()
	local var5, var6 = reactModule.useState(true)
	local conversationId = var1.conversationId
	local participantId = var1.participantId
	local showRemoveUserButton = var1.showRemoveUserButton
	local unitTestScreenSize = var1.unitTestScreenSize or var4.absoluteSize
	local var7 = if var1.anchorRef and var1.anchorRef.current then var1.anchorRef else nil
	local onDismiss = var1.onDismiss or function() end
	
	local var8 = function()
		-- upvalues: var6 (ref), onDismiss (ref)
		var6(false)
		onDismiss()
	end
	
	local var9 = if fFlagAppChatParticipantDialogGamepadFocusModule then useAppFocusRoot({
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = var5,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p2)
					-- upvalues: var6 (ref), onDismiss (ref)
					p2.cancelled = true
					var6(false)
					onDismiss()
				end)
			}
		}
	}) else nil
	local var10 = reactModule.useRef(false)
	local t_1 = {}
	
	local function onDisabledActivated() end
	
	local function _(p2, p3, p4)
		-- upvalues: t_1 (ref), onDisabledActivated (ref), var10 (ref), var6 (ref)
		table.insert(t_1, {
			text = p2,
			isDisabled = p4,
			onActivated = if p4 then onDisabledActivated else function()
				-- upvalues: var10 (copy), var6 (copy), p3 (ref)
				if var10.current then return end
				var10.current = true
				var6(false)
				
				if p3 then
					p3()
				end
			end
		})
	end
	
	if var1.showViewProfileButton then
		local var11 = function()
			-- upvalues: loggerModule (copy), participantId (ref), var1 (ref)
			loggerModule:info("User activated viewProfile | userId: {}", participantId)
			var1.openViewProfile(participantId)
		end
		
		table.insert(t_1, {
			isDisabled = nil,
			text = var1.viewProfileText,
			onActivated = function()
				-- upvalues: var10 (ref), var6 (ref), var11 (ref)
				if var10.current then return end
				var10.current = true
				var6(false)
				
				if var11 then
					var11()
				end
			end
		})
	end
	if var1.showTrustedFriendButton then
		local trustedFriendText = var1.trustedFriendText
		
		local var12 = function()
			-- upvalues: loggerModule (copy), participantId (ref), var1 (ref)
			loggerModule:info("User activated openTrustedFriend | userId: {}", participantId)
			var1.openTrustedFriend(participantId)
		end
		
		local isTrustedFriendButtonDisabled = var1.isTrustedFriendButtonDisabled
		table.insert(t_1, {
			text = trustedFriendText,
			isDisabled = isTrustedFriendButtonDisabled,
			onActivated = if isTrustedFriendButtonDisabled then onDisabledActivated else function()
				-- upvalues: var10 (ref), var6 (ref), var12 (ref)
				if var10.current then return end
				var10.current = true
				var6(false)
				
				if var12 then
					var12()
				end
			end
		})
	end
	if var1.showChatButton then
		local var13 = function()
			-- upvalues: loggerModule (copy), participantId (ref), var2 (ref), chatDetailsTelemetryEventsModule (copy), var1 (ref)
			loggerModule:info("User activated openChat | userId: {}", participantId)
			var2.emit(chatDetailsTelemetryEventsModule.ParticipantDialogChatClicked, {})
			var1.openChat(participantId)
		end
		
		table.insert(t_1, {
			isDisabled = nil,
			text = var1.chatText,
			onActivated = function()
				-- upvalues: var10 (ref), var6 (ref), var13 (ref)
				if var10.current then return end
				var10.current = true
				var6(false)
				
				if var13 then
					var13()
				end
			end
		})
	end
	local var14 = function()
		-- upvalues: loggerModule (copy), participantId (ref), conversationId (ref), var2 (ref), chatDetailsTelemetryEventsModule (copy), var1 (ref)
		loggerModule:info("User activated reportUser | userId: {}, conversationId: {}", participantId, conversationId)
		var2.emit(chatDetailsTelemetryEventsModule.ParticipantDialogReportUserClicked, {})
		var1.openReportUser(participantId, conversationId)
	end
	
	table.insert(t_1, {
		isDisabled = nil,
		text = var1.reportUserText,
		onActivated = function()
			-- upvalues: var10 (ref), var6 (ref), var14 (ref)
			if var10.current then return end
			var10.current = true
			var6(false)
			
			if var14 then
				var14()
			end
		end
	})
	
	if showRemoveUserButton then
		local var15 = function()
			-- upvalues: var1 (ref), participantId (ref), conversationId (ref)
			var1.openRemoveUserDialog(participantId, conversationId)
		end
		
		table.insert(t_1, {
			isDisabled = nil,
			text = var1.removeFromGroupText,
			onActivated = function()
				-- upvalues: var10 (ref), var6 (ref), var15 (ref)
				if var10.current then return end
				var10.current = true
				var6(false)
				
				if var15 then
					var15()
				end
			end
		})
	end
	return if var7 then reactModule.createElement(menu, {
		align = popoverAlign.End,
		anchorRef = var7,
		isOpen = var5,
		items = t_1,
		onPressedOutside = var8,
		ref = if fFlagAppChatParticipantDialogGamepadFocusModule then var9 else nil,
		side = if unitTestScreenSize.Y / 2 < var7.current.AbsolutePosition.Y + var7.current.AbsoluteSize.Y / 2 then popoverSide.Top else popoverSide.Bottom,
		size = inputSize.Medium,
		width = if var1.isWideMode then uDim else nil
	}) else reactModule.createElement(foundationModule.View, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		MenuAnchor = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -10),
			Size = UDim2.fromOffset(400, 1),
			ref = var3
		}),
		Menu = reactModule.createElement(menu, {
			align = popoverAlign.Center,
			anchorRef = var3,
			isOpen = var5,
			items = t_1,
			onPressedOutside = var8,
			ref = if fFlagAppChatParticipantDialogGamepadFocusModule then var9 else nil,
			side = popoverSide.Top,
			size = inputSize.Medium,
			width = if var1.isWideMode then uDim else nil
		})
	})
end

return memo(ParticipantDialog)