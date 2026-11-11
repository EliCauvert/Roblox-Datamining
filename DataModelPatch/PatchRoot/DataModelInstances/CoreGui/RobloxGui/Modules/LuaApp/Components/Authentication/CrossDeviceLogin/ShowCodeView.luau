local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local DividerWithText = require(CorePackages.Workspace.Packages.AuthCommon).Components.DividerWithText
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local GetFFlagCrossDeviceInstructionExperimentModule = require(Modules.LuaApp.Flags.GetFFlagCrossDeviceInstructionExperiment)
local GetFFlagEnableCrossDeviceLoginUsingQRCodesModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes)
local GetFFlagEnableCorrectedLoginInstructionsModule = require(Modules.LuaApp.Flags.GetFFlagEnableCorrectedLoginInstructions)
local GetFFlagEnableMaquettesShortLinkCDLInstructionsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableMaquettesShortLinkCDLInstructions
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local RoactAnalytics = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalytics
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local FFlagEnableMagicLogin = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMagicLogin
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local IconSize1 = UIBloxModule.App.ImageSet.Enum.IconSize
local IconsGraphicLockXxlarge = UIBloxModule.App.ImageSet.Images["icons/graphic/lock_xxlarge"]
local IconSizeUDim2 = UIBloxModule.App.ImageSet.getIconSizeUDim2(IconSize1.XLarge)
local IconSizeRatio = UIBloxModule.App.ImageSet.getIconSize(IconSize1.XLarge) * 4 / 3

return function(Player)
	-- upvalues: UseDispatchFunction (copy), UseDesignTokensFunction (copy), UseRoactServiceFunction (copy), AppLinking (copy), RoactNetworking (copy), RoactAnalytics (copy), UseAppPolicyFunction (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), LaunchAppModule (copy), LaunchContextModule (copy), WithStyleFunction (copy), IconSizeRatio (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (copy), WithLocalizationModule (copy), GetFFlagCrossDeviceInstructionExperimentModule (copy), GetFFlagEnableMaquettesShortLinkCDLInstructionsFunction (copy), IsVRAppBuildFunction (copy), GetFFlagEnableCorrectedLoginInstructionsModule (copy), RoactModule (copy), FFlagEnableMagicLogin (copy), Button (copy), ButtonVariant (copy), InputSize (copy), ImageSetLabel (copy), IconSizeUDim2 (copy), IconsGraphicLockXxlarge (copy), DividerWithText (copy), Loading (copy), IconSize (copy), FitTextLabelModule (copy), FitChildrenModule (copy)
	local IsDualLayout = Player.isDualLayout
	local HideDeviceCode = Player.hideDeviceCode
	local ShowLockIcon = Player.showLockIcon
	local UseDispatchResult = UseDispatchFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local LoginView = UseDesignTokensResult.LuaApps.LoginView
	local EngagementScreen = UseDesignTokensResult.LuaApps.EngagementScreen
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult2 = UseRoactServiceFunction(RoactAnalytics)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1
	end)
	
	local function MagicLoginOpenDiscoveryView()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval), LaunchAppModule (upval), UseRoactServiceResult1 (copy), UseRoactServiceResult2 (copy), UseAppPolicyResult (copy), LaunchContextModule (upval)
		UseDispatchResult(SetCentralOverlayModule(OverlayTypeModule.DeviceSelectorPeekView, {
			launchApp = function()
				-- upvalues: UseDispatchResult (upval), LaunchAppModule (upval), UseRoactServiceResult1 (upval), UseRoactServiceResult2 (upval), UseAppPolicyResult (upval), LaunchContextModule (upval)
				return UseDispatchResult(LaunchAppModule(UseRoactServiceResult1, nil, UseRoactServiceResult2, UseAppPolicyResult, LaunchContextModule.Login))
			end
		}))
	end
	
	return WithStyleFunction(function(p1)
		-- upvalues: Player (copy), LoginView (copy), IsDualLayout (copy), IconSizeRatio (upval), GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (upval), UseRoactServiceResult (copy), WithLocalizationModule (upval), GetFFlagCrossDeviceInstructionExperimentModule (upval), GetFFlagEnableMaquettesShortLinkCDLInstructionsFunction (upval), IsVRAppBuildFunction (upval), GetFFlagEnableCorrectedLoginInstructionsModule (upval), RoactModule (upval), FFlagEnableMagicLogin (upval), Button (upval), ButtonVariant (upval), MagicLoginOpenDiscoveryView (copy), InputSize (upval), ShowLockIcon (copy), ImageSetLabel (upval), IconSizeUDim2 (upval), IconsGraphicLockXxlarge (upval), HideDeviceCode (copy), UseDesignTokensResult (copy), DividerWithText (upval), EngagementScreen (copy), Loading (upval), IconSize (upval), FitTextLabelModule (upval), FitChildrenModule (upval)
		local DeviceCode = Player.DeviceCode
		local TitleFont = p1.Font.Title.Font
		local BodyFont = p1.Font.Body.Font
		local BaseSize = p1.Font.BaseSize
		local CdlDeviceCodeSize = LoginView.cdlDeviceCodeSize or BaseSize * p1.Font.Title.RelativeSize
		local TextBodySize = LoginView.textBodySize or BaseSize * p1.Font.Body.RelativeSize
		local TextSmallSize = if IsDualLayout then LoginView.textSmallSize else BaseSize * p1.Font.CaptionBody.RelativeSize
		local QrWidth = LoginView.qrWidth or IconSizeRatio
		local _UDim2 = UDim2.fromOffset(QrWidth, QrWidth)
		local Transparency = p1.Theme.TextEmphasis.Transparency
		local Color = p1.Theme.TextEmphasis.Color
		local NoDisableQrCode: boolean = GetFFlagEnableCrossDeviceLoginUsingQRCodesModule() and (Player.QrCodeUrl and not Player.DisableQrCode)
		local NoDisableQrCode1 = not Player.DisableQrCode
		
		if Player.isDualLayout then
			NoDisableQrCode = Player.QrCodeUrl and not Player.DisableQrCode
		end
		local YOffset = nil
		YOffset = if NoDisableQrCode then CdlDeviceCodeSize * 0.75 else CdlDeviceCodeSize * 1.5
		local LeftAlignText = Player.leftAlignText
		
		if Player.isCrossApp and DeviceCode ~= "" then
			UseRoactServiceResult:openURL("robloxglobal://navigation/crossdevice?code=" .. DeviceCode .. "&" .. "source=vng")
		end
		return WithLocalizationModule({
			alertTitle = "Authentication.CrossDevice.Heading.LoginCode",
			devicePrompt = "Authentication.CrossDevice.Label.DevicePrompt",
			loginInstructions = "Authentication.CrossDevice.Label.LoginInstructions",
			loginInstructionsV2 = "Authentication.CrossDevice.Label.LoginInstructionsV2",
			loginLocation = "Authentication.CrossDevice.Label.LoginLocation",
			loginLocationV2 = "Authentication.CrossDevice.Label.LoginLocationV2",
			qrHeader = "Authentication.CrossDevice.Label.QrHeader",
			qrHeaderDualLayout = "Authentication.CrossDevice.Label.QrCodeLogin",
			qrInstructions = "Authentication.CrossDevice.Label.QrInstructions",
			codeHeader = "Authentication.CrossDevice.Label.CodeHeader",
			codeHeaderDualLayout = "Authentication.CrossDevice.Heading.QuickLogin",
			orYouCan = "CommonUI.Features.Labels.OrYouCan",
			confirmAndLoginAs = "Authentication.CrossDevice.Label.ConfirmAndLoginAs",
			qrCodeError = "Authentication.CrossDevice.Label.QrCodeError",
			shortlinkLoginInstructions = "Authentication.CrossDevice.Label.QuestCDLShortLinkInstruction"
		})(function(p2)
			-- upvalues: GetFFlagCrossDeviceInstructionExperimentModule (upval), Player (upval), GetFFlagEnableMaquettesShortLinkCDLInstructionsFunction (upval), IsVRAppBuildFunction (upval), GetFFlagEnableCorrectedLoginInstructionsModule (upval), IsDualLayout (upval), NoDisableQrCode1 (copy), NoDisableQrCode (ref), RoactModule (upval), FFlagEnableMagicLogin (upval), BodyFont (copy), TextBodySize (copy), Color (copy), Transparency (copy), LeftAlignText (copy), Button (upval), ButtonVariant (upval), MagicLoginOpenDiscoveryView (upval), InputSize (upval), ShowLockIcon (upval), ImageSetLabel (upval), _UDim2 (copy), IconSizeUDim2 (upval), IconsGraphicLockXxlarge (upval), p1 (copy), LoginView (upval), TextSmallSize (copy), HideDeviceCode (upval), UseDesignTokensResult (upval), DividerWithText (upval), EngagementScreen (upval), DeviceCode (copy), TitleFont (copy), CdlDeviceCodeSize (copy), YOffset (ref), Loading (upval), IconSize (upval), FitTextLabelModule (upval), FitChildrenModule (upval)
			local FFlagCrossDeviceInstructionExperimentModule = GetFFlagCrossDeviceInstructionExperimentModule()
			local AltDesktopInstruction = FFlagCrossDeviceInstructionExperimentModule and (Player.AltMobileInstruction and Player.AltDesktopInstruction)
			local AltTitle = FFlagCrossDeviceInstructionExperimentModule and Player.AltTitle or (if GetFFlagEnableMaquettesShortLinkCDLInstructionsFunction() and IsVRAppBuildFunction() then p2.shortlinkLoginInstructions else p2.devicePrompt)
			local AltInstruction = FFlagCrossDeviceInstructionExperimentModule and Player.AltInstruction or (if GetFFlagEnableCorrectedLoginInstructionsModule() then p2.loginInstructionsV2 else p2.loginInstructions)
			local LayoutOrder: number? = nil
			local LayoutOrder1: number? = nil
			local NoDisableQrCode1_1 = IsDualLayout and NoDisableQrCode1
			local LayoutOrder2 = nil
			local LayoutOrder3 = nil
			
			if NoDisableQrCode1_1 then
				LayoutOrder = 3
				LayoutOrder1 = 2
				LayoutOrder2 = 6
				LayoutOrder3 = 5
			elseif NoDisableQrCode then
				LayoutOrder = 2
				LayoutOrder1 = 3
				LayoutOrder2 = 5
				LayoutOrder3 = 6
			else
				LayoutOrder2 = 2
				LayoutOrder3 = 4
			end
			local QrHeaderDualLayout = if IsDualLayout then p2.qrHeaderDualLayout else p2.qrHeader
			local CodeHeaderDualLayout = if IsDualLayout then p2.codeHeaderDualLayout else p2.codeHeader
			local Formatted = if Player.showConfirmLoginText then string.format(p2.confirmAndLoginAs, Player.DisplayName) else p2.qrInstructions
			
			return RoactModule.createFragment({
				MagicLoginHeader = if FFlagEnableMagicLogin then RoactModule.createElement("TextLabel", {
					Text = "<b> Option 1 </b>",
					RichText = true,
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = -1,
					Font = BodyFont,
					TextSize = TextBodySize,
					TextColor3 = Color,
					TextTransparency = Transparency,
					TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(1, 0, 0, 0)
				}) else nil,
				MagicLoginDiscoveryButton = if FFlagEnableMagicLogin then RoactModule.createElement(Button, {
					text = "Search Nearby Devices",
					isDisabled = false,
					LayoutOrder = 0,
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: MagicLoginOpenDiscoveryView (upval)
						MagicLoginOpenDiscoveryView()
					end,
					size = InputSize.Large
				}) else nil,
				QrHeader = if NoDisableQrCode1_1 or NoDisableQrCode then RoactModule.createElement("TextLabel", {
					RichText = true,
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Text = if FFlagEnableMagicLogin then "<b>Option 2</b>" else "<b>" .. QrHeaderDualLayout .. "</b>",
					Font = BodyFont,
					TextSize = TextBodySize,
					TextColor3 = Color,
					TextTransparency = Transparency,
					TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(1, 0, 0, 0)
				}) else nil,
				HeaderIcon = if ShowLockIcon and not NoDisableQrCode then RoactModule.createElement(ImageSetLabel, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ImageTransparency = 0,
					Size = if Player.isDualLayout then _UDim2 else IconSizeUDim2,
					ScaleType = Enum.ScaleType.Fit,
					Image = IconsGraphicLockXxlarge,
					ImageColor3 = p1.Theme.UIEmphasis.Color
				}) else nil,
				QrErrorPadding = if NoDisableQrCode1_1 and not NoDisableQrCode then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, LoginView.qrErrorPadding)
				}) else nil,
				QrImageFrame = NoDisableQrCode and RoactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					Size = _UDim2,
					BackgroundColor3 = Color3.fromHex("#FFFFFF"),
					LayoutOrder = LayoutOrder
				}, {
					QrImage = RoactModule.createElement(ImageSetLabel, {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						Size = UDim2.new(1, 0, 1, 0),
						ScaleType = Enum.ScaleType.Fit,
						Image = Player.QrCodeUrl
					}),
					UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
					UIPadding = RoactModule.createElement("UIPadding", {
						PaddingBottom = if IsDualLayout then LoginView.qrPadding else UDim.new(0, 4),
						PaddingLeft = if IsDualLayout then LoginView.qrPadding else UDim.new(0, 4),
						PaddingRight = if IsDualLayout then LoginView.qrPadding else UDim.new(0, 4),
						PaddingTop = if IsDualLayout then LoginView.qrPadding else UDim.new(0, 4)
					})
				}),
				QrInstructions = NoDisableQrCode and RoactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					Text = Formatted,
					Font = BodyFont,
					TextSize = TextSmallSize,
					TextColor3 = Color,
					TextTransparency = Transparency,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil,
					TextYAlignment = if IsDualLayout and HideDeviceCode then Enum.TextYAlignment.Top else nil,
					Size = if IsDualLayout and HideDeviceCode then UDim2.new(1, 0, 0, 48) else UDim2.new(1, 0, 0, 24),
					LayoutOrder = LayoutOrder1
				}, {
					UIPadding = RoactModule.createElement("UIPadding", {
						PaddingTop = if IsDualLayout and not HideDeviceCode then UDim.new(0, UseDesignTokensResult.Size.Size_400) else nil,
						PaddingBottom = if IsDualLayout and not HideDeviceCode then UDim.new(0, UseDesignTokensResult.Size.Size_600) elseif IsDualLayout and HideDeviceCode then UDim.new(0, UseDesignTokensResult.Size.Size_400) else UDim.new(0, 24)
					})
				}),
				Divider = if NoDisableQrCode1_1 and not HideDeviceCode then RoactModule.createElement(DividerWithText, {
					layoutOrder = 4,
					width = 0,
					height = 0,
					size = UDim2.new(1, 0, 0, LoginView.dividerPadding * 2 + LoginView.dividerSize),
					font = BodyFont,
					fontSize = UseDesignTokensResult.Typography.CaptionSmall.FontSize,
					color3 = UseDesignTokensResult.Color.Content.Muted.Color3,
					transparency = UseDesignTokensResult.Color.Content.Muted.Transparency,
					text = p2.orYouCan,
					padding = EngagementScreen.dividerPadding
				}) else nil,
				CodeHeader = if NoDisableQrCode1_1 or NoDisableQrCode then if HideDeviceCode then nil else RoactModule.createElement("TextLabel", {
					RichText = true,
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Text = if FFlagEnableMagicLogin then "<b>Option 3</b>" else "<b>" .. CodeHeaderDualLayout .. "</b>",
					Font = BodyFont,
					TextSize = TextBodySize,
					TextColor3 = Color,
					TextTransparency = Transparency,
					TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(1, 0, 0, 0)
				}) else nil,
				CodeDisplay = if HideDeviceCode then nil else RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = DeviceCode,
					Font = TitleFont,
					TextSize = CdlDeviceCodeSize,
					TextColor3 = Color,
					TextTransparency = Transparency,
					TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil,
					Size = UDim2.new(1, 0, 0, YOffset),
					LayoutOrder = LayoutOrder2
				}, {
					Spinner = DeviceCode == "" and RoactModule.createElement(Loading, {
						Position = UDim2.new(0.5, 0, 0.5, 0),
						size = if NoDisableQrCode then IconSize.Small else IconSize.Medium,
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}),
				DevicePrompt = not NoDisableQrCode and (not HideDeviceCode and RoactModule.createElement(FitTextLabelModule, {
					TextWrapped = true,
					BackgroundTransparency = 1,
					Text = if NoDisableQrCode1_1 then p2.qrCodeError else AltTitle,
					Font = BodyFont,
					RichText = GetFFlagEnableMaquettesShortLinkCDLInstructionsFunction() and IsVRAppBuildFunction(),
					TextSize = if IsDualLayout then TextSmallSize else TextBodySize,
					TextColor3 = Color,
					TextTransparency = Transparency,
					TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil,
					AutomaticSize = if IsDualLayout then Enum.AutomaticSize.Y else nil,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					LayoutOrder = if IsDualLayout then 2 else 3
				}, {
					UIPadding = if IsDualLayout then RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_400)
					}) else nil
				})),
				Instructions = if GetFFlagEnableMaquettesShortLinkCDLInstructionsFunction() and IsVRAppBuildFunction() then nil elseif HideDeviceCode then nil else RoactModule.createElement(FitChildrenModule.FitFrame, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					LayoutOrder = LayoutOrder3
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, if AltDesktopInstruction then 12 else 0)
					}),
					UIPadding = if IsDualLayout then RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_400),
						PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_400)
					}) else nil,
					InstructionText = RoactModule.createElement(FitTextLabelModule, {
						TextWrapped = true,
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Text = AltInstruction,
						Font = BodyFont,
						TextSize = TextSmallSize,
						TextColor3 = Color,
						TextTransparency = Transparency,
						TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildrenModule.FitAxis.Height
					}),
					LocationText = not AltDesktopInstruction and RoactModule.createElement(FitTextLabelModule, {
						RichText = true,
						TextWrapped = true,
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Text = if GetFFlagEnableCorrectedLoginInstructionsModule() then p2.loginLocationV2 else p2.loginLocation,
						Font = BodyFont,
						TextSize = TextSmallSize,
						TextColor3 = Color,
						TextTransparency = Transparency,
						TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildrenModule.FitAxis.Height
					}),
					LocationList = AltDesktopInstruction and RoactModule.createElement("Frame", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -48, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						List = RoactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 4)
						}),
						Mobile = RoactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							RichText = true,
							TextWrapped = true,
							BackgroundTransparency = 1,
							Text = Player.AltMobileInstruction,
							Font = BodyFont,
							TextSize = TextSmallSize,
							TextColor3 = Color,
							TextTransparency = Transparency,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						Desktop = RoactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							RichText = true,
							TextWrapped = true,
							BackgroundTransparency = 1,
							Text = Player.AltDesktopInstruction,
							Font = BodyFont,
							TextSize = TextSmallSize,
							TextColor3 = Color,
							TextTransparency = Transparency,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						})
					})
				})
			})
		end)
	end)
end