local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Toast = UIBloxModule.App.Dialog.Toast
local Images = UIBloxModule.App.ImageSet.Images
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local FeedbackSubmissionToast = RoactModule.PureComponent:extend("FeedbackSubmissionToast")
FeedbackSubmissionToast.validateProps = TModule.strictInterface({
	numFeedbackSubmissionAttempts = TModule.optional(TModule.number)
})

function FeedbackSubmissionToast.render(p1) --[[ Line: 26 ]]
	-- upvalues: RoactModule (copy), WithLocalizationFunction (copy), Toast (copy), Images (copy)
	return if p1.props.numFeedbackSubmissionAttempts == nil then nil else RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 100,
		Size = UDim2.fromScale(1, 1)
	}, {
		Toast = WithLocalizationFunction({
			toastTitle = "CoreScripts.Feedback.SubmissionToastHeader",
			toastSubtitle = "CoreScripts.Feedback.SubmissionToastBody"
		})(function(p2) --[[ Line: 40 ]]
			-- upvalues: p1 (copy), RoactModule (upval), Toast (upval), Images (upval)
			local ToastTitle = p2.toastTitle
			local ToastSubtitle = p2.toastSubtitle
			
			if p1.props.numFeedbackSubmissionAttempts % 2 == 0 then
				ToastTitle = p2.toastTitle .. " "
				ToastSubtitle = p2.toastSubtitle .. " "
			end
			return RoactModule.createElement(Toast, {
				duration = 3,
				toastContent = {
					iconImage = Images["icons/status/success"],
					toastTitle = ToastTitle,
					toastSubtitle = ToastSubtitle
				}
			})
		end)
	})
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 65 ]]
	return {
		numFeedbackSubmissionAttempts = p1.common.numFeedbackSubmissionAttempts
	}
end, nil)(FeedbackSubmissionToast)