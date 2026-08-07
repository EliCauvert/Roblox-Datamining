local replicatedStorageService = game:GetService("ReplicatedStorage")
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 9 | named "dispatchEnhancedVideoConfig" ]]
	-- upvalues: replicatedStorageService (ref)
	task.spawn(function() --[[ line: 10 ]]
		-- upvalues: replicatedStorageService (copy), p0 (ref)
		local enhancedVideoConfig = replicatedStorageService:WaitForChild("EnhancedVideoConfig", 60)
		
		if enhancedVideoConfig and enhancedVideoConfig:IsA("BindableEvent") then
			enhancedVideoConfig:Fire(p0)
			
			return
		end
	end)
end