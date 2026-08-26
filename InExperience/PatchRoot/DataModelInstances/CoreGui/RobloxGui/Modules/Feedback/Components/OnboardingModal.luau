local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local parent = script.Parent.Parent
local themedTextLabelModule = require(parent.Components.PortedComponents.ThemedTextLabel)
local modalDialogModule = require(parent.Components.ModalDialog)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local showOnboardingModalThunkModule = require(parent.Thunks.ShowOnboardingModalThunk)
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local onboardingModal = roactModule.PureComponent:extend("OnboardingModal")
local fFlagTopBarSignalizeScreenSize = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize

function onboardingModal.init(p1)
	-- upvalues: experienceStateCaptureService (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	function p0.onDismiss()
		-- upvalues: p1 (ref)
		p1.props.showOnboardingModal(false)
	end
	
	function p0.onCancel()
		-- upvalues: experienceStateCaptureService (copy)
		experienceStateCaptureService:ToggleCaptureMode()
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = signalsModule.createEffect(function(p2)
			-- upvalues: p1 (ref), getViewportSize (ref)
			p1:setState({ screenSize = getViewportSize(p2) })
		end)
	end
end

function onboardingModal.willUnmount(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

function onboardingModal.render(p1)
	-- upvalues: withLocalization (ref), roactModule (ref), modalDialogModule (ref), fFlagTopBarSignalizeScreenSize (ref), buttonStack (ref), buttonType (ref), themedTextLabelModule (ref)
	return withLocalization({
		mainHeader = "CoreScripts.Feedback.Onboarding.MainHeader",
		instructionLabel = "CoreScripts.Feedback.Onboarding.Instructions",
		cancel = "CoreScripts.Feedback.Onboarding.Cancel",
		start = "CoreScripts.Feedback.Onboarding.Start"
	})(function(p2)
		-- upvalues: roactModule (copy), modalDialogModule (copy), p1 (ref), fFlagTopBarSignalizeScreenSize (copy), buttonStack (copy), buttonType (copy), themedTextLabelModule (copy)
		return roactModule.createElement(modalDialogModule, {
			maxHeight = 200,
			maxWidth = 540,
			showCloseButton = true,
			visible = p1.props.visible,
			screenSize = if fFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
			titleText = p2.mainHeader,
			actionButtons = roactModule.createElement(buttonStack, {
				buttonHeight = 36,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = { onActivated = p1.onCancel, text = p2.cancel }
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							isDisabled = false,
							onActivated = p1.onDismiss,
							text = p2.start
						}
					}
				}
			}),
			contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingBottom = UDim.new(0, 24)
				}),
				Layout = roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				InstructionLabel = roactModule.createElement(themedTextLabelModule, {
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

return roactRoduxModule.connect(function(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		visible = p1.common.showOnboardingModal
	}
end, function(p1)
	-- upvalues: showOnboardingModalThunkModule (ref)
	return {
		showOnboardingModal = function(p2)
			-- upvalues: p1 (ref), showOnboardingModalThunkModule (copy)
			p1(showOnboardingModalThunkModule(p2))
		end
	}
end)(onboardingModal)