local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local Parent = script.Parent.Parent
local ThemedTextLabelModule = require(Parent.Components.PortedComponents.ThemedTextLabel)
local ModalDialogModule = require(Parent.Components.ModalDialog)
local ShowHelpModalThunkModule = require(Parent.Thunks.ShowHelpModalThunk)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local HelpModal = RoactModule.PureComponent:extend("HelpModal")
local FFlagTopBarSignalizeScreenSize = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local GetFFlagEnableSendImageFeedbackToBackendModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)

function HelpModal.init(p1) --[[ Line: 37 ]]
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy), DisplayModule (copy), SignalsModule (copy)
	function p1.onDismiss() --[[ Line: 38 ]]
		-- upvalues: p1 (copy)
		p1.props.showHelpModal(false)
	end
	
	if FFlagTopBarSignalizeScreenSize then
		local GetViewportSizeFunction = DisplayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = SignalsModule.createEffect(function(p2) --[[ Line: 45 ]]
			-- upvalues: p1 (copy), GetViewportSizeFunction (copy)
			p1:setState({ screenSize = GetViewportSizeFunction(p2) })
		end)
	end
end

function HelpModal.willUnmount(p1) --[[ Line: 53 ]]
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	if FFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

function HelpModal.render(p1) --[[ Line: 59 ]]
	-- upvalues: WithLocalizationFunction (copy), GetFFlagEnableSendImageFeedbackToBackendModule (copy), RoactModule (copy), ModalDialogModule (copy), FFlagTopBarSignalizeScreenSize (copy), ThemedTextLabelModule (copy)
	return WithLocalizationFunction({
		mainHeader = "CoreScripts.Feedback.Help.MainHeader",
		instructionLabel = if GetFFlagEnableSendImageFeedbackToBackendModule() then "CoreScripts.Feedback.Help.InstructionsWithImage" else "CoreScripts.Feedback.Help.Instructions"
	})(function(p2) --[[ Line: 65 ]]
		-- upvalues: RoactModule (upval), ModalDialogModule (upval), p1 (copy), FFlagTopBarSignalizeScreenSize (upval), ThemedTextLabelModule (upval)
		return RoactModule.createElement(ModalDialogModule, {
			maxHeight = 130,
			maxWidth = 540,
			showCloseButton = true,
			visible = p1.props.visible,
			screenSize = if FFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
			titleText = p2.mainHeader,
			contents = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
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

return RoactRoduxModule.connect(function(p1) --[[ Line: 103 ]]
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	return {
		screenSize = if FFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		visible = p1.common.showHelpModal
	}
end, function(Callback) --[[ Line: 108 ]]
	-- upvalues: ShowHelpModalThunkModule (copy)
	return {
		showHelpModal = function(p1) --[[ Line: 110 ]]
			-- upvalues: Callback (copy), ShowHelpModalThunkModule (upval)
			Callback(ShowHelpModalThunkModule(p1))
		end
	}
end)(HelpModal)