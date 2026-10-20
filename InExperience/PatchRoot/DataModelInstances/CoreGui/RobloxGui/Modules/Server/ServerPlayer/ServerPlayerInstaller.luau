local ServerUtilModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Server.ServerUtil)

return function()
	-- upvalues: ServerUtilModule (copy)
	if game:GetService("StarterPlayer"):FindFirstChild("PlayerSettings") == nil then
		local PlayerSettings = Instance.new("ModuleScript")
		PlayerSettings.Name = "PlayerSettings"
		
		if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
			PlayerSettings.Source = ServerUtilModule.getSourceForServerScript(script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings"))
		else
			PlayerSettings.Source = script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings").Source
		end
		PlayerSettings.Parent = game:GetService("StarterPlayer")
		PlayerSettings.Archivable = false
	end
end