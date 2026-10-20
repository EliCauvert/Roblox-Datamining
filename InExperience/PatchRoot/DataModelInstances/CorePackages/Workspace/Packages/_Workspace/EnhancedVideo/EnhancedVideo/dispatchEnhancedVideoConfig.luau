local ReplicatedStorage = game:GetService("ReplicatedStorage")
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: ReplicatedStorage (copy)
	task.spawn(function()
		-- upvalues: ReplicatedStorage (upval), p1 (copy)
		local EnhancedVideoConfig = ReplicatedStorage:WaitForChild("EnhancedVideoConfig", 60)
		
		if EnhancedVideoConfig and EnhancedVideoConfig:IsA("BindableEvent") then
			EnhancedVideoConfig:Fire(p1)
			
			return
		end
	end)
end