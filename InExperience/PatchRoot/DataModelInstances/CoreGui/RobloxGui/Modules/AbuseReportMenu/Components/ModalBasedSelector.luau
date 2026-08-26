local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local modalBasedSelectorDialogControllerModule = require(abuseReportMenu.Components.ModalBasedSelectorDialogController)
local fFlagHideShortcutsOnReportDropdownModule = require(abuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)

return function(p1)
	-- upvalues: fFlagHideShortcutsOnReportDropdownModule (ref), reactModule (ref), modalBasedSelectorDialogControllerModule (ref), view (ref), text (ref), icon (ref)
	local var1 = if fFlagHideShortcutsOnReportDropdownModule then reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onMenuOpenChange(true)
	end, { p1.onMenuOpenChange }) else nil
	local var2 = reactModule.useCallback(function()
		-- upvalues: modalBasedSelectorDialogControllerModule (copy), fFlagHideShortcutsOnReportDropdownModule (copy), p1 (ref)
		modalBasedSelectorDialogControllerModule.unmountModalSelector()
		
		if fFlagHideShortcutsOnReportDropdownModule then
			p1.onMenuOpenChange(false)
		end
	end, { p1.onMenuOpenChange })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p1.selectorHeight)
	}, {
		ControlButton = reactModule.createElement(view, {
			tag = "size-full stroke-thicker stroke-emphasis radius-medium",
			onActivated = function()
				-- upvalues: modalBasedSelectorDialogControllerModule (copy), p1 (ref), var2 (ref), var1 (write)
				modalBasedSelectorDialogControllerModule.mountModalSelector(p1.viewportHeight, p1.viewportWidth, p1.selections, p1.onSelect, var2, var1)
			end
		}, {
			Text = reactModule.createElement(text, {
				tag = "size-full anchor-center-center position-center-center",
				Text = p1.selectedValue or p1.placeholderText,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			Icon = reactModule.createElement(icon, {
				name = "icons/actions/truncationExpand",
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0)
			})
		})
	})
end