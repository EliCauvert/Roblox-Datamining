local replicatedStorageService = game:GetService("ReplicatedStorage")
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: replicatedStorageService (ref)
	task.spawn(function()
		-- upvalues: replicatedStorageService (copy), p1 (ref)
		local enhancedVideoConfig = replicatedStorageService:WaitForChild("EnhancedVideoConfig", 60)
		
		if enhancedVideoConfig and enhancedVideoConfig:IsA("BindableEvent") then
			enhancedVideoConfig:Fire(p1)
			
			return
		end
	end)
end