local Chat = game:GetService("Chat")
local ServerScriptService = game:GetService("ServerScriptService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ServerUtilModule = require(RobloxGui.Modules.Server.ServerUtil)
local SendChatAnalyticsModule = require(RobloxGui.Modules.Server.SendChatAnalytics)

local function LoadScript(ChildName, Parent) --[[ Line: 11 ]]
	-- upvalues: ServerUtilModule (copy)
	local ChildName1 = script.Parent:WaitForChild(ChildName)
	local Script1 = Instance.new("Script")
	Script1.Name = ChildName
	
	if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
		Script1.Source = ServerUtilModule.getSourceForServerScript(ChildName1)
	else
		Script1.Source = ChildName1.Source
	end
	Script1.Parent = Parent
	
	return Script1
end

local function _(Object, ChildName, Parent) --[[ Line: 24 | Named "LoadModule" ]]
	-- upvalues: ServerUtilModule (copy)
	local ChildName1 = Object:WaitForChild(ChildName)
	local Module = Instance.new("ModuleScript")
	Module.Name = ChildName
	
	if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
		Module.Source = ServerUtilModule.getSourceForServerScript(ChildName1)
	else
		Module.Source = ChildName1.Source
	end
	Module.Parent = Parent
	
	return Module
end

local _ = function(Object, ChildName, p1) --[[ Line: 37 | Named "GetBoolValue" ]]
	local ChildName1 = Object:FindFirstChild(ChildName)
	
	return if ChildName1 and ChildName1:IsA("BoolValue") then ChildName1.Value else p1
end

local function makeDefaultLocalizationTable(Parent) --[[ Line: 47 ]]
	local ChatLocalization = Instance.new("LocalizationTable")
	ChatLocalization.Name = "ChatLocalization"
	ChatLocalization.Archivable = false
	ChatLocalization.SourceLocaleId = "en-us"
	ChatLocalization:SetEntries(require(script.Parent:WaitForChild("DefaultChatLocalization")))
	ChatLocalization:SetIsExemptFromUGCAnalytics(true)
	ChatLocalization.Parent = Parent
end

return function() --[[ Line: 57 | Named "Install" ]]
	-- upvalues: Chat (copy), makeDefaultLocalizationTable (copy), LoadScript (copy), ServerUtilModule (copy), ServerScriptService (copy), SendChatAnalyticsModule (copy)
	local t = {}
	local ChatLocalization = Chat:FindFirstChild("ChatLocalization")
	
	if ChatLocalization then
		if ChatLocalization:IsA("LocalizationTable") then
			ChatLocalization:SetIsExemptFromUGCAnalytics(true)
		end
	else
		makeDefaultLocalizationTable(Chat)
	end
	local Archivable = true
	local ChatServiceRunner = Chat:FindFirstChild("ChatServiceRunner")
	
	if ChatServiceRunner then
		t.ChatServiceRunner = "True"
	else
		Archivable = false
		ChatServiceRunner = LoadScript("ChatServiceRunner", Chat)
		local Parent = ChatServiceRunner
		local ChatService = script.Parent:WaitForChild("ChatService")
		local ChatService1 = Instance.new("ModuleScript")
		ChatService1.Name = "ChatService"
		
		if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
			ChatService1.Source = ServerUtilModule.getSourceForServerScript(ChatService)
		else
			ChatService1.Source = ChatService.Source
		end
		ChatService1.Parent = Parent
		local Parent1 = ChatServiceRunner
		local ChatChannel = script.Parent:WaitForChild("ChatChannel")
		local ChatChannel1 = Instance.new("ModuleScript")
		ChatChannel1.Name = "ChatChannel"
		
		if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
			ChatChannel1.Source = ServerUtilModule.getSourceForServerScript(ChatChannel)
		else
			ChatChannel1.Source = ChatChannel.Source
		end
		ChatChannel1.Parent = Parent1
		local Parent2 = ChatServiceRunner
		local Speaker = script.Parent:WaitForChild("Speaker")
		local Speaker1 = Instance.new("ModuleScript")
		Speaker1.Name = "Speaker"
		
		if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
			Speaker1.Source = ServerUtilModule.getSourceForServerScript(Speaker)
		else
			Speaker1.Source = Speaker.Source
		end
		Speaker1.Parent = Parent2
		local Parent3 = ChatServiceRunner
		local Util = script.Parent:WaitForChild("Util")
		local Util1 = Instance.new("ModuleScript")
		Util1.Name = "Util"
		
		if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
			Util1.Source = ServerUtilModule.getSourceForServerScript(Util)
		else
			Util1.Source = Util.Source
		end
		Util1.Parent = Parent3
	end
	local ChatModules = Chat:FindFirstChild("ChatModules")
	
	if not ChatModules then
		ChatModules = Instance.new("Folder")
		ChatModules.Name = "ChatModules"
		ChatModules.Archivable = false
		local InsertDefaultModules = Instance.new("BoolValue")
		InsertDefaultModules.Name = "InsertDefaultModules"
		InsertDefaultModules.Value = true
		InsertDefaultModules.Parent = ChatModules
		ChatModules.Parent = Chat
	end
	assert(ChatModules, "")
	local InsertDefaultModules = ChatModules:FindFirstChild("InsertDefaultModules")
	
	if if InsertDefaultModules and InsertDefaultModules:IsA("BoolValue") then InsertDefaultModules.Value else false then
		if not ChatModules:FindFirstChild("Utility") then
			local Utility = Instance.new("Folder")
			Utility.Name = "Utility"
			Utility.Parent = ChatModules
		end
		local Children = script.Parent.DefaultChatModules:GetChildren()
		
		for i = 1, #Children do
			if Children.className == "Folder" or ChatModules:FindFirstChild(Children[i].Name) then
				if Children.className ~= "Folder" then
					t[Children[i].Name] = "True"
				end
			else
				local Name = Children[i].Name
				local Folder = ChatModules
				local Name1 = script.Parent.DefaultChatModules:WaitForChild(Name)
				local Module = Instance.new("ModuleScript")
				Module.Name = Name
				
				if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
					Module.Source = ServerUtilModule.getSourceForServerScript(Name1)
				else
					Module.Source = Name1.Source
				end
				Module.Parent = Folder
			end
		end
		for _, child in pairs(script.Parent.DefaultChatModules.Utility:GetChildren()) do
			if ChatModules.Utility:FindFirstChild(child.Name) then
				t[child.Name] = "True"
				continue
			end
			local Name = child.Name
			local Utility = ChatModules.Utility
			local Name2 = script.Parent.DefaultChatModules.Utility:WaitForChild(Name)
			local Module = Instance.new("ModuleScript")
			Module.Name = Name
			
			if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
				Module.Source = ServerUtilModule.getSourceForServerScript(Name2)
			else
				Module.Source = Name2.Source
			end
			Module.Parent = Utility
		end
	end
	if not ServerScriptService:FindFirstChild("ChatServiceRunner") then
		local Copy = ChatServiceRunner:Clone()
		Copy.Archivable = false
		Copy.Parent = ServerScriptService
	end
	ChatServiceRunner.Archivable = Archivable
	SendChatAnalyticsModule("LoadServerDefaultChatForkedModules", t)
end