local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local FitChildrenModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.FitChildren)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), RoactModule (copy), FitChildrenModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local LayoutHeaderFontFont = UseDesignTokensResult.LuaApps.CrossDeviceLogin.layoutHeaderFont.Font
	local FontSize = UseDesignTokensResult.LuaApps.CrossDeviceLogin.layoutHeaderFont.FontSize
	local LayoutTextColorColor3 = UseDesignTokensResult.LuaApps.CrossDeviceLogin.layoutTextColor.Color3
	local ButtonFrameWidth = UseDesignTokensResult.LuaApps.CrossDeviceLogin.buttonFrameWidth
	local BaseSize: number = p1.Style.Font.BaseSize
	
	return RoactModule.createFragment({
		Align = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, 16),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		TabletHeader = not p1.HighKeyboardMode and RoactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Font = LayoutHeaderFontFont,
			TextSize = FontSize,
			TextColor3 = LayoutTextColorColor3,
			Text = p1.TabletHeaderText or "",
			Size = UDim2.new(1, 0, 0, FontSize),
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		WarningText = RoactModule.createElement(FitChildrenModule.FitFrame, {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			fitAxis = FitChildrenModule.FitAxis.Height
		}, {
			Align = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = UseDesignTokensResult.LuaApps.CrossDeviceLogin.warningTextVerticalAlignment,
				Padding = UDim.new(0, 16),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Icon = p1.Icon,
			WarningText = p1.WarningText
		}),
		CodeInput = p1.InputBox and (p1.ConfirmCodeButton and (p1.ConfirmCodeButtonWidth and RoactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -16 - p1.ConfirmCodeButtonWidth, 0, 30)
		}, {
			InputBox = p1.InputBox,
			InputWarning = p1.InputWarning,
			ButtonWrapper = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p1.ConfirmCodeButtonWidth, 1, 0),
				Position = UDim2.new(1, 16, 0, 0)
			}, { ConfirmButton = p1.ConfirmCodeButton })
		}))),
		CodeConfirmButtonFrame = p1.LoginButton and (p1.CancelButton and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(ButtonFrameWidth, 0, 0, BaseSize * 2)
		}, {
			CancelButtonWrapper = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -6, 1, 0)
			}, { CancelButton = p1.CancelButton }),
			LoginButtonWrapper = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -6, 1, 0),
				Position = UDim2.new(0.5, 6, 0, 0)
			}, { LoginButton = p1.LoginButton })
		}))
	})
end