local playersService = game:GetService("Players")
local textChatService = game:GetService("TextChatService")
local sharedFlagsModule = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags)
local fFlagEnableGlobalChatAbuseReporting = sharedFlagsModule.FFlagEnableGlobalChatAbuseReporting
local fFlagAbuseReportAttributedRBXSystemMessages = sharedFlagsModule.FFlagAbuseReportAttributedRBXSystemMessages
local t = {
	CHANNEL_GENERAL = "RBXGeneral",
	CHANNEL_GLOBAL = "RBXGlobal",
	areChannelTabsEnabled = function()
		-- upvalues: textChatService (ref)
		if not game:GetEngineFeature("EnableChannelTabsConfiguration") then
			return false
		end
		local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		
		return channelTabsConfiguration ~= nil and channelTabsConfiguration.Enabled
	end,
	localizeString = function(p1, p2)
		if not p1 then
			return p2
		end
		local ok, status = pcall(p1.TranslateGameText, p1, game, p2)
		
		return if ok and type(status) == "string" then status else p2
	end,
	isSystemMessage = function(p1)
		-- upvalues: fFlagAbuseReportAttributedRBXSystemMessages (ref)
		return if not (not fFlagAbuseReportAttributedRBXSystemMessages and p1.textChannel and p1.textChannel.Name == "RBXSystem") then p1.userId and p1.userId ~= "0" else true
	end,
	formatChannelLabel = function(p1, p2)
		-- upvalues: playersService (ref), fFlagEnableGlobalChatAbuseReporting (ref)
		if string.find(p1, "RBXGeneral") then
			return "General"
		elseif string.find(p1, "^RBXTeam") then
			return "Team"
		elseif string.find(p1, "^RBXWhisper") then
			if p2 and playersService.LocalPlayer then
				for i, v in ipairs(p2:GetChildren()) do
					if v:IsA("TextSource") then
						local userIdPlayerByUserId = playersService:GetPlayerByUserId(v.UserId)
						
						if userIdPlayerByUserId and userIdPlayerByUserId ~= playersService.LocalPlayer then
							return userIdPlayerByUserId.DisplayName
						end
					end
				end
			end
			return "Whisper"
		else
			return if fFlagEnableGlobalChatAbuseReporting and p1 == "RBXGlobal" then "Global" else p1
		end
	end,
	formatMessageLabel = function(p3)
		local prefixText = p3.prefixText or ""
		local text = p3.text or ""
		
		return if #prefixText > 0 then prefixText .. " " .. text else text
	end,
	getMessageUsername = function(p3)
		-- upvalues: playersService (ref)
		local var1 = tonumber(p3.userId)
		
		if var1 and var1 ~= 0 then
			local var2 = playersService:GetPlayerByUserId(var1)
			
			if var2 then
				return var2.Name
			end
		end
		local textChatMessageInstance = p3.textChatMessageInstance
		
		if textChatMessageInstance then
			local textSource = textChatMessageInstance.TextSource
			
			return if textSource and textSource.Username and #textSource.Username > 0 then textSource.Username else nil
		end
	end
}

function t.collectItems(p3, p4)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in ipairs(p4) do
		local var1 = p3[v]
		
		if var1 and not t.isSystemMessage(var1) then
			table.insert(t_1, {
				id = var1.messageId,
				label = t.formatMessageLabel(var1),
				meta = {
					textChannel = var1.textChannel,
					userId = tostring(var1.userId),
					presetId = var1.presetId,
					presetChatVersion = var1.presetChatVersion,
					username = t.getMessageUsername(var1)
				}
			})
		end
	end
	return t_1
end

function t.annotateWhisperItems(p5, p6, p7)
	for i, v in ipairs(p5) do
		local id = p6[v.id]
		
		if id and id.textChannel and (typeof(id.textChannel.Name) == "string" and string.sub(id.textChannel.Name, 1, 10) == "RBXWhisper") then
			v.label = string.format("[%s] %s", p7, v.label)
		end
	end
end

return t