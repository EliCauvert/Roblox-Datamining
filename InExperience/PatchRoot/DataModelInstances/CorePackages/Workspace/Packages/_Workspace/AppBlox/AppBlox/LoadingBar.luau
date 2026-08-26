local workspaceService = game:GetService("Workspace")
local runService = game:GetService("RunService")
local roactModule = require(script:FindFirstAncestor("AppBlox").Parent.Roact)
local rect = Rect.new(1, 0, 2, 3)
local loadingBar = roactModule.Component:extend("LoadingBar")

function loadingBar.init(p1)
	-- upvalues: roactModule (ref)
	p1.barRef = roactModule.createRef()
end

function loadingBar.render(p1)
	-- upvalues: roactModule (ref), rect (ref)
	return roactModule.createElement("ImageLabel", {
		Image = "rbxasset://textures/ui/LuaApp/9-slice/gr-loading-indicator.png",
		ScaleType = "Slice",
		SliceCenter = rect,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = p1.props.ZIndex,
		[roactModule.Ref] = p1.barRef
	})
end

function loadingBar.didMount(p1)
	-- upvalues: runService (ref), workspaceService (ref)
	p1.connection = runService.RenderStepped:Connect(function()
		-- upvalues: workspaceService (copy), p1 (ref)
		local distributedGameTime = workspaceService.DistributedGameTime
		local current = p1.barRef.current
		local var1 = (1 - math.cos(2 * distributedGameTime * 5.026548245744)) * 7.5
		current.Size = UDim2.new(0, var1 + 4, 0, 4)
		current.Position = UDim2.new(0.5, math.cos(distributedGameTime * 5.026548245744) * 40 - var1 / 2 - 2, 0.5, 0)
	end)
end

function loadingBar.willUnmount(p1)
	p1.connection:Disconnect()
end

return loadingBar