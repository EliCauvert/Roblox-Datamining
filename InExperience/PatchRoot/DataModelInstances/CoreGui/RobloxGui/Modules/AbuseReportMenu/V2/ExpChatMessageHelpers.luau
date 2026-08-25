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
	localizeString = function(p0, p1)
		if not p0 then
			return p1
		end
		local ok, status = pcall(p0.TranslateGameText, p0, game, p1)
		
		return if ok and type(status) == "string" then status else p1
	end,
	isSystemMessage = function(p2)
		-- upvalues: fFlagAbuseReportAttributedRBXSystemMessages (ref)
		return if not (not fFlagAbuseReportAttributedRBXSystemMessages and p2.textChannel and p2.textChannel.Name == "RBXSystem") then p2.userId and p2.userId ~= "0" else true
	end,
	formatChannelLabel = function(p3, p4)
		-- upvalues: playersService (ref), fFlagEnableGlobalChatAbuseReporting (ref)
		if string.find(p3, "RBXGeneral") then
			return "General"
		elseif string.find(p3, "^RBXTeam") then
			return "Team"
		elseif string.find(p3, "^RBXWhisper") then
			if p4 and playersService.LocalPlayer then
				for i, v in ipairs(p4:GetChildren()) do
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
			return if fFlagEnableGlobalChatAbuseReporting and p3 == "RBXGlobal" then "Global" else p3
		end
	end,
	formatMessageLabel = function(p5)
		local prefixText = p5.prefixText or ""
		local text = p5.text or ""
		
		return if #prefixText > 0 then prefixText .. " " .. text else text
	end,
	getMessageUsername = function(p6)
		-- upvalues: playersService (ref)
		local var8 = tonumber(p6.userId)
		
		if var8 and var8 ~= 0 then
			local var9 = playersService:GetPlayerByUserId(var8)
			
			if var9 then
				return var9.Name
			end
		end
		local textChatMessageInstance = p6.textChatMessageInstance
		
		if textChatMessageInstance then
			local textSource = textChatMessageInstance.TextSource
			
			return if textSource and textSource.Username and #textSource.Username > 0 then textSource.Username else nil
		end
	end
}

function t.collectItems(p7, p8)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in ipairs(p8) do
		local var11 = p7[v]
		
		if var11 and not t.isSystemMessage(var11) then
			table.insert(t_1, {
				id = var11.messageId,
				label = t.formatMessageLabel(var11),
				meta = {
					textChannel = var11.textChannel,
					userId = tostring(var11.userId),
					presetId = var11.presetId,
					presetChatVersion = var11.presetChatVersion,
					username = t.getMessageUsername(var11)
				}
			})
		end
	end
	return t_1
end

function t.annotateWhisperItems(p9, p10, p11)
	for i, v in ipairs(p9) do
		local id = p10[v.id]
		
		if id and id.textChannel and (typeof(id.textChannel.Name) == "string" and string.sub(id.textChannel.Name, 1, 10) == "RBXWhisper") then
			v.label = string.format("[%s] %s", p11, v.label)
		end
	end
end

return t