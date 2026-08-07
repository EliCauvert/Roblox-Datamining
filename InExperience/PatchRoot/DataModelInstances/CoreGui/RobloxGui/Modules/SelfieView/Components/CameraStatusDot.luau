local packages = game:GetService("CorePackages").Packages
local reactModule = require(packages.React)
local useStyle = require(packages.UIBlox).Core.Style.useStyle
local uDim2 = UDim2.fromOffset(4, 4)
local vector2 = Vector2.new(0.5, 0.5)
local uDim2_1 = UDim2.fromScale(0.8, 0.8)

return function(vectorA) --[[ line: 18 | named "CameraStatusDot" ]]
	-- upvalues: useStyle (ref), reactModule (ref), vector2 (ref), uDim2 (ref), uDim2_1 (ref)
	return reactModule.createElement("Frame", {
		AnchorPoint = vectorA.AnchorPoint or vector2,
		Size = if vectorA.Size then vectorA.Size else uDim2,
		BackgroundColor3 = useStyle().Theme.OnlineStatus.Color,
		Position = vectorA.Position or uDim2_1,
		ZIndex = vectorA.ZIndex
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end