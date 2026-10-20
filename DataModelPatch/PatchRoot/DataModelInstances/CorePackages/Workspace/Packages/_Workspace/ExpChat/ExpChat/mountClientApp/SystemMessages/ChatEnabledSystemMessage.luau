local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local DisplaySystemMessageModule = require(ExpChat.displaySystemMessage)
local ExpChatLocalChatEnabledMessageExperimentation = require(Parent.SocialExperiments).ExpChatLocalChatEnabledMessageExperimentation
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local ExpChatLocalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatLocalUserCountEnabled")
local ExpChatChatableUserCountSystemMessageMinUsers = game:DefineFastInt("ExpChatChatableUserCountSystemMessageMinUsers", 5)
local NewResult = require(Parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)

return function(p1)
	-- upvalues: FFlagConnectionsToFriendsRename (copy), DisplaySystemMessageModule (copy), ExpChatLocalChatEnabledMessageExperimentation (copy), ExpChatLocalUserCountEnabledEngineFeature (copy), TextChatService (copy), NewResult (copy), ExpChatChatableUserCountSystemMessageMinUsers (copy)
	local Translator = p1.translator
	local DefaultSystemTextChannel = p1.defaultSystemTextChannel
	local LocalPlayer = p1.localPlayer
	local Flag = false
	
	return function()
		-- upvalues: FFlagConnectionsToFriendsRename (upval), DisplaySystemMessageModule (upval), Translator (copy), DefaultSystemTextChannel (copy), ExpChatLocalChatEnabledMessageExperimentation (upval), ExpChatLocalUserCountEnabledEngineFeature (upval), TextChatService (upval), LocalPlayer (copy), NewResult (upval), ExpChatChatableUserCountSystemMessageMinUsers (upval), Flag (ref)
		local CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF: string = if FFlagConnectionsToFriendsRename then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAndTC"
		local OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou: string = if FFlagConnectionsToFriendsRename then "Only people in similar age groups and your trusted friends can chat with you." else "Only people in similar age groups and your Trusted Connections can chat with you."
		
		local function _()
			-- upvalues: DisplaySystemMessageModule (upval), CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF (copy), Translator (upval), DefaultSystemTextChannel (upval), OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou (copy)
			DisplaySystemMessageModule(CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF, nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou)
		end
		
		if ExpChatLocalChatEnabledMessageExperimentation.isExperimentEnabled and ExpChatLocalUserCountEnabledEngineFeature then
			task.spawn(function()
				-- upvalues: TextChatService (upval), LocalPlayer (upval), NewResult (upval), DisplaySystemMessageModule (upval), CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF (copy), Translator (upval), DefaultSystemTextChannel (upval), OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou (copy), ExpChatLocalChatEnabledMessageExperimentation (upval), ExpChatChatableUserCountSystemMessageMinUsers (upval), Flag (upval)
				local Success, Result = pcall(function()
					-- upvalues: TextChatService (upval), LocalPlayer (upval)
					return TextChatService:GetChatableUserCountAsync(LocalPlayer.UserId, "local")
				end)
				
				if not Success then
					NewResult:warning("GetChatableUserCountAsync (local) failed: {}", (tostring(Result)))
					DisplaySystemMessageModule(CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF, nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou)
					
					return
				end
				if Result == nil then
					DisplaySystemMessageModule(CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF, nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou)
					
					return
				end
				local SystemMessageKey = ExpChatLocalChatEnabledMessageExperimentation.getSystemMessageKey()
				
				if SystemMessageKey == nil then
					DisplaySystemMessageModule(CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF, nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou)
					
					return
				end
				local function _(p2)
					-- upvalues: CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF (upval), Result (copy), ExpChatChatableUserCountSystemMessageMinUsers (upval)
					return if p2 == "CONTROL" then CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF elseif p2 == "V1_WITH_COUNT" then if ExpChatChatableUserCountSystemMessageMinUsers <= Result then "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.WithCount" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3" elseif p2 == "V2_FRIENDLY" then "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.Friendly" elseif p2 == "V3_WITHOUT_COUNT" then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3" else nil
				end
				
				local CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF1 = if SystemMessageKey == "CONTROL" then CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF elseif SystemMessageKey == "V1_WITH_COUNT" then if Result >= ExpChatChatableUserCountSystemMessageMinUsers then "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.WithCount" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3" elseif SystemMessageKey == "V2_FRIENDLY" then "CoreScripts.TextChat.ChatWindow.ChatWithOnlinePlayers.Local.Friendly" elseif SystemMessageKey == "V3_WITHOUT_COUNT" then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3" else nil
				
				if CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF1 == nil then
					NewResult:warning("LocalChatEnabledMessage: IXP returned unrecognized identifier '{}'; showing control message, not logging exposure", SystemMessageKey)
					DisplaySystemMessageModule(CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF, nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou)
					
					return
				end
				if not Flag then
					Flag = true
					ExpChatLocalChatEnabledMessageExperimentation.logExposure()
				end
				DisplaySystemMessageModule(CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF1, { RBX_COUNT = Result }, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou)
			end)
			
			return
		else
			DisplaySystemMessageModule(CoreScriptsTextChatChatWindowChatEnabledChatWithAgeGroupAAndTF, nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, OnlyPeopleInSimilarAgeGroupsAndYourTrustedFriendsCanChatWithYou)
		end
	end
end