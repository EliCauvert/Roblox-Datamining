local chatService = game:GetService("Chat")
local playersService = game:GetService("Players")
local starterPlayerScripts = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local serverUtilModule = require(robloxGui.Modules.Server.ServerUtil)
local sendChatAnalyticsModule = require(robloxGui.Modules.Server.SendChatAnalytics)
local chatWindowInstallerCheckClassName = game:DefineFastFlag("ChatWindowInstallerCheckClassName", false)
local _ = false
local ok, status = pcall(function() --[[ line: 18 ]]
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local status_1 = ok and status

local function LoadLocalScript(p0, p1, p2) --[[ line: 24 ]]
	-- upvalues: chatWindowInstallerCheckClassName (ref), serverUtilModule (ref)
	local var10 = p0:WaitForChild(p1)
	
	if chatWindowInstallerCheckClassName and var10.ClassName ~= "ModuleScript" then
		return var10:Clone()
	end
	local localScript = Instance.new("LocalScript")
	localScript.Name = p1
	
	if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
		localScript.Source = serverUtilModule.getSourceForServerScript(var10)
	else
		localScript.Source = var10.Source
	end
	localScript.Parent = p2
	
	return localScript
end

local function LoadModule(p3, p4, p5) --[[ line: 42 ]]
	-- upvalues: chatWindowInstallerCheckClassName (ref), serverUtilModule (ref)
	local var12 = p3:WaitForChild(p4)
	
	if chatWindowInstallerCheckClassName and var12.ClassName ~= "ModuleScript" then
		return var12:Clone()
	end
	local moduleScript = Instance.new("ModuleScript")
	moduleScript.Name = p4
	
	if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
		moduleScript.Source = serverUtilModule.getSourceForServerScript(var12)
	else
		moduleScript.Source = var12.Source
	end
	moduleScript.Parent = p5
	
	return moduleScript
end

local function _(p6, p7, p8) --[[ line: 60 | named "GetBoolValue" ]]
	local var14 = p6:FindFirstChild(p7)
	
	return if var14 and var14:IsA("BoolValue") then var14.Value else p8
end

return function() --[[ line: 70 | named "Install" ]]
	-- upvalues: chatService (ref), LoadLocalScript (ref), LoadModule (ref), status_1 (write), starterPlayerScripts (ref), playersService (ref), sendChatAnalyticsModule (ref)
	local t = {}
	local var16 = true
	local chatScript = chatService:FindFirstChild("ChatScript")
	
	if chatScript then
		t.ChatScript = "True"
	else
		var16 = false
		chatScript = LoadLocalScript(script.Parent, "ChatScript", chatService)
		local var18 = LoadModule(script.Parent, "ChatMain", chatScript)
		LoadModule(script.Parent, "ChannelsBar", var18)
		LoadModule(script.Parent, "ChatBar", var18)
		LoadModule(script.Parent, "ChatChannel", var18)
		LoadModule(script.Parent, "MessageLogDisplay", var18)
		LoadModule(script.Parent, "ChatWindow", var18)
		LoadModule(script.Parent, "MessageLabelCreator", var18)
		LoadModule(script.Parent, "CommandProcessor", var18)
		LoadModule(script.Parent, "ChannelsTab", var18)
		LoadModule(script.Parent.Parent.Parent.Common, "ObjectPool", var18)
		LoadModule(script.Parent, "MessageSender", var18)
		LoadModule(script.Parent, "CurveUtil", var18)
		
		if status_1 then
			local chatTranslationEnabled = Instance.new("BoolValue")
			chatTranslationEnabled.Name = "ChatTranslationEnabled"
			chatTranslationEnabled.Value = false
			chatTranslationEnabled.Parent = var18
		end
	end
	local var20 = true
	local bubbleChat = chatService:FindFirstChild("BubbleChat")
	
	if bubbleChat then
		t.BubbleChat = "True"
	else
		var20 = false
		bubbleChat = LoadLocalScript(script.Parent.BubbleChat, "BubbleChat", chatService)
	end
	local clientChatModules_1 = chatService:FindFirstChild("ClientChatModules")
	
	if clientChatModules_1 then
		t.ClientChatModules = "True"
	else
		clientChatModules_1 = Instance.new("Folder")
		clientChatModules_1.Name = "ClientChatModules"
		clientChatModules_1.Archivable = false
		clientChatModules_1.Parent = chatService
	end
	if clientChatModules_1:FindFirstChild("ChatSettings") then
		t.ChatSettings = "True"
	else
		LoadModule(script.Parent.DefaultClientChatModules, "ChatSettings", clientChatModules_1)
	end
	if clientChatModules_1:FindFirstChild("ChatConstants") then
		t.ChatConstants = "True"
	else
		LoadModule(script.Parent.DefaultClientChatModules, "ChatConstants", clientChatModules_1)
	end
	if clientChatModules_1:FindFirstChild("ChatLocalization") then
		t.ChatLocalization = "True"
	else
		LoadModule(script.Parent.DefaultClientChatModules, "ChatLocalization", clientChatModules_1)
	end
	local messageCreatorModules_1 = clientChatModules_1:FindFirstChild("MessageCreatorModules")
	
	if not messageCreatorModules_1 then
		messageCreatorModules_1 = Instance.new("Folder")
		messageCreatorModules_1.Name = "MessageCreatorModules"
		messageCreatorModules_1.Archivable = false
		local insertDefaultModules = Instance.new("BoolValue")
		insertDefaultModules.Name = "InsertDefaultModules"
		insertDefaultModules.Value = true
		insertDefaultModules.Parent = messageCreatorModules_1
		messageCreatorModules_1.Parent = clientChatModules_1
	end
	local insertDefaultModules_2 = messageCreatorModules_1:FindFirstChild("InsertDefaultModules")
	
	if if insertDefaultModules_2 and insertDefaultModules_2:IsA("BoolValue") then insertDefaultModules_2.Value else false then
		local children = script.Parent.DefaultClientChatModules.MessageCreatorModules:GetChildren()
		
		for i = 1, #children do
			if messageCreatorModules_1:FindFirstChild(children[i].Name) then
				t[children[i].Name] = "True"
			else
				LoadModule(script.Parent.DefaultClientChatModules.MessageCreatorModules, children[i].Name, messageCreatorModules_1)
			end
		end
	end
	local commandModules_1 = clientChatModules_1:FindFirstChild("CommandModules")
	
	if not commandModules_1 then
		commandModules_1 = Instance.new("Folder")
		commandModules_1.Name = "CommandModules"
		commandModules_1.Archivable = false
		insertDefaultModules_2 = Instance.new("BoolValue")
		insertDefaultModules_2.Name = "InsertDefaultModules"
		insertDefaultModules_2.Value = true
		insertDefaultModules_2.Parent = commandModules_1
		commandModules_1.Parent = clientChatModules_1
	end
	local insertDefaultModules_3 = commandModules_1:FindFirstChild("InsertDefaultModules")
	insertDefaultModules_2 = if insertDefaultModules_3 and insertDefaultModules_3:IsA("BoolValue") then insertDefaultModules_3.Value else false
	
	if insertDefaultModules_2 then
		local children = script.Parent.DefaultClientChatModules.CommandModules:GetChildren()
		
		for i_1 = 1, #children do
			if commandModules_1:FindFirstChild(children[i_1].Name) then
				t[children[i_1].Name] = "True"
			else
				LoadModule(script.Parent.DefaultClientChatModules.CommandModules, children[i_1].Name, commandModules_1)
			end
		end
	end
	if not starterPlayerScripts:FindFirstChild("ChatScript") then
		local var30 = chatScript:Clone()
		var30.Parent = starterPlayerScripts
		var30.Archivable = false
		
		for i_2, v in pairs(playersService:GetPlayers()) do
			if v:FindFirstChildOfClass("PlayerGui") then
				local var31 = LoadLocalScript(script.Parent, "ChatInstallVerifier", v.PlayerGui)
				local scriptToVerify = Instance.new("StringValue")
				scriptToVerify.Name = "ScriptToVerify"
				scriptToVerify.Value = "ChatScript"
				scriptToVerify.Parent = var31
			end
		end
	end
	chatScript.Archivable = var16
	
	if not starterPlayerScripts:FindFirstChild("BubbleChat") then
		local var33 = bubbleChat:Clone()
		var33.Parent = starterPlayerScripts
		var33.Archivable = false
		
		for i_2, v in pairs(playersService:GetPlayers()) do
			if v:FindFirstChildOfClass("PlayerGui") then
				local var34 = LoadLocalScript(script.Parent, "ChatInstallVerifier", v.PlayerGui)
				local scriptToVerify_1 = Instance.new("StringValue")
				scriptToVerify_1.Name = "ScriptToVerify"
				scriptToVerify_1.Value = "BubbleChat"
				scriptToVerify_1.Parent = var34
			end
		end
	end
	bubbleChat.Archivable = var20
	sendChatAnalyticsModule("LoadClientDefaultChatForkedModules", t)
end