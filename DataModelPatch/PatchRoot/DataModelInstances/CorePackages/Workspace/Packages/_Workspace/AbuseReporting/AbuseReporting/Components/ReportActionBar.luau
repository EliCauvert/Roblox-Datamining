local AbuseReporting = script:FindFirstAncestor("AbuseReporting")
local Parent = AbuseReporting.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local _ = require(AbuseReporting.Common.Types)
local UseAbuseReportingDesignTokensModule = require(AbuseReporting.Hooks.useAbuseReportingDesignTokens)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local _UDim2 = UDim2.new(1, 0, 0, 200)

return function(p1)
	-- upvalues: UseAbuseReportingDesignTokensModule (copy), _UDim2 (copy), ButtonType (copy), ReactModule (copy), ButtonStack (copy)
	local ReportActionBar = UseAbuseReportingDesignTokensModule().ReportActionBar
	local Size = ReportActionBar.size or _UDim2
	local ButtonHeight = ReportActionBar.buttonHeight or 48
	local _UDim2_1 = UDim2.fromOffset(ReportActionBar.buttonWidth or 500, ButtonHeight)
	local Buttons = {}
	
	for _, button in p1.buttons do
		table.insert(Buttons, {
			buttonType = button.buttonType or ButtonType.Secondary,
			props = {
				onActivated = button.onActivated,
				size = _UDim2_1,
				text = button.text
			}
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = Size
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		ActionButtons = ReactModule.createElement(ButtonStack, {
			marginBetween = ReportActionBar.buttonListHorizontalPadding,
			buttonHeight = ButtonHeight,
			buttons = Buttons
		})
	})
end