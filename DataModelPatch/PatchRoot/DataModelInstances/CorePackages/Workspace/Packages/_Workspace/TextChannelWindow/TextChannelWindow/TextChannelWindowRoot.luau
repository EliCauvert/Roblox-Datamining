local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local ChatAppModule = require(script.Parent.ChatApp)
local _ = require(script.Parent.Message)
local MountToTargetInstanceModule = require(script.Parent.mountToTargetInstance)
local UseTextChannelWindowPropsModule = require(script.Parent.useTextChannelWindowProps)
local UseLocalUserInTextChannelModule = require(script.Parent.useLocalUserInTextChannel)
local UseRobloxSystemMessageModule = require(script.Parent.useRobloxSystemMessage)
local ChatAvailabilityContextModule = require(script.Parent.ChatAvailabilityContext)
local MessageWriterContextModule = require(script.Parent.MessageWriterContext)
local CreateChannelMessagesStoreModule = require(script.Parent.createChannelMessagesStore)
local TextChatServiceBridgeModule = require(script.Parent.TextChatServiceBridge)
local UseLocalUserChatAvailabilityFunction = ChatAvailabilityContextModule.useLocalUserChatAvailability
local Signal = require(Parent.Signals).createSignal({})

local function TextChannelWindowRoot(p1)
	-- upvalues: UseTextChannelWindowPropsModule (copy), UseLocalUserInTextChannelModule (copy), UseLocalUserChatAvailabilityFunction (copy), UseRobloxSystemMessageModule (copy), ReactModule (copy), Signal (copy), ChatAppModule (copy)
	local UseTextChannelWindowPropsModuleResult = UseTextChannelWindowPropsModule(p1.textChannelWindow)
	local Target = UseTextChannelWindowPropsModuleResult.target
	local UseLocalUserInTextChannelModuleResult = UseLocalUserInTextChannelModule(Target, p1.localUserId)
	local NoChannel: string = if Target == nil then "no-channel" elseif UseLocalUserInTextChannelModuleResult then "member" else "not-member"
	local Target1 = if NoChannel == "member" then Target else nil
	local UseLocalUserChatAvailabilityResult = UseLocalUserChatAvailabilityFunction()
	local UseRobloxSystemMessageModuleResult = UseRobloxSystemMessageModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Target1 (copy), p1 (copy), Signal (upval)
		return if Target1 then p1.getChannelMessages(Target1) else Signal
	end, { Target1, p1.getChannelMessages, Signal })
	ReactModule.useEffect(function()
		-- upvalues: UseLocalUserChatAvailabilityResult (copy), UseRobloxSystemMessageModuleResult (copy)
		if UseLocalUserChatAvailabilityResult.messageKey then
			UseRobloxSystemMessageModuleResult.displayRobloxSystemMessage(UseLocalUserChatAvailabilityResult.messageKey, UseLocalUserChatAvailabilityResult.messageFallback or "")
		end
		return UseRobloxSystemMessageModuleResult.clearAvailabilityMessage
	end, {
		UseRobloxSystemMessageModuleResult,
		UseLocalUserChatAvailabilityResult.messageKey,
		UseLocalUserChatAvailabilityResult.messageFallback
	})
	
	return ReactModule.createElement(ChatAppModule, {
		messagesSignal = UseMemoResult,
		localUserId = p1.localUserId,
		targetChannel = Target1,
		channelState = NoChannel,
		canLocalUserChat = UseLocalUserChatAvailabilityResult.canChat,
		backgroundColor = UseTextChannelWindowPropsModuleResult.backgroundColor
	})
end

local t = {}

return {
	start = function()
		-- upvalues: CreateChannelMessagesStoreModule (copy), t (copy), ReactModule (copy), MessageWriterContextModule (copy), ChatAvailabilityContextModule (copy), TextChannelWindowRoot (copy), MountToTargetInstanceModule (copy), TextChatServiceBridgeModule (copy)
		local LocalPlayer = game:GetService("Players").LocalPlayer
		
		if not LocalPlayer then return end
		local Text = tostring(LocalPlayer.UserId)
		local ChannelMessagesStoreModule = CreateChannelMessagesStoreModule()
		
		local function onRemoved(TextChannelWindow)
			-- upvalues: t (upval)
			local Entry: () -> () = t[TextChannelWindow]
			
			if Entry then
				Entry()
				t[TextChannelWindow] = nil
			end
		end
		
		local function onAdded(TextChannelWindow)
			-- upvalues: ChannelMessagesStoreModule (copy), ReactModule (upval), MessageWriterContextModule (upval), ChatAvailabilityContextModule (upval), LocalPlayer (copy), TextChannelWindowRoot (upval), Text (copy), MountToTargetInstanceModule (upval), t (upval)
			local MountToTargetInstanceModuleResult = MountToTargetInstanceModule(TextChannelWindow, (ReactModule.createElement(MessageWriterContextModule.Provider, {
				upsertMessage = function(Target)
					-- upvalues: TextChannelWindow (copy), ChannelMessagesStoreModule (upval)
					local Target1 = TextChannelWindow.Target
					
					if Target1 and Target1:IsA("TextChannel") then
						ChannelMessagesStoreModule.upsertMessage(Target1, Target)
					end
				end,
				removeMessage = function(Target)
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
						getChannelMessages = ChannelMessagesStoreModule.getMessagesForChannel
					})
				})
			})))
			
			if MountToTargetInstanceModuleResult then
				t[TextChannelWindow] = MountToTargetInstanceModuleResult
			end
			TextChannelWindow.AncestryChanged:Connect(function()
				-- upvalues: TextChannelWindow (copy), t (upval)
				if not TextChannelWindow:IsDescendantOf(game) then
					local Entry: () -> () = t[TextChannelWindow]
					
					if Entry then
						Entry()
						t[TextChannelWindow] = nil
					end
				end
			end)
		end
		
		local TextChatService = game:GetService("TextChatService")
		TextChatServiceBridgeModule(TextChatService, Text, ChannelMessagesStoreModule)
		
		for _, textChannelWindow in TextChatService:GetTextChannelWindows() do
			onAdded(textChannelWindow)
		end
		TextChatService.TextChannelWindowAdded:Connect(onAdded)
		TextChatService.TextChannelWindowRemoved:Connect(onRemoved)
	end
}