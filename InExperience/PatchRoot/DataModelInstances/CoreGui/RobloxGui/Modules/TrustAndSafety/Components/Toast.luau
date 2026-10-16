local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Toast = UIBloxModule.App.Dialog.Toast
local Images = UIBloxModule.App.ImageSet.Images
local Toast1 = RoactModule.PureComponent:extend("Toast")
Toast1.validateProps = TModule.strictInterface({
	toastTitle = TModule.optional(TModule.string),
	toastSubtitle = TModule.optional(TModule.string)
})

function Toast1.render(p1) --[[ Line: 18 ]]
	-- upvalues: RoactModule (copy), Toast (copy), Images (copy)
	return if p1.props.toastTitle then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 100,
		Size = UDim2.fromScale(1, 1)
	}, {
		Toast = RoactModule.createElement(Toast, {
			duration = 3,
			toastContent = {
				iconImage = Images["icons/status/success"],
				toastTitle = p1.props.toastTitle,
				toastSubtitle = p1.props.toastSubtitle
			}
		})
	}) else nil
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 38 ]]
	return {
		toastTitle = p1.common.toastTitle,
		toastSubtitle = p1.common.toastSubtitle
	}
end, nil)(Toast1)