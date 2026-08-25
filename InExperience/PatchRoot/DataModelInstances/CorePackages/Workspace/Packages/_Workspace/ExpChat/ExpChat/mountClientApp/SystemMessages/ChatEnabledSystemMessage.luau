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
local var8 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)

return function(p0)
	-- upvalues: fFlagConnectionsToFriendsRename (ref), displaySystemMessageModule (ref), expChatLocalChatEnabledMessageExperimentation (ref), expChatLocalUserCountEnabledEngineFeature (ref), textChatService (ref), expChatReportChatEnabledUserCountMetrics (ref), analytics (ref), var8 (ref), fFlagExpChatUseUpdatedUserCountStrings (ref), expChatChatableUserCountSystemMessageMinUsers (ref)
	local translator = p0.translator
	local defaultSystemTextChannel = p0.defaultSystemTextChannel
	local localPlayer = p0.localPlayer
	local var9 = false
	
	return function()
		-- upvalues: fFlagConnectionsToFriendsRename (copy), displaySystemMessageModule (copy), translator (ref), defaultSystemTextChannel (ref), expChatLocalChatEnabledMessageExperimentation (copy), expChatLocalUserCountEnabledEngineFeature (copy), textChatService (copy), localPlayer (ref), expChatReportChatEnabledUserCountMetrics (copy), analytics (copy), var8 (copy), fFlagExpChatUseUpdatedUserCountStrings (copy), expChatChatableUserCountSystemMessageMinUsers (copy), var9 (write)
		local var10 = if fFlagConnectionsToFriendsRename then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAndTC"
		local var11 = if fFlagConnectionsToFriendsRename then "Only people in similar age groups and your trusted friends can chat with you." else "Only people in similar age groups and your Trusted Connections can chat with you."
		
		local function _()
			-- upvalues: displaySystemMessageModule (copy), var10 (ref), translator (copy), defaultSystemTextChannel (copy), var11 (ref)
			displaySystemMessageModule(var10, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var11)
		end
		
		if expChatLocalChatEnabledMessageExperimentation.isExperimentEnabled and expChatLocalUserCountEnabledEngineFeature then
			task.spawn(function()
				-- upvalues: textChatService (copy), localPlayer (copy), expChatReportChatEnabledUserCountMetrics (copy), analytics (copy), var8 (copy), displaySystemMessageModule (copy), var10 (ref), translator (copy), defaultSystemTextChannel (copy), var11 (ref), expChatLocalChatEnabledMessageExperimentation (copy), fFlagExpChatUseUpdatedUserCountStrings (copy), expChatChatableUserCountSystemMessageMinUsers (copy), var9 (copy)
				local ok, status = pcall(function()
					-- upvalues: textChatService (copy), localPlayer (copy)
					return textChatService:GetChatableUserCountAsync(localPlayer.UserId, "local")
				end)
				
				if expChatReportChatEnabledUserCountMetrics then
					analytics.reportChatEnabledUserCountFetchResult(ok and status ~= nil)
				end
				if not ok then
					var8:warning("GetChatableUserCountAsync (local) failed: {}", tostring(status))
					displaySystemMessageModule(var10, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var11)
					
					return
				elseif status == nil then
					displaySystemMessageModule(var10, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var11)
					
					return
				end
				local systemMessageKey = expChatLocalChatEnabledMessageExperimentation.getSystemMessageKey()
				
				if systemMessageKey == nil then
					displaySystemMessageModule(var10, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var11)
					
					return
				end
				local var13 = (function(p1)
					-- upvalues: fFlagExpChatUseUpdatedUserCountStrings (copy), var10 (copy), status (ref), expChatChatableUserCountSystemMessageMinUsers (copy)
					local t = {
						FRIENDLY = "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.Friendly",
						WITH_COUNT_ABOVE_THRESHOLD = if fFlagExpChatUseUpdatedUserCountStrings then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.Local.WithCount" else "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.WithCount",
						WITH_COUNT_BELOW_THRESHOLD = if fFlagExpChatUseUpdatedUserCountStrings then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.BelowThreshold" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3"
					}
					
					return if p1 == "CONTROL" then var10 elseif p1 == "V1_WITH_COUNT" then if expChatChatableUserCountSystemMessageMinUsers <= status then t.WITH_COUNT_ABOVE_THRESHOLD else t.WITH_COUNT_BELOW_THRESHOLD elseif p1 == "V2_FRIENDLY" then t.FRIENDLY elseif p1 == "V3_WITHOUT_COUNT" then t.WITH_COUNT_BELOW_THRESHOLD else nil
				end)(systemMessageKey)
				
				if var13 == nil then
					var8:warning("LocalChatEnabledMessage: IXP returned unrecognized identifier '{}'; showing control message, not logging exposure", systemMessageKey)
					displaySystemMessageModule(var10, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var11)
					
					return
				elseif not var9 then
					var9 = true
					expChatLocalChatEnabledMessageExperimentation.logExposure()
				end
				displaySystemMessageModule(var13, { RBX_COUNT = status }, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var11)
			end)
			
			return
		end
		displaySystemMessageModule(var10, nil, "Roblox.ChatEnabled.Info", translator, defaultSystemTextChannel, var11)
	end
end