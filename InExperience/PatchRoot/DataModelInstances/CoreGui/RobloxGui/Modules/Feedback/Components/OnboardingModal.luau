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

function onboardingModal.init(p0) --[[ line: 35 ]]
	-- upvalues: experienceStateCaptureService (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	function p0.onDismiss() --[[ line: 36 ]]
		-- upvalues: p0 (ref)
		p0.props.showOnboardingModal(false)
	end
	
	function p0.onCancel() --[[ line: 40 ]]
		-- upvalues: experienceStateCaptureService (copy)
		experienceStateCaptureService:ToggleCaptureMode()
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p0.disposeScreenSize = signalsModule.createEffect(function(p1) --[[ line: 47 ]]
			-- upvalues: p0 (ref), getViewportSize (ref)
			p0:setState({ screenSize = getViewportSize(p1) })
		end)
	end
end

function onboardingModal.willUnmount(p2) --[[ line: 55 ]]
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p2.disposeScreenSize()
	end
end

function onboardingModal.render(p3) --[[ line: 61 ]]
	-- upvalues: withLocalization (ref), roactModule (ref), modalDialogModule (ref), fFlagTopBarSignalizeScreenSize (ref), buttonStack (ref), buttonType (ref), themedTextLabelModule (ref)
	return withLocalization({
		mainHeader = "CoreScripts.Feedback.Onboarding.MainHeader",
		instructionLabel = "CoreScripts.Feedback.Onboarding.Instructions",
		cancel = "CoreScripts.Feedback.Onboarding.Cancel",
		start = "CoreScripts.Feedback.Onboarding.Start"
	})(function(p4) --[[ line: 67 ]]
		-- upvalues: roactModule (copy), modalDialogModule (copy), p3 (ref), fFlagTopBarSignalizeScreenSize (copy), buttonStack (copy), buttonType (copy), themedTextLabelModule (copy)
		return roactModule.createElement(modalDialogModule, {
			maxHeight = 200,
			maxWidth = 540,
			showCloseButton = true,
			visible = p3.props.visible,
			screenSize = if fFlagTopBarSignalizeScreenSize then p3.state.screenSize else p3.props.screenSize,
			titleText = p4.mainHeader,
			actionButtons = roactModule.createElement(buttonStack, {
				buttonHeight = 36,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = { onActivated = p3.onCancel, text = p4.cancel }
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							isDisabled = false,
							onActivated = p3.onDismiss,
							text = p4.start
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
					Text = p4.instructionLabel,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			onDismiss = p3.onDismiss
		})
	end)
end

return roactRoduxModule.connect(function(p5) --[[ line: 126 ]]
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p5.displayOptions.screenSize,
		visible = p5.common.showOnboardingModal
	}
end, function(p6) --[[ line: 131 ]]
	-- upvalues: showOnboardingModalThunkModule (ref)
	return {
		showOnboardingModal = function(p7) --[[ line: 133 ]]
			-- upvalues: p6 (ref), showOnboardingModalThunkModule (copy)
			p6(showOnboardingModalThunkModule(p7))
		end
	}
end)(onboardingModal)