local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local MessageModule = require(script.Parent.Message)
local MessageWriterContextModule = require(script.Parent.MessageWriterContext)
local GetWhisperChannelOtherDisplayNameModule = require(script.Parent.getWhisperChannelOtherDisplayName)
local UseInExperienceLocalizationFunction = require(Parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local FFlagExpChatTextChannelWindowWelcomeAndSummaryModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowWelcomeAndSummary)
local self = setmetatable({}, { __mode = "k" })

local function _(p1): boolean
	return string.find(p1.Name, "^RBXWhisper") ~= nil
end

return function(p1, p2)
	-- upvalues: MessageWriterContextModule (copy), UseInExperienceLocalizationFunction (copy), ReactModule (copy), FFlagExpChatTextChannelWindowWelcomeAndSummaryModule (copy), self (copy), GetWhisperChannelOtherDisplayNameModule (copy), MessageModule (copy), Players (copy)
	local UseMessageWriterResult = MessageWriterContextModule.useMessageWriter()
	local UseInExperienceLocalizationResult = UseInExperienceLocalizationFunction()
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatTextChannelWindowWelcomeAndSummaryModule (upval), UseMessageWriterResult (copy), p1 (copy), self (upval), GetWhisperChannelOtherDisplayNameModule (upval), p2 (copy), UseInExperienceLocalizationResult (copy), MessageModule (upval), Players (upval)
		if not FFlagExpChatTextChannelWindowWelcomeAndSummaryModule then return end
		if not UseMessageWriterResult or p1 == nil then return end
		if string.find(p1.Name, "^RBXWhisper") == nil or self[p1] then return end
		local function trySend(): boolean
			-- upvalues: self (upval), p1 (copy), GetWhisperChannelOtherDisplayNameModule (upval), p2 (upval), UseInExperienceLocalizationResult (upval), UseMessageWriterResult (upval), MessageModule (upval)
			if self[p1] then
				return true
			end
			local WhisperChannelOtherDisplayNameModule = GetWhisperChannelOtherDisplayNameModule(p1, p2)
			
			if not WhisperChannelOtherDisplayNameModule then
				return false
			end
			local CoreScriptsTextChatNotificationWhisperChatCreated = UseInExperienceLocalizationResult("CoreScripts.TextChat.Notification.WhisperChat.Created", { RBX_NAME = WhisperChannelOtherDisplayNameModule })
			
			if CoreScriptsTextChatNotificationWhisperChatCreated == "" then
				return false
			else
				self[p1] = true
				UseMessageWriterResult.write(MessageModule.createSystemMessage(CoreScriptsTextChatNotificationWhisperChatCreated, "Roblox.Whisper.Welcome.Sent:" .. p1.Name))
				
				return true
			end
		end
		
		if trySend() then return end
		local Connection = nil
		local Connection1 = nil
		
		local function cleanup()
			-- upvalues: Connection (ref), Connection1 (ref)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
		
		local function retry()
			-- upvalues: trySend (copy), Connection (ref), Connection1 (ref)
			if trySend() then
				Connection:Disconnect()
				Connection1:Disconnect()
			end
		end
		
		Connection = p1.ChildAdded:Connect(retry)
		Connection1 = Players.PlayerAdded:Connect(retry)
		
		return cleanup
	end, {
		UseMessageWriterResult,
		UseInExperienceLocalizationResult,
		p1,
		p2
	})
end