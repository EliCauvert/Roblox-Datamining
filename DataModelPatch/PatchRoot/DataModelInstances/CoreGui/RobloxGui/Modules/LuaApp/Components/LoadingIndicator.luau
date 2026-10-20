local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(game:GetService("CorePackages").Workspace.Packages.AppChat.Constants)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local RoactModule = require(Modules.Common.Roact)
local LoadingIndicator = RoactModule.PureComponent:extend("LoadingIndicator")
LoadingIndicator.defaultProps = {
	AnimationSpeedMultiplier = 1.75,
	DotScale = 0.7,
	DotColor = ConstantsModule.Color.GRAY3,
	DotHighlightColor = ConstantsModule.Color.BLUE_PRIMARY,
	Size = UDim2.new(0, 70, 0, 16)
}

function LoadingIndicator.init(p1)
	p1.state = { timer = true }
	
	function p1:renderSteppedCallback()
		-- upvalues: p1 (copy)
		p1:setState({ timer = not p1.state.timer })
	end
end

function LoadingIndicator.render(p1)
	-- upvalues: Workspace (copy), RoactModule (copy), ExternalEventConnectionModule (copy), RunService (copy)
	local DotColor = p1.props.DotColor
	local DotHighlightColor = p1.props.DotHighlightColor
	local DotScale = p1.props.DotScale
	local Size = p1.props.Size
	local DistributedGameTimeRemainder = Workspace.DistributedGameTime * p1.props.AnimationSpeedMultiplier % 3
	local config = {
		RatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.375,
			AspectType = Enum.AspectType.FitWithinMaxSize
		})
	}
	
	for i = 1, 3 do
		local Interpolated = DotColor
		local YScale: number = DotScale
		local X = (i - 1) / 2
		
		if i - 1 <= DistributedGameTimeRemainder and DistributedGameTimeRemainder <= i then
			local Sine = math.sin(3.141592653589793 * (DistributedGameTimeRemainder % 1))
			YScale += (1 - YScale) * Sine
			Interpolated = DotColor:lerp(DotHighlightColor, Sine)
		end
		config[i] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(X, 0.5),
			BackgroundColor3 = Interpolated,
			Size = UDim2.new(DotScale, 0, YScale, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Position = UDim2.new(X, 0, 0.5, 0)
		})
	end
	config.RenderStepped = RoactModule.createElement(ExternalEventConnectionModule, {
		callback = p1.renderSteppedCallback,
		event = RunService.renderStepped
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = p1.props.AnchorPoint,
		Position = p1.props.Position,
		Size = Size
	}, config)
end

return LoadingIndicator