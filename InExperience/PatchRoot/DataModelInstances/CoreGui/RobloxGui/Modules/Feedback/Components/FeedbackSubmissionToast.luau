local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local toast = UIBloxModule.App.Dialog.Toast
local images = UIBloxModule.App.ImageSet.Images
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local feedbackSubmissionToast = roactModule.PureComponent:extend("FeedbackSubmissionToast")
feedbackSubmissionToast.validateProps = tModule.strictInterface({
	numFeedbackSubmissionAttempts = tModule.optional(tModule.number)
})

function feedbackSubmissionToast.render(p1)
	-- upvalues: roactModule (ref), withLocalization (ref), toast (ref), images (ref)
	return if p1.props.numFeedbackSubmissionAttempts == nil then nil else roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 100,
		Size = UDim2.fromScale(1, 1)
	}, {
		Toast = withLocalization({
			toastTitle = "CoreScripts.Feedback.SubmissionToastHeader",
			toastSubtitle = "CoreScripts.Feedback.SubmissionToastBody"
		})(function(p2)
			-- upvalues: p1 (ref), roactModule (copy), toast (copy), images (copy)
			local toastTitle = p2.toastTitle
			local toastSubtitle = p2.toastSubtitle
			
			if p1.props.numFeedbackSubmissionAttempts % 2 == 0 then
				toastTitle = p2.toastTitle .. " "
				toastSubtitle = p2.toastSubtitle .. " "
			end
			return roactModule.createElement(toast, {
				duration = 3,
				toastContent = {
					iconImage = images["icons/status/success"],
					toastTitle = toastTitle,
					toastSubtitle = toastSubtitle
				}
			})
		end)
	})
end

return roactRoduxModule.connect(function(p1)
	return {
		numFeedbackSubmissionAttempts = p1.common.numFeedbackSubmissionAttempts
	}
end, nil)(feedbackSubmissionToast)