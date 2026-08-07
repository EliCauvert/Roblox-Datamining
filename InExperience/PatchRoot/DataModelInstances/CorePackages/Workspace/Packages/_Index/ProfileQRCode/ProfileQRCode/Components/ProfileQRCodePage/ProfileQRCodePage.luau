local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local localizationModule = require(parent.Localization)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local profileShareLinksModule = require(parent.ProfileShareLinks)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useProfileShareLink = profileShareLinksModule.Hooks.useProfileShareLink
local profileSharePolicyEnum = profileShareLinksModule.Enums.ProfileSharePolicyEnum
local roactUtilsModule = require(parent.RoactUtils)
local button = UIBloxModule.App.Button.Button
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local standardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local verticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local images = UIBloxModule.App.ImageSet.Images
local foundationModule = require(parent.Foundation)
local inputLabel = foundationModule.InputLabel
local inputLabelSize = foundationModule.Enums.InputLabelSize
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var9 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local profileQRCodeTopElementsModule = require(profileQRCode.Components.ProfileQRCodeTopElements)
local QRCodeViewModule = require(profileQRCode.Components.QRCodeView)
local textKeysModule = require(profileQRCode.Common.TextKeys)
local useIsWideMode = require(parent.SocialCommon).Hooks.useIsWideMode
local useLocalization = localizationModule.Hooks.useLocalization
local useStyle = UIBloxModule.Core.Style.useStyle
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local color3 = Color3.new(1, 1, 1)
local fFlagProfileQRCodeFixFocusNavigationModule = require(profileQRCode.Flags.FFlagProfileQRCodeFixFocusNavigation)
local fFlagQRCodeCopyUpdates = require(parent.SharedFlags).FFlagQRCodeCopyUpdates
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fStringCanAccessTrustedContactsAmpFeature = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature
local fFlagTCPolicyCheckRedirect = require(parent.SharedFlags).FFlagTCPolicyCheckRedirect
local fStringIsUserInTcEligibleCountryAmpFeature = require(parent.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature
local fStringCanAccessTrustedContactsAmpNameSpace = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local ampApiProvider = require(parent.AmpUpsell).AmpApiProvider
local ampEnums = require(parent.AmpUpsell).AmpEnums

return function(p0) --[[ line: 85 ]]
	-- upvalues: useDispatch (ref), useAppPolicy (ref), useLocalization (ref), textKeysModule (ref), fFlagQRCodeCopyUpdates (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var9 (ref), navigateDown (ref), fFlagProfileQRCodeFixFocusNavigationModule (ref), useIsWideMode (ref), useStyle (ref), useLastInputMode (ref), useFocusGuiObject (ref), useProfileShareLink (ref), contexts (ref), profileSharePolicyEnum (ref), images (ref), fFlagTCPolicyCheckRedirect (ref), fStringIsUserInTcEligibleCountryAmpFeature (ref), fStringCanAccessTrustedContactsAmpFeature (ref), ampApiProvider (ref), fStringCanAccessTrustedContactsAmpNameSpace (ref), ampEnums (ref), profileQRCodeTopElementsModule (ref), verticalScrollView (ref), color3 (ref), QRCodeViewModule (ref), styledTextLabel (ref), inputLabel (ref), inputLabelSize (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var15 = useDispatch()
	local var16 = useAppPolicy(function(p1) --[[ line: 88 ]]
		return p1.getWebViewSupport()
	end)
	local var17 = useLocalization({
		learnMore = "Feature.Chat.Action.LearnMore",
		description = textKeysModule.ScanQRText,
		descriptionTCEducation = if fFlagQRCodeCopyUpdates then textKeysModule.TrustedConnectionDescription else nil,
		descriptionTrustedFriends = if fFlagConnectionsToFriendsRename then textKeysModule.TrustedFriendsDescription else nil,
		shareProfileLink = textKeysModule.ShareProfileLink,
		copyProfileLink = textKeysModule.CopyProfileLink
	})
	local var18 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var9 (copy), var15 (ref), navigateDown (copy)
		local t = {
			detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812",
			name = appPage.GenericWebPage,
			extraProps = { title = "" }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var9.down(var9.fromLegacyPage(t))
			
			return
		end
		var15(navigateDown(t, nil))
	end, { var15 })
	local var19, var20 = reactModule.useState(false)
	local var21 = if fFlagProfileQRCodeFixFocusNavigationModule then reactModule.useRef(nil) else nil
	local var22 = useIsWideMode()
	local var23 = useStyle()
	local var24 = if fFlagProfileQRCodeFixFocusNavigationModule then useLastInputMode() else nil
	local var25 = if fFlagProfileQRCodeFixFocusNavigationModule then useFocusGuiObject() else nil
	local var26 = useProfileShareLink({ context = contexts.ProfileQRCode })
	local var27 = var26.policy ~= profileSharePolicyEnum.Disabled and var26.hasLoaded
	local copyProfileLink = nil
	local link = nil
	
	if var26.policy == profileSharePolicyEnum.Share then
		copyProfileLink = var17.shareProfileLink
		link = images["icons/actions/share"]
	elseif var26.policy == profileSharePolicyEnum.Copy then
		copyProfileLink = var17.copyProfileLink
		link = images["icons/menu/link"]
	end
	if fFlagProfileQRCodeFixFocusNavigationModule then
		reactModule.useEffect(function() --[[ line: 137 ]]
			-- upvalues: var25 (ref), var21 (ref), var24 (ref)
			if var25 and var21 and (var21.current and var24 == "Focus") then
				var25(var21.current)
			end
		end, {})
	end
	local var28, var29 = reactModule.useState(false)
	local var30, var31 = reactModule.useState(false)
	
	if fFlagQRCodeCopyUpdates then
		reactModule.useEffect(function() --[[ line: 148 ]]
			-- upvalues: fFlagTCPolicyCheckRedirect (copy), fStringIsUserInTcEligibleCountryAmpFeature (copy), fStringCanAccessTrustedContactsAmpFeature (copy), ampApiProvider (copy), fStringCanAccessTrustedContactsAmpNameSpace (copy), ampEnums (copy), var29 (ref), var31 (ref)
			if ampApiProvider.upsellFeatureAccess(if fFlagTCPolicyCheckRedirect then fStringIsUserInTcEligibleCountryAmpFeature else fStringCanAccessTrustedContactsAmpFeature, {}, fStringCanAccessTrustedContactsAmpNameSpace).access == ampEnums.AccessResponseEnum.Granted then
				var29(true)
			end
			var31(true)
		end, {})
	end
	local createElement_4
	local createElement = reactModule.createElement
	local var32 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}
	local t_1 = {
		TopElements = reactModule.createElement(profileQRCodeTopElementsModule, {
			appStorageService = p0.appStorageService,
			onClose = p0.onClose,
			openQrCodeScanner = p0.openQrCodeScanner,
			robloxEventReceiver = p0.robloxEventReceiver
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		useAutomaticCanvasSize = true,
		size = if var22 then nil else UDim2.new(1, 0, 1, -24),
		canvasSizeY = UDim.new(),
		position = UDim2.new(0, 0, 0, 56)
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var37 = "Frame"
	local t_4 = {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = color3,
		BackgroundTransparency = if var22 then 0.7 else 1,
		Position = UDim2.fromScale(0, 0),
		Size = if var22 then UDim2.fromScale(0.6, 1) else UDim2.fromScale(1, 1),
		BorderSizePixel = 0,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2) --[[ line: 183 ]]
			-- upvalues: var20 (ref)
			if p2.AbsoluteSize.Y >= 450 then
				var20(true)
				
				return
			end
			var20(false)
		end)
	}
	local t_5 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		})
	}
	local createElement_3 = reactModule.createElement
	local var40 = "Frame"
	local t_6 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = if var22 then UDim2.new(1, 0, 1, -56) else UDim2.new(1, 0, 0.5, 0)
	}
	local t_7 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24),
			PaddingBottom = UDim.new(0, 24),
			PaddingLeft = UDim.new(0, 24)
		}),
		QRCodeView = reactModule.createElement(QRCodeViewModule, { layoutOrder = 1, isSmallScreen = var19 }),
		Spacer1 = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromOffset(0, if var19 then 12 else 24)
		})
	}
	
	if fFlagQRCodeCopyUpdates and var30 == false then
		createElement_4 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(0, 304, 0, 45)
		})
	else
		createElement_4 = reactModule.createElement
		createElement_4 = createElement_4(styledTextLabel, {
			layoutOrder = 3,
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			text = if fFlagQRCodeCopyUpdates and var28 then if fFlagConnectionsToFriendsRename then var17.descriptionTrustedFriends else var17.descriptionTCEducation else var17.description,
			fontStyle = var23.Font.CaptionBody,
			colorStyle = var23.Theme.TextDefault,
			size = if fFlagQRCodeCopyUpdates and var28 then UDim2.new(0, 304, 0, 0) else UDim2.new(1, 0, 0, 0),
			automaticSize = Enum.AutomaticSize.Y,
			textXAlignment = if fFlagQRCodeCopyUpdates and var28 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			textYAlignment = if fFlagQRCodeCopyUpdates and var28 then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center
		})
	end
	t_7.Description = createElement_4
	t_7.LearnMoreWebLink = if not var16 then if fFlagQRCodeCopyUpdates and var30 == false then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = UDim2.new(0, 304, 0, 15)
	}) elseif fFlagQRCodeCopyUpdates and var28 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 4,
		Size = UDim2.new(0, 304, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		LearnMoreWebLink = reactModule.createElement(inputLabel, {
			tag = "auto-y size-full-0 text-align-x-left",
			RichText = true,
			Text = `<u>{var17.learnMore}</u>`,
			size = inputLabelSize.Small,
			onActivated = var18
		})
	}) else reactModule.createElement(inputLabel, {
		LayoutOrder = 4,
		tag = "auto-y size-full-0",
		RichText = true,
		Text = `<u>{var17.learnMore}</u>`,
		size = inputLabelSize.Small,
		onActivated = var18
	}) else nil
	t_7.ProfileShareButtonContainer = if var27 then reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = 5,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 24),
			PaddingBottom = UDim.new(0, 24)
		}),
		ProfileShareButton = reactModule.createElement(button, {
			maxWidth = 304,
			buttonType = buttonType.PrimarySystem,
			standardSize = standardButtonSize.Regular,
			text = copyProfileLink,
			icon = link,
			onActivated = var26.onActivated,
			ref = if fFlagProfileQRCodeFixFocusNavigationModule then var21 else nil
		})
	}) else nil
	t_7.UISizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, 420) })
	t_5.Content = createElement_3(var40, t_6, t_7)
	t_5.Gradient = reactModule.createElement("UIGradient", {
		Rotation = 90,
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, var23.Theme.BackgroundContrast.Color),
			ColorSequenceKeypoint.new(1, var23.Theme.BackgroundContrast.Color)
		}),
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.4),
			NumberSequenceKeypoint.new(1, 0)
		})
	})
	t_3.GradientBackground = createElement_2(var37, t_4, t_5)
	t_1.VerticalScrollView = createElement_1(verticalScrollView, t_2, t_3)
	
	return createElement(var32, t, t_1)
end