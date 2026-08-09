local parent = script.Parent.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local chatAppModule = require(script.Parent.ChatApp)
local mountToTargetInstanceModule = require(script.Parent.mountToTargetInstance)
local textChatServiceIntegrationModule = require(script.Parent.TextChatServiceIntegration)
local useTextChannelWindowPropsModule = require(script.Parent.useTextChannelWindowProps)
local useLocalUserInTextChannelModule = require(script.Parent.useLocalUserInTextChannel)
local useRobloxSystemMessageModule = require(script.Parent.useRobloxSystemMessage)
local chatAvailabilityContextModule = require(script.Parent.ChatAvailabilityContext)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local useLocalUserChatAvailability = chatAvailabilityContextModule.useLocalUserChatAvailability

local function TextChannelWindowRoot(p0) --[[ line: 24 ]]
	-- upvalues: useTextChannelWindowPropsModule (ref), useLocalUserInTextChannelModule (ref), useLocalUserChatAvailability (ref), useRobloxSystemMessageModule (ref), reactModule (ref), textChatServiceIntegrationModule (ref), chatAppModule (ref)
	local target = useTextChannelWindowPropsModule(p0.textChannelWindow).target
	local var12 = if useLocalUserInTextChannelModule(target, p0.localUserId) then target else nil
	local var13 = useLocalUserChatAvailability()
	local var14 = useRobloxSystemMessageModule()
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: p0 (ref), textChatServiceIntegrationModule (copy), var12 (ref)
		p0.setMessages(function() --[[ line: 35 ]]
			return {}
		end)
		
		return textChatServiceIntegrationModule.subscribeToMessages({
			channel = var12,
			textChatService = p0.textChatService,
			localUserId = p0.localUserId,
			setMessages = p0.setMessages
		})
	end, {
		var12,
		p0.localUserId,
		p0.setMessages,
		p0.textChatService
	})
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: var13 (ref), var14 (ref)
		if var13.messageKey then
			var14.displayRobloxSystemMessage(var13.messageKey, var13.messageFallback or "")
		end
		return var14.clearAvailabilityMessage
	end, { var14, var13.messageKey, var13.messageFallback })
	
	return reactModule.createElement(chatAppModule, {
		messagesSignal = p0.getMessages,
		localUserId = p0.localUserId,
		targetChannel = var12,
		canLocalUserChat = var13.canChat
	})
end

local t = {}

return {
	start = function() --[[ line: 63 ]]
		-- upvalues: t (ref), signalsModule (ref), reactModule (ref), messageWriterContextModule (ref), chatAvailabilityContextModule (ref), TextChannelWindowRoot (ref), mountToTargetInstanceModule (ref)
		local function onRemoved(p1) --[[ line: 64 ]]
			-- upvalues: t (copy)
			local var18 = t[p1]
			
			if var18 then
				var18()
				t[p1] = nil
			end
		end
		
		local function onAdded(p2) --[[ line: 72 ]]
			-- upvalues: signalsModule (copy), reactModule (copy), messageWriterContextModule (copy), chatAvailabilityContextModule (copy), TextChannelWindowRoot (copy), mountToTargetInstanceModule (copy), t (copy)
			local localPlayer = game:GetService("Players").LocalPlayer
			
			if not localPlayer then return end
			local var19 = tostring(localPlayer.UserId)
			local textChatService = game:GetService("TextChatService")
			local var21, var22 = signalsModule.createSignal({})
			local var23 = mountToTargetInstanceModule(p2, reactModule.createElement(messageWriterContextModule.Provider, { setMessages = var22 }, {
				availability = reactModule.createElement(chatAvailabilityContextModule.Provider, { subjectPlayer = localPlayer }, {
					root = reactModule.createElement(TextChannelWindowRoot, {
						localUserId = var19,
						textChannelWindow = p2,
						textChatService = textChatService,
						getMessages = var21,
						setMessages = var22
					})
				})
			}))
			
			if var23 then
				t[p2] = var23
			end
			p2.AncestryChanged:Connect(function() --[[ line: 100 ]]
				-- upvalues: p2 (ref), t (copy)
				if not p2:IsDescendantOf(game) then
					local var24 = p2
					local var25 = t[var24]
					
					if var25 then
						var25()
						t[var24] = nil
					end
				end
			end)
		end
		
		local textChatService = game:GetService("TextChatService")
		
		for i, v in textChatService:GetTextChannelWindows() do
			onAdded(v)
		end
		textChatService.TextChannelWindowAdded:Connect(onAdded)
		textChatService.TextChannelWindowRemoved:Connect(onRemoved)
	end
}