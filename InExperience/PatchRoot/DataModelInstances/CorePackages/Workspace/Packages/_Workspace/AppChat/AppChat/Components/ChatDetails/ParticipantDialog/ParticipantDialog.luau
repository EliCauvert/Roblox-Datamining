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
	openViewProfile = function(_) --[[ line: 81 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openViewProfile was not passed to ParticipantDialog")
	end,
	openChat = function(...) --[[ line: 84 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openChat was not passed to ParticipantDialog")
	end,
	openReportUser = function(...) --[[ line: 87 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openReportUser was not passed to ParticipantDialog")
	end,
	openRemoveUserDialog = function(...) --[[ line: 90 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openRemoveUserDialog was not passed to ParticipantDialog")
	end,
	openTrustedFriend = function(...) --[[ line: 93 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openTrustedFriend was not passed to ParticipantDialog")
	end,
	onDismiss = function(_) --[[ line: 96 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onDismiss was not passed to ParticipantDialog")
	end
}

function ParticipantDialog(p0) --[[ line: 103 ]]
	-- upvalues: cryoModule (ref), t (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), reactModule (ref), useLayerCollector (ref), fFlagAppChatParticipantDialogGamepadFocusModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), loggerModule (ref), chatDetailsTelemetryEventsModule (ref), popoverSide (ref), menu (ref), popoverAlign (ref), inputSize (ref), uDim (ref), foundationModule (ref)
	local var13 = cryoModule.Dictionary.join(t, p0)
	local var14 = useTelemetryModule(chatDialogTelemetryLayerModule.Context)
	local var15 = reactModule.useRef(nil)
	local var16 = useLayerCollector()
	local var17, var18 = reactModule.useState(true)
	local conversationId = var13.conversationId
	local participantId = var13.participantId
	local showRemoveUserButton = var13.showRemoveUserButton
	local unitTestScreenSize = var13.unitTestScreenSize or var16.absoluteSize
	local var20 = if var13.anchorRef and var13.anchorRef.current then var13.anchorRef else nil
	local onDismiss = var13.onDismiss or function() --[[ line: 114 ]] end
	
	local var22 = function() --[[ line: 116 ]]
		-- upvalues: var18 (ref), onDismiss (ref)
		var18(false)
		onDismiss()
	end
	
	local var23 = if fFlagAppChatParticipantDialogGamepadFocusModule then useAppFocusRoot({
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = var17,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p1) --[[ line: 125 ]]
					-- upvalues: var18 (ref), onDismiss (ref)
					p1.cancelled = true
					var18(false)
					onDismiss()
				end)
			}
		}
	}) else nil
	local var24 = reactModule.useRef(false)
	local t_1 = {}
	
	local function onDisabledActivated() --[[ line: 145 ]] end
	
	local function _(p2, p3, p4) --[[ line: 147 | named "insertAction" ]]
		-- upvalues: t_1 (ref), onDisabledActivated (ref), var24 (ref), var18 (ref)
		table.insert(t_1, {
			text = p2,
			isDisabled = p4,
			onActivated = if p4 then onDisabledActivated else function() --[[ line: 155 ]]
				-- upvalues: var24 (copy), var18 (copy), p3 (ref)
				if var24.current then return end
				var24.current = true
				var18(false)
				
				if p3 then
					p3()
				end
			end
		})
	end
	
	if var13.showViewProfileButton then
		local var27 = function() --[[ line: 170 ]]
			-- upvalues: loggerModule (copy), participantId (ref), var13 (ref)
			loggerModule:info("User activated viewProfile | userId: {}", participantId)
			var13.openViewProfile(participantId)
		end
		
		table.insert(t_1, {
			isDisabled = nil,
			text = var13.viewProfileText,
			onActivated = function() --[[ line: 155 ]]
				-- upvalues: var24 (ref), var18 (ref), var27 (ref)
				if var24.current then return end
				var24.current = true
				var18(false)
				
				if var27 then
					var27()
				end
			end
		})
	end
	if var13.showTrustedFriendButton then
		local trustedFriendText = var13.trustedFriendText
		
		local var28 = function() --[[ line: 177 ]]
			-- upvalues: loggerModule (copy), participantId (ref), var13 (ref)
			loggerModule:info("User activated openTrustedFriend | userId: {}", participantId)
			var13.openTrustedFriend(participantId)
		end
		
		local isTrustedFriendButtonDisabled = var13.isTrustedFriendButtonDisabled
		table.insert(t_1, {
			text = trustedFriendText,
			isDisabled = isTrustedFriendButtonDisabled,
			onActivated = if isTrustedFriendButtonDisabled then onDisabledActivated else function() --[[ line: 155 ]]
				-- upvalues: var24 (ref), var18 (ref), var28 (ref)
				if var24.current then return end
				var24.current = true
				var18(false)
				
				if var28 then
					var28()
				end
			end
		})
	end
	if var13.showChatButton then
		local var29 = function() --[[ line: 184 ]]
			-- upvalues: loggerModule (copy), participantId (ref), var14 (ref), chatDetailsTelemetryEventsModule (copy), var13 (ref)
			loggerModule:info("User activated openChat | userId: {}", participantId)
			var14.emit(chatDetailsTelemetryEventsModule.ParticipantDialogChatClicked, {})
			var13.openChat(participantId)
		end
		
		table.insert(t_1, {
			isDisabled = nil,
			text = var13.chatText,
			onActivated = function() --[[ line: 155 ]]
				-- upvalues: var24 (ref), var18 (ref), var29 (ref)
				if var24.current then return end
				var24.current = true
				var18(false)
				
				if var29 then
					var29()
				end
			end
		})
	end
	local var30 = function() --[[ line: 191 ]]
		-- upvalues: loggerModule (copy), participantId (ref), conversationId (ref), var14 (ref), chatDetailsTelemetryEventsModule (copy), var13 (ref)
		loggerModule:info("User activated reportUser | userId: {}, conversationId: {}", participantId, conversationId)
		var14.emit(chatDetailsTelemetryEventsModule.ParticipantDialogReportUserClicked, {})
		var13.openReportUser(participantId, conversationId)
	end
	
	table.insert(t_1, {
		isDisabled = nil,
		text = var13.reportUserText,
		onActivated = function() --[[ line: 155 ]]
			-- upvalues: var24 (ref), var18 (ref), var30 (ref)
			if var24.current then return end
			var24.current = true
			var18(false)
			
			if var30 then
				var30()
			end
		end
	})
	
	if showRemoveUserButton then
		local var31 = function() --[[ line: 198 ]]
			-- upvalues: var13 (ref), participantId (ref), conversationId (ref)
			var13.openRemoveUserDialog(participantId, conversationId)
		end
		
		table.insert(t_1, {
			isDisabled = nil,
			text = var13.removeFromGroupText,
			onActivated = function() --[[ line: 155 ]]
				-- upvalues: var24 (ref), var18 (ref), var31 (ref)
				if var24.current then return end
				var24.current = true
				var18(false)
				
				if var31 then
					var31()
				end
			end
		})
	end
	return if var20 then reactModule.createElement(menu, {
		align = popoverAlign.End,
		anchorRef = var20,
		isOpen = var17,
		items = t_1,
		onPressedOutside = var22,
		ref = if fFlagAppChatParticipantDialogGamepadFocusModule then var23 else nil,
		side = if unitTestScreenSize.Y / 2 < var20.current.AbsolutePosition.Y + var20.current.AbsoluteSize.Y / 2 then popoverSide.Top else popoverSide.Bottom,
		size = inputSize.Medium,
		width = if var13.isWideMode then uDim else nil
	}) else reactModule.createElement(foundationModule.View, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		MenuAnchor = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -10),
			Size = UDim2.fromOffset(400, 1),
			ref = var15
		}),
		Menu = reactModule.createElement(menu, {
			align = popoverAlign.Center,
			anchorRef = var15,
			isOpen = var17,
			items = t_1,
			onPressedOutside = var22,
			ref = if fFlagAppChatParticipantDialogGamepadFocusModule then var23 else nil,
			side = popoverSide.Top,
			size = inputSize.Medium,
			width = if var13.isWideMode then uDim else nil
		})
	})
end

return memo(ParticipantDialog)