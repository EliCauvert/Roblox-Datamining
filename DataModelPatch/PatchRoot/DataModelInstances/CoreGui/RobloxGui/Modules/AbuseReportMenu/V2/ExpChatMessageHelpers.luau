local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local FFlagEnableGlobalChatAbuseReporting = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableGlobalChatAbuseReporting
local ExpChatMessageHelpersModule = {
	CHANNEL_GENERAL = "RBXGeneral",
	CHANNEL_GLOBAL = "RBXGlobal",
	areChannelTabsEnabled = function()
		-- upvalues: TextChatService (copy)
		if game:GetEngineFeature("EnableChannelTabsConfiguration") then
			local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
			
			return ChannelTabsConfiguration ~= nil and ChannelTabsConfiguration.Enabled
		else
			return false
		end
	end,
	localizeString = function(p1, p2)
		if p1 then
			local Success, Result = pcall(p1.TranslateGameText, p1, game, p2)
			
			return if Success and type(Result) == "string" then Result else p2
		else
			return p2
		end
	end,
	isSystemMessage = function(p1): boolean
		return p1.textChannel and p1.textChannel.Name == "RBXSystem" or (not p1.userId or p1.userId == "0")
	end,
	formatChannelLabel = function(Text: string, Object)
		-- upvalues: Players (copy), FFlagEnableGlobalChatAbuseReporting (copy)
		if string.find(Text, "RBXGeneral") then
			return "General"
		end
		if string.find(Text, "^RBXTeam") then
			return "Team"
		end
		if not string.find(Text, "^RBXWhisper") then
			return if FFlagEnableGlobalChatAbuseReporting and Text == "RBXGlobal" then "Global" else Text
		end
		if Object and Players.LocalPlayer then
			local Player = nil
			for _, TextSource in ipairs(Object:GetChildren()) do
				if TextSource:IsA("TextSource") then
					Player = Players:GetPlayerByUserId(TextSource.UserId)
					
					if Player and Player ~= Players.LocalPlayer then
						return Player.DisplayName
					end
				end
			end
		end
		return "Whisper"
	end,
	formatMessageLabel = function(p1)
		local PrefixText = p1.prefixText or ""
		local Text = p1.text or ""
		
		return if #PrefixText > 0 then PrefixText .. " " .. Text else Text
	end,
	getMessageUsername = function(p1)
		-- upvalues: Players (copy)
		local Number: number? = tonumber(p1.userId)
		
		if Number and Number ~= 0 then
			local Player = Players:GetPlayerByUserId(Number)
			
			if Player then
				return Player.Name
			end
		end
		local TextChatMessageInstance = p1.textChatMessageInstance
		
		if TextChatMessageInstance then
			local TextSource = TextChatMessageInstance.TextSource
			
			if TextSource and TextSource.Username and #TextSource.Username > 0 then
				return TextSource.Username
			end
		end
		return nil
	end
}

function ExpChatMessageHelpersModule.collectItems(p1, List)
	-- upvalues: ExpChatMessageHelpersModule (copy)
	local List1 = {}
	
	for _, value in ipairs(List) do
		local v1 = p1[value]
		
		if v1 and not ExpChatMessageHelpersModule.isSystemMessage(v1) then
			table.insert(List1, {
				id = v1.messageId,
				label = ExpChatMessageHelpersModule.formatMessageLabel(v1),
				meta = {
					textChannel = v1.textChannel,
					userId = tostring(v1.userId),
					presetId = v1.presetId,
					presetChatVersion = v1.presetChatVersion,
					username = ExpChatMessageHelpersModule.getMessageUsername(v1)
				}
			})
		end
	end
	return List1
end

function ExpChatMessageHelpersModule.annotateWhisperItems(List, p2, p3)
	for _, value in ipairs(List) do
		local v2 = p2[value.id]
		
		if v2 and v2.textChannel and typeof(v2.textChannel.Name) == "string" and string.sub(v2.textChannel.Name, 1, 10) == "RBXWhisper" then
			value.label = string.format("[%s] %s", p3, value.label)
		end
	end
end

return ExpChatMessageHelpersModule