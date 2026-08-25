local t = { DEFAULT_DURATION = 5 }
local runService = game:GetService("RunService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local var3 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create("ImageLabel")({
	Name = "NotificationObject",
	BackgroundTransparency = 1,
	Image = "rbxasset://textures/ui/VR/notifier_glow.png",
	ImageTransparency = 0,
	BorderSizePixel = 0,
	Position = UDim2.new(0.5, -860, 1, -301),
	Size = UDim2.new(0, 1700, 0, 1000)
})
local var4 = (function()
	-- upvalues: runService (ref), var3 (ref), robloxGui (ref)
	local t = {}
	local var6 = nil
	
	function t.Init(p0, p1)
		-- upvalues: var6 (write), runService (copy), var3 (copy), robloxGui (copy)
		local currentTime = tick()
		local var8 = currentTime + p1
		
		if var6 then
			var6:disconnect()
			var6 = nil
		end
		var6 = runService.RenderStepped:connect(function()
			-- upvalues: var8 (ref), p0 (ref), var3 (copy), robloxGui (copy), currentTime (ref)
			if var8 <= tick() then
				p0:Cancel()
				
				return
			end
			var3.Parent = robloxGui
			var3.ImageTransparency = (math.sin((tick() - currentTime) * 2.5 + 1.570796326795) + 1) / 2 * 0.5 + 0.5
		end)
	end
	
	function t.Cancel(_)
		-- upvalues: var6 (write), var3 (copy)
		if var6 then
			var6:disconnect()
			var6 = nil
		end
		var3.Parent = nil
	end
	
	return t
end)()

function t.BeginNotification(p2, p3)
	-- upvalues: var4 (ref)
	p2:CancelNotification()
	var4:Init(p3 or p2.DEFAULT_DURATION)
end

function t.CancelNotification(_)
	-- upvalues: var4 (ref)
	var4:Cancel()
end

return t