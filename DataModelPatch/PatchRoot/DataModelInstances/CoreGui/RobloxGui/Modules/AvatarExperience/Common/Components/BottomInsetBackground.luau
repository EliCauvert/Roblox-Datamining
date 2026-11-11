local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local TModule = require(CorePackages.Packages.t)
local BottomInsetBackground = RoactModule.PureComponent:extend("BottomInsetBackground")
BottomInsetBackground.validateProps = TModule.strictInterface({
	globalGuiInset = TModule.strictInterface({
		left = TModule.integer,
		top = TModule.integer,
		right = TModule.integer,
		bottom = TModule.integer
	})
})

function BottomInsetBackground.renderWithStyle(p1, p2)
	-- upvalues: RoactModule (copy)
	local Theme = p2.Theme
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 3,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency,
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, p1.props.globalGuiInset.bottom)
	})
end

function BottomInsetBackground.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

return BottomInsetBackground