local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local FitChildrenModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.FitChildren)

return function(p1)
	-- upvalues: RoactModule (copy), FitChildrenModule (copy)
	local BaseSize: number = p1.Style.Font.BaseSize
	
	return RoactModule.createFragment({
		Align = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 14),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Icon = not p1.HighKeyboardMode and p1.Icon,
		WarningText = p1.WarningText,
		InputArea = p1.InputBox and RoactModule.createElement(FitChildrenModule.FitFrame, {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			fitAxis = FitChildrenModule.FitAxis.Height
		}, {
			Align = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 3),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			InputBox = p1.InputBox,
			InputWarning = p1.InputWarning
		}),
		NextButtonWrapper = RoactModule.createElement("Frame", {
			LayoutOrder = 4,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, BaseSize * 2)
		}, { NextButton = p1.ConfirmCodeButton or p1.LoginButton }),
		CancelButton = p1.CancelButton and RoactModule.createElement("Frame", {
			LayoutOrder = 5,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, BaseSize * 2)
		}, { CancelButton = p1.CancelButton })
	})
end