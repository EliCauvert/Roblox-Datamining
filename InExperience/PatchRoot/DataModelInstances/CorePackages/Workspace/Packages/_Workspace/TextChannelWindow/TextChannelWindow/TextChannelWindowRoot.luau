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
local useAvailabilitySystemMessageModule = require(script.Parent.useAvailabilitySystemMessage)
local chatAvailabilityContextModule = require(script.Parent.ChatAvailabilityContext)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local createChannelMessagesStoreModule = require(script.Parent.createChannelMessagesStore)
local textChatServiceBridgeModule = require(script.Parent.TextChatServiceBridge)
local textChatService = game:GetService("TextChatService")
local useLocalUserChatAvailability = chatAvailabilityContextModule.useLocalUserChatAvailability
local var1 = signalsModule.createSignal({})

local function _(p1)
	return p1.Name
end

local _ = function(p1)
	local target = p1.Target
	
	return if target and target:IsA("TextChannel") then target.Name else nil
end

local function TextChannelWindowRoot(p1)
	-- upvalues: useTextChannelWindowPropsModule (ref), useLocalUserInTextChannelModule (ref), useLocalUserChatAvailability (ref), reactModule (ref), var1 (ref), useAvailabilitySystemMessageModule (ref), textChannelWindowPerfTracker (ref), textChannelWindowAnalyticsModule (ref), textChatService (ref), signalsModule (ref), chatAppModule (ref)
	local var2 = useTextChannelWindowPropsModule(p1.textChannelWindow)
	local target = var2.target
	local var3 = if target == nil then "no-channel" elseif not useLocalUserInTextChannelModule(target, p1.localUserId) then "not-member" else "member"
	local var4 = if var3 == "member" then target else nil
	local var5 = useLocalUserChatAvailability()
	local var6 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), p1 (ref), var1 (copy)
		return if var4 then p1.getChannelMessages(var4) else var1
	end, { var4, p1.getChannelMessages, var1 })
	useAvailabilitySystemMessageModule(var5, target)
	local name = p1.textChannelWindow.Name
	local var7 = reactModule.useRef(false)
	local loadStartTime = p1.loadStartTime
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), textChannelWindowPerfTracker (copy), name (ref), textChannelWindowAnalyticsModule (copy), loadStartTime (ref), textChatService (copy)
		if not var7.current then
			var7.current = true
			textChannelWindowPerfTracker.finishMountTTI(name)
			
			if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() and loadStartTime then
				textChatService:SendExpChatLoadSuccess(os.clock() - loadStartTime, nil, "text_channel_window", name)
			end
		end
	end, { name, loadStartTime })
	local var8 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: textChannelWindowAnalyticsModule (copy), signalsModule (copy), var6 (ref), var8 (ref), textChatService (copy), name (ref)
		if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() and textChannelWindowAnalyticsModule.getFFlagExpChatUseUpdatedMessageRendered() then
			return signalsModule.createEffect(function(p2)
				-- upvalues: var6 (copy), var8 (copy), textChannelWindowAnalyticsModule (copy), textChatService (copy), name (copy)
				for i, v in var6(p2) do
					local messageId = v.messageId
					
					if messageId and not var8.current[messageId] then
						var8.current[messageId] = true
						
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
	end, { var6, name })
	
	return reactModule.createElement(chatAppModule, {
		messagesSignal = var6,
		localUserId = p1.localUserId,
		targetChannel = var4,
		channelState = var3,
		canLocalUserChat = var5.canChat,
		backgroundColor = var2.backgroundColor,
		fontFace = var2.fontOverride,
		windowName = name
	})
end

local textChannelWindowErrorBoundary = reactModule.Component:extend("TextChannelWindowErrorBoundary")

function textChannelWindowErrorBoundary.init(p2)
	p2.state = { hasError = false }
end

function textChannelWindowErrorBoundary.getDerivedStateFromError(_)
	return { hasError = true }
end

function textChannelWindowErrorBoundary.componentDidCatch(_, _, _) end

function textChannelWindowErrorBoundary.render(p2)
	return if p2.state.hasError then nil else p2.props.children
end

local function onScriptError(_, _, _) end

local t = {}
local t_1 = {}
local var9 = false

return {
	start = function()
		-- upvalues: createChannelMessagesStoreModule (ref), textChannelWindowAnalyticsModule (ref), t_1 (ref), textChatService (ref), t (ref), textChannelWindowPerfTracker (ref), reactModule (ref), textChannelWindowErrorBoundary (ref), messageWriterContextModule (ref), chatAvailabilityContextModule (ref), TextChannelWindowRoot (ref), mountToTargetInstanceModule (ref), var9 (write), onScriptError (ref), textChatServiceBridgeModule (ref)
		local playersService = game:GetService("Players")
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then return end
		local var10 = tostring(localPlayer.UserId)
		local var11 = createChannelMessagesStoreModule()
		
		local function flushWindowStatus(p2)
			-- upvalues: textChannelWindowAnalyticsModule (copy), t_1 (copy), textChatService (copy)
			if not textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then return end
			local var12 = t_1[p2]
			
			if var12 then
				local var13 = os.clock() - var12.lastChangeTime
				textChatService:SendExpChatWindowStatusChange(var12.closedDuration + (if not var12.isOpen then var13 else 0), var12.openDuration + (if var12.isOpen then var13 else 0), 0, 0, "text_channel_window", p2.Name)
				t_1[p2] = nil
			end
		end
		
		local function onRemoved(p2)
			-- upvalues: t (copy), textChannelWindowPerfTracker (copy), flushWindowStatus (ref)
			local var12 = t[p2]
			
			if var12 then
				local target = p2.Target
				local var13 = if target and target:IsA("TextChannel") then target.Name else nil
				
				if var13 then
					textChannelWindowPerfTracker.cancelForChannel(var13)
				end
				flushWindowStatus(p2)
				var12()
				t[p2] = nil
			end
		end
		
		local function onAdded(p2)
			-- upvalues: var11 (ref), textChannelWindowAnalyticsModule (copy), reactModule (copy), textChannelWindowErrorBoundary (copy), messageWriterContextModule (copy), chatAvailabilityContextModule (copy), localPlayer (ref), TextChannelWindowRoot (copy), var10 (ref), textChannelWindowPerfTracker (copy), mountToTargetInstanceModule (copy), t (copy), t_1 (copy), flushWindowStatus (ref)
			local var12 = reactModule.createElement(textChannelWindowErrorBoundary, nil, {
				inner = reactModule.createElement(messageWriterContextModule.Provider, {
					upsertMessage = function(p3)
						-- upvalues: p2 (ref), var11 (copy)
						local target = p2.Target
						
						if target and target:IsA("TextChannel") then
							var11.upsertMessage(target, p3)
						end
					end,
					removeMessage = function(p3)
						-- upvalues: p2 (ref), var11 (copy)
						local target = p2.Target
						
						if target and target:IsA("TextChannel") then
							var11.removeMessage(target, p3)
						end
					end
				}, {
					availability = reactModule.createElement(chatAvailabilityContextModule.Provider, { subjectPlayer = localPlayer }, {
						root = reactModule.createElement(TextChannelWindowRoot, {
							localUserId = var10,
							textChannelWindow = p2,
							getChannelMessages = var11.getMessagesForChannel,
							loadStartTime = if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then os.clock() else nil
						})
					})
				})
			})
			textChannelWindowPerfTracker.startMountTTI(p2.Name)
			local var13 = mountToTargetInstanceModule(p2, var12)
			
			if var13 then
				t[p2] = var13
				local target = p2.Target
				local var14 = if target and target:IsA("TextChannel") then target.Name else nil
				textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.Mount, {
					result = "success",
					has_target = var14 ~= nil,
					target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var14)
				})
			else
				local target = p2.Target
				local var15 = if target and target:IsA("TextChannel") then target.Name else nil
				textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.Mount, {
					result = "failed",
					has_target = var15 ~= nil,
					target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var15)
				})
			end
			if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then
				t_1[p2] = {
					openDuration = 0,
					closedDuration = 0,
					isOpen = p2.IsRendering == true,
					lastChangeTime = os.clock()
				}
				p2:GetPropertyChangedSignal("IsRendering"):Connect(function()
					-- upvalues: t_1 (copy), p2 (ref)
					local var16 = t_1[p2]
					
					if var16 then
						local processTime = os.clock()
						local var17 = processTime - var16.lastChangeTime
						t_1[p2] = {
							isOpen = p2.IsRendering == true,
							lastChangeTime = processTime,
							openDuration = var16.openDuration + (if var16.isOpen then var17 else 0),
							closedDuration = var16.closedDuration + (if not var16.isOpen then var17 else 0)
						}
					end
				end)
			end
			p2.AncestryChanged:Connect(function()
				-- upvalues: p2 (ref), t (copy), textChannelWindowPerfTracker (copy), flushWindowStatus (copy)
				if not p2:IsDescendantOf(game) then
					local var16 = p2
					local var17 = t[var16]
					
					if var17 then
						local target = var16.Target
						local var18 = if target and target:IsA("TextChannel") then target.Name else nil
						
						if var18 then
							textChannelWindowPerfTracker.cancelForChannel(var18)
						end
						flushWindowStatus(var16)
						var17()
						t[var16] = nil
					end
				end
			end)
		end
		
		if not var9 then
			var9 = true
			game:GetService("ScriptContext").Error:Connect(onScriptError)
		end
		local textChatService_1 = game:GetService("TextChatService")
		textChatServiceBridgeModule(textChatService_1, var10, var11)
		
		for i, v in textChatService_1:GetTextChannelWindows() do
			onAdded(v)
		end
		textChatService_1.TextChannelWindowAdded:Connect(onAdded)
		textChatService_1.TextChannelWindowRemoved:Connect(onRemoved)
		
		if textChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then
			playersService.PlayerRemoving:Connect(function(p2)
				-- upvalues: localPlayer (ref), t_1 (copy), flushWindowStatus (ref)
				if p2 == localPlayer then
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