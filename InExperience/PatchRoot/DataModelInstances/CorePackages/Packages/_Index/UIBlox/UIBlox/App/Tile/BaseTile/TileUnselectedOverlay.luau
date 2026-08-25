local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local UIBloxConfigModule = require(parent.UIBloxConfig)
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local imagesModule = require(parent.App.ImageSet.Images)
local imageSetComponentModule = require(parent.Core.ImageSet.ImageSetComponent)
local withStyleModule = require(parent.Core.Style.withStyle)
local tileUnselectedOverlay = roactModule.PureComponent:extend("TileUnselectedOverlay")
local hollow = imagesModule["squircles/hollow"]
tileUnselectedOverlay.validateProps = tModule.strictInterface({ ZIndex = tModule.optional(tModule.integer) })

function tileUnselectedOverlay.render(p0)
	-- upvalues: withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref), hollow (ref), UIBloxConfigModule (ref)
	local zIndex = p0.props.ZIndex
	
	return withStyleModule(function(p1)
		-- upvalues: roactModule (copy), zIndex (ref), imageSetComponentModule (copy), hollow (copy), UIBloxConfigModule (copy)
		local tokens = p1.Tokens
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = zIndex
		}, {
			SelectionImage = roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Image = hollow,
				Position = UDim2.new(1, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then -tokens.Size.Size_200 else -tokens.Global.Size_100, 0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100),
				Size = UDim2.fromOffset(24, 24)
			})
		})
	end)
end

return tileUnselectedOverlay