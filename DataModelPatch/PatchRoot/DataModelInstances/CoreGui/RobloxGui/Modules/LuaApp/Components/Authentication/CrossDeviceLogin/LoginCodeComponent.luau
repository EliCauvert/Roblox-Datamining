local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local GetFFlagEnableCrossDeviceLoginUsingQRCodesModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes)
local ShowCodeViewModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.ShowCodeView)
local ShowProfileViewModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.ShowProfileView)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local FitChildrenModule = require(Modules.LuaApp.FitChildren)

return function(Player: Player)
	-- upvalues: UseDesignTokensFunction (copy), RoactModule (copy), FitChildrenModule (copy), ShowCodeViewModule (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (copy), ShowProfileViewModule (copy)
	local LoginView = UseDesignTokensFunction().LuaApps.LoginView
	
	return RoactModule.createElement(FitChildrenModule.FitFrame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		fitAxis = FitChildrenModule.FitAxis.Height
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = if Player.isDualLayout then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingTop = if Player.isDualLayout then UDim.new(0, 0) else UDim.new(0, 24),
			PaddingBottom = if Player.isDualLayout then UDim.new(0, 0) else UDim.new(0, 12),
			PaddingLeft = if Player.isDualLayout then UDim.new(0, LoginView.dualLayoutPadding) else nil
		}),
		View = Player.showCodeView and RoactModule.createElement(ShowCodeViewModule, {
			DeviceCode = Player.DeviceCode,
			QrCodeUrl = if GetFFlagEnableCrossDeviceLoginUsingQRCodesModule() then Player.QrCodeUrl else nil,
			AltTitle = Player.AltTitle,
			AltInstruction = Player.AltInstruction,
			AltMobileInstruction = Player.AltMobileInstruction,
			AltDesktopInstruction = Player.AltDesktopInstruction,
			DisableQrCode = Player.disableCdlQrCodeForMaquettes or false,
			hideDeviceCode = Player.hideDeviceCode,
			showLockIcon = Player.showLockIcon,
			isDualLayout = Player.isDualLayout,
			leftAlignText = Player.isDualLayout,
			showConfirmLoginText = Player.showConfirmLoginText,
			DisplayName = Player.DisplayName,
			isCrossApp = Player.isCrossApp
		}) or RoactModule.createElement(ShowProfileViewModule, {
			Url = Player.AccountPictureUrl,
			DisplayName = Player.DisplayName,
			leftAlignText = Player.isDualLayout
		})
	})
end