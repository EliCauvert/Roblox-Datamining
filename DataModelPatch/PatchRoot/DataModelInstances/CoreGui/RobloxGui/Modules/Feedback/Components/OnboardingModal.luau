local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local Parent = script.Parent.Parent
local ThemedTextLabelModule = require(Parent.Components.PortedComponents.ThemedTextLabel)
local ModalDialogModule = require(Parent.Components.ModalDialog)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ShowOnboardingModalThunkModule = require(Parent.Thunks.ShowOnboardingModalThunk)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local OnboardingModal = RoactModule.PureComponent:extend("OnboardingModal")
local FFlagTopBarSignalizeScreenSize = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize

function OnboardingModal.init(p1)
	-- upvalues: ExperienceStateCaptureService (copy), FFlagTopBarSignalizeScreenSize (copy), DisplayModule (copy), SignalsModule (copy)
	function p1.onDismiss()
		-- upvalues: p1 (copy)
		p1.props.showOnboardingModal(false)
	end
	
	function p1.onCancel()
		-- upvalues: ExperienceStateCaptureService (upval)
		ExperienceStateCaptureService:ToggleCaptureMode()
	end
	
	if FFlagTopBarSignalizeScreenSize then
		local GetViewportSizeFunction = DisplayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = SignalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), GetViewportSizeFunction (copy)
			p1:setState({ screenSize = GetViewportSizeFunction(p2) })
		end)
	end
end

function OnboardingModal.willUnmount(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	if FFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

function OnboardingModal.render(p1)
	-- upvalues: WithLocalizationFunction (copy), RoactModule (copy), ModalDialogModule (copy), FFlagTopBarSignalizeScreenSize (copy), ButtonStack (copy), ButtonType (copy), ThemedTextLabelModule (copy)
	return WithLocalizationFunction({
		mainHeader = "CoreScripts.Feedback.Onboarding.MainHeader",
		instructionLabel = "CoreScripts.Feedback.Onboarding.Instructions",
		cancel = "CoreScripts.Feedback.Onboarding.Cancel",
		start = "CoreScripts.Feedback.Onboarding.Start"
	})(function(p2)
		-- upvalues: RoactModule (upval), ModalDialogModule (upval), p1 (copy), FFlagTopBarSignalizeScreenSize (upval), ButtonStack (upval), ButtonType (upval), ThemedTextLabelModule (upval)
		return RoactModule.createElement(ModalDialogModule, {
			maxHeight = 200,
			maxWidth = 540,
			showCloseButton = true,
			visible = p1.props.visible,
			screenSize = if FFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
			titleText = p2.mainHeader,
			actionButtons = RoactModule.createElement(ButtonStack, {
				buttonHeight = 36,
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = { onActivated = p1.onCancel, text = p2.cancel }
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							isDisabled = false,
							onActivated = p1.onDismiss,
							text = p2.start
						}
					}
				}
			}),
			contents = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingBottom = UDim.new(0, 24)
				}),
				Layout = RoactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				InstructionLabel = RoactModule.createElement(ThemedTextLabelModule, {
					LayoutOrder = 1,
					fontKey = "Body",
					themeKey = "TextDefault",
					TextWrapped = true,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 76, 0.5, 0),
					Size = UDim2.new(1, 0, 0.4, 36),
					Text = p2.instructionLabel,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			onDismiss = p1.onDismiss
		})
	end)
end

return RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	return {
		screenSize = if FFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		visible = p1.common.showOnboardingModal
	}
end, function(Callback)
	-- upvalues: ShowOnboardingModalThunkModule (copy)
	return {
		showOnboardingModal = function(p1)
			-- upvalues: Callback (copy), ShowOnboardingModalThunkModule (upval)
			Callback(ShowOnboardingModalThunkModule(p1))
		end
	}
end)(OnboardingModal)