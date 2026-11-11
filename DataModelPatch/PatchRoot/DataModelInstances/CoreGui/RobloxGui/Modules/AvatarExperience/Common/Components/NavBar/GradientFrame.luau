local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local GetFFlagAXEnableAutomaticSizeGradientFrameModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXEnableAutomaticSizeGradientFrame)

return function(p1)
	-- upvalues: GetFFlagAXEnableAutomaticSizeGradientFrameModule (copy), UseStyleFunction (copy), ReactModule (copy)
	local FrameRef = p1.frameRef
	local GradientStyle = p1.gradientStyle
	local Height = if GetFFlagAXEnableAutomaticSizeGradientFrameModule() then nil else p1.height
	local ZIndex = p1.ZIndex
	local Theme = UseStyleFunction().Theme
	local Color = GradientStyle and GradientStyle.Color or Theme.BackgroundDefault.Color
	local Transparency = GradientStyle and GradientStyle.Transparency or Theme.BackgroundDefault.Transparency
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = ZIndex,
		ref = FrameRef
	}, {
		Left = ReactModule.createElement("Frame", {
			BackgroundTransparency = Transparency,
			BackgroundColor3 = Color,
			Size = UDim2.new(0, 50, if GetFFlagAXEnableAutomaticSizeGradientFrameModule() then 1 else 0, if GetFFlagAXEnableAutomaticSizeGradientFrameModule() then 0 else Height)
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		Right = ReactModule.createElement("Frame", {
			BackgroundTransparency = Transparency,
			BackgroundColor3 = Color,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			Size = UDim2.new(0, 50, if GetFFlagAXEnableAutomaticSizeGradientFrameModule() then 1 else 0, if GetFFlagAXEnableAutomaticSizeGradientFrameModule() then 0 else Height)
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		})
	})
end