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

function helpModal.init(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	function p0.onDismiss()
		-- upvalues: p1 (ref)
		p1.props.showHelpModal(false)
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = signalsModule.createEffect(function(p2)
			-- upvalues: p1 (ref), getViewportSize (ref)
			p1:setState({ screenSize = getViewportSize(p2) })
		end)
	end
end

function helpModal.willUnmount(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

function helpModal.render(p1)
	-- upvalues: withLocalization (ref), roactModule (ref), modalDialogModule (ref), fFlagTopBarSignalizeScreenSize (ref), themedTextLabelModule (ref)
	return withLocalization({
		mainHeader = "CoreScripts.Feedback.Help.MainHeader",
		instructionLabel = "CoreScripts.Feedback.Help.Instructions"
	})(function(p2)
		-- upvalues: roactModule (copy), modalDialogModule (copy), p1 (ref), fFlagTopBarSignalizeScreenSize (copy), themedTextLabelModule (copy)
		return roactModule.createElement(modalDialogModule, {
			maxHeight = 130,
			maxWidth = 540,
			showCloseButton = true,
			visible = p1.props.visible,
			screenSize = if fFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
			titleText = p2.mainHeader,
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
		visible = p1.common.showHelpModal
	}
end, function(p1)
	-- upvalues: showHelpModalThunkModule (ref)
	return {
		showHelpModal = function(p2)
			-- upvalues: p1 (ref), showHelpModalThunkModule (copy)
			p1(showHelpModalThunkModule(p2))
		end
	}
end)(helpModal)