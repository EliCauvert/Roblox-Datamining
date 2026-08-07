-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:00 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local imagesModule = require(parent.App.ImageSet.Images)
local imageSetComponentModule = require(parent.Core.ImageSet.ImageSetComponent)
local withStyleModule = require(parent.Core.Style.withStyle)
local tileUnselectedOverlay = roactModule.PureComponent:extend("TileUnselectedOverlay")
local hollow = imagesModule["squircles/hollow"]
tileUnselectedOverlay.validateProps = tModule.strictInterface({ ZIndex = tModule.optional(tModule.integer) })

function tileUnselectedOverlay.render(p0) --[[ line: 28 ]]
	-- upvalues: withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref), hollow (ref)
	local zIndex = p0.props.ZIndex
	
	return withStyleModule(function(p1) --[[ line: 31 ]]
		-- upvalues: roactModule (copy), zIndex (ref), imageSetComponentModule (copy), hollow (copy)
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
				Position = UDim2.new(1, -tokens.Global.Size_100, 0, tokens.Global.Size_100),
				Size = UDim2.fromOffset(24, 24)
			})
		})
	end)
end

return tileUnselectedOverlay