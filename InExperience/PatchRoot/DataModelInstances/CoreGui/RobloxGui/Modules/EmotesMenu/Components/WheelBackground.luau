local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Colors = UIBloxModule.App.Style.Colors
local WithStyleFunction = UIBloxModule.Style.withStyle
local Parent = script.Parent
local ConstantsModule = require(Parent.Parent.Constants)
local SelectionGradientModule = require(Parent.SelectionGradient)
local SelectionEffectModule = require(Parent.SelectionEffect)
local WheelTextModule = require(Parent.WheelText)
local WheelBackground = RoactModule.PureComponent:extend("WheelBackground")

function WheelBackground.renderContent(p1, Alpha)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), Colors (copy), SelectionGradientModule (copy), SelectionEffectModule (copy), WheelTextModule (copy)
	local Layout = ConstantsModule.Layouts[p1.props.layout]
	
	return RoactModule.createElement("Folder", {}, {
		BackgroundCircleOverlay = if Alpha then RoactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Colors.Flint:Lerp(Color3.new(0, 0, 0), Alpha),
			BackgroundTransparency = ConstantsModule.WheelBackgroundTransparency * Alpha
		}, {
			RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) else RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = Layout.CircleBackground
		}),
		BackgroundGradient = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			SelectionGradient = RoactModule.createElement(SelectionGradientModule)
		}),
		BackgroundImage = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = Layout.SegmentedCircle
		}),
		Selection = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			SelectionEffect = RoactModule.createElement(SelectionEffectModule)
		}),
		BackgroundText = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			Size = UDim2.new(1, 0, 1, 0)
		}, { MiddleText = RoactModule.createElement(WheelTextModule) })
	})
end

function WheelBackground.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderContent(p2.Settings.PreferredTransparency)
	end)
end

return RoactRoduxModule.connect(function(p1)
	return { layout = p1.layout }
end, nil)(WheelBackground)