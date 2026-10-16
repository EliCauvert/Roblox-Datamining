local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local TextChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local TextChannelWindowPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.TextChannelWindowPerfTracker
local ChatAppModule = require(script.Parent.ChatApp)
local _ = require(script.Parent.Message)
local MountToTargetInstanceModule = require(script.Parent.mountToTargetInstance)
local UseTextChannelWindowPropsModule = require(script.Parent.useTextChannelWindowProps)
local UseLocalUserInTextChannelModule = require(script.Parent.useLocalUserInTextChannel)
local UseAvailabilitySystemMessageModule = require(script.Parent.useAvailabilitySystemMessage)
local ChatAvailabilityContextModule = require(script.Parent.ChatAvailabilityContext)
local MessageWriterContextModule = require(script.Parent.MessageWriterContext)
local CreateChannelMessagesStoreModule = require(script.Parent.createChannelMessagesStore)
local TextChatServiceBridgeModule = require(script.Parent.TextChatServiceBridge)
local UseWelcomeSystemMessageModule = require(script.Parent.useWelcomeSystemMessage)
local UseSummarySystemMessageModule = require(script.Parent.useSummarySystemMessage)
local ThirdPartySummaryEligibilityModule = require(script.Parent.thirdPartySummaryEligibility)
local TextChatService = game:GetService("TextChatService")
local UseLocalUserChatAvailabilityFunction = ChatAvailabilityContextModule.useLocalUserChatAvailability
local Signal = SignalsModule.createSignal({})

local function _(p1) --[[ Line: 27 | Named "getWindowName" ]]
	return p1.Name
end

local _ = function(Mouse) --[[ Line: 31 | Named "getTargetName" ]]
	local Target = Mouse.Target
	
	return if Target and Target:IsA("TextChannel") then Target.Name else nil
end

local function TextChannelWindowRoot(p1) --[[ Line: 47 ]]
	-- upvalues: UseTextChannelWindowPropsModule (copy), UseLocalUserInTextChannelModule (copy), UseLocalUserChatAvailabilityFunction (copy), ReactModule (copy), Signal (copy), UseAvailabilitySystemMessageModule (copy), UseWelcomeSystemMessageModule (copy), UseSummarySystemMessageModule (copy), TextChannelWindowPerfTracker (copy), TextChannelWindowAnalyticsModule (copy), TextChatService (copy), SignalsModule (copy), ChatAppModule (copy)
	local UseTextChannelWindowPropsModuleResult = UseTextChannelWindowPropsModule(p1.textChannelWindow)
	local Target = UseTextChannelWindowPropsModuleResult.target
	local UseLocalUserInTextChannelModuleResult = UseLocalUserInTextChannelModule(Target, p1.localUserId)
	local NoChannel: string = if Target == nil then "no-channel" elseif UseLocalUserInTextChannelModuleResult then "member" else "not-member"
	local Target1 = if NoChannel == "member" then Target else nil
	local UseLocalUserChatAvailabilityResult = UseLocalUserChatAvailabilityFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 66 ]]
		-- upvalues: Target1 (copy), p1 (copy), Signal (upval)
		return if Target1 then p1.getChannelMessages(Target1) else Signal
	end, { Target1, p1.getChannelMessages, Signal })
	UseAvailabilitySystemMessageModule(UseLocalUserChatAvailabilityResult, Target)
	UseWelcomeSystemMessageModule(Target1, p1.localUserId)
	UseSummarySystemMessageModule(Target1, p1.getIsEligibleForSummary)
	local Name = p1.textChannelWindow.Name
	local UseRefResult = ReactModule.useRef(false)
	local LoadStartTime = p1.loadStartTime
	ReactModule.useEffect(function() --[[ Line: 82 ]]
		-- upvalues: UseRefResult (copy), TextChannelWindowPerfTracker (upval), Name (copy), TextChannelWindowAnalyticsModule (upval), LoadStartTime (copy), TextChatService (upval)
		if not UseRefResult.current then
			UseRefResult.current = true
			TextChannelWindowPerfTracker.finishMountTTI(Name)
			
			if TextChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() and LoadStartTime then
				TextChatService:SendExpChatLoadSuccess(os.clock() - LoadStartTime, nil, "text_channel_window", Name)
			end
		end
	end, { Name, LoadStartTime })
	local UseRefResult1 = ReactModule.useRef({})
	ReactModule.useEffect(function() --[[ Line: 96 ]]
		-- upvalues: TextChannelWindowAnalyticsModule (upval), SignalsModule (upval), UseMemoResult (copy), UseRefResult1 (copy), TextChatService (upval), Name (copy)
		if not TextChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() or not TextChannelWindowAnalyticsModule.getFFlagExpChatUseUpdatedMessageRendered() then return end
		return (SignalsModule.createEffect(function(p2) --[[ Line: 103 ]]
			-- upvalues: UseMemoResult (upval), UseRefResult1 (upval), TextChannelWindowAnalyticsModule (upval), TextChatService (upval), Name (upval)
			for _, value in UseMemoResult(p2) do
				local MessageId = value.messageId
				
				if MessageId and not UseRefResult1.current[MessageId] then
					UseRefResult1.current[MessageId] = true
					
					if TextChannelWindowAnalyticsModule.shouldSendMessageRenderedTelemetry() then
						local TextChatMessageInstance = value.textChatMessageInstance
						
						if TextChatMessageInstance then
							if game:GetEngineFeature("ExpChatGlobalChatEngineTelemetryEnabled") then
								TextChatService:SendExpChatMessageClientRendered(TextChatMessageInstance, "text_channel_window", -1, Name)
							else
								TextChatService:SendExpChatMessageClientRendered(TextChatMessageInstance, "text_channel_window")
							end
						end
					end
				end
			end
		end))
	end, { UseMemoResult, Name })
	
	return ReactModule.createElement(ChatAppModule, {
		messagesSignal = UseMemoResult,
		localUserId = p1.localUserId,
		targetChannel = Target1,
		channelState = NoChannel,
		canLocalUserChat = UseLocalUserChatAvailabilityResult.canChat,
		backgroundColor = UseTextChannelWindowPropsModuleResult.backgroundColor,
		fontFace = UseTextChannelWindowPropsModuleResult.fontOverride,
		windowName = Name,
		windowInstance = p1.textChannelWindow
	})
end

local TextChannelWindowErrorBoundary = ReactModule.Component:extend("TextChannelWindowErrorBoundary")

function TextChannelWindowErrorBoundary.init(p2) --[[ Line: 148 ]]
	p2.state = { hasError = false }
end

function TextChannelWindowErrorBoundary:getDerivedStateFromError() --[[ Line: 152 ]]
	return { hasError = true }
end

function TextChannelWindowErrorBoundary:componentDidCatch(_, _) --[[ Line: 156 ]] end

function TextChannelWindowErrorBoundary.render(p2) --[[ Line: 158 ]]
	return if p2.state.hasError then nil else p2.props.children
end

local function onScriptError(_, _, _) --[[ Line: 166 ]] end

local t = {}
local t1 = {}
local Flag = false

return {
	start = function() --[[ Line: 175 ]]
		-- upvalues: CreateChannelMessagesStoreModule (copy), ThirdPartySummaryEligibilityModule (copy), TextChannelWindowAnalyticsModule (copy), t1 (copy), TextChatService (copy), t (copy), TextChannelWindowPerfTracker (copy), ReactModule (copy), TextChannelWindowErrorBoundary (copy), MessageWriterContextModule (copy), ChatAvailabilityContextModule (copy), TextChannelWindowRoot (copy), MountToTargetInstanceModule (copy), Flag (ref), onScriptError (copy), TextChatServiceBridgeModule (copy)
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer
		
		if not LocalPlayer then return end
		local Text = tostring(LocalPlayer.UserId)
		local ChannelMessagesStoreModule = CreateChannelMessagesStoreModule()
		local NewThirdPartySummaryEligibility = ThirdPartySummaryEligibilityModule.create(Text)
		
		local function flushWindowStatus(Mouse) --[[ Line: 186 ]]
			-- upvalues: TextChannelWindowAnalyticsModule (upval), t1 (upval), TextChatService (upval)
			if not TextChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then return end
			local Entry = t1[Mouse]
			
			if Entry then
				local Elapsed = os.clock() - Entry.lastChangeTime
				TextChatService:SendExpChatWindowStatusChange(Entry.closedDuration + (if Entry.isOpen then 0 else Elapsed), Entry.openDuration + (if Entry.isOpen then Elapsed else 0), 0, 0, "text_channel_window", Mouse.Name)
				t1[Mouse] = nil
			end
		end
		
		local function onRemoved(TextChannelWindow) --[[ Line: 207 ]]
			-- upvalues: t (upval), TextChannelWindowPerfTracker (upval), flushWindowStatus (copy)
			local Entry: () -> () = t[TextChannelWindow]
			
			if Entry then
				local Target = TextChannelWindow.Target
				local Name = if Target and Target:IsA("TextChannel") then Target.Name else nil
				
				if Name then
					TextChannelWindowPerfTracker.cancelForChannel(Name)
				end
				flushWindowStatus(TextChannelWindow)
				Entry()
				t[TextChannelWindow] = nil
			end
		end
		
		local function onAdded(TextChannelWindow) --[[ Line: 221 ]]
			-- upvalues: ChannelMessagesStoreModule (copy), TextChannelWindowAnalyticsModule (upval), ReactModule (upval), TextChannelWindowErrorBoundary (upval), MessageWriterContextModule (upval), ChatAvailabilityContextModule (upval), LocalPlayer (copy), TextChannelWindowRoot (upval), Text (copy), NewThirdPartySummaryEligibility (copy), TextChannelWindowPerfTracker (upval), MountToTargetInstanceModule (upval), t (upval), t1 (upval), flushWindowStatus (copy)
			local Element = ReactModule.createElement(TextChannelWindowErrorBoundary, nil, {
				inner = ReactModule.createElement(MessageWriterContextModule.Provider, {
					upsertMessage = function(Target) --[[ Line: 222 ]]
						-- upvalues: TextChannelWindow (copy), ChannelMessagesStoreModule (upval)
						local Target1 = TextChannelWindow.Target
						
						if Target1 and Target1:IsA("TextChannel") then
							ChannelMessagesStoreModule.upsertMessage(Target1, Target)
						end
					end,
					removeMessage = function(Target) --[[ Line: 229 ]]
						-- upvalues: TextChannelWindow (copy), ChannelMessagesStoreModule (upval)
						local Target1 = TextChannelWindow.Target
						
						if Target1 and Target1:IsA("TextChannel") then
							ChannelMessagesStoreModule.removeMessage(Target1, Target)
						end
					end
				}, {
					availability = ReactModule.createElement(ChatAvailabilityContextModule.Provider, { subjectPlayer = LocalPlayer }, {
						root = ReactModule.createElement(TextChannelWindowRoot, {
							localUserId = Text,
							textChannelWindow = TextChannelWindow,
							getChannelMessages = ChannelMessagesStoreModule.getMessagesForChannel,
							getIsEligibleForSummary = NewThirdPartySummaryEligibility.getIsEligible,
							loadStartTime = if TextChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then os.clock() else nil
						})
					})
				})
			})
			TextChannelWindowPerfTracker.startMountTTI(TextChannelWindow.Name)
			local MountToTargetInstanceModuleResult = MountToTargetInstanceModule(TextChannelWindow, Element)
			
			if MountToTargetInstanceModuleResult then
				t[TextChannelWindow] = MountToTargetInstanceModuleResult
				local Target = TextChannelWindow.Target
				local Name = if Target and Target:IsA("TextChannel") then Target.Name else nil
				TextChannelWindowAnalyticsModule.emit(TextChannelWindowAnalyticsModule.Counters.Mount, {
					result = "success",
					has_target = Name ~= nil,
					target_text_channel_category = TextChannelWindowAnalyticsModule.getChannelCategory(Name)
				})
			else
				local Target = TextChannelWindow.Target
				local Name = if Target and Target:IsA("TextChannel") then Target.Name else nil
				TextChannelWindowAnalyticsModule.emit(TextChannelWindowAnalyticsModule.Counters.Mount, {
					result = "failed",
					has_target = Name ~= nil,
					target_text_channel_category = TextChannelWindowAnalyticsModule.getChannelCategory(Name)
				})
			end
			if TextChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then
				t1[TextChannelWindow] = {
					openDuration = 0,
					closedDuration = 0,
					isOpen = TextChannelWindow.IsRendering == true,
					lastChangeTime = os.clock()
				}
				TextChannelWindow:GetPropertyChangedSignal("IsRendering"):Connect(function() --[[ Line: 289 ]]
					-- upvalues: t1 (upval), TextChannelWindow (copy)
					local Entry = t1[TextChannelWindow]
					
					if Entry then
						local ClockTime = os.clock()
						local ClockTimeDelta = ClockTime - Entry.lastChangeTime
						t1[TextChannelWindow] = {
							isOpen = TextChannelWindow.IsRendering == true,
							lastChangeTime = ClockTime,
							openDuration = Entry.openDuration + (if Entry.isOpen then ClockTimeDelta else 0),
							closedDuration = Entry.closedDuration + (if Entry.isOpen then 0 else ClockTimeDelta)
						}
					end
				end)
			end
			TextChannelWindow.AncestryChanged:Connect(function() --[[ Line: 305 ]]
				-- upvalues: TextChannelWindow (copy), t (upval), TextChannelWindowPerfTracker (upval), flushWindowStatus (upval)
				if not TextChannelWindow:IsDescendantOf(game) then
					local Entry: () -> () = t[TextChannelWindow]
					
					if Entry then
						local Target = TextChannelWindow.Target
						local Name = if Target and Target:IsA("TextChannel") then Target.Name else nil
						
						if Name then
							TextChannelWindowPerfTracker.cancelForChannel(Name)
						end
						flushWindowStatus(TextChannelWindow)
						Entry()
						t[TextChannelWindow] = nil
					end
				end
			end)
		end
		
		if not Flag then
			Flag = true
			game:GetService("ScriptContext").Error:Connect(onScriptError)
		end
		local TextChatService1 = game:GetService("TextChatService")
		TextChatServiceBridgeModule(TextChatService1, Text, ChannelMessagesStoreModule)
		
		for _, textChannelWindow in TextChatService1:GetTextChannelWindows() do
			onAdded(textChannelWindow)
		end
		TextChatService1.TextChannelWindowAdded:Connect(onAdded)
		TextChatService1.TextChannelWindowRemoved:Connect(onRemoved)
		
		if TextChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then
			Players.PlayerRemoving:Connect(function(Player) --[[ Line: 329 ]]
				-- upvalues: LocalPlayer (copy), t1 (upval), flushWindowStatus (copy)
				if Player == LocalPlayer then
					for i in t1 do
						flushWindowStatus(i)
					end
				end
			end)
		end
	end,
	_onScriptError = onScriptError,
	_TextChannelWindowErrorBoundary = TextChannelWindowErrorBoundary
}