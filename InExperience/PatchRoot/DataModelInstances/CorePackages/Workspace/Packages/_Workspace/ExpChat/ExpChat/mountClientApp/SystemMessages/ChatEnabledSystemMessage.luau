local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local displaySystemMessageModule = require(expChat.displaySystemMessage)
local expChatLocalChatEnabledMessageExperimentation = require(parent.SocialExperiments).ExpChatLocalChatEnabledMessageExperimentation
local analytics = expChatSharedModule.Analytics
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagExpChatUseUpdatedUserCountStrings = expChatSharedModule.Flags.FFlagExpChatUseUpdatedUserCountStrings
local expChatReportChatEnabledUserCountMetrics = game:DefineFastFlag("ExpChatReportChatEnabledUserCountMetrics", false)
local expChatLocalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatLocalUserCountEnabled")
local expChatChatableUserCountSystemMessageMinUsers = game:DefineFastInt("ExpChatChatableUserCountSystemMessageMinUsers", 5)
local var1 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)

return function(p1)
	-- upvalues: fFlagConnectionsToFriendsRename (ref), displaySystemMessageModule (ref), expChatLocalChatEnabledMessageExperimentation (ref), expChatLocalUserCountEnabledEngineFeature (ref), textChatService (ref), expChatReportChatEnabledUserCountMetrics (ref), analytics (ref), var1 (ref), fFlagExpChatUseUpdatedUserCountStrings (ref), expChatChatableUserCountSystemMessageMinUsers (ref)
	local translator = p1.translator
	local defaultSystemTextChannel = p1.defaultSystemTextChannel
	local localPlayer = p1.localPlayer
	local var2 = false
	
	return function()
		-- upvalues: fFlagConnectionsToFriendsRename (copy), displaySystemMessageModule (copy), translator (ref), defaultSystemTextChannel (ref), expChatLocalChatEnabledMessageExperimentation (copy), expChatLocalUserCountEnabledEngineFeature (copy), textChatService (copy), localPlayer (ref), expChatReportChatEnabledUserCountMetrics (copy), analytics (copy), var1 (copy), fFlagExpChatUseUpdatedUserCountStrings (copy), expChatChatableUserCountSystemMessageMinUsers (copy), var2 (write)
		local var3 = if fFlagConnectionsToFriendsRename then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAndTC"
		local var4 = if fFlagConnectionsToFriendsRename then "Only people in similar age groups and your trusted friends can chat with you." else "Only people in similar age groups and your Trusted Connections can chat with you."
		
		local function _()
			-- upvalues: displaySystemMessageModule (copy), var3 (ref), translator (copy), defaultSystemTextChannel (copy), var4 (ref)
			displaySystemMessageModule(var3, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var4)
		end
		
		if expChatLocalChatEnabledMessageExperimentation.isExperimentEnabled and expChatLocalUserCountEnabledEngineFeature then
			task.spawn(function()
				-- upvalues: textChatService (copy), localPlayer (copy), expChatReportChatEnabledUserCountMetrics (copy), analytics (copy), var1 (copy), displaySystemMessageModule (copy), var3 (ref), translator (copy), defaultSystemTextChannel (copy), var4 (ref), expChatLocalChatEnabledMessageExperimentation (copy), fFlagExpChatUseUpdatedUserCountStrings (copy), expChatChatableUserCountSystemMessageMinUsers (copy), var2 (copy)
				local ok, status = pcall(function()
					-- upvalues: textChatService (copy), localPlayer (copy)
					return textChatService:GetChatableUserCountAsync(localPlayer.UserId, "local")
				end)
				
				if expChatReportChatEnabledUserCountMetrics then
					analytics.reportChatEnabledUserCountFetchResult(ok and status ~= nil)
				end
				if not ok then
					var1:warning("GetChatableUserCountAsync (local) failed: {}", tostring(status))
					displaySystemMessageModule(var3, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var4)
					
					return
				elseif status == nil then
					displaySystemMessageModule(var3, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var4)
					
					return
				end
				local systemMessageKey = expChatLocalChatEnabledMessageExperimentation.getSystemMessageKey()
				
				if systemMessageKey == nil then
					displaySystemMessageModule(var3, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var4)
					
					return
				end
				local var5 = (function(p2)
					-- upvalues: fFlagExpChatUseUpdatedUserCountStrings (copy), var3 (copy), status (ref), expChatChatableUserCountSystemMessageMinUsers (copy)
					local t = {
						FRIENDLY = "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.Friendly",
						WITH_COUNT_ABOVE_THRESHOLD = if fFlagExpChatUseUpdatedUserCountStrings then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.Local.WithCount" else "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.WithCount",
						WITH_COUNT_BELOW_THRESHOLD = if fFlagExpChatUseUpdatedUserCountStrings then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.BelowThreshold" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3"
					}
					
					return if p2 == "CONTROL" then var3 elseif p2 == "V1_WITH_COUNT" then if expChatChatableUserCountSystemMessageMinUsers <= status then t.WITH_COUNT_ABOVE_THRESHOLD else t.WITH_COUNT_BELOW_THRESHOLD elseif p2 == "V2_FRIENDLY" then t.FRIENDLY elseif p2 == "V3_WITHOUT_COUNT" then t.WITH_COUNT_BELOW_THRESHOLD else nil
				end)(systemMessageKey)
				
				if var5 == nil then
					var1:warning("LocalChatEnabledMessage: IXP returned unrecognized identifier '{}'; showing control message, not logging exposure", systemMessageKey)
					displaySystemMessageModule(var3, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var4)
					
					return
				elseif not var2 then
					var2 = true
					expChatLocalChatEnabledMessageExperimentation.logExposure()
				end
				displaySystemMessageModule(var5, { RBX_COUNT = status }, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var4)
			end)
			
			return
		end
		displaySystemMessageModule(var3, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var4)
	end
end