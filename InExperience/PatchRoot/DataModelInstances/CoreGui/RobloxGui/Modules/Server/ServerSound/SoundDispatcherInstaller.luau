local serverScriptService = game:GetService("ServerScriptService")
local starterPlayerService = game:GetService("StarterPlayer")
local serverUtilModule = require(script.Parent.Parent.ServerUtil)

local function _()
	-- upvalues: serverScriptService (ref), starterPlayerService (ref)
	if serverScriptService:FindFirstChild("SoundDispatcher") then
		return true
	end
	local starterCharacterScripts = starterPlayerService:FindFirstChildOfClass("StarterCharacterScripts")
	
	return starterCharacterScripts and starterCharacterScripts:FindFirstChild("Sound")
end

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

return function()
	-- upvalues: serverScriptService (ref), starterPlayerService (ref), LoadScript (ref)
	local var1, starterCharacterScripts
	if serverScriptService:FindFirstChild("SoundDispatcher") then
		var1 = true
	else
		starterCharacterScripts = starterPlayerService:FindFirstChildOfClass("StarterCharacterScripts")
		var1 = if starterCharacterScripts and starterCharacterScripts:FindFirstChild("Sound") then true else false
	end
	if not var1 then return end
	local var2 = true
	starterCharacterScripts = serverScriptService:FindFirstChild("SoundDispatcher")
	
	if not starterCharacterScripts then
		var2 = false
		starterCharacterScripts = LoadScript("SoundDispatcher", serverScriptService)
	end
	if not serverScriptService:FindFirstChild("SoundDispatcher") then
		local var3 = starterCharacterScripts:Clone()
		var3.Archivable = false
		var3.Parent = serverScriptService
	end
	starterCharacterScripts.Archivable = var2
end