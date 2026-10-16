local ServerScriptService = game:GetService("ServerScriptService")
local StarterPlayer = game:GetService("StarterPlayer")
local ServerUtilModule = require(script.Parent.Parent.ServerUtil)

local function _(): boolean --[[ Line: 11 | Named "HasOldSoundScripts" ]]
	-- upvalues: ServerScriptService (copy), StarterPlayer (copy)
	if ServerScriptService:FindFirstChild("SoundDispatcher") then
		return true
	else
		local StarterCharScripts = StarterPlayer:FindFirstChildOfClass("StarterCharacterScripts")
		
		return if StarterCharScripts and StarterCharScripts:FindFirstChild("Sound") then true else false
	end
end

local function LoadScript(ChildName, Parent) --[[ Line: 24 ]]
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

return function() --[[ Line: 37 | Named "TryInstall" ]]
	-- upvalues: ServerScriptService (copy), StarterPlayer (copy), LoadScript (copy)
	local v1 = nil
	if ServerScriptService:FindFirstChild("SoundDispatcher") then
		v1 = true
	else
		local StarterCharScripts = StarterPlayer:FindFirstChildOfClass("StarterCharacterScripts")
		v1 = if StarterCharScripts and StarterCharScripts:FindFirstChild("Sound") then true else false
	end
	if not v1 then return end
	local Archivable = true
	local SoundDispatcher = ServerScriptService:FindFirstChild("SoundDispatcher")
	
	if not SoundDispatcher then
		Archivable = false
		SoundDispatcher = LoadScript("SoundDispatcher", ServerScriptService)
	end
	if not ServerScriptService:FindFirstChild("SoundDispatcher") then
		local SoundDispatcherClone = SoundDispatcher:Clone()
		SoundDispatcherClone.Archivable = false
		SoundDispatcherClone.Parent = ServerScriptService
	end
	SoundDispatcher.Archivable = Archivable
end