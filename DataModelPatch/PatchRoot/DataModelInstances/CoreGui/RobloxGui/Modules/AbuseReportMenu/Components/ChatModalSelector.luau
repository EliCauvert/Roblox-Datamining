local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local ChatModalSelectorDialogControllerModule = require(AbuseReportMenu.Components.ChatModalSelectorDialogController)
local _ = require(AbuseReportMenu.Components.Types)
local FFlagHideShortcutsOnReportDropdownModule = require(AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)

return function(p1)
	-- upvalues: FFlagHideShortcutsOnReportDropdownModule (copy), ReactModule (copy), ChatModalSelectorDialogControllerModule (copy), View (copy), Text (copy), Icon (copy)
	local UseResult = if FFlagHideShortcutsOnReportDropdownModule then ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onMenuOpenChange(true)
	end, { p1.onMenuOpenChange }) else nil
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ChatModalSelectorDialogControllerModule (upval), FFlagHideShortcutsOnReportDropdownModule (upval), p1 (copy)
		ChatModalSelectorDialogControllerModule.unmountModalSelector()
		
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
				-- upvalues: ChatModalSelectorDialogControllerModule (upval), UseResult1 (copy), UseResult (ref), p1 (copy)
				ChatModalSelectorDialogControllerModule.mountModalSelector(UseResult1, UseResult, p1.onSelect)
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