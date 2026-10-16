local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local DisplaySystemMessageModule = require(ExpChat.displaySystemMessage)
local ExpChatLocalChatEnabledMessageExperimentation = require(Parent.SocialExperiments).ExpChatLocalChatEnabledMessageExperimentation
local Analytics = ExpChatSharedModule.Analytics
local FFlagExpChatUseUpdatedUserCountStrings = ExpChatSharedModule.Flags.FFlagExpChatUseUpdatedUserCountStrings
local ExpChatReportChatEnabledUserCountMetrics = game:DefineFastFlag("ExpChatReportChatEnabledUserCountMetrics", false)
local ExpChatLocalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatLocalUserCountEnabled")
local ExpChatChatableUserCountSystemMessageMinUsers = game:DefineFastInt("ExpChatChatableUserCountSystemMessageMinUsers", 5)
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/" .. script.Name)

return function(p1) --[[ Line: 32 | Named "createDisplayChatEnabledMessage" ]]
	-- upvalues: DisplaySystemMessageModule (copy), ExpChatLocalChatEnabledMessageExperimentation (copy), ExpChatLocalUserCountEnabledEngineFeature (copy), TextChatService (copy), ExpChatReportChatEnabledUserCountMetrics (copy), Analytics (copy), NewResult (copy), FFlagExpChatUseUpdatedUserCountStrings (copy), ExpChatChatableUserCountSystemMessageMinUsers (copy)
	local Translator = p1.translator
	local DefaultSystemTextChannel = p1.defaultSystemTextChannel
	local LocalPlayer = p1.localPlayer
	local DisplayVirtualSystemMessageFunction = p1.displayVirtualSystemMessage
	local Flag = false
	
	return function() --[[ Line: 40 ]]
		-- upvalues: DisplayVirtualSystemMessageFunction (copy), DisplaySystemMessageModule (upval), Translator (copy), DefaultSystemTextChannel (copy), ExpChatLocalChatEnabledMessageExperimentation (upval), ExpChatLocalUserCountEnabledEngineFeature (upval), TextChatService (upval), LocalPlayer (copy), ExpChatReportChatEnabledUserCountMetrics (upval), Analytics (upval), NewResult (upval), FFlagExpChatUseUpdatedUserCountStrings (upval), ExpChatChatableUserCountSystemMessageMinUsers (upval), Flag (ref)
		local function _() --[[ Line: 44 | Named "displayControlMessage" ]]
			-- upvalues: DisplayVirtualSystemMessageFunction (upval), DisplaySystemMessageModule (upval), Translator (upval), DefaultSystemTextChannel (upval)
			if DisplayVirtualSystemMessageFunction then
				DisplayVirtualSystemMessageFunction("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Only people in similar age groups and your trusted friends can chat with you.")
				
				return
			else
				DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, "Only people in similar age groups and your trusted friends can chat with you.")
			end
		end
		
		if ExpChatLocalChatEnabledMessageExperimentation.isExperimentEnabled and ExpChatLocalUserCountEnabledEngineFeature then
			task.spawn(function() --[[ Line: 63 ]]
				-- upvalues: TextChatService (upval), LocalPlayer (upval), ExpChatReportChatEnabledUserCountMetrics (upval), Analytics (upval), NewResult (upval), DisplayVirtualSystemMessageFunction (upval), DisplaySystemMessageModule (upval), Translator (upval), DefaultSystemTextChannel (upval), ExpChatLocalChatEnabledMessageExperimentation (upval), FFlagExpChatUseUpdatedUserCountStrings (upval), ExpChatChatableUserCountSystemMessageMinUsers (upval), Flag (upval)
				local Success, Result = pcall(function() --[[ Line: 64 ]]
					-- upvalues: TextChatService (upval), LocalPlayer (upval)
					return TextChatService:GetChatableUserCountAsync(LocalPlayer.UserId, "local")
				end)
				
				if ExpChatReportChatEnabledUserCountMetrics then
					Analytics.reportChatEnabledUserCountFetchResult(Success and Result ~= nil)
				end
				if Success then
					if Result ~= nil then
						local SystemMessageKey = ExpChatLocalChatEnabledMessageExperimentation.getSystemMessageKey()
						
						if SystemMessageKey ~= nil then
							local v1 = (function(p2) --[[ Line: 90 | Named "GetSystemMessageKey" ]]
								-- upvalues: FFlagExpChatUseUpdatedUserCountStrings (upval), Result (copy), ExpChatChatableUserCountSystemMessageMinUsers (upval)
								local config = {
									FRIENDLY = "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.Friendly",
									WITH_COUNT_ABOVE_THRESHOLD = if FFlagExpChatUseUpdatedUserCountStrings then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.Local.WithCount" else "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.WithCount",
									WITH_COUNT_BELOW_THRESHOLD = if FFlagExpChatUseUpdatedUserCountStrings then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.BelowThreshold" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3"
								}
								
								return if p2 == "CONTROL" then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF" elseif p2 == "V1_WITH_COUNT" then if ExpChatChatableUserCountSystemMessageMinUsers <= Result then config.WITH_COUNT_ABOVE_THRESHOLD else config.WITH_COUNT_BELOW_THRESHOLD elseif p2 == "V2_FRIENDLY" then config.FRIENDLY elseif p2 == "V3_WITHOUT_COUNT" then config.WITH_COUNT_BELOW_THRESHOLD else nil
							end)(SystemMessageKey)
							
							if v1 == nil then
								NewResult:warning("LocalChatEnabledMessage: IXP returned unrecognized identifier '{}'; showing control message, not logging exposure", SystemMessageKey)
								
								if DisplayVirtualSystemMessageFunction then
									DisplayVirtualSystemMessageFunction("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Only people in similar age groups and your trusted friends can chat with you.")
									
									return
								else
									DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, "Only people in similar age groups and your trusted friends can chat with you.")
									
									return
								end
							else
								if not Flag then
									Flag = true
									ExpChatLocalChatEnabledMessageExperimentation.logExposure()
								end
								if DisplayVirtualSystemMessageFunction then
									DisplayVirtualSystemMessageFunction(v1, { RBX_COUNT = Result }, "Only people in similar age groups and your trusted friends can chat with you.")
									
									return
								else
									DisplaySystemMessageModule(v1, { RBX_COUNT = Result }, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, "Only people in similar age groups and your trusted friends can chat with you.")
									
									return
								end
							end
						elseif DisplayVirtualSystemMessageFunction then
							DisplayVirtualSystemMessageFunction("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Only people in similar age groups and your trusted friends can chat with you.")
							
							return
						else
							DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, "Only people in similar age groups and your trusted friends can chat with you.")
							
							return
						end
					elseif DisplayVirtualSystemMessageFunction then
						DisplayVirtualSystemMessageFunction("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Only people in similar age groups and your trusted friends can chat with you.")
						
						return
					else
						DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, "Only people in similar age groups and your trusted friends can chat with you.")
						
						return
					end
				else
					NewResult:warning("GetChatableUserCountAsync (local) failed: {}", (tostring(Result)))
					
					if DisplayVirtualSystemMessageFunction then
						DisplayVirtualSystemMessageFunction("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Only people in similar age groups and your trusted friends can chat with you.")
						
						return
					else
						DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, "Only people in similar age groups and your trusted friends can chat with you.")
					end
				end
			end)
			
			return
		end
		if DisplayVirtualSystemMessageFunction then
			DisplayVirtualSystemMessageFunction("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Only people in similar age groups and your trusted friends can chat with you.")
			
			return
		else
			DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, "Only people in similar age groups and your trusted friends can chat with you.")
		end
	end
end