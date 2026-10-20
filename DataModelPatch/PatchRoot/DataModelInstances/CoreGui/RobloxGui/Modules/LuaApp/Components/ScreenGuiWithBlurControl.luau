local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ScreenGuiWithBlurControl = RoactModule.PureComponent:extend("ScreenGuiWithBlurControl")

function ScreenGuiWithBlurControl.render(p1)
	-- upvalues: CryoModule (copy), RoactModule (copy)
	local BlurDisplayOrder = p1.props.blurDisplayOrder
	local DisplayOrder = p1.props.DisplayOrder
	
	return RoactModule.createElement("ScreenGui", (CryoModule.Dictionary.join(p1.props, {
		hasScreenGuiBlur = CryoModule.None,
		blurDisplayOrder = CryoModule.None,
		OnTopOfCoreBlur = p1.props.hasScreenGuiBlur and BlurDisplayOrder <= DisplayOrder or false
	})))
end

return (RoactRoduxModule.connect(function(p1, _)
	return {
		hasScreenGuiBlur = p1.ScreenGuiBlur.hasBlur,
		blurDisplayOrder = p1.ScreenGuiBlur.blurDisplayOrder
	}
end)(ScreenGuiWithBlurControl))