local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent.Parent
local createShallowEqualAndTablesModule = require(parent.createShallowEqualAndTables)
local fFlagPlayerListReduceRerendersModule = require(parent.Flags.FFlagPlayerListReduceRerenders)
local cellExtender = roactModule.PureComponent:extend("CellExtender")
cellExtender.validateProps = tModule.strictInterface({
	layoutOrder = tModule.integer,
	size = tModule.UDim2,
	backgroundStyle = tModule.strictInterface({ Color = tModule.Color3, Transparency = tModule.number }),
	overlayStyle = tModule.strictInterface({ Color = tModule.Color3, Transparency = tModule.number }),
	doubleOverlay = tModule.boolean
})

function cellExtender.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = p1.props.layoutOrder,
		Size = p1.props.size,
		BackgroundTransparency = p1.props.backgroundStyle.Transparency,
		BackgroundColor3 = p1.props.backgroundStyle.Color
	}, {
		DoubleOverLay = roactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Visible = p1.props.doubleOverlay,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.props.overlayStyle.Transparency,
			BackgroundColor3 = p1.props.overlayStyle.Color
		}),
		OverlayFrame = roactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.props.overlayStyle.Transparency,
			BackgroundColor3 = p1.props.overlayStyle.Color
		})
	})
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(cellExtender, createShallowEqualAndTablesModule({ "backgroundStyle" })) else cellExtender