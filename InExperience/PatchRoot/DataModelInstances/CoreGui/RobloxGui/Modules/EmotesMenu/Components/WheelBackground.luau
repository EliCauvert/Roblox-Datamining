local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local colors = UIBloxModule.App.Style.Colors
local withStyle = UIBloxModule.Style.withStyle
local parent = script.Parent
local constantsModule = require(parent.Parent.Constants)
local selectionGradientModule = require(parent.SelectionGradient)
local selectionEffectModule = require(parent.SelectionEffect)
local wheelTextModule = require(parent.WheelText)
local wheelBackground = roactModule.PureComponent:extend("WheelBackground")

function wheelBackground.renderContent(p0, p1)
	-- upvalues: constantsModule (ref), roactModule (ref), colors (ref), selectionGradientModule (ref), selectionEffectModule (ref), wheelTextModule (ref)
	local layout = constantsModule.Layouts[p0.props.layout]
	
	return roactModule.createElement("Folder", {}, {
		BackgroundCircleOverlay = if p1 then roactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = colors.Flint:Lerp(Color3.new(0, 0, 0), p1),
			BackgroundTransparency = constantsModule.WheelBackgroundTransparency * p1
		}, {
			roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) else roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = layout.CircleBackground
		}),
		BackgroundGradient = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			SelectionGradient = roactModule.createElement(selectionGradientModule)
		}),
		BackgroundImage = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = layout.SegmentedCircle
		}),
		Selection = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			SelectionEffect = roactModule.createElement(selectionEffectModule)
		}),
		BackgroundText = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			Size = UDim2.new(1, 0, 1, 0)
		}, { MiddleText = roactModule.createElement(wheelTextModule) })
	})
end

function wheelBackground.render(p2)
	-- upvalues: withStyle (ref)
	return withStyle(function(p3)
		-- upvalues: p2 (ref)
		return p2:renderContent(p3.Settings.PreferredTransparency)
	end)
end

return roactRoduxModule.connect(function(p4)
	return { layout = p4.layout }
end, nil)(wheelBackground)