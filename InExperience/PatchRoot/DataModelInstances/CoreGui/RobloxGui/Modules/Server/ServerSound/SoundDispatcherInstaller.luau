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

local function LoadScript(p0, p1)
	-- upvalues: serverUtilModule (ref)
	local var5 = script.Parent:WaitForChild(p0)
	local script = Instance.new("Script")
	script.Name = p0
	
	if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
		script.Source = serverUtilModule.getSourceForServerScript(var5)
	else
		script.Source = var5.Source
	end
	script.Parent = p1
	
	return script
end

return function()
	-- upvalues: serverScriptService (ref), starterPlayerService (ref), LoadScript (ref)
	local var7, starterCharacterScripts
	if serverScriptService:FindFirstChild("SoundDispatcher") then
		var7 = true
	else
		starterCharacterScripts = starterPlayerService:FindFirstChildOfClass("StarterCharacterScripts")
		var7 = if starterCharacterScripts and starterCharacterScripts:FindFirstChild("Sound") then true else false
	end
	if not var7 then return end
	local var9 = true
	starterCharacterScripts = serverScriptService:FindFirstChild("SoundDispatcher")
	
	if not starterCharacterScripts then
		var9 = false
		starterCharacterScripts = LoadScript("SoundDispatcher", serverScriptService)
	end
	if not serverScriptService:FindFirstChild("SoundDispatcher") then
		local var10 = starterCharacterScripts:Clone()
		var10.Archivable = false
		var10.Parent = serverScriptService
	end
	starterCharacterScripts.Archivable = var9
end