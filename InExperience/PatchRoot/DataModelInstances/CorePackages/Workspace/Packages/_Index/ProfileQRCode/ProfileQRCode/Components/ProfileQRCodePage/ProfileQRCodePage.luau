local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local ProfileShareLinksModule = require(Parent.ProfileShareLinks)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseProfileShareLinkFunction = ProfileShareLinksModule.Hooks.useProfileShareLink
local ProfileSharePolicyEnum = ProfileShareLinksModule.Enums.ProfileSharePolicyEnum
local Button = UIBloxModule.App.Button.Button
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local Images = UIBloxModule.App.ImageSet.Images
local FoundationModule = require(Parent.Foundation)
local InputLabel = FoundationModule.InputLabel
local InputLabelSize = FoundationModule.Enums.InputLabelSize
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local ProfileQRCodeTopElementsModule = require(ProfileQRCode.Components.ProfileQRCodeTopElements)
local QRCodeViewModule = require(ProfileQRCode.Components.QRCodeView)
local TextKeysModule = require(ProfileQRCode.Common.TextKeys)
local UseIsWideModeFunction = require(Parent.SocialCommon).Hooks.useIsWideMode
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local _Color3 = Color3.new(1, 1, 1)
local FFlagProfileQRCodeFixFocusNavigationModule = require(ProfileQRCode.Flags.FFlagProfileQRCodeFixFocusNavigation)
local FFlagQRCodeCopyUpdates = require(Parent.SharedFlags).FFlagQRCodeCopyUpdates
local FFlagQRCodePageVisualRefresh = require(Parent.SharedFlags).FFlagQRCodePageVisualRefresh
local FStringCanAccessTrustedContactsAmpFeature = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature
local FFlagTCPolicyCheckRedirect = require(Parent.SharedFlags).FFlagTCPolicyCheckRedirect
local FStringIsUserInTcEligibleCountryAmpFeature = require(Parent.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature
local FStringCanAccessTrustedContactsAmpNameSpace = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AmpEnums = require(Parent.AmpUpsell).AmpEnums

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FFlagProfileQRCodeFixFocusNavigationModule (copy), UseIsWideModeFunction (copy), UseStyleFunction (copy), UseLastInputModeFunction (copy), UseFocusGuiObjectFunction (copy), UseProfileShareLinkFunction (copy), Contexts (copy), ProfileSharePolicyEnum (copy), Images (copy), FFlagQRCodeCopyUpdates (copy), FFlagTCPolicyCheckRedirect (copy), FStringIsUserInTcEligibleCountryAmpFeature (copy), FStringCanAccessTrustedContactsAmpFeature (copy), AmpApiProvider (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), AmpEnums (copy), FFlagQRCodePageVisualRefresh (copy), FoundationModule (copy), ProfileQRCodeTopElementsModule (copy), VerticalScrollView (copy), _Color3 (copy), QRCodeViewModule (copy), StyledTextLabel (copy), InputLabel (copy), InputLabelSize (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getWebViewSupport()
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		learnMore = "Feature.Chat.Action.LearnMore",
		description = TextKeysModule.ScanQRText,
		descriptionTrustedFriends = TextKeysModule.TrustedFriendsDescription,
		shareProfileLink = TextKeysModule.ShareProfileLink,
		copyProfileLink = TextKeysModule.CopyProfileLink
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812",
			name = AppPage.GenericWebPage,
			extraProps = { title = "" }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config, nil))
		end
	end, { UseDispatchResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = if FFlagProfileQRCodeFixFocusNavigationModule then ReactModule.useRef(nil) else nil
	local UseIsWideModeResult = UseIsWideModeFunction()
	local UseStyleResult = UseStyleFunction()
	local UseLastInputModeResult = if FFlagProfileQRCodeFixFocusNavigationModule then UseLastInputModeFunction() else nil
	local UseFocusGuiObjectResult = if FFlagProfileQRCodeFixFocusNavigationModule then UseFocusGuiObjectFunction() else nil
	local UseProfileShareLinkResult = UseProfileShareLinkFunction({ context = Contexts.ProfileQRCode })
	local HasLoaded = UseProfileShareLinkResult.policy ~= ProfileSharePolicyEnum.Disabled and UseProfileShareLinkResult.hasLoaded
	local CopyProfileLink = nil
	local IconsActionsShare = nil
	
	if UseProfileShareLinkResult.policy == ProfileSharePolicyEnum.Share then
		CopyProfileLink = UseLocalizationResult.shareProfileLink
		IconsActionsShare = Images["icons/actions/share"]
	elseif UseProfileShareLinkResult.policy == ProfileSharePolicyEnum.Copy then
		CopyProfileLink = UseLocalizationResult.copyProfileLink
		IconsActionsShare = Images["icons/menu/link"]
	end
	if FFlagProfileQRCodeFixFocusNavigationModule then
		ReactModule.useEffect(function()
			-- upvalues: UseFocusGuiObjectResult (copy), UseRefResult (copy), UseLastInputModeResult (copy)
			if UseFocusGuiObjectResult and UseRefResult and UseRefResult.current and UseLastInputModeResult == "Focus" then
				UseFocusGuiObjectResult(UseRefResult.current)
			end
		end, {})
	end
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	
	if FFlagQRCodeCopyUpdates then
		ReactModule.useEffect(function()
			-- upvalues: FFlagTCPolicyCheckRedirect (upval), FStringIsUserInTcEligibleCountryAmpFeature (upval), FStringCanAccessTrustedContactsAmpFeature (upval), AmpApiProvider (upval), FStringCanAccessTrustedContactsAmpNameSpace (upval), AmpEnums (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
			if AmpApiProvider.upsellFeatureAccess(if FFlagTCPolicyCheckRedirect then FStringIsUserInTcEligibleCountryAmpFeature else FStringCanAccessTrustedContactsAmpFeature, {}, FStringCanAccessTrustedContactsAmpNameSpace).access == AmpEnums.AccessResponseEnum.Granted then
				UseStateResult2_1(true)
			end
			UseStateResult2_2(true)
		end, {})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}, {
		WidePanel = if FFlagQRCodePageVisualRefresh and UseIsWideModeResult then ReactModule.createElement(FoundationModule.View, {
			tag = "bg-over-media-100",
			ZIndex = 0,
			Size = UDim2.fromScale(0.6, 1)
		}) else nil,
		TopElements = ReactModule.createElement(ProfileQRCodeTopElementsModule, {
			appStorageService = p1.appStorageService,
			onClose = p1.onClose,
			openQrCodeScanner = p1.openQrCodeScanner,
			robloxEventReceiver = p1.robloxEventReceiver
		}),
		VerticalScrollView = ReactModule.createElement(VerticalScrollView, {
			useAutomaticCanvasSize = true,
			size = if UseIsWideModeResult then nil else UDim2.new(1, 0, 1, -24),
			canvasSizeY = UDim.new(),
			position = UDim2.new(0, 0, 0, 56)
		}, {
			GradientBackground = ReactModule.createElement("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = _Color3,
				BackgroundTransparency = if UseIsWideModeResult and not FFlagQRCodePageVisualRefresh then 0.7 else 1,
				Position = UDim2.fromScale(0, 0),
				Size = if UseIsWideModeResult then UDim2.fromScale(0.6, 1) else UDim2.fromScale(1, 1),
				BorderSizePixel = 0,
				[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
					-- upvalues: UseStateResult2 (copy)
					if Frame.AbsoluteSize.Y >= 450 then
						UseStateResult2(true)
						
						return
					else
						UseStateResult2(false)
					end
				end)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Bottom
				}),
				Content = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = if UseIsWideModeResult then UDim2.new(1, 0, 1, -56) else UDim2.new(1, 0, 0.5, 0)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Padding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 24),
						PaddingLeft = UDim.new(0, 24)
					}),
					QRCodeView = ReactModule.createElement(QRCodeViewModule, { layoutOrder = 1, isSmallScreen = UseStateResult }),
					Spacer1 = ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromOffset(0, if UseStateResult then 12 else 24)
					}),
					Description = if FFlagQRCodeCopyUpdates and UseStateResult3 == false then ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(0, 304, 0, 45)
					}) else ReactModule.createElement(StyledTextLabel, {
						layoutOrder = 3,
						lineHeight = 1,
						fluidSizing = false,
						richText = false,
						text = if FFlagQRCodeCopyUpdates and UseStateResult1 then UseLocalizationResult.descriptionTrustedFriends else UseLocalizationResult.description,
						fontStyle = UseStyleResult.Font.CaptionBody,
						colorStyle = UseStyleResult.Theme.TextDefault,
						size = if FFlagQRCodeCopyUpdates and UseStateResult1 then UDim2.new(0, 304, 0, 0) else UDim2.new(1, 0, 0, 0),
						automaticSize = Enum.AutomaticSize.Y,
						textXAlignment = if FFlagQRCodeCopyUpdates and UseStateResult1 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
						textYAlignment = if FFlagQRCodeCopyUpdates and UseStateResult1 then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center
					}),
					LearnMoreWebLink = if UseAppPolicyResult then if FFlagQRCodeCopyUpdates and UseStateResult3 == false then ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 4,
						Size = UDim2.new(0, 304, 0, 15)
					}) elseif FFlagQRCodeCopyUpdates and UseStateResult1 then ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 4,
						Size = UDim2.new(0, 304, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Top
						}),
						LearnMoreWebLink = ReactModule.createElement(InputLabel, {
							tag = "auto-y size-full-0 text-align-x-left",
							RichText = true,
							Text = `<u>{UseLocalizationResult.learnMore}</u>`,
							size = InputLabelSize.Small,
							onActivated = UseResult
						})
					}) else ReactModule.createElement(InputLabel, {
						LayoutOrder = 4,
						tag = "auto-y size-full-0",
						RichText = true,
						Text = `<u>{UseLocalizationResult.learnMore}</u>`,
						size = InputLabelSize.Small,
						onActivated = UseResult
					}) else nil,
					ProfileShareButtonContainer = if HasLoaded then ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromScale(1, 0)
					}, {
						Layout = ReactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
						UIPadding = ReactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 24),
							PaddingBottom = UDim.new(0, 24)
						}),
						ProfileShareButton = ReactModule.createElement(Button, {
							maxWidth = 304,
							buttonType = ButtonType.PrimarySystem,
							standardSize = StandardButtonSize.Regular,
							text = CopyProfileLink,
							icon = IconsActionsShare,
							onActivated = UseProfileShareLinkResult.onActivated,
							ref = if FFlagProfileQRCodeFixFocusNavigationModule then UseRefResult else nil
						})
					}) else nil,
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, 420) })
				}),
				Gradient = ReactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, UseStyleResult.Theme.BackgroundContrast.Color),
						ColorSequenceKeypoint.new(1, UseStyleResult.Theme.BackgroundContrast.Color)
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0.4),
						NumberSequenceKeypoint.new(1, 0)
					})
				})
			})
		})
	})
end