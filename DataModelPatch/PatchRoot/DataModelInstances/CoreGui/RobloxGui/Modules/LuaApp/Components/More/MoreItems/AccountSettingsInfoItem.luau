local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local QRCodeDisplayModule = require(CorePackages.Workspace.Packages.QRCodeDisplay)
local DisplayQRCode = QRCodeDisplayModule.DisplayQRCode
local ECLevels = QRCodeDisplayModule.ECLevels
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local MoreTextModule = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreText)
local BodyText = MoreTextModule.BodyText
local SubheaderText = MoreTextModule.SubheaderText
local BoldBodyText = MoreTextModule.BoldBodyText
local _ = require(script.Parent.Types)
local AccountResult = require(Modules.LuaApp.Http.UrlBuilder).static.settings.account()

local function TextInfo(p1)
	-- upvalues: ReactModule (copy), SubheaderText (copy), BodyText (copy), BoldBodyText (copy)
	local BodyText1 = p1.bodyText
	local BoldBodyText1 = p1.boldBodyText
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = p1.itemsPadding
		}),
		Subheader = ReactModule.createElement(SubheaderText, { layoutOrder = 1, text = p1.subheaderText }),
		Body = if BodyText1 then ReactModule.createElement(BodyText, { layoutOrder = 2, text = BodyText1 }) else nil,
		BoldBody = if BoldBodyText1 then ReactModule.createElement(BoldBodyText, { layoutOrder = 3, text = BoldBodyText1 }) else nil
	})
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), TextInfo (copy), AccountResult (copy), DisplayQRCode (copy), ECLevels (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local _UDim = UDim.new(0, UseDesignTokensResult.Size.Size_400)
	local QrSize = UseDesignTokensResult.LuaApps.More.QrSize
	local UseLocalizationResult = UseLocalizationFunction({
		accountSettingsWebsite = "Feature.Settings.Subheading.AccountSettingsWebsite",
		accountSettingsWebsiteDescription = "Feature.Settings.Description.AccountSettingsWebsite",
		accountSettingsScan = "Feature.Settings.Subheading.AccountSettingsScan",
		accountSettingsScanDescription = "Feature.Settings.Description.AccountSettingsScan"
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}), ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, -QrSize, 1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = _UDim
		}), ReactModule.createElement(TextInfo, {
			layoutOrder = 1,
			itemsPadding = _UDim,
			subheaderText = UseLocalizationResult.accountSettingsWebsite,
			bodyText = UseLocalizationResult.accountSettingsWebsiteDescription,
			boldBodyText = AccountResult
		}), ReactModule.createElement(TextInfo, {
			layoutOrder = 2,
			itemsPadding = _UDim,
			subheaderText = UseLocalizationResult.accountSettingsScan,
			bodyText = UseLocalizationResult.accountSettingsScanDescription
		})), ReactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 2 }, ReactModule.createElement(DisplayQRCode, {
			ecLevel = ECLevels.EC_LEVEL_1,
			sideLength = QrSize,
			toEncode = AccountResult
		})))
	})
end