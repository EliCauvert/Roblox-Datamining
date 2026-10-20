local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.ProfilePictureEditor.Constants)
local PeekabooFrameBorder = RoactModule.PureComponent:extend("PeekabooFrameBorder")
PeekabooFrameBorder.validateProps = require(CorePackages.Packages.t).strictInterface({})

function PeekabooFrameBorder:render()
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ConstantsModule (copy)
	return WithStyleFunction(function(p1)
		-- upvalues: RoactModule (upval), ConstantsModule (upval)
		local Theme = p1.Theme
		
		return RoactModule.createFragment({
			TopBorder = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				BackgroundColor3 = Theme.Divider.Color,
				Size = UDim2.new(1, 0, 0, ConstantsModule.PeekabooBorderWidthPix),
				Position = UDim2.fromOffset(0, 0)
			}),
			LeftBorder = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				BackgroundColor3 = Theme.Divider.Color,
				Size = UDim2.new(0, ConstantsModule.PeekabooBorderWidthPix, 1, 0),
				Position = UDim2.fromOffset(0, 0)
			}),
			RightBorder = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				BackgroundColor3 = Theme.Divider.Color,
				AnchorPoint = Vector2.new(1, 0),
				Size = UDim2.new(0, ConstantsModule.PeekabooBorderWidthPix, 1, 0),
				Position = UDim2.fromScale(1, 0)
			}),
			BottomBorder = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				BackgroundColor3 = Theme.Divider.Color,
				AnchorPoint = Vector2.new(0, 1),
				Size = UDim2.new(1, 0, 0, ConstantsModule.PeekabooBorderWidthPix),
				Position = UDim2.fromScale(0, 1)
			})
		})
	end)
end

return PeekabooFrameBorder