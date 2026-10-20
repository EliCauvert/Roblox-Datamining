local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local DEPRECATEDImageSetLabelModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local _Rect = Rect.new(8, 8, 9, 9)
local LoadingBarWithTheme = RoactModule.Component:extend("LoadingBarWithTheme")

function LoadingBarWithTheme.init(p1)
	-- upvalues: RoactModule (copy)
	p1.barRef = RoactModule.createRef()
end

function LoadingBarWithTheme.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), DEPRECATEDImageSetLabelModule (copy), _Rect (copy)
	local ZIndex = p1.props.ZIndex
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), DEPRECATEDImageSetLabelModule (upval), _Rect (upval), ZIndex (copy), p1 (copy)
		return RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
			Image = "LuaApp/buttons/buttonFill",
			ImageColor3 = p2.Theme.SystemPrimaryDefault.Color,
			ImageTransparency = p2.Theme.SystemPrimaryDefault.Transparency,
			ScaleType = "Slice",
			SliceCenter = _Rect,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = ZIndex,
			[RoactModule.Ref] = p1.barRef
		})
	end)
end

function LoadingBarWithTheme.didMount(p1)
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

function LoadingBarWithTheme.willUnmount(p1)
	p1.connection:Disconnect()
end

return LoadingBarWithTheme