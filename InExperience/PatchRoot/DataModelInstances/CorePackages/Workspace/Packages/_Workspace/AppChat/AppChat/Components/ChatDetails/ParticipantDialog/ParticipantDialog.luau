local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local foundationModule = require(parent.Foundation)
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
	openViewProfile = function(_) --[[ line: 73 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openViewProfile was not passed to ParticipantDialog")
	end,
	openChat = function(...) --[[ line: 76 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openChat was not passed to ParticipantDialog")
	end,
	openReportUser = function(...) --[[ line: 79 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openReportUser was not passed to ParticipantDialog")
	end,
	openRemoveUserDialog = function(...) --[[ line: 82 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openRemoveUserDialog was not passed to ParticipantDialog")
	end,
	openTrustedFriend = function(...) --[[ line: 85 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openTrustedFriend was not passed to ParticipantDialog")
	end,
	onDismiss = function(_) --[[ line: 88 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onDismiss was not passed to ParticipantDialog")
	end
}

function ParticipantDialog(p0) --[[ line: 95 ]]
	-- upvalues: cryoModule (ref), t (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), reactModule (ref), useLayerCollector (ref), loggerModule (ref), chatDetailsTelemetryEventsModule (ref), popoverSide (ref), menu (ref), popoverAlign (ref), inputSize (ref), uDim (ref), foundationModule (ref)
	local var10 = cryoModule.Dictionary.join(t, p0)
	local var11 = useTelemetryModule(chatDialogTelemetryLayerModule.Context)
	local var12 = reactModule.useRef(nil)
	local var13 = useLayerCollector()
	local var14, var15 = reactModule.useState(true)
	local conversationId = var10.conversationId
	local participantId = var10.participantId
	local showRemoveUserButton = var10.showRemoveUserButton
	local unitTestScreenSize = var10.unitTestScreenSize or var13.absoluteSize
	local var17 = if var10.anchorRef and var10.anchorRef.current then var10.anchorRef else nil
	local onDismiss = var10.onDismiss or function() --[[ line: 106 ]] end
	
	local var19 = function() --[[ line: 108 ]]
		-- upvalues: var15 (ref), onDismiss (ref)
		var15(false)
		onDismiss()
	end
	
	local var20 = reactModule.useRef(false)
	local t_1 = {}
	
	local function onDisabledActivated() --[[ line: 120 ]] end
	
	local function _(p1, p2, p3) --[[ line: 122 | named "insertAction" ]]
		-- upvalues: t_1 (ref), onDisabledActivated (ref), var20 (ref), var15 (ref)
		table.insert(t_1, {
			text = p1,
			isDisabled = p3,
			onActivated = if p3 then onDisabledActivated else function() --[[ line: 130 ]]
				-- upvalues: var20 (copy), var15 (copy), p2 (ref)
				if var20.current then return end
				var20.current = true
				var15(false)
				
				if p2 then
					p2()
				end
			end
		})
	end
	
	if var10.showViewProfileButton then
		local var23 = function() --[[ line: 145 ]]
			-- upvalues: loggerModule (copy), participantId (ref), var10 (ref)
			loggerModule:info("User activated viewProfile | userId: {}", participantId)
			var10.openViewProfile(participantId)
		end
		
		table.insert(t_1, {
			isDisabled = nil,
			text = var10.viewProfileText,
			onActivated = function() --[[ line: 130 ]]
				-- upvalues: var20 (ref), var15 (ref), var23 (ref)
				if var20.current then return end
				var20.current = true
				var15(false)
				
				if var23 then
					var23()
				end
			end
		})
	end
	if var10.showTrustedFriendButton then
		local trustedFriendText = var10.trustedFriendText
		
		local var24 = function() --[[ line: 152 ]]
			-- upvalues: loggerModule (copy), participantId (ref), var10 (ref)
			loggerModule:info("User activated openTrustedFriend | userId: {}", participantId)
			var10.openTrustedFriend(participantId)
		end
		
		local isTrustedFriendButtonDisabled = var10.isTrustedFriendButtonDisabled
		table.insert(t_1, {
			text = trustedFriendText,
			isDisabled = isTrustedFriendButtonDisabled,
			onActivated = if isTrustedFriendButtonDisabled then onDisabledActivated else function() --[[ line: 130 ]]
				-- upvalues: var20 (ref), var15 (ref), var24 (ref)
				if var20.current then return end
				var20.current = true
				var15(false)
				
				if var24 then
					var24()
				end
			end
		})
	end
	if var10.showChatButton then
		local var25 = function() --[[ line: 159 ]]
			-- upvalues: loggerModule (copy), participantId (ref), var11 (ref), chatDetailsTelemetryEventsModule (copy), var10 (ref)
			loggerModule:info("User activated openChat | userId: {}", participantId)
			var11.emit(chatDetailsTelemetryEventsModule.ParticipantDialogChatClicked, {})
			var10.openChat(participantId)
		end
		
		table.insert(t_1, {
			isDisabled = nil,
			text = var10.chatText,
			onActivated = function() --[[ line: 130 ]]
				-- upvalues: var20 (ref), var15 (ref), var25 (ref)
				if var20.current then return end
				var20.current = true
				var15(false)
				
				if var25 then
					var25()
				end
			end
		})
	end
	local var26 = function() --[[ line: 166 ]]
		-- upvalues: loggerModule (copy), participantId (ref), conversationId (ref), var11 (ref), chatDetailsTelemetryEventsModule (copy), var10 (ref)
		loggerModule:info("User activated reportUser | userId: {}, conversationId: {}", participantId, conversationId)
		var11.emit(chatDetailsTelemetryEventsModule.ParticipantDialogReportUserClicked, {})
		var10.openReportUser(participantId, conversationId)
	end
	
	table.insert(t_1, {
		isDisabled = nil,
		text = var10.reportUserText,
		onActivated = function() --[[ line: 130 ]]
			-- upvalues: var20 (ref), var15 (ref), var26 (ref)
			if var20.current then return end
			var20.current = true
			var15(false)
			
			if var26 then
				var26()
			end
		end
	})
	
	if showRemoveUserButton then
		local var27 = function() --[[ line: 173 ]]
			-- upvalues: var10 (ref), participantId (ref), conversationId (ref)
			var10.openRemoveUserDialog(participantId, conversationId)
		end
		
		table.insert(t_1, {
			isDisabled = nil,
			text = var10.removeFromGroupText,
			onActivated = function() --[[ line: 130 ]]
				-- upvalues: var20 (ref), var15 (ref), var27 (ref)
				if var20.current then return end
				var20.current = true
				var15(false)
				
				if var27 then
					var27()
				end
			end
		})
	end
	return if var17 then reactModule.createElement(menu, {
		align = popoverAlign.End,
		anchorRef = var17,
		isOpen = var14,
		items = t_1,
		onPressedOutside = var19,
		side = if unitTestScreenSize.Y / 2 < var17.current.AbsolutePosition.Y + var17.current.AbsoluteSize.Y / 2 then popoverSide.Top else popoverSide.Bottom,
		size = inputSize.Medium,
		width = if var10.isWideMode then uDim else nil
	}) else reactModule.createElement(foundationModule.View, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		MenuAnchor = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -10),
			Size = UDim2.fromOffset(400, 1),
			ref = var12
		}),
		Menu = reactModule.createElement(menu, {
			align = popoverAlign.Center,
			anchorRef = var12,
			isOpen = var14,
			items = t_1,
			onPressedOutside = var19,
			side = popoverSide.Top,
			size = inputSize.Medium,
			width = if var10.isWideMode then uDim else nil
		})
	})
end

return memo(ParticipantDialog)