local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local messageModule = require(script.Parent.Message)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local getWhisperChannelOtherDisplayNameModule = require(script.Parent.getWhisperChannelOtherDisplayName)
local useInExperienceLocalization = require(parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local fFlagExpChatTextChannelWindowWelcomeAndSummaryModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowWelcomeAndSummary)
local tbl = setmetatable({}, { __mode = "k" })

local function _(p1)
	return string.find(p1.Name, "^RBXWhisper") ~= nil
end

return function(p1, p2)
	-- upvalues: messageWriterContextModule (ref), useInExperienceLocalization (ref), reactModule (ref), fFlagExpChatTextChannelWindowWelcomeAndSummaryModule (ref), tbl (ref), getWhisperChannelOtherDisplayNameModule (ref), messageModule (ref), playersService (ref)
	local var1 = messageWriterContextModule.useMessageWriter()
	local var2 = useInExperienceLocalization()
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatTextChannelWindowWelcomeAndSummaryModule (copy), var1 (ref), p1 (ref), tbl (copy), getWhisperChannelOtherDisplayNameModule (copy), p2 (ref), var2 (ref), messageModule (copy), playersService (copy)
		if not fFlagExpChatTextChannelWindowWelcomeAndSummaryModule then return end
		if not var1 or p1 == nil then return end
		if string.find(p1.Name, "^RBXWhisper") == nil or tbl[p1] then return end
		local function trySend()
			-- upvalues: tbl (copy), p1 (ref), getWhisperChannelOtherDisplayNameModule (copy), p2 (copy), var2 (copy), var1 (copy), messageModule (copy)
			if tbl[p1] then
				return true
			end
			local var3 = getWhisperChannelOtherDisplayNameModule(p1, p2)
			
			if not var3 then
				return false
			end
			local var4 = var2("CoreScripts.TextChat.Notification.WhisperChat.Created", { RBX_NAME = var3 })
			
			if var4 == "" then
				return false
			end
			tbl[p1] = true
			var1.write(messageModule.createSystemMessage(var4, "Roblox.Whisper.Welcome.Sent:" .. p1.Name))
			
			return true
		end
		
		if trySend() then
			return
		end
		local childAddedConnection = nil
		local playerAddedConnection = nil
		
		local function cleanup()
			-- upvalues: childAddedConnection (write), playerAddedConnection (write)
			childAddedConnection:Disconnect()
			playerAddedConnection:Disconnect()
		end
		
		local function retry()
			-- upvalues: trySend (ref), childAddedConnection (write), playerAddedConnection (write)
			if trySend() then
				childAddedConnection:Disconnect()
				playerAddedConnection:Disconnect()
			end
		end
		
		childAddedConnection = p1.ChildAdded:Connect(retry)
		playerAddedConnection = playersService.PlayerAdded:Connect(retry)
		
		return cleanup
	end, { var1, var2, p1, p2 })
end