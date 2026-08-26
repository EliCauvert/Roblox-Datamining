local t = { DEFAULT_DURATION = 5 }
local runService = game:GetService("RunService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local var1 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create("ImageLabel")({
	Name = "NotificationObject",
	BackgroundTransparency = 1,
	Image = "rbxasset://textures/ui/VR/notifier_glow.png",
	ImageTransparency = 0,
	BorderSizePixel = 0,
	Position = UDim2.new(0.5, -860, 1, -301),
	Size = UDim2.new(0, 1700, 0, 1000)
})
local var2 = (function()
	-- upvalues: runService (ref), var1 (ref), robloxGui (ref)
	local t = {}
	local var3 = nil
	
	function t.Init(p1, p2)
		-- upvalues: var3 (write), runService (copy), var1 (copy), robloxGui (copy)
		local currentTime = tick()
		local var4 = currentTime + p2
		
		if var3 then
			var3:disconnect()
			var3 = nil
		end
		var3 = runService.RenderStepped:connect(function()
			-- upvalues: var4 (ref), p1 (ref), var1 (copy), robloxGui (copy), currentTime (ref)
			if var4 <= tick() then
				p1:Cancel()
				
				return
			end
			var1.Parent = robloxGui
			var1.ImageTransparency = (math.sin((tick() - currentTime) * 2.5 + 1.570796326795) + 1) / 2 * 0.5 + 0.5
		end)
	end
	
	function t.Cancel(_)
		-- upvalues: var3 (write), var1 (copy)
		if var3 then
			var3:disconnect()
			var3 = nil
		end
		var1.Parent = nil
	end
	
	return t
end)()

function t.BeginNotification(p1, p2)
	-- upvalues: var2 (ref)
	p1:CancelNotification()
	var2:Init(p2 or p1.DEFAULT_DURATION)
end

function t.CancelNotification(_)
	-- upvalues: var2 (ref)
	var2:Cancel()
end

return t