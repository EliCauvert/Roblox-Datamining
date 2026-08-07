local serverUtilModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Server.ServerUtil)

return function() --[[ line: 5 ]]
	-- upvalues: serverUtilModule (ref)
	if game:GetService("StarterPlayer"):FindFirstChild("PlayerSettings") == nil then
		local playerSettings = Instance.new("ModuleScript")
		playerSettings.Name = "PlayerSettings"
		
		if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
			playerSettings.Source = serverUtilModule.getSourceForServerScript(script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings"))
		else
			playerSettings.Source = script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings").Source
		end
		playerSettings.Parent = game:GetService("StarterPlayer")
		playerSettings.Archivable = false
	end
end