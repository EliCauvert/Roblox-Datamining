local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent.Parent
local CreateShallowEqualAndTablesModule = require(Parent.createShallowEqualAndTables)
local FFlagPlayerListReduceRerendersModule = require(Parent.Flags.FFlagPlayerListReduceRerenders)
local CellExtender = RoactModule.PureComponent:extend("CellExtender")
CellExtender.validateProps = TModule.strictInterface({
	layoutOrder = TModule.integer,
	size = TModule.UDim2,
	backgroundStyle = TModule.strictInterface({ Color = TModule.Color3, Transparency = TModule.number }),
	overlayStyle = TModule.strictInterface({ Color = TModule.Color3, Transparency = TModule.number }),
	doubleOverlay = TModule.boolean
})

function CellExtender.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = p1.props.layoutOrder,
		Size = p1.props.size,
		BackgroundTransparency = p1.props.backgroundStyle.Transparency,
		BackgroundColor3 = p1.props.backgroundStyle.Color
	}, {
		DoubleOverLay = RoactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Visible = p1.props.doubleOverlay,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.props.overlayStyle.Transparency,
			BackgroundColor3 = p1.props.overlayStyle.Color
		}),
		OverlayFrame = RoactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.props.overlayStyle.Transparency,
			BackgroundColor3 = p1.props.overlayStyle.Color
		})
	})
end

return if FFlagPlayerListReduceRerendersModule then ReactModule.memo(CellExtender, CreateShallowEqualAndTablesModule({ "backgroundStyle" })) else CellExtender