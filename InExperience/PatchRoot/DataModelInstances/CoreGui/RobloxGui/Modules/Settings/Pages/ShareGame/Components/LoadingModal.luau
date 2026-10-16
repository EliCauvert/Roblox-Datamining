local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local LoadingBar = require(CorePackages.Workspace.Packages.AppBlox).LoadingBar
local _Color3 = Color3.fromRGB(41, 41, 41)

return function() --[[ Line: 9 ]]
	-- upvalues: RoactModule (copy), _Color3 (copy), LoadingBar (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 0.1,
		Size = UDim2.new(0, 160, 0, 160),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = _Color3
	}, {
		RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
		RoactModule.createElement(LoadingBar)
	})
end