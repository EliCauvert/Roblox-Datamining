local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local parent = script.Parent.Parent
local themedTextLabelModule = require(parent.Components.PortedComponents.ThemedTextLabel)
local modalDialogModule = require(parent.Components.ModalDialog)
local showHelpModalThunkModule = require(parent.Thunks.ShowHelpModalThunk)
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local helpModal = roactModule.PureComponent:extend("HelpModal")
local fFlagTopBarSignalizeScreenSize = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize

function helpModal.init(p0)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	function p0.onDismiss()
		-- upvalues: p0 (ref)
		p0.props.showHelpModal(false)
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p0.disposeScreenSize = signalsModule.createEffect(function(p1)
			-- upvalues: p0 (ref), getViewportSize (ref)
			p0:setState({ screenSize = getViewportSize(p1) })
		end)
	end
end

function helpModal.willUnmount(p2)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p2.disposeScreenSize()
	end
end

function helpModal.render(p3)
	-- upvalues: withLocalization (ref), roactModule (ref), modalDialogModule (ref), fFlagTopBarSignalizeScreenSize (ref), themedTextLabelModule (ref)
	return withLocalization({
		mainHeader = "CoreScripts.Feedback.Help.MainHeader",
		instructionLabel = "CoreScripts.Feedback.Help.Instructions"
	})(function(p4)
		-- upvalues: roactModule (copy), modalDialogModule (copy), p3 (ref), fFlagTopBarSignalizeScreenSize (copy), themedTextLabelModule (copy)
		return roactModule.createElement(modalDialogModule, {
			maxHeight = 130,
			maxWidth = 540,
			showCloseButton = true,
			visible = p3.props.visible,
			screenSize = if fFlagTopBarSignalizeScreenSize then p3.state.screenSize else p3.props.screenSize,
			titleText = p4.mainHeader,
			contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
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

return roactRoduxModule.connect(function(p5)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p5.displayOptions.screenSize,
		visible = p5.common.showHelpModal
	}
end, function(p6)
	-- upvalues: showHelpModalThunkModule (ref)
	return {
		showHelpModal = function(p7)
			-- upvalues: p6 (ref), showHelpModalThunkModule (copy)
			p6(showHelpModalThunkModule(p7))
		end
	}
end)(helpModal)