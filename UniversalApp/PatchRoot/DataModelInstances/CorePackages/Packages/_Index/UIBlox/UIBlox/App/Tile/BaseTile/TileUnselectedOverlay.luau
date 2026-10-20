local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local ImageSetComponentModule = require(Parent.Core.ImageSet.ImageSetComponent)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local TileUnselectedOverlay = RoactModule.PureComponent:extend("TileUnselectedOverlay")
local SquirclesHollow = require(Parent.App.ImageSet.Images)["squircles/hollow"]
TileUnselectedOverlay.validateProps = TModule.strictInterface({ ZIndex = TModule.optional(TModule.integer) })

function TileUnselectedOverlay.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ImageSetComponentModule (copy), SquirclesHollow (copy)
	local ZIndex = p1.props.ZIndex
	
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), ZIndex (copy), ImageSetComponentModule (upval), SquirclesHollow (upval)
		local Tokens = p2.Tokens
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = ZIndex
		}, {
			SelectionImage = RoactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Image = SquirclesHollow,
				Position = UDim2.new(1, -Tokens.Size.Size_200, 0, Tokens.Size.Size_200),
				Size = UDim2.fromOffset(24, 24)
			})
		})
	end)
end

return TileUnselectedOverlay