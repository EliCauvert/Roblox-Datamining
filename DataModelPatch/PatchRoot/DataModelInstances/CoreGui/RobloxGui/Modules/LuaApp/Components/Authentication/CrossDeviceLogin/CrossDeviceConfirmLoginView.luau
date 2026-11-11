local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local FoundationModule = require(CorePackages.Packages.Foundation)
local Image = FoundationModule.Image
local UseTokens = FoundationModule.Hooks.useTokens
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local CrossDeviceLoginModule = require(Modules.LuaApp.Thunks.Authentication.CrossDeviceLogin)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local CrossDevicePhoneLayoutModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDevicePhoneLayout)
local CrossDeviceTabletLayoutModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceTabletLayout)
local GetFFlagEnableAuthsecImageUpdateFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuthsecImageUpdate
local GetFFlagEnableCrossDeviceEnterCodeRefreshModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeRefresh)
local GetFFlagEnableApproveQuickLoginAuthButtonClickSchematizationModule = require(Modules.LuaApp.Flags.GetFFlagEnableApproveQuickLoginAuthButtonClickSchematization)
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsGraphicDevicesXxlarge = Images["icons/graphic/devices_xxlarge"]
local IconSize1 = UIBloxModule.App.ImageSet.getIconSize(IconSize.XLarge)
local IconsStatusAlert = Images["icons/status/alert"]
local IconSizeUDim2 = UIBloxModule.App.ImageSet.getIconSizeUDim2(IconSize.Medium)
local CrossDeviceConfirmLoginView = RoactModule.PureComponent:extend("CrossDeviceConfirmLoginView")
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)

function CrossDeviceConfirmLoginView.init(p1)
	-- upvalues: FoundationModule (copy), GetFFlagEnableApproveQuickLoginAuthButtonClickSchematizationModule (copy), EventStreamConstantsModule (copy), RbxAnalyticsService (copy)
	p1:setState({ isConfirming = false })
	
	function p1.getVerifyCodeImage(Name): string
		-- upvalues: FoundationModule (upval)
		return if Name == FoundationModule.Enums.Theme.Dark then "icons/graphic/verifyCode_dark" else "icons/graphic/verifyCode_light"
	end
	
	p1.confirming = false
	
	function p1.confirmButtonPressed()
		-- upvalues: p1 (copy), GetFFlagEnableApproveQuickLoginAuthButtonClickSchematizationModule (upval), EventStreamConstantsModule (upval)
		if not p1.confirming then
			p1.confirming = true
			p1:setState({ isConfirming = true })
			
			if GetFFlagEnableApproveQuickLoginAuthButtonClickSchematizationModule() then
				p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.ApproveQuickLogin, EventStreamConstantsModule.Button.GrantAccess)
			else
				p1.props.authAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.ApproveQuickLogin, EventStreamConstantsModule.Button.GrantAccess)
			end
			p1.props.confirmDeviceAccess(p1.props.networking, p1.props.deviceCode):andThen(function(_)
				-- upvalues: p1 (upval)
				p1.confirmCallback(true)
			end, function(_)
				-- upvalues: p1 (upval)
				p1.confirmCallback(false)
			end)
		end
	end
	
	function p1.confirmCallback(p2)
		-- upvalues: p1 (copy), RbxAnalyticsService (upval)
		if p1.confirming then
			p1.confirming = false
			p1:setState({ isConfirming = false })
			p1.props.openConfirmationModal(p2, p1.props.closeCallback, p1.props.retryCallback, p1.props.deviceString)
			
			if p1.props.source == "vng" then
				RbxAnalyticsService:ReportCounter("CrossAppLoginSuccess", 1)
				p1.props.linking:openURL("robloxvng://")
			end
		end
	end
	
	function p1.closeButtonPressed()
		-- upvalues: p1 (copy)
		p1.props.cancelLoginCode(p1.props.networking, p1.props.deviceCode)
		
		if p1.props.closeCallback then
			p1.props.closeCallback()
		end
	end
end

function CrossDeviceConfirmLoginView.didMount(p1)
	-- upvalues: EventStreamConstantsModule (copy)
	p1.props.authAnalytics.reportScreenLoaded(EventStreamConstantsModule.Context.ApproveQuickLogin)
end

function CrossDeviceConfirmLoginView.willUnmount(p1)
	p1.confirming = false
end

function CrossDeviceConfirmLoginView.render(p1)
	-- upvalues: GetFFlagEnableCrossDeviceEnterCodeRefreshModule (copy), WithStyleFunction (copy), WithLocalizationModule (copy), GetFFlagEnableAuthsecImageUpdateFunction (copy), RoactModule (copy), Image (copy), ImageSetLabel (copy), IconsGraphicDevicesXxlarge (copy), CrossDeviceTabletLayoutModule (copy), CrossDevicePhoneLayoutModule (copy), FitChildrenModule (copy), IconSize1 (copy), IconSizeUDim2 (copy), IconsStatusAlert (copy), FitTextLabelModule (copy), Button (copy), ButtonType (copy)
	local IsWideView = p1.props.isWideView
	local IsConfirming = p1.state.isConfirming
	local AuthenticationCrossDeviceLabelConfirm: string = if GetFFlagEnableCrossDeviceEnterCodeRefreshModule() then "Authentication.CrossDevice.Label.Confirm" else "Authentication.CrossDevice.Action.ConfirmLogin"
	
	return WithStyleFunction(function(Style)
		-- upvalues: WithLocalizationModule (upval), AuthenticationCrossDeviceLabelConfirm (copy), p1 (copy), IsWideView (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (upval), GetFFlagEnableAuthsecImageUpdateFunction (upval), RoactModule (upval), Image (upval), ImageSetLabel (upval), IconsGraphicDevicesXxlarge (upval), CrossDeviceTabletLayoutModule (upval), CrossDevicePhoneLayoutModule (upval), FitChildrenModule (upval), IconSize1 (upval), IconSizeUDim2 (upval), IconsStatusAlert (upval), FitTextLabelModule (upval), Button (upval), ButtonType (upval), IsConfirming (copy)
		return WithLocalizationModule({
			heading = "Authentication.CrossDevice.Heading.Warning",
			confirmation1 = "Authentication.CrossDevice.Label.ConfirmationMessage1",
			confirmation2 = "Authentication.CrossDevice.Label.ConfirmationMessage2",
			confirmation3 = "Authentication.CrossDevice.Label.ConfirmationMessage3",
			cancel = "Authentication.CrossDevice.Action.CancelLogin",
			confirm = AuthenticationCrossDeviceLabelConfirm
		})(function(p2)
			-- upvalues: p1 (upval), IsWideView (upval), Style (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (upval), GetFFlagEnableAuthsecImageUpdateFunction (upval), RoactModule (upval), Image (upval), ImageSetLabel (upval), IconsGraphicDevicesXxlarge (upval), CrossDeviceTabletLayoutModule (upval), CrossDevicePhoneLayoutModule (upval), FitChildrenModule (upval), IconSize1 (upval), IconSizeUDim2 (upval), IconsStatusAlert (upval), FitTextLabelModule (upval), Button (upval), ButtonType (upval), IsConfirming (upval)
			local DesignTokens = p1.props.designTokens
			local _UDim2 = UDim2.fromOffset(DesignTokens.LuaApps.CrossDeviceLogin.iconSize, DesignTokens.LuaApps.CrossDeviceLogin.iconSize)
			local HeaderFontFont = DesignTokens.LuaApps.CrossDeviceLogin.headerFont.Font
			local FontSize = DesignTokens.LuaApps.CrossDeviceLogin.headerFont.FontSize
			local HeaderTextColorColor3 = DesignTokens.LuaApps.CrossDeviceLogin.headerTextColor.Color3
			local ScaledSize = IsWideView and p1.props.tokens.Size.Size_2000 * 2 or p1.props.tokens.Size.Size_2000 * 4
			local Size2200 = IsWideView and p1.props.tokens.Size.Size_2200 or p1.props.tokens.Size.Size_2200 * 2
			local Size350 = if IsWideView then 0 else p1.props.tokens.Size.Size_350 or 0
			local BodyFontFont = DesignTokens.LuaApps.CrossDeviceLogin.bodyFont.Font
			local FontSize1 = DesignTokens.LuaApps.CrossDeviceLogin.bodyFont.FontSize
			local BodyTextColorColor3 = DesignTokens.LuaApps.CrossDeviceLogin.bodyTextColor.Color3
			local Transparency = DesignTokens.LuaApps.CrossDeviceLogin.headerTextColor.Transparency
			local BaseSize = Style.Font.BaseSize
			local Color = Style.Theme.UIEmphasis.Color
			
			return RoactModule.createElement(IsWideView and CrossDeviceTabletLayoutModule or CrossDevicePhoneLayoutModule, {
				TabletHeaderText = p2.tabletHeader,
				Style = Style,
				HighKeyboardMode = p1.props.highKeyboardMode,
				Icon = if GetFFlagEnableCrossDeviceEnterCodeRefreshModule() then nil elseif GetFFlagEnableAuthsecImageUpdateFunction() then RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = IsWideView and _UDim2 or UDim2.new(0, ScaledSize, 0, Size2200 - Size350)
				}, {
					Image = RoactModule.createElement(Image, {
						Image = p1.getVerifyCodeImage(p1.props.tokens.Config.ColorMode.Name),
						ScaleType = Enum.ScaleType.Fit,
						Size = UDim2.new(0, ScaledSize, 0, Size2200),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) else RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ImageTransparency = 0,
					Size = _UDim2,
					ScaleType = Enum.ScaleType.Fit,
					Image = IconsGraphicDevicesXxlarge,
					ImageColor3 = Color
				}),
				WarningText = RoactModule.createElement(FitChildrenModule.FitFrame, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, IsWideView and -50 - IconSize1 or -20, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height
				}, {
					Align = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 6),
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					TopWarning = if GetFFlagEnableAuthsecImageUpdateFunction() then nil else RoactModule.createElement(FitChildrenModule.FitFrame, {
						BackgroundTransparency = 1,
						fitAxis = FitChildrenModule.FitAxis.Height,
						Size = UDim2.new(1, 0, 1, 0)
					}, {
						ListLayout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = IsWideView and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 0),
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						WarningIcon1 = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							ImageTransparency = 0,
							Size = IconSizeUDim2,
							ScaleType = Enum.ScaleType.Fit,
							Image = IconsStatusAlert,
							ImageColor3 = Color
						}),
						WarningText = RoactModule.createElement(FitTextLabelModule, {
							LayoutOrder = 2,
							TextWrapped = true,
							BackgroundTransparency = 1,
							Size = UDim2.new(0, BaseSize, 1, 0),
							Text = p2.heading,
							Font = HeaderFontFont,
							TextSize = FontSize,
							TextColor3 = HeaderTextColorColor3,
							TextTransparency = Transparency,
							TextXAlignment = IsWideView and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
							fitAxis = FitChildrenModule.FitAxis.Width
						}),
						WarningIcon2 = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							ImageTransparency = 0,
							Size = IconSizeUDim2,
							ScaleType = Enum.ScaleType.Fit,
							Image = IconsStatusAlert,
							ImageColor3 = Color
						})
					}) or nil,
					Warning1 = RoactModule.createElement(FitTextLabelModule, {
						LayoutOrder = 3,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						Text = string.format(p2.confirmation1, p1.props.deviceString),
						Font = BodyFontFont,
						TextSize = FontSize1,
						TextColor3 = BodyTextColorColor3,
						TextTransparency = Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						fitAxis = FitChildrenModule.FitAxis.Height
					}),
					Warning2 = RoactModule.createElement(FitTextLabelModule, {
						LayoutOrder = 4,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p2.confirmation2,
						Font = DesignTokens.LuaApps.CrossDeviceLogin.textAlertFont.Font,
						TextSize = DesignTokens.LuaApps.CrossDeviceLogin.textAlertFont.FontSize,
						TextColor3 = DesignTokens.LuaApps.CrossDeviceLogin.textAlertColor.Color3,
						TextTransparency = Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						fitAxis = FitChildrenModule.FitAxis.Height
					}),
					Warning3 = RoactModule.createElement(FitTextLabelModule, {
						LayoutOrder = 5,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p2.confirmation3,
						Font = BodyFontFont,
						TextSize = FontSize1,
						TextColor3 = BodyTextColorColor3,
						TextTransparency = Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						fitAxis = FitChildrenModule.FitAxis.Height
					})
				}),
				LoginButton = RoactModule.createElement(Button, {
					buttonType = ButtonType.PrimarySystem,
					size = UDim2.new(1, 0, 1, 0),
					text = p2.confirm,
					onActivated = p1.confirmButtonPressed,
					isLoading = IsConfirming
				}),
				CancelButton = RoactModule.createElement(Button, {
					buttonType = ButtonType.Secondary,
					size = UDim2.new(1, 0, 1, 0),
					text = p2.cancel,
					onActivated = p1.closeButtonPressed
				})
			})
		end)
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: CrossDeviceLoginModule (copy)
	return {
		confirmDeviceAccess = function(p1, p2)
			-- upvalues: Callback (copy), CrossDeviceLoginModule (upval)
			return Callback(CrossDeviceLoginModule.ConfirmDeviceAccess(p1, p2))
		end,
		cancelLoginCode = function(p1, p2)
			-- upvalues: Callback (copy), CrossDeviceLoginModule (upval)
			return Callback(CrossDeviceLoginModule.CancelLoginCode(p1, p2))
		end,
		openConfirmationModal = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), CrossDeviceLoginModule (upval)
			return Callback(CrossDeviceLoginModule.OpenConfirmationOverlay(p1, p2, p3, p4))
		end
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	authAnalytics = RoactAnalyticsAuthEventsModule,
	linking = AppLinking
})(CrossDeviceConfirmLoginView)))

return function(p1)
	-- upvalues: UseDesignTokens (copy), UseTokens (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.join(p1, { designTokens = UseDesignTokens(), tokens = UseTokens() }))
end