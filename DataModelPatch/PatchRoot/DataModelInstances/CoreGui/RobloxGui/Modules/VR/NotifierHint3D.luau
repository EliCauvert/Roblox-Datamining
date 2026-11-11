local RunService = game:GetService("RunService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Image = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create("ImageLabel")({
	Name = "NotificationObject",
	BackgroundTransparency = 1,
	Image = "rbxasset://textures/ui/VR/notifier_glow.png",
	ImageTransparency = 0,
	BorderSizePixel = 0,
	Position = UDim2.new(0.5, -860, 1, -301),
	Size = UDim2.new(0, 1700, 0, 1000)
})
local v1 = (function()
	-- upvalues: RunService (copy), Image (copy), RobloxGui (copy)
	local RenderSteppedConnection = nil
	
	return {
		Init = function(p1, p2: number)
			-- upvalues: RenderSteppedConnection (ref), RunService (upval), Image (upval), RobloxGui (upval)
			local CurrentTime = tick()
			local NewCurrentTime = CurrentTime + p2
			
			if RenderSteppedConnection then
				RenderSteppedConnection:disconnect()
				RenderSteppedConnection = nil
			end
			RenderSteppedConnection = RunService.RenderStepped:connect(function()
				-- upvalues: NewCurrentTime (copy), p1 (copy), Image (upval), RobloxGui (upval), CurrentTime (copy)
				if NewCurrentTime <= tick() then
					p1:Cancel()
					
					return
				else
					Image.Parent = RobloxGui
					Image.ImageTransparency = (math.sin((tick() - CurrentTime) * 2.5 + 1.5707963267948966) + 1) / 2 * 0.5 + 0.5
				end
			end)
		end,
		Cancel = function(_)
			-- upvalues: RenderSteppedConnection (ref), Image (upval)
			if RenderSteppedConnection then
				RenderSteppedConnection:disconnect()
				RenderSteppedConnection = nil
			end
			Image.Parent = nil
		end
	}
end)()

return {
	DEFAULT_DURATION = 5,
	BeginNotification = function(NotificationService, p1)
		-- upvalues: v1 (copy)
		NotificationService:CancelNotification()
		v1:Init(p1 or NotificationService.DEFAULT_DURATION)
	end,
	CancelNotification = function(_)
		-- upvalues: v1 (copy)
		v1:Cancel()
	end
}