local ReplicatedStorage = game:GetService("ReplicatedStorage")
local _ = require(script.Parent.Types)

return function(p1) --[[ Line: 9 | Named "dispatchEnhancedVideoConfig" ]]
	-- upvalues: ReplicatedStorage (copy)
	task.spawn(function() --[[ Line: 10 ]]
		-- upvalues: ReplicatedStorage (upval), p1 (copy)
		local EnhancedVideoConfig = ReplicatedStorage:WaitForChild("EnhancedVideoConfig", 60)
		
		if EnhancedVideoConfig and EnhancedVideoConfig:IsA("BindableEvent") then
			EnhancedVideoConfig:Fire(p1)
			
			return
		end
	end)
end