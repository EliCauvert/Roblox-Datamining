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

local function _(p1)
	-- upvalues: appStorageService (ref)
	p1 = p1 or appStorageService
	assert(p1 ~= nil, "AppStorageService is not nil")
	local ok, status = pcall(function()
		-- upvalues: p1 (write)
		return p1:GetItem("QrCodeScannerTooltipSeen")
	end)
	
	return if ok and status ~= nil then status == "true" else false
end

local _ = function(value, p1)
	-- upvalues: appStorageService (ref)
	value = value or appStorageService
	assert(value ~= nil, "AppStorageService is not nil")
	pcall(function()
		-- upvalues: value (write), p1 (ref)
		value:SetItem("QrCodeScannerTooltipSeen", tostring(p1))
		value:Flush()
	end)
end

return function(p1)
	-- upvalues: fFlagProfileQRCodeFixFocusNavigationModule (ref), useLastInputMode (ref), useAnalyticsModule (ref), useLocalization (ref), textKeysModule (ref), useAppPolicy (ref), reactModule (ref), appStorageService (ref), eventNamesModule (ref), inputUtilities (ref), IXPService (ref), appUserLayers (ref), coreGuiService (ref), tooltipOrientation (ref), withTooltip (ref), iconButton (ref), images (ref), iconSize (ref), externalEventConnection (ref), userInputService (ref), makeBackButton (ref), headerBar (ref)
	local isFocus
	if fFlagProfileQRCodeFixFocusNavigationModule then
		isFocus = useLastInputMode() == "Focus"
		isFocus = nil
	else
		isFocus = nil
	end
	local var1 = useAnalyticsModule()
	local var2 = useLocalization({
		title = textKeysModule.Title,
		tooltipBodyText = textKeysModule.TooltipText,
		tooltipHeaderText = textKeysModule.TooltipTitle
	})
	local var3 = useAppPolicy(function(p2)
		return p2.getFriendCodeQrCodeScannerEnabled()
	end)
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), appStorageService (copy), var5 (ref), var1 (ref), eventNamesModule (copy)
		local isTrue
		local appStorageService_1 = p1.appStorageService or appStorageService
		assert(appStorageService_1 ~= nil, "AppStorageService is not nil")
		local ok, status = pcall(function()
			-- upvalues: appStorageService_1 (write)
			return appStorageService_1:GetItem("QrCodeScannerTooltipSeen")
		end)
		
		if ok and status ~= nil then
			isTrue = status == "true"
			isTrue = nil
		else
			isTrue = false
		end
		var5(not isTrue)
		
		if not isTrue then
			var1.fireEvent(eventNamesModule.QRCodeScannerTooltipShown)
		end
	end, {})
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: inputUtilities (copy), var4 (ref), var5 (ref), p1 (ref), appStorageService (copy)
		if inputUtilities.isActivationInput(p2) and var4 then
			var5(false)
			local appStorageService_1 = p1.appStorageService or appStorageService
			assert(appStorageService_1 ~= nil, "AppStorageService is not nil")
			local var7 = true
			pcall(function()
				-- upvalues: appStorageService_1 (write), var7 (ref)
				appStorageService_1:SetItem("QrCodeScannerTooltipSeen", tostring(var7))
				appStorageService_1:Flush()
			end)
		end
	end, { var4 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: IXPService (copy), appUserLayers (copy), var1 (ref), eventNamesModule (copy), p1 (ref)
		IXPService:LogUserLayerExposure(appUserLayers.ProfileQRCodeScannerLayer)
		var1.fireEvent(eventNamesModule.QRCodeScannerOpened)
		p1.openQrCodeScanner()
	end, { p1.openQrCodeScanner })
	local tooltipBodyText = var2.tooltipBodyText
	local tooltipHeaderText = var2.tooltipHeaderText
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, 56),
		LayoutOrder = p1.layoutOrder
	}, {
		headerBar = reactModule.createElement(headerBar, {
			isSecondary = true,
			backgroundTransparency = 1,
			barHeight = 56,
			title = var2.title,
			renderLeft = if fFlagProfileQRCodeFixFocusNavigationModule and not isFocus or not fFlagProfileQRCodeFixFocusNavigationModule then makeBackButton(p1.onClose) else nil,
			renderRight = if var3 then reactModule.useCallback(function()
				-- upvalues: tooltipBodyText (ref), tooltipHeaderText (ref), var4 (ref), coreGuiService (copy), tooltipOrientation (copy), withTooltip (copy), reactModule (copy), iconButton (copy), images (copy), iconSize (copy), var7 (ref), externalEventConnection (copy), userInputService (copy), var6 (ref)
				return withTooltip({
					bodyText = tooltipBodyText,
					headerText = tooltipHeaderText
				}, {
					DisplayOrder = 10,
					active = var4,
					guiTarget = coreGuiService,
					preferredOrientation = tooltipOrientation.Bottom
				}, function(p2)
					-- upvalues: reactModule (copy), iconButton (copy), images (copy), iconSize (copy), var7 (copy), externalEventConnection (copy), userInputService (copy), var6 (copy)
					return reactModule.createElement(iconButton, {
						icon = images["icons/actions/scan"],
						iconSize = iconSize.Medium,
						onActivated = var7,
						size = UDim2.fromOffset(0, 0),
						onAbsolutePositionChanged = p2,
						[reactModule.Change.AbsoluteSize] = p2
					}, {
						InputBeganConnection = reactModule.createElement(externalEventConnection, { event = userInputService.InputBegan, callback = var6 })
					})
				end)
			end, {
				var7,
				var3,
				var4,
				tooltipBodyText,
				tooltipHeaderText
			}) else nil
		})
	})
end