local chatService = game:GetService("Chat")
local serverScriptService = game:GetService("ServerScriptService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local serverUtilModule = require(robloxGui.Modules.Server.ServerUtil)
local sendChatAnalyticsModule = require(robloxGui.Modules.Server.SendChatAnalytics)

local function LoadScript(p1, p2)
	-- upvalues: serverUtilModule (ref)
	local var1 = script.Parent:WaitForChild(p1)
	local script = Instance.new("Script")
	script.Name = p1
	
	if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
		script.Source = serverUtilModule.getSourceForServerScript(var1)
	else
		script.Source = var1.Source
	end
	script.Parent = p2
	
	return script
end

local function _(p1, p2, p3)
	-- upvalues: serverUtilModule (ref)
	local var1 = p1:WaitForChild(p2)
	local moduleScript = Instance.new("ModuleScript")
	moduleScript.Name = p2
	
	if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
		moduleScript.Source = serverUtilModule.getSourceForServerScript(var1)
	else
		moduleScript.Source = var1.Source
	end
	moduleScript.Parent = p3
	
	return moduleScript
end

local _ = function(p1, p2, p3)
	local var1 = p1:FindFirstChild(p2)
	
	return if var1 and var1:IsA("BoolValue") then var1.Value else p3
end

local function makeDefaultLocalizationTable(p1)
	local chatLocalization = Instance.new("LocalizationTable")
	chatLocalization.Name = "ChatLocalization"
	chatLocalization.Archivable = false
	chatLocalization.SourceLocaleId = "en-us"
	chatLocalization:SetEntries(require(script.Parent:WaitForChild("DefaultChatLocalization")))
	chatLocalization:SetIsExemptFromUGCAnalytics(true)
	chatLocalization.Parent = p1
end

return function()
	-- upvalues: chatService (ref), makeDefaultLocalizationTable (ref), LoadScript (ref), serverUtilModule (ref), serverScriptService (ref), sendChatAnalyticsModule (ref)
	local t = {}
	local chatLocalization = chatService:FindFirstChild("ChatLocalization")
	
	if not chatLocalization then
		makeDefaultLocalizationTable(chatService)
	elseif chatLocalization:IsA("LocalizationTable") then
		chatLocalization:SetIsExemptFromUGCAnalytics(true)
	end
	local var1 = true
	local chatServiceRunner = chatService:FindFirstChild("ChatServiceRunner")
	
	if chatServiceRunner then
		t.ChatServiceRunner = "True"
	else
		var1 = false
		chatServiceRunner = LoadScript("ChatServiceRunner", chatService)
		local chatService_1 = script.Parent:WaitForChild("ChatService")
		local chatService_2 = Instance.new("ModuleScript")
		chatService_2.Name = "ChatService"
		
		if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
			chatService_2.Source = serverUtilModule.getSourceForServerScript(chatService_1)
		else
			chatService_2.Source = chatService_1.Source
		end
		chatService_2.Parent = chatServiceRunner
		local chatChannel = script.Parent:WaitForChild("ChatChannel")
		local chatChannel_1 = Instance.new("ModuleScript")
		chatChannel_1.Name = "ChatChannel"
		
		if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
			chatChannel_1.Source = serverUtilModule.getSourceForServerScript(chatChannel)
		else
			chatChannel_1.Source = chatChannel.Source
		end
		chatChannel_1.Parent = chatServiceRunner
		local speaker = script.Parent:WaitForChild("Speaker")
		local speaker_1 = Instance.new("ModuleScript")
		speaker_1.Name = "Speaker"
		
		if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
			speaker_1.Source = serverUtilModule.getSourceForServerScript(speaker)
		else
			speaker_1.Source = speaker.Source
		end
		speaker_1.Parent = chatServiceRunner
		local var2 = chatServiceRunner
		local util = script.Parent:WaitForChild("Util")
		local util_1 = Instance.new("ModuleScript")
		util_1.Name = "Util"
		
		if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
			util_1.Source = serverUtilModule.getSourceForServerScript(util)
		else
			util_1.Source = util.Source
		end
		util_1.Parent = var2
	end
	local chatModules_1 = chatService:FindFirstChild("ChatModules")
	
	if not chatModules_1 then
		chatModules_1 = Instance.new("Folder")
		chatModules_1.Name = "ChatModules"
		chatModules_1.Archivable = false
		local insertDefaultModules = Instance.new("BoolValue")
		insertDefaultModules.Name = "InsertDefaultModules"
		insertDefaultModules.Value = true
		insertDefaultModules.Parent = chatModules_1
		chatModules_1.Parent = chatService
	end
	local children
	assert(chatModules_1, "")
	local insertDefaultModules_1 = chatModules_1:FindFirstChild("InsertDefaultModules")
	
	if if insertDefaultModules_1 and insertDefaultModules_1:IsA("BoolValue") then insertDefaultModules_1.Value else false then
		if not chatModules_1:FindFirstChild("Utility") then
			local utility = Instance.new("Folder")
			utility.Name = "Utility"
			utility.Parent = chatModules_1
		end
		children = script.Parent.DefaultChatModules:GetChildren()
		
		for i = 1, #children do
			if children.className == "Folder" or chatModules_1:FindFirstChild(children[i].Name) then
				if children.className ~= "Folder" then
					t[children[i].Name] = "True"
				end
			end
			local defaultChatModules = script.Parent.DefaultChatModules
			local name = children[i].Name
			local var3 = chatModules_1
			local var4 = defaultChatModules:WaitForChild(name)
			local moduleScript = Instance.new("ModuleScript")
			moduleScript.Name = name
			
			if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
				moduleScript.Source = serverUtilModule.getSourceForServerScript(var4)
			else
				moduleScript.Source = var4.Source
			end
			moduleScript.Parent = var3
		end
		for i_1, v in pairs(script.Parent.DefaultChatModules.Utility:GetChildren()) do
			if chatModules_1.Utility:FindFirstChild(v.Name) then
				t[v.Name] = "True"
				continue
			end
			local utility_1 = script.Parent.DefaultChatModules.Utility
			local name = v.Name
			local utility_2 = chatModules_1.Utility
			local var5 = utility_1:WaitForChild(name)
			local moduleScript = Instance.new("ModuleScript")
			moduleScript.Name = name
			
			if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
				moduleScript.Source = serverUtilModule.getSourceForServerScript(var5)
			else
				moduleScript.Source = var5.Source
			end
			moduleScript.Parent = utility_2
		end
	end
	if not serverScriptService:FindFirstChild("ChatServiceRunner") then
		children = chatServiceRunner:Clone()
		children.Archivable = false
		children.Parent = serverScriptService
	end
	chatServiceRunner.Archivable = var1
	sendChatAnalyticsModule("LoadServerDefaultChatForkedModules", t)
end