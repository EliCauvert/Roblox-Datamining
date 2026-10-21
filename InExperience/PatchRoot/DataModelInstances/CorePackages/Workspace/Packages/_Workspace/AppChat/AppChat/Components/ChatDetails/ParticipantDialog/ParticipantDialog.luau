local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local LoggerModule = require(script.Parent.Logger)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UseLayerCollectorFunction = require(Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatDetailsTelemetryEventsModule = require(AppChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local ChatDialogTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local Menu = FoundationModule.Menu
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local InputSize = FoundationModule.Enums.InputSize
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local _UDim = UDim.new(0, 400)
local config = {
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
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openViewProfile was not passed to ParticipantDialog")
	end,
	openChat = function(...)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openChat was not passed to ParticipantDialog")
	end,
	openReportUser = function(...)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openReportUser was not passed to ParticipantDialog")
	end,
	openRemoveUserDialog = function(...)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openRemoveUserDialog was not passed to ParticipantDialog")
	end,
	openTrustedFriend = function(...)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openTrustedFriend was not passed to ParticipantDialog")
	end,
	onDismiss = function(_)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("onDismiss was not passed to ParticipantDialog")
	end
}

function ParticipantDialog(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTelemetryModule (copy), ChatDialogTelemetryLayerModule (copy), ReactModule (copy), UseLayerCollectorFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), LoggerModule (copy), ChatDetailsTelemetryEventsModule (copy), PopoverSide (copy), Menu (copy), PopoverAlign (copy), InputSize (copy), _UDim (copy), FoundationModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatDialogTelemetryLayerModule.Context)
	local UseRefResult = ReactModule.useRef(nil)
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local ConversationId = JoinResult.conversationId
	local ParticipantId = JoinResult.participantId
	local ShowRemoveUserButton = JoinResult.showRemoveUserButton
	local UnitTestScreenSize = JoinResult.unitTestScreenSize or UseLayerCollectorResult.absoluteSize
	local AnchorRef = if JoinResult.anchorRef and JoinResult.anchorRef.current then JoinResult.anchorRef else nil
	local OnDismiss = JoinResult.onDismiss or function() end
	
	local function OnPressedOutside()
		-- upvalues: UseStateResult2 (copy), OnDismiss (copy)
		UseStateResult2(false)
		OnDismiss()
	end
	
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = UseStateResult,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: UseStateResult2 (copy), OnDismiss (copy)
					p2.cancelled = true
					UseStateResult2(false)
					OnDismiss()
				end)
			}
		}
	})
	local UseRefResult1 = ReactModule.useRef(false)
	local List = {}
	
	local function onDisabledActivated() end
	
	local function _(Text, Callback, IsDisabled)
		-- upvalues: List (copy), onDisabledActivated (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		table.insert(List, {
			text = Text,
			isDisabled = IsDisabled,
			onActivated = if IsDisabled then onDisabledActivated else function()
				-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval), Callback (copy)
				if UseRefResult1.current then return end
				UseRefResult1.current = true
				UseStateResult2(false)
				
				if Callback then
					Callback()
				end
			end
		})
	end
	
	if JoinResult.showViewProfileButton then
		local function v38()
			-- upvalues: LoggerModule (upval), ParticipantId (copy), JoinResult (copy)
			LoggerModule:info("User activated viewProfile | userId: {}", ParticipantId)
			JoinResult.openViewProfile(ParticipantId)
		end
		
		table.insert(List, {
			isDisabled = nil,
			text = JoinResult.viewProfileText,
			onActivated = function()
				-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), v38 (copy)
				if UseRefResult1.current then return end
				UseRefResult1.current = true
				UseStateResult2(false)
				
				if v38 then
					v38()
				end
			end
		})
	end
	if JoinResult.showTrustedFriendButton then
		local function v39()
			-- upvalues: LoggerModule (upval), ParticipantId (copy), JoinResult (copy)
			LoggerModule:info("User activated openTrustedFriend | userId: {}", ParticipantId)
			JoinResult.openTrustedFriend(ParticipantId)
		end
		
		local IsTrustedFriendButtonDisabled = JoinResult.isTrustedFriendButtonDisabled
		table.insert(List, {
			text = JoinResult.trustedFriendText,
			isDisabled = IsTrustedFriendButtonDisabled,
			onActivated = if IsTrustedFriendButtonDisabled then onDisabledActivated else function()
				-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), v39 (copy)
				if UseRefResult1.current then return end
				UseRefResult1.current = true
				UseStateResult2(false)
				
				if v39 then
					v39()
				end
			end
		})
	end
	if JoinResult.showChatButton then
		local function v41()
			-- upvalues: LoggerModule (upval), ParticipantId (copy), UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval), JoinResult (copy)
			LoggerModule:info("User activated openChat | userId: {}", ParticipantId)
			UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.ParticipantDialogChatClicked, {})
			JoinResult.openChat(ParticipantId)
		end
		
		table.insert(List, {
			isDisabled = nil,
			text = JoinResult.chatText,
			onActivated = function()
				-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), v41 (copy)
				if UseRefResult1.current then return end
				UseRefResult1.current = true
				UseStateResult2(false)
				
				if v41 then
					v41()
				end
			end
		})
	end
	local function v42()
		-- upvalues: LoggerModule (upval), ParticipantId (copy), ConversationId (copy), UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval), JoinResult (copy)
		LoggerModule:info("User activated reportUser | userId: {}, conversationId: {}", ParticipantId, ConversationId)
		UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.ParticipantDialogReportUserClicked, {})
		JoinResult.openReportUser(ParticipantId, ConversationId)
	end
	
	table.insert(List, {
		isDisabled = nil,
		text = JoinResult.reportUserText,
		onActivated = function()
			-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), v42 (copy)
			if UseRefResult1.current then return end
			UseRefResult1.current = true
			UseStateResult2(false)
			
			if v42 then
				v42()
			end
		end
	})
	
	if ShowRemoveUserButton then
		local function v43()
			-- upvalues: JoinResult (copy), ParticipantId (copy), ConversationId (copy)
			JoinResult.openRemoveUserDialog(ParticipantId, ConversationId)
		end
		
		table.insert(List, {
			isDisabled = nil,
			text = JoinResult.removeFromGroupText,
			onActivated = function()
				-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), v43 (copy)
				if UseRefResult1.current then return end
				UseRefResult1.current = true
				UseStateResult2(false)
				
				if v43 then
					v43()
				end
			end
		})
	end
	return if AnchorRef then ReactModule.createElement(Menu, {
		align = PopoverAlign.End,
		anchorRef = AnchorRef,
		isOpen = UseStateResult,
		items = List,
		onPressedOutside = OnPressedOutside,
		ref = UseAppFocusRootResult,
		side = if UnitTestScreenSize.Y / 2 < AnchorRef.current.AbsolutePosition.Y + AnchorRef.current.AbsoluteSize.Y / 2 then PopoverSide.Top else PopoverSide.Bottom,
		size = InputSize.Medium,
		width = if JoinResult.isWideMode then _UDim else nil
	}) else ReactModule.createElement(FoundationModule.View, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		MenuAnchor = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -10),
			Size = UDim2.fromOffset(400, 1),
			ref = UseRefResult
		}),
		Menu = ReactModule.createElement(Menu, {
			align = PopoverAlign.Center,
			anchorRef = UseRefResult,
			isOpen = UseStateResult,
			items = List,
			onPressedOutside = OnPressedOutside,
			ref = UseAppFocusRootResult,
			side = PopoverSide.Top,
			size = InputSize.Medium,
			width = if JoinResult.isWideMode then _UDim else nil
		})
	})
end

return MemoFunction(ParticipantDialog)