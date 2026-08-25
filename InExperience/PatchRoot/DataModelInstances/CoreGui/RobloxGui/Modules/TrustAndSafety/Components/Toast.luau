local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local toast = UIBloxModule.App.Dialog.Toast
local images = UIBloxModule.App.ImageSet.Images
local toast_1 = roactModule.PureComponent:extend("Toast")
toast_1.validateProps = tModule.strictInterface({
	toastTitle = tModule.optional(tModule.string),
	toastSubtitle = tModule.optional(tModule.string)
})

function toast_1.render(p0)
	-- upvalues: roactModule (ref), toast (ref), images (ref)
	return if p0.props.toastTitle then roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 100,
		Size = UDim2.fromScale(1, 1)
	}, {
		Toast = roactModule.createElement(toast, {
			duration = 3,
			toastContent = {
				iconImage = images["icons/status/success"],
				toastTitle = p0.props.toastTitle,
				toastSubtitle = p0.props.toastSubtitle
			}
		})
	}) else nil
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		toastTitle = p1.common.toastTitle,
		toastSubtitle = p1.common.toastSubtitle
	}
end, nil)(toast_1)