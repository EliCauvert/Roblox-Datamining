local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local AppStorageService = game:GetService("AppStorageService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local IXPService = game:GetService("IXPService")
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local MakeBackButtonFunction = require(Parent.AppHeaderBar).makeBackButton
local ExternalEventConnection = require(Parent.RoactUtils).ExternalEventConnection
local InputUtilities = require(Parent.SocialCommon).Utils.InputUtilities
local EventNamesModule = require(ProfileQRCode.Analytics.EventNames)
local TextKeysModule = require(ProfileQRCode.Common.TextKeys)
local UseAnalyticsModule = require(ProfileQRCode.Analytics.useAnalytics)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local FFlagProfileQRCodeFixFocusNavigationModule = require(ProfileQRCode.Flags.FFlagProfileQRCodeFixFocusNavigation)

local function _(p1): boolean --[[ Line: 42 | Named "getTooltipWasShown" ]]
	-- upvalues: AppStorageService (copy)
	local P0 = p1 or AppStorageService
	assert(P0 ~= nil, "AppStorageService is not nil")
	local Success, Result = pcall(function() --[[ Line: 46 ]]
		-- upvalues: P0 (ref)
		return P0:GetItem("QrCodeScannerTooltipSeen")
	end)
	
	return if Success and Result ~= nil then Result == "true" else false
end

local _ = function(p1, p2) --[[ Line: 57 | Named "setTooltipWasShown" ]]
	-- upvalues: AppStorageService (copy)
	local P1 = p1 or AppStorageService
	assert(P1 ~= nil, "AppStorageService is not nil")
	pcall(function() --[[ Line: 61 ]]
		-- upvalues: P1 (ref), p2 (copy)
		P1:SetItem("QrCodeScannerTooltipSeen", (tostring(p2)))
		P1:Flush()
	end)
end

return function(p1) --[[ Line: 75 ]]
	-- upvalues: FFlagProfileQRCodeFixFocusNavigationModule (copy), UseLastInputModeFunction (copy), UseAnalyticsModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseAppPolicyFunction (copy), ReactModule (copy), AppStorageService (copy), EventNamesModule (copy), InputUtilities (copy), IXPService (copy), AppUserLayers (copy), CoreGui (copy), TooltipOrientation (copy), WithTooltipFunction (copy), IconButton (copy), Images (copy), IconSize (copy), ExternalEventConnection (copy), UserInputService (copy), MakeBackButtonFunction (copy), HeaderBar (copy)
	local IsFocus = if FFlagProfileQRCodeFixFocusNavigationModule then UseLastInputModeFunction() == "Focus" else nil
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseLocalizationResult = UseLocalizationFunction({
		title = TextKeysModule.Title,
		tooltipBodyText = TextKeysModule.TooltipText,
		tooltipHeaderText = TextKeysModule.TooltipTitle
	})
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 84 ]]
		return p2.getFriendCodeQrCodeScannerEnabled()
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 89 ]]
		-- upvalues: p1 (copy), AppStorageService (upval), UseStateResult2 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		local AppStorageService1 = p1.appStorageService or AppStorageService
		assert(AppStorageService1 ~= nil, "AppStorageService is not nil")
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: AppStorageService1 (ref)
			return AppStorageService1:GetItem("QrCodeScannerTooltipSeen")
		end)
		local IsTrue: boolean = if Success and Result ~= nil then Result == "true" else false
		UseStateResult2(not IsTrue)
		
		if not IsTrue then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.QRCodeScannerTooltipShown)
		end
	end, {})
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 97 ]]
		-- upvalues: InputUtilities (upval), UseStateResult (copy), UseStateResult2 (copy), p1 (copy), AppStorageService (upval)
		if InputUtilities.isActivationInput(p2) and UseStateResult then
			UseStateResult2(false)
			local AppStorageService1 = p1.appStorageService or AppStorageService
			assert(AppStorageService1 ~= nil, "AppStorageService is not nil")
			local v1 = true
			pcall(function() --[[ Line: 61 ]]
				-- upvalues: AppStorageService1 (ref), v1 (copy)
				AppStorageService1:SetItem("QrCodeScannerTooltipSeen", (tostring(v1)))
				AppStorageService1:Flush()
			end)
		end
	end, { UseStateResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 106 ]]
		-- upvalues: IXPService (upval), AppUserLayers (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy)
		IXPService:LogUserLayerExposure(AppUserLayers.ProfileQRCodeScannerLayer)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.QRCodeScannerOpened)
		p1.openQrCodeScanner()
	end, { p1.openQrCodeScanner })
	local TooltipBodyText = UseLocalizationResult.tooltipBodyText
	local TooltipHeaderText = UseLocalizationResult.tooltipHeaderText
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 115 ]]
		-- upvalues: TooltipBodyText (copy), TooltipHeaderText (copy), UseStateResult (copy), CoreGui (upval), TooltipOrientation (upval), WithTooltipFunction (upval), ReactModule (upval), IconButton (upval), Images (upval), IconSize (upval), UseResult1 (copy), ExternalEventConnection (upval), UserInputService (upval), UseResult (copy)
		return WithTooltipFunction({
			bodyText = TooltipBodyText,
			headerText = TooltipHeaderText
		}, {
			DisplayOrder = 10,
			active = UseStateResult,
			guiTarget = CoreGui,
			preferredOrientation = TooltipOrientation.Bottom
		}, function(OnAbsolutePositionChanged) --[[ Line: 128 ]]
			-- upvalues: ReactModule (upval), IconButton (upval), Images (upval), IconSize (upval), UseResult1 (upval), ExternalEventConnection (upval), UserInputService (upval), UseResult (upval)
			return ReactModule.createElement(IconButton, {
				icon = Images["icons/actions/scan"],
				iconSize = IconSize.Medium,
				onActivated = UseResult1,
				size = UDim2.fromOffset(0, 0),
				onAbsolutePositionChanged = OnAbsolutePositionChanged,
				[ReactModule.Change.AbsoluteSize] = OnAbsolutePositionChanged
			}, {
				InputBeganConnection = ReactModule.createElement(ExternalEventConnection, {
					event = UserInputService.InputBegan,
					callback = UseResult
				})
			})
		end)
	end, {
		UseResult1,
		UseAppPolicyResult,
		UseStateResult,
		TooltipBodyText,
		TooltipHeaderText
	})
	local BackButton = MakeBackButtonFunction(p1.onClose)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, 56),
		LayoutOrder = p1.layoutOrder
	}, {
		headerBar = ReactModule.createElement(HeaderBar, {
			isSecondary = true,
			backgroundTransparency = 1,
			barHeight = 56,
			title = UseLocalizationResult.title,
			renderLeft = if FFlagProfileQRCodeFixFocusNavigationModule and not IsFocus then BackButton elseif FFlagProfileQRCodeFixFocusNavigationModule then nil else BackButton,
			renderRight = if UseAppPolicyResult then UseResult2 else nil
		})
	})
end