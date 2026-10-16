local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Dark = require(CorePackages.Packages.Foundation).Enums.ColorMode.Dark
local SetFeedbackFlowStateModule = require(Parent.Actions.SetFeedbackFlowState)
local SetScreenSizeModule = require(Parent.Actions.SetScreenSize)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local AssetsModule = require(Parent.Resources.Assets)
local FeedbackReportDialogModule = require(Parent.Components.FeedbackReportDialog)
local RefinedFeedbackBarModule = require(Parent.Components.RefinedFeedbackBar)
local FeedbackSubmissionToastModule = require(Parent.Components.FeedbackSubmissionToast)
local HelpModalModule = require(Parent.Components.HelpModal)
local OnboardingModalModule = require(Parent.Components.OnboardingModal)
local FFlagInExperienceUseAppStyleProvider = require(CorePackages.Workspace.Packages.SharedFlags).FFlagInExperienceUseAppStyleProvider
local FeedbackApp = RoactModule.PureComponent:extend("FeedbackApp")
FeedbackApp.validateProps = TModule.strictInterface({ setScreenGuiSize = TModule.callback })

function FeedbackApp.render(p1) --[[ Line: 48 ]]
	-- upvalues: RoactModule (copy), FFlagInExperienceUseAppStyleProvider (copy), AppStyleProvider (copy), UIBloxModule (copy), Dark (copy), FeedbackSubmissionToastModule (copy), HelpModalModule (copy), OnboardingModalModule (copy), FeedbackReportDialogModule (copy), WithLocalizationFunction (copy), WithStyleFunction (copy), RefinedFeedbackBarModule (copy), AssetsModule (copy)
	return RoactModule.createElement(if FFlagInExperienceUseAppStyleProvider then AppStyleProvider else UIBloxModule.Core.Style.Provider, if FFlagInExperienceUseAppStyleProvider then { style = { themeName = Dark } } else {}, {
		Gui = RoactModule.createElement("ScreenGui", {
			AutoLocalize = false,
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			[RoactModule.Change.AbsoluteSize] = p1.props.setScreenGuiSize
		}, {
			ScreenFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 10,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				FeedbackSubmissionToast = RoactModule.createElement(FeedbackSubmissionToastModule),
				HelpModal = RoactModule.createElement(HelpModalModule),
				OnboardingModal = RoactModule.createElement(OnboardingModalModule),
				FeedbackReportDialog = RoactModule.createElement(FeedbackReportDialogModule)
			}),
			RefinedFeedbackBar = WithLocalizationFunction({
				feedbackBarText = "CoreScripts.Feedback.FeedbackBar.MainLabel"
			})(function(p2) --[[ Line: 80 ]]
				-- upvalues: WithStyleFunction (upval), RoactModule (upval), RefinedFeedbackBarModule (upval), AssetsModule (upval)
				return WithStyleFunction(function(p3) --[[ Line: 81 ]]
					-- upvalues: RoactModule (upval), RefinedFeedbackBarModule (upval), p2 (copy), AssetsModule (upval)
					local _Font = p3.Font
					
					return RoactModule.createElement(RefinedFeedbackBarModule, {
						leftHint = {
							maxWidth = 200,
							text = p2.feedbackBarText,
							hintTextSize = _Font.BaseSize * _Font.Body.RelativeSize,
							icon = AssetsModule.Images.FeedbackBarHintIcon
						}
					}, {})
				end)
			end)
		})
	})
end

return RoactRoduxModule.connect(function() --[[ Line: 98 ]] end, function(Callback) --[[ Line: 98 ]]
	-- upvalues: SetScreenSizeModule (copy), SetFeedbackFlowStateModule (copy)
	return {
		setScreenGuiSize = function(Frame) --[[ Line: 100 ]]
			-- upvalues: Callback (copy), SetScreenSizeModule (upval)
			Callback(SetScreenSizeModule(Frame.AbsoluteSize))
		end,
		setFeedbackFlowState = function(p1) --[[ Line: 103 ]]
			-- upvalues: Callback (copy), SetFeedbackFlowStateModule (upval)
			Callback(function(p2) --[[ Line: 104 ]]
				-- upvalues: SetFeedbackFlowStateModule (upval), p1 (copy)
				p2:dispatch(SetFeedbackFlowStateModule(p1))
			end)
		end
	}
end)(FeedbackApp)