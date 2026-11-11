local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local RoactModule = require(script:FindFirstAncestor("AppBlox").Parent.Roact)
local _Rect = Rect.new(1, 0, 2, 3)
local LoadingBar = RoactModule.Component:extend("LoadingBar")

function LoadingBar.init(p1)
	-- upvalues: RoactModule (copy)
	p1.barRef = RoactModule.createRef()
end

function LoadingBar.render(p1)
	-- upvalues: RoactModule (copy), _Rect (copy)
	return RoactModule.createElement("ImageLabel", {
		Image = "rbxasset://textures/ui/LuaApp/9-slice/gr-loading-indicator.png",
		ScaleType = "Slice",
		SliceCenter = _Rect,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = p1.props.ZIndex,
		[RoactModule.Ref] = p1.barRef
	})
end

function LoadingBar.didMount(p1)
	-- upvalues: RunService (copy), Workspace (copy)
	p1.connection = RunService.RenderStepped:Connect(function()
		-- upvalues: Workspace (upval), p1 (copy)
		local DistributedGameTime: number = Workspace.DistributedGameTime
		local Current = p1.barRef.current
		local ScaledCosine = (1 - math.cos(2 * DistributedGameTime * 5.026548245743669)) * 7.5
		Current.Size = UDim2.new(0, ScaledCosine + 4, 0, 4)
		Current.Position = UDim2.new(0.5, math.cos(DistributedGameTime * 5.026548245743669) * 40 - ScaledCosine / 2 - 2, 0.5, 0)
	end)
end

function LoadingBar.willUnmount(p1)
	p1.connection:Disconnect()
end

return LoadingBar