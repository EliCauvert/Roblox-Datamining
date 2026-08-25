local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local colorMode = require(corePackagesService.Packages.Foundation).Enums.ColorMode
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent
local withStyle = UIBloxModule.Core.Style.withStyle
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local dark = colorMode.Dark
local setFeedbackFlowStateModule = require(parent.Actions.SetFeedbackFlowState)
local setScreenSizeModule = require(parent.Actions.SetScreenSize)
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local assetsModule = require(parent.Resources.Assets)
local feedbackReportDialogModule = require(parent.Components.FeedbackReportDialog)
local refinedFeedbackBarModule = require(parent.Components.RefinedFeedbackBar)
local feedbackSubmissionToastModule = require(parent.Components.FeedbackSubmissionToast)
local helpModalModule = require(parent.Components.HelpModal)
local onboardingModalModule = require(parent.Components.OnboardingModal)
local fFlagInExperienceUseAppStyleProvider = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagInExperienceUseAppStyleProvider
local feedbackApp = roactModule.PureComponent:extend("FeedbackApp")
feedbackApp.validateProps = tModule.strictInterface({ setScreenGuiSize = tModule.callback })

function feedbackApp.render(p0)
	-- upvalues: roactModule (ref), fFlagInExperienceUseAppStyleProvider (ref), appStyleProvider (ref), UIBloxModule (ref), dark (ref), feedbackSubmissionToastModule (ref), helpModalModule (ref), onboardingModalModule (ref), feedbackReportDialogModule (ref), withLocalization (ref), withStyle (ref), refinedFeedbackBarModule (ref), assetsModule (ref)
	return roactModule.createElement(if fFlagInExperienceUseAppStyleProvider then appStyleProvider else UIBloxModule.Core.Style.Provider, if fFlagInExperienceUseAppStyleProvider then { style = { themeName = dark } } else {}, {
		Gui = roactModule.createElement("ScreenGui", {
			AutoLocalize = false,
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			[roactModule.Change.AbsoluteSize] = p0.props.setScreenGuiSize
		}, {
			ScreenFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 10,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				FeedbackSubmissionToast = roactModule.createElement(feedbackSubmissionToastModule),
				HelpModal = roactModule.createElement(helpModalModule),
				OnboardingModal = roactModule.createElement(onboardingModalModule),
				FeedbackReportDialog = roactModule.createElement(feedbackReportDialogModule)
			}),
			RefinedFeedbackBar = withLocalization({
				feedbackBarText = "CoreScripts.Feedback.FeedbackBar.MainLabel"
			})(function(p1)
				-- upvalues: withStyle (copy), roactModule (copy), refinedFeedbackBarModule (copy), assetsModule (copy)
				return withStyle(function(p2)
					-- upvalues: roactModule (copy), refinedFeedbackBarModule (copy), p1 (ref), assetsModule (copy)
					local font = p2.Font
					
					return roactModule.createElement(refinedFeedbackBarModule, {
						leftHint = {
							maxWidth = 200,
							text = p1.feedbackBarText,
							hintTextSize = font.BaseSize * font.Body.RelativeSize,
							icon = assetsModule.Images.FeedbackBarHintIcon
						}
					}, {})
				end)
			end)
		})
	})
end

return roactRoduxModule.connect(function() end, function(p3)
	-- upvalues: setScreenSizeModule (ref), setFeedbackFlowStateModule (ref)
	return {
		setScreenGuiSize = function(value)
			-- upvalues: p3 (ref), setScreenSizeModule (copy)
			p3(setScreenSizeModule(value.AbsoluteSize))
		end,
		setFeedbackFlowState = function(value)
			-- upvalues: p3 (ref), setFeedbackFlowStateModule (copy)
			p3(function(p4)
				-- upvalues: setFeedbackFlowStateModule (copy), value (ref)
				p4:dispatch(setFeedbackFlowStateModule(value))
			end)
		end
	}
end)(feedbackApp)