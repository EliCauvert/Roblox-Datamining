local Chat = game:GetService("Chat")
local Players = game:GetService("Players")
local StarterPlayerScripts = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ServerUtilModule = require(RobloxGui.Modules.Server.ServerUtil)
local SendChatAnalyticsModule = require(RobloxGui.Modules.Server.SendChatAnalytics)
local ChatWindowInstallerCheckClassName = game:DefineFastFlag("ChatWindowInstallerCheckClassName", false)
local Result1 = false
local Success, Result = pcall(function() --[[ Line: 18 ]]
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
Result1 = Success and Result

local function LoadLocalScript(Parent, ChildName, PlayerGui) --[[ Line: 24 ]]
	-- upvalues: ChatWindowInstallerCheckClassName (copy), ServerUtilModule (copy)
	local ChildName1 = Parent:WaitForChild(ChildName)
	
	if ChatWindowInstallerCheckClassName and ChildName1.ClassName ~= "ModuleScript" then
		return ChildName1:Clone()
	end
	local LocalScript = Instance.new("LocalScript")
	LocalScript.Name = ChildName
	
	if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
		LocalScript.Source = ServerUtilModule.getSourceForServerScript(ChildName1)
	else
		LocalScript.Source = ChildName1.Source
	end
	LocalScript.Parent = PlayerGui
	
	return LocalScript
end

local function LoadModule(Parent, Name, ChatMain) --[[ Line: 42 ]]
	-- upvalues: ChatWindowInstallerCheckClassName (copy), ServerUtilModule (copy)
	local Name1 = Parent:WaitForChild(Name)
	
	if ChatWindowInstallerCheckClassName and Name1.ClassName ~= "ModuleScript" then
		return Name1:Clone()
	end
	local Module = Instance.new("ModuleScript")
	Module.Name = Name
	
	if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
		Module.Source = ServerUtilModule.getSourceForServerScript(Name1)
	else
		Module.Source = Name1.Source
	end
	Module.Parent = ChatMain
	
	return Module
end

local function _(Object, ChildName, p1) --[[ Line: 60 | Named "GetBoolValue" ]]
	local ChildName1 = Object:FindFirstChild(ChildName)
	
	return if ChildName1 and ChildName1:IsA("BoolValue") then ChildName1.Value else p1
end

return function() --[[ Line: 70 | Named "Install" ]]
	-- upvalues: Chat (copy), LoadLocalScript (copy), LoadModule (copy), Result1 (ref), StarterPlayerScripts (copy), Players (copy), SendChatAnalyticsModule (copy)
	local t = {}
	local Archivable = true
	local ChatScript = Chat:FindFirstChild("ChatScript")
	
	if ChatScript then
		t.ChatScript = "True"
	else
		Archivable = false
		ChatScript = LoadLocalScript(script.Parent, "ChatScript", Chat)
		local ChatMain = LoadModule(script.Parent, "ChatMain", ChatScript)
		LoadModule(script.Parent, "ChannelsBar", ChatMain)
		LoadModule(script.Parent, "ChatBar", ChatMain)
		LoadModule(script.Parent, "ChatChannel", ChatMain)
		LoadModule(script.Parent, "MessageLogDisplay", ChatMain)
		LoadModule(script.Parent, "ChatWindow", ChatMain)
		LoadModule(script.Parent, "MessageLabelCreator", ChatMain)
		LoadModule(script.Parent, "CommandProcessor", ChatMain)
		LoadModule(script.Parent, "ChannelsTab", ChatMain)
		LoadModule(script.Parent.Parent.Parent.Common, "ObjectPool", ChatMain)
		LoadModule(script.Parent, "MessageSender", ChatMain)
		LoadModule(script.Parent, "CurveUtil", ChatMain)
		
		if Result1 then
			local ChatTranslationEnabled = Instance.new("BoolValue")
			ChatTranslationEnabled.Name = "ChatTranslationEnabled"
			ChatTranslationEnabled.Value = false
			ChatTranslationEnabled.Parent = ChatMain
		end
	end
	local Archivable1 = true
	local BubbleChat = Chat:FindFirstChild("BubbleChat")
	
	if BubbleChat then
		t.BubbleChat = "True"
	else
		Archivable1 = false
		BubbleChat = LoadLocalScript(script.Parent.BubbleChat, "BubbleChat", Chat)
	end
	local ClientChatModules = Chat:FindFirstChild("ClientChatModules")
	
	if ClientChatModules then
		t.ClientChatModules = "True"
	else
		ClientChatModules = Instance.new("Folder")
		ClientChatModules.Name = "ClientChatModules"
		ClientChatModules.Archivable = false
		ClientChatModules.Parent = Chat
	end
	if ClientChatModules:FindFirstChild("ChatSettings") then
		t.ChatSettings = "True"
	else
		LoadModule(script.Parent.DefaultClientChatModules, "ChatSettings", ClientChatModules)
	end
	if ClientChatModules:FindFirstChild("ChatConstants") then
		t.ChatConstants = "True"
	else
		LoadModule(script.Parent.DefaultClientChatModules, "ChatConstants", ClientChatModules)
	end
	if ClientChatModules:FindFirstChild("ChatLocalization") then
		t.ChatLocalization = "True"
	else
		LoadModule(script.Parent.DefaultClientChatModules, "ChatLocalization", ClientChatModules)
	end
	local MessageCreatorModules = ClientChatModules:FindFirstChild("MessageCreatorModules")
	
	if not MessageCreatorModules then
		MessageCreatorModules = Instance.new("Folder")
		MessageCreatorModules.Name = "MessageCreatorModules"
		MessageCreatorModules.Archivable = false
		local InsertDefaultModules = Instance.new("BoolValue")
		InsertDefaultModules.Name = "InsertDefaultModules"
		InsertDefaultModules.Value = true
		InsertDefaultModules.Parent = MessageCreatorModules
		MessageCreatorModules.Parent = ClientChatModules
	end
	local InsertDefaultModules = MessageCreatorModules:FindFirstChild("InsertDefaultModules")
	
	if if InsertDefaultModules and InsertDefaultModules:IsA("BoolValue") then InsertDefaultModules.Value else false then
		local Children = script.Parent.DefaultClientChatModules.MessageCreatorModules:GetChildren()
		
		for i = 1, #Children do
			if MessageCreatorModules:FindFirstChild(Children[i].Name) then
				t[Children[i].Name] = "True"
			else
				LoadModule(script.Parent.DefaultClientChatModules.MessageCreatorModules, Children[i].Name, MessageCreatorModules)
			end
		end
	end
	local CommandModules = ClientChatModules:FindFirstChild("CommandModules")
	
	if not CommandModules then
		CommandModules = Instance.new("Folder")
		CommandModules.Name = "CommandModules"
		CommandModules.Archivable = false
		local InsertDefaultModules1 = Instance.new("BoolValue")
		InsertDefaultModules1.Name = "InsertDefaultModules"
		InsertDefaultModules1.Value = true
		InsertDefaultModules1.Parent = CommandModules
		CommandModules.Parent = ClientChatModules
	end
	local InsertDefaultModules2 = CommandModules:FindFirstChild("InsertDefaultModules")
	
	if if InsertDefaultModules2 and InsertDefaultModules2:IsA("BoolValue") then InsertDefaultModules2.Value else false then
		local Children = script.Parent.DefaultClientChatModules.CommandModules:GetChildren()
		
		for i1 = 1, #Children do
			if CommandModules:FindFirstChild(Children[i1].Name) then
				t[Children[i1].Name] = "True"
			else
				LoadModule(script.Parent.DefaultClientChatModules.CommandModules, Children[i1].Name, CommandModules)
			end
		end
	end
	if not StarterPlayerScripts:FindFirstChild("ChatScript") then
		local ChatScriptClone = ChatScript:Clone()
		ChatScriptClone.Parent = StarterPlayerScripts
		ChatScriptClone.Archivable = false
		
		for _, player in pairs((Players:GetPlayers())) do
			if player:FindFirstChildOfClass("PlayerGui") then
				local ScriptToVerify = Instance.new("StringValue")
				ScriptToVerify.Name = "ScriptToVerify"
				ScriptToVerify.Value = "ChatScript"
				ScriptToVerify.Parent = LoadLocalScript(script.Parent, "ChatInstallVerifier", player.PlayerGui)
			end
		end
	end
	ChatScript.Archivable = Archivable
	
	if not StarterPlayerScripts:FindFirstChild("BubbleChat") then
		local BubbleChatClone = BubbleChat:Clone()
		BubbleChatClone.Parent = StarterPlayerScripts
		BubbleChatClone.Archivable = false
		
		for _, player1 in pairs((Players:GetPlayers())) do
			if player1:FindFirstChildOfClass("PlayerGui") then
				local ScriptToVerify = Instance.new("StringValue")
				ScriptToVerify.Name = "ScriptToVerify"
				ScriptToVerify.Value = "BubbleChat"
				ScriptToVerify.Parent = LoadLocalScript(script.Parent, "ChatInstallVerifier", player1.PlayerGui)
			end
		end
	end
	BubbleChat.Archivable = Archivable1
	SendChatAnalyticsModule("LoadClientDefaultChatForkedModules", t)
end