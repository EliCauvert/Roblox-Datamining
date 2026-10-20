local Packages = game:GetService("CorePackages").Packages
local ReactModule = require(Packages.React)
local UseStyleFunction = require(Packages.UIBlox).Core.Style.useStyle
local _UDim2 = UDim2.fromOffset(4, 4)
local _Vector2 = Vector2.new(0.5, 0.5)
local _UDim2_1 = UDim2.fromScale(0.8, 0.8)

return function(Frame)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), _Vector2 (copy), _UDim2 (copy), _UDim2_1 (copy)
	return ReactModule.createElement("Frame", {
		AnchorPoint = Frame.AnchorPoint or _Vector2,
		Size = if Frame.Size then Frame.Size else _UDim2,
		BackgroundColor3 = UseStyleFunction().Theme.OnlineStatus.Color,
		Position = Frame.Position or _UDim2_1,
		ZIndex = Frame.ZIndex
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end