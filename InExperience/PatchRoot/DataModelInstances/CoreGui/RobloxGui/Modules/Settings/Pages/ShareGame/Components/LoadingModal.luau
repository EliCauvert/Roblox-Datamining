local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local loadingBar = require(corePackagesService.Workspace.Packages.AppBlox).LoadingBar
local color = Color3.fromRGB(41, 41, 41)

return function() --[[ line: 9 ]]
	-- upvalues: roactModule (ref), color (ref), loadingBar (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 0.1,
		Size = UDim2.new(0, 160, 0, 160),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = color
	}, {
		roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
		roactModule.createElement(loadingBar)
	})
end