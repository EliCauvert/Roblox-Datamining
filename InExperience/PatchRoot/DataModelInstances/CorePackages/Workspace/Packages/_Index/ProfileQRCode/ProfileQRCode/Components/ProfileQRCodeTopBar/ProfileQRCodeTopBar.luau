local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local appStorageService = game:GetService("AppStorageService")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local IXPService = game:GetService("IXPService")
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local socialCommonModule = require(parent.SocialCommon)
local UIBloxModule = require(parent.UIBlox)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local makeBackButton = require(parent.AppHeaderBar).makeBackButton
local externalEventConnection = roactUtilsModule.ExternalEventConnection
local inputUtilities = socialCommonModule.Utils.InputUtilities
local eventNamesModule = require(profileQRCode.Analytics.EventNames)
local textKeysModule = require(profileQRCode.Common.TextKeys)
local useAnalyticsModule = require(profileQRCode.Analytics.useAnalytics)
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local useLocalization = localizationModule.Hooks.useLocalization
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local fFlagProfileQRCodeFixFocusNavigationModule = require(profileQRCode.Flags.FFlagProfileQRCodeFixFocusNavigation)

local function _(p0) --[[ line: 42 | named "getTooltipWasShown" ]]
	-- upvalues: appStorageService (ref)
	p0 = p0 or appStorageService
	assert(p0 ~= nil, "AppStorageService is not nil")
	local ok, status = pcall(function() --[[ line: 46 ]]
		-- upvalues: p0 (write)
		return p0:GetItem("QrCodeScannerTooltipSeen")
	end)
	
	return if ok and status ~= nil then status == "true" else false
end

local _ = function(value, p1) --[[ line: 57 | named "setTooltipWasShown" ]]
	-- upvalues: appStorageService (ref)
	value = value or appStorageService
	assert(value ~= nil, "AppStorageService is not nil")
	pcall(function() --[[ line: 61 ]]
		-- upvalues: value (write), p1 (ref)
		value:SetItem("QrCodeScannerTooltipSeen", tostring(p1))
		value:Flush()
	end)
end

return function(p2) --[[ line: 75 ]]
	-- upvalues: fFlagProfileQRCodeFixFocusNavigationModule (ref), useLastInputMode (ref), useAnalyticsModule (ref), useLocalization (ref), textKeysModule (ref), useAppPolicy (ref), reactModule (ref), appStorageService (ref), eventNamesModule (ref), inputUtilities (ref), IXPService (ref), appUserLayers (ref), coreGuiService (ref), tooltipOrientation (ref), withTooltip (ref), iconButton (ref), images (ref), iconSize (ref), externalEventConnection (ref), userInputService (ref), makeBackButton (ref), headerBar (ref)
	local isFocus
	if fFlagProfileQRCodeFixFocusNavigationModule then
		isFocus = useLastInputMode() == "Focus"
		isFocus = nil
	else
		isFocus = nil
	end
	local var17 = useAnalyticsModule()
	local var18 = useLocalization({
		title = textKeysModule.Title,
		tooltipBodyText = textKeysModule.TooltipText,
		tooltipHeaderText = textKeysModule.TooltipTitle
	})
	local var19 = useAppPolicy(function(p3) --[[ line: 84 ]]
		return p3.getFriendCodeQrCodeScannerEnabled()
	end)
	local var20, var21 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 89 ]]
		-- upvalues: p2 (ref), appStorageService (copy), var21 (ref), var17 (ref), eventNamesModule (copy)
		local isTrue
		local appStorageService_1 = p2.appStorageService or appStorageService
		assert(appStorageService_1 ~= nil, "AppStorageService is not nil")
		local ok, status = pcall(function() --[[ line: 46 ]]
			-- upvalues: appStorageService_1 (write)
			return appStorageService_1:GetItem("QrCodeScannerTooltipSeen")
		end)
		
		if ok and status ~= nil then
			isTrue = status == "true"
			isTrue = nil
		else
			isTrue = false
		end
		var21(not isTrue)
		
		if not isTrue then
			var17.fireEvent(eventNamesModule.QRCodeScannerTooltipShown)
		end
	end, {})
	local var22 = reactModule.useCallback(function(p4) --[[ line: 97 ]]
		-- upvalues: inputUtilities (copy), var20 (ref), var21 (ref), p2 (ref), appStorageService (copy)
		if inputUtilities.isActivationInput(p4) and var20 then
			var21(false)
			local appStorageService_1 = p2.appStorageService or appStorageService
			assert(appStorageService_1 ~= nil, "AppStorageService is not nil")
			local var27 = true
			pcall(function() --[[ line: 61 ]]
				-- upvalues: appStorageService_1 (write), var27 (ref)
				appStorageService_1:SetItem("QrCodeScannerTooltipSeen", tostring(var27))
				appStorageService_1:Flush()
			end)
		end
	end, { var20 })
	local var23 = reactModule.useCallback(function() --[[ line: 106 ]]
		-- upvalues: IXPService (copy), appUserLayers (copy), var17 (ref), eventNamesModule (copy), p2 (ref)
		IXPService:LogUserLayerExposure(appUserLayers.ProfileQRCodeScannerLayer)
		var17.fireEvent(eventNamesModule.QRCodeScannerOpened)
		p2.openQrCodeScanner()
	end, { p2.openQrCodeScanner })
	local tooltipBodyText = var18.tooltipBodyText
	local tooltipHeaderText = var18.tooltipHeaderText
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, 56),
		LayoutOrder = p2.layoutOrder
	}, {
		headerBar = reactModule.createElement(headerBar, {
			isSecondary = true,
			backgroundTransparency = 1,
			barHeight = 56,
			title = var18.title,
			renderLeft = if fFlagProfileQRCodeFixFocusNavigationModule and not isFocus or not fFlagProfileQRCodeFixFocusNavigationModule then makeBackButton(p2.onClose) else nil,
			renderRight = if var19 then reactModule.useCallback(function() --[[ line: 115 ]]
				-- upvalues: tooltipBodyText (ref), tooltipHeaderText (ref), var20 (ref), coreGuiService (copy), tooltipOrientation (copy), withTooltip (copy), reactModule (copy), iconButton (copy), images (copy), iconSize (copy), var23 (ref), externalEventConnection (copy), userInputService (copy), var22 (ref)
				return withTooltip({
					bodyText = tooltipBodyText,
					headerText = tooltipHeaderText
				}, {
					DisplayOrder = 10,
					active = var20,
					guiTarget = coreGuiService,
					preferredOrientation = tooltipOrientation.Bottom
				}, function(p5) --[[ line: 128 ]]
					-- upvalues: reactModule (copy), iconButton (copy), images (copy), iconSize (copy), var23 (copy), externalEventConnection (copy), userInputService (copy), var22 (copy)
					return reactModule.createElement(iconButton, {
						icon = images["icons/actions/scan"],
						iconSize = iconSize.Medium,
						onActivated = var23,
						size = UDim2.fromOffset(0, 0),
						onAbsolutePositionChanged = p5,
						[reactModule.Change.AbsoluteSize] = p5
					}, {
						InputBeganConnection = reactModule.createElement(externalEventConnection, { event = userInputService.InputBegan, callback = var22 })
					})
				end)
			end, {
				var23,
				var19,
				var20,
				tooltipBodyText,
				tooltipHeaderText
			}) else nil
		})
	})
end