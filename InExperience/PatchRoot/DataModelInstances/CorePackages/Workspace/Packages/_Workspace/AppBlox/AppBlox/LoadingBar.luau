local workspaceService = game:GetService("Workspace")
local runService = game:GetService("RunService")
local roactModule = require(script:FindFirstAncestor("AppBlox").Parent.Roact)
local rect = Rect.new(1, 0, 2, 3)
local loadingBar = roactModule.Component:extend("LoadingBar")

function loadingBar.init(p0) --[[ line: 16 ]]
	-- upvalues: roactModule (ref)
	p0.barRef = roactModule.createRef()
end

function loadingBar.render(p1) --[[ line: 20 ]]
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

function loadingBar.didMount(p2) --[[ line: 34 ]]
	-- upvalues: runService (ref), workspaceService (ref)
	p2.connection = runService.RenderStepped:Connect(function() --[[ line: 35 ]]
		-- upvalues: workspaceService (copy), p2 (ref)
		local distributedGameTime = workspaceService.DistributedGameTime
		local current = p2.barRef.current
		local var5 = (1 - math.cos(2 * distributedGameTime * 5.026548245744)) * 7.5
		current.Size = UDim2.new(0, var5 + 4, 0, 4)
		current.Position = UDim2.new(0.5, math.cos(distributedGameTime * 5.026548245744) * 40 - var5 / 2 - 2, 0.5, 0)
	end)
end

function loadingBar.willUnmount(p3) --[[ line: 48 ]]
	p3.connection:Disconnect()
end

return loadingBar