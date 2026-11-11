local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.RoactRodux)
local VngComplianceLoadingPopup = RoactModule.PureComponent:extend("VngComplianceLoadingPopup")
local Loading = require(CorePackages.Packages.Foundation).Loading

function VngComplianceLoadingPopup.render(p1)
	-- upvalues: RoactModule (copy), Loading (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, p1.props.screenSize.Y)
	}, {
		Layout = RoactModule.createElement(Loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		})
	})
end

return (RoactRoduxModule.connect(function(p1)
	return { screenSize = p1.ScreenSize }
end, function(_) end)(VngComplianceLoadingPopup))