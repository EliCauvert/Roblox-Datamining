local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local ModalBasedSelectorDialogControllerModule = require(AbuseReportMenu.Components.ModalBasedSelectorDialogController)
local FFlagHideShortcutsOnReportDropdownModule = require(AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)

return function(p1)
	-- upvalues: FFlagHideShortcutsOnReportDropdownModule (copy), ReactModule (copy), ModalBasedSelectorDialogControllerModule (copy), View (copy), Text (copy), Icon (copy)
	local UseResult = if FFlagHideShortcutsOnReportDropdownModule then ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onMenuOpenChange(true)
	end, { p1.onMenuOpenChange }) else nil
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ModalBasedSelectorDialogControllerModule (upval), FFlagHideShortcutsOnReportDropdownModule (upval), p1 (copy)
		ModalBasedSelectorDialogControllerModule.unmountModalSelector()
		
		if FFlagHideShortcutsOnReportDropdownModule then
			p1.onMenuOpenChange(false)
		end
	end, { p1.onMenuOpenChange })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p1.selectorHeight)
	}, {
		ControlButton = ReactModule.createElement(View, {
			tag = "size-full stroke-thicker stroke-emphasis radius-medium",
			onActivated = function()
				-- upvalues: ModalBasedSelectorDialogControllerModule (upval), p1 (copy), UseResult1 (copy), UseResult (ref)
				ModalBasedSelectorDialogControllerModule.mountModalSelector(p1.viewportHeight, p1.viewportWidth, p1.selections, p1.onSelect, UseResult1, UseResult)
			end
		}, {
			Text = ReactModule.createElement(Text, {
				tag = "size-full anchor-center-center position-center-center",
				Text = p1.selectedValue or p1.placeholderText,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			Icon = ReactModule.createElement(Icon, {
				name = "icons/actions/truncationExpand",
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0)
			})
		})
	})
end