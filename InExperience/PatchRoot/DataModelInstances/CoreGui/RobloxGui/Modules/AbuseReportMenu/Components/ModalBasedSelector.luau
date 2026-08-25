local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local modalBasedSelectorDialogControllerModule = require(abuseReportMenu.Components.ModalBasedSelectorDialogController)
local fFlagHideShortcutsOnReportDropdownModule = require(abuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)

return function(p0)
	-- upvalues: fFlagHideShortcutsOnReportDropdownModule (ref), reactModule (ref), modalBasedSelectorDialogControllerModule (ref), view (ref), text (ref), icon (ref)
	local var6 = if fFlagHideShortcutsOnReportDropdownModule then reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		p0.onMenuOpenChange(true)
	end, { p0.onMenuOpenChange }) else nil
	local var7 = reactModule.useCallback(function()
		-- upvalues: modalBasedSelectorDialogControllerModule (copy), fFlagHideShortcutsOnReportDropdownModule (copy), p0 (ref)
		modalBasedSelectorDialogControllerModule.unmountModalSelector()
		
		if fFlagHideShortcutsOnReportDropdownModule then
			p0.onMenuOpenChange(false)
		end
	end, { p0.onMenuOpenChange })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p0.selectorHeight)
	}, {
		ControlButton = reactModule.createElement(view, {
			tag = "size-full stroke-thicker stroke-emphasis radius-medium",
			onActivated = function()
				-- upvalues: modalBasedSelectorDialogControllerModule (copy), p0 (ref), var7 (ref), var6 (write)
				modalBasedSelectorDialogControllerModule.mountModalSelector(p0.viewportHeight, p0.viewportWidth, p0.selections, p0.onSelect, var7, var6)
			end
		}, {
			Text = reactModule.createElement(text, {
				tag = "size-full anchor-center-center position-center-center",
				Text = p0.selectedValue or p0.placeholderText,
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