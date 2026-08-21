local parent = script.Parent.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local textChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local textChannelWindowPerfTracker = require(parent.ChatUIPrimitives).Telemetry.TextChannelWindowPerfTracker
local chatAppModule = require(script.Parent.ChatApp)
local _ = require(script.Parent.Message)
local mountToTargetInstanceModule = require(script.Parent.mountToTargetInstance)
local useTextChannelWindowPropsModule = require(script.Parent.useTextChannelWindowProps)
local useLocalUserInTextChannelModule = require(script.Parent.useLocalUserInTextChannel)
local useRobloxSystemMessageModule = require(script.Parent.useRobloxSystemMessage)
local chatAvailabilityContextModule = require(script.Parent.ChatAvailabilityContext)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local createChannelMessagesStoreModule = require(script.Parent.createChannelMessagesStore)
local textChatServiceBridgeModule = require(script.Parent.TextChatServiceBridge)
local textChatService = game:GetService("TextChatService")
local useLocalUserChatAvailability = chatAvailabilityContextModule.useLocalUserChatAvailability
local var13 = signalsModule.createSignal({})

local function _(p0) --[[ line: 24 | named "getWindowName" ]]
	return p0.Name
end

local _ = function(p1) --[[ line: 28 | named "getTargetName" ]]
	local target = p1.Target
	
	return if target and target:IsA("TextChannel") then target.Name else nil
end

local function TextChannelWindowRoot(p2) --[[ line: 43 ]]
	-- upvalues: useTextChannelWindowPropsModule (ref), useLocalUserInTextChannelModule (ref), useLocalUserChatAvailability (ref), useRobloxSystemMessageModule (ref), reactModule (ref), var13 (ref), textChannelWindowPerfTracker (ref), textChannelWindowAnalyticsModule (ref), textChatService (ref), signalsModule (ref), chatAppModule (ref)
	local var20 = useTextChannelWindowPropsModule(p2.textChannelWindow)
	local target = var20.target
	local var21 = if target == nil then "no-channel" elseif not useLocalUserInTextChannelModule(target, p2.localUserId) then "not-member" else "member"
	local var22 = if var21 == "member" then target else nil
	local var23 = useLocalUserChatAvailability()
	local var24 = useRobloxSystemMessageModule()
	local var25 = reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: var22 (ref), p2 (ref), var13 (copy)
		return if var22 then p2.getChannelMessages(var22) else var13
	end, { var22, p2.getChannelMessages, var13 })
	reactModule.useEffect(function() --[[ line: 70 ]]
		-- upvalues: var23 (ref), var24 (ref)
		if var23.messageKey then
			var24.displayRobloxSystemMessage(var23.messageKey, var23.messageFallback or "")
		end
		return var24.clearAvailabilityMessage
	end, { var24, var23.messageKey, var23.messageFallback })
	local name = p2.textChannelWindow.Name
	local var26 = reactModule.useRef(false)
	local loadStartTime = p2.loadStartTime
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: var26 (ref), textChannelWindowPerfTracker (copy), name (ref), textChannelWindowAnalyticsModule (copy), loadStartTime (ref), textChatService (copy)
		if not var26.current then
			var26.current = true
			textChannelWindowPerfTracker.finishMountTTI(name)
			
			if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() and loadStartTime then
				textChatService:SendExpChatLoadSuccess(os.clock() - loadStartTime, nil, "text_channel_window", name)
			end
		end
	end, { name, loadStartTime })
	local var27 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 96 ]]
		-- upvalues: textChannelWindowAnalyticsModule (copy), signalsModule (copy), var25 (ref), var27 (ref), textChatService (copy), name (ref)
		if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() and textChannelWindowAnalyticsModule.getFFlagExpChatUseUpdatedMessageRendered() then
			return signalsModule.createEffect(function(p3) --[[ line: 103 ]]
				-- upvalues: var25 (copy), var27 (copy), textChannelWindowAnalyticsModule (copy), textChatService (copy), name (copy)
				for i, v in var25(p3) do
					local messageId = v.messageId
					
					if messageId and not var27.current[messageId] then
						var27.current[messageId] = true
						
						if textChannelWindowAnalyticsModule.shouldSendMessageRenderedTelemetry() then
							local textChatMessageInstance = v.textChatMessageInstance
							
							if textChatMessageInstance then
								if game:GetEngineFeature("ExpChatGlobalChatEngineTelemetryEnabled") then
									textChatService:SendExpChatMessageClientRendered(textChatMessageInstance, "text_channel_window", -1, name)
								else
									textChatService:SendExpChatMessageClientRendered(textChatMessageInstance, "text_channel_window")
								end
							end
						end
					end
				end
			end)
		end
	end, { var25, name })
	
	return reactModule.createElement(chatAppModule, {
		messagesSignal = var25,
		localUserId = p2.localUserId,
		targetChannel = var22,
		channelState = var21,
		canLocalUserChat = var23.canChat,
		backgroundColor = var20.backgroundColor,
		windowName = name
	})
end

local textChannelWindowErrorBoundary = reactModule.Component:extend("TextChannelWindowErrorBoundary")

function textChannelWindowErrorBoundary.init(p4) --[[ line: 146 ]]
	p4.state = { hasError = false }
end

function textChannelWindowErrorBoundary.getDerivedStateFromError(_) --[[ line: 150 ]]
	return { hasError = true }
end

function textChannelWindowErrorBoundary.componentDidCatch(_, _, _) --[[ line: 154 ]] end

function textChannelWindowErrorBoundary.render(p5) --[[ line: 156 ]]
	return if p5.state.hasError then nil else p5.props.children
end

local function onScriptError(_, _, _) --[[ line: 164 ]] end

local t = {}
local t_1 = {}
local var19 = false

return {
	start = function() --[[ line: 173 ]]
		-- upvalues: createChannelMessagesStoreModule (ref), textChannelWindowAnalyticsModule (ref), t_1 (ref), textChatService (ref), t (ref), textChannelWindowPerfTracker (ref), reactModule (ref), textChannelWindowErrorBoundary (ref), messageWriterContextModule (ref), chatAvailabilityContextModule (ref), TextChannelWindowRoot (ref), mountToTargetInstanceModule (ref), var19 (write), onScriptError (ref), textChatServiceBridgeModule (ref)
		local playersService = game:GetService("Players")
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then return end
		local var29 = tostring(localPlayer.UserId)
		local var30 = createChannelMessagesStoreModule()
		
		local function flushWindowStatus(p6) --[[ line: 183 ]]
			-- upvalues: textChannelWindowAnalyticsModule (copy), t_1 (copy), textChatService (copy)
			if not textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then return end
			local var35 = t_1[p6]
			
			if var35 then
				local var36 = os.clock() - var35.lastChangeTime
				textChatService:SendExpChatWindowStatusChange(var35.closedDuration + (if not var35.isOpen then var36 else 0), var35.openDuration + (if var35.isOpen then var36 else 0), 0, 0, "text_channel_window", p6.Name)
				t_1[p6] = nil
			end
		end
		
		local function onRemoved(p7) --[[ line: 204 ]]
			-- upvalues: t (copy), textChannelWindowPerfTracker (copy), flushWindowStatus (ref)
			local var37 = t[p7]
			
			if var37 then
				local target = p7.Target
				local var38 = if target and target:IsA("TextChannel") then target.Name else nil
				
				if var38 then
					textChannelWindowPerfTracker.cancelForChannel(var38)
				end
				flushWindowStatus(p7)
				var37()
				t[p7] = nil
			end
		end
		
		local function onAdded(p8) --[[ line: 218 ]]
			-- upvalues: var30 (ref), textChannelWindowAnalyticsModule (copy), reactModule (copy), textChannelWindowErrorBoundary (copy), messageWriterContextModule (copy), chatAvailabilityContextModule (copy), localPlayer (ref), TextChannelWindowRoot (copy), var29 (ref), textChannelWindowPerfTracker (copy), mountToTargetInstanceModule (copy), t (copy), t_1 (copy), flushWindowStatus (ref)
			local var39 = reactModule.createElement(textChannelWindowErrorBoundary, nil, {
				inner = reactModule.createElement(messageWriterContextModule.Provider, {
					upsertMessage = function(p9) --[[ line: 219 ]]
						-- upvalues: p8 (ref), var30 (copy)
						local target = p8.Target
						
						if target and target:IsA("TextChannel") then
							var30.upsertMessage(target, p9)
						end
					end,
					removeMessage = function(p10) --[[ line: 226 ]]
						-- upvalues: p8 (ref), var30 (copy)
						local target = p8.Target
						
						if target and target:IsA("TextChannel") then
							var30.removeMessage(target, p10)
						end
					end
				}, {
					availability = reactModule.createElement(chatAvailabilityContextModule.Provider, { subjectPlayer = localPlayer }, {
						root = reactModule.createElement(TextChannelWindowRoot, {
							localUserId = var29,
							textChannelWindow = p8,
							getChannelMessages = var30.getMessagesForChannel,
							loadStartTime = if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then os.clock() else nil
						})
					})
				})
			})
			textChannelWindowPerfTracker.startMountTTI(p8.Name)
			local var40 = mountToTargetInstanceModule(p8, var39)
			
			if var40 then
				t[p8] = var40
				local target = p8.Target
				local var42 = if target and target:IsA("TextChannel") then target.Name else nil
				textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.Mount, {
					result = "success",
					has_target = var42 ~= nil,
					target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var42)
				})
			else
				local target = p8.Target
				local var41 = if target and target:IsA("TextChannel") then target.Name else nil
				textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.Mount, {
					result = "failed",
					has_target = var41 ~= nil,
					target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var41)
				})
			end
			if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then
				t_1[p8] = {
					openDuration = 0,
					closedDuration = 0,
					isOpen = p8.IsRendering == true,
					lastChangeTime = os.clock()
				}
				p8:GetPropertyChangedSignal("IsRendering"):Connect(function() --[[ line: 285 ]]
					-- upvalues: t_1 (copy), p8 (ref)
					local var43 = t_1[p8]
					
					if var43 then
						local processTime = os.clock()
						local var45 = processTime - var43.lastChangeTime
						t_1[p8] = {
							isOpen = p8.IsRendering == true,
							lastChangeTime = processTime,
							openDuration = var43.openDuration + (if var43.isOpen then var45 else 0),
							closedDuration = var43.closedDuration + (if not var43.isOpen then var45 else 0)
						}
					end
				end)
			end
			p8.AncestryChanged:Connect(function() --[[ line: 301 ]]
				-- upvalues: p8 (ref), t (copy), textChannelWindowPerfTracker (copy), flushWindowStatus (copy)
				if not p8:IsDescendantOf(game) then
					local var46 = p8
					local var47 = t[var46]
					
					if var47 then
						local target = var46.Target
						local var48 = if target and target:IsA("TextChannel") then target.Name else nil
						
						if var48 then
							textChannelWindowPerfTracker.cancelForChannel(var48)
						end
						flushWindowStatus(var46)
						var47()
						t[var46] = nil
					end
				end
			end)
		end
		
		if not var19 then
			var19 = true
			game:GetService("ScriptContext").Error:Connect(onScriptError)
		end
		local textChatService_1 = game:GetService("TextChatService")
		textChatServiceBridgeModule(textChatService_1, var29, var30)
		
		for i, v in textChatService_1:GetTextChannelWindows() do
			onAdded(v)
		end
		textChatService_1.TextChannelWindowAdded:Connect(onAdded)
		textChatService_1.TextChannelWindowRemoved:Connect(onRemoved)
		
		if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then
			playersService.PlayerRemoving:Connect(function(p11) --[[ line: 325 ]]
				-- upvalues: localPlayer (ref), t_1 (copy), flushWindowStatus (ref)
				if p11 == localPlayer then
					for i in t_1 do
						flushWindowStatus(i)
					end
				end
			end)
		end
	end,
	_onScriptError = onScriptError,
	_TextChannelWindowErrorBoundary = textChannelWindowErrorBoundary
}