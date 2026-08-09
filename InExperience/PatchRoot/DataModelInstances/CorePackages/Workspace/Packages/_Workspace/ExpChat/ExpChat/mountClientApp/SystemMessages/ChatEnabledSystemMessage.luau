local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local displaySystemMessageModule = require(expChat.displaySystemMessage)
local expChatLocalChatEnabledMessageExperimentation = require(parent.SocialExperiments).ExpChatLocalChatEnabledMessageExperimentation
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local expChatLocalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatLocalUserCountEnabled")
local expChatChatableUserCountSystemMessageMinUsers = game:DefineFastInt("ExpChatChatableUserCountSystemMessageMinUsers", 5)
local var7 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)

return function(p0) --[[ line: 29 | named "createDisplayChatEnabledMessage" ]]
	-- upvalues: fFlagConnectionsToFriendsRename (ref), displaySystemMessageModule (ref), expChatLocalChatEnabledMessageExperimentation (ref), expChatLocalUserCountEnabledEngineFeature (ref), textChatService (ref), var7 (ref), expChatChatableUserCountSystemMessageMinUsers (ref)
	local translator = p0.translator
	local defaultSystemTextChannel = p0.defaultSystemTextChannel
	local localPlayer = p0.localPlayer
	local var8 = false
	
	return function() --[[ line: 36 ]]
		-- upvalues: fFlagConnectionsToFriendsRename (copy), displaySystemMessageModule (copy), translator (ref), defaultSystemTextChannel (ref), expChatLocalChatEnabledMessageExperimentation (copy), expChatLocalUserCountEnabledEngineFeature (copy), textChatService (copy), localPlayer (ref), var7 (copy), expChatChatableUserCountSystemMessageMinUsers (copy), var8 (write)
		local var9 = if fFlagConnectionsToFriendsRename then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAndTC"
		local var10 = if fFlagConnectionsToFriendsRename then "Only people in similar age groups and your trusted friends can chat with you." else "Only people in similar age groups and your Trusted Connections can chat with you."
		
		local function _() --[[ line: 44 | named "displayControlMessage" ]]
			-- upvalues: displaySystemMessageModule (copy), var9 (ref), translator (copy), defaultSystemTextChannel (copy), var10 (ref)
			displaySystemMessageModule(var9, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var10)
		end
		
		if expChatLocalChatEnabledMessageExperimentation.isExperimentEnabled and expChatLocalUserCountEnabledEngineFeature then
			task.spawn(function() --[[ line: 59 ]]
				-- upvalues: textChatService (copy), localPlayer (copy), var7 (copy), displaySystemMessageModule (copy), var9 (ref), translator (copy), defaultSystemTextChannel (copy), var10 (ref), expChatLocalChatEnabledMessageExperimentation (copy), expChatChatableUserCountSystemMessageMinUsers (copy), var8 (copy)
				local ok, status = pcall(function() --[[ line: 60 ]]
					-- upvalues: textChatService (copy), localPlayer (copy)
					return textChatService:GetChatableUserCountAsync(localPlayer.UserId, "local")
				end)
				
				if not ok then
					var7:warning("GetChatableUserCountAsync (local) failed: {}", tostring(status))
					displaySystemMessageModule(var9, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var10)
					
					return
				elseif status == nil then
					displaySystemMessageModule(var9, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var10)
					
					return
				end
				local systemMessageKey = expChatLocalChatEnabledMessageExperimentation.getSystemMessageKey()
				
				if systemMessageKey == nil then
					displaySystemMessageModule(var9, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var10)
					
					return
				end
				local function _(p1) --[[ line: 82 | named "GetSystemMessageKey" ]]
					-- upvalues: var9 (copy), status (ref), expChatChatableUserCountSystemMessageMinUsers (copy)
					local _ = {
						WITH_COUNT_ABOVE_THRESHOLD = "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.WithCount",
						WITH_COUNT_BELOW_THRESHOLD = "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3",
						FRIENDLY = "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.Friendly"
					}
					
					return if p1 == "CONTROL" then var9 elseif p1 == "V1_WITH_COUNT" then if expChatChatableUserCountSystemMessageMinUsers <= status then "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.WithCount" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3" elseif p1 == "V2_FRIENDLY" then "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.Friendly" elseif p1 == "V3_WITHOUT_COUNT" then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3" else nil
				end
				
				local _ = {
					WITH_COUNT_ABOVE_THRESHOLD = "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.WithCount",
					WITH_COUNT_BELOW_THRESHOLD = "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3",
					FRIENDLY = "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.Friendly"
				}
				local var12 = if systemMessageKey == "CONTROL" then var9 elseif systemMessageKey == "V1_WITH_COUNT" then if expChatChatableUserCountSystemMessageMinUsers <= status then "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.WithCount" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3" elseif systemMessageKey == "V2_FRIENDLY" then "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.Friendly" elseif systemMessageKey == "V3_WITHOUT_COUNT" then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3" else nil
				
				if var12 == nil then
					var7:warning("LocalChatEnabledMessage: IXP returned unrecognized identifier '{}'; showing control message, not logging exposure", systemMessageKey)
					displaySystemMessageModule(var9, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var10)
					
					return
				elseif not var8 then
					var8 = true
					expChatLocalChatEnabledMessageExperimentation.logExposure()
				end
				displaySystemMessageModule(var12, { RBX_COUNT = status }, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var10)
			end)
			
			return
		end
		displaySystemMessageModule(var9, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var10)
	end
end