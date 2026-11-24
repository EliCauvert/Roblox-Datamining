local Parent = script.Parent
local Parent1 = Parent.Parent
local ArgCheckModule = require(Parent1.ArgCheck)
local AppCommonLibModule = require(Parent1.AppCommonLib)
local IsTenFootInterface = AppCommonLibModule.isTenFootInterface
local IsVRAppBuild = AppCommonLibModule.IsVRAppBuild
local AccountSettingsPageModule = require(Parent.AccountSettingsPage)
local WebViewWindowModule = require(Parent.WebViewWindow)

local function supportsWebViews()
	-- upvalues: Parent1 (copy)
	return require(Parent1.UniversalAppPolicy).getAppFeaturePolicies().getWebViewSupport()
end

local function isInApp(): boolean
	return game.GameId == 0
end

local function getPresentation(p1)
	-- upvalues: IsTenFootInterface (copy), IsVRAppBuild (copy), supportsWebViews (copy)
	local Internal = p1 and p1.internal
	
	if Internal and Internal.presentation then
		return Internal.presentation
	elseif (p1 and p1.isConsole or IsTenFootInterface)() then
		return "QrCode"
	elseif (p1 and p1.isXR or IsVRAppBuild)() then
		return "ExternalBrowser"
	else
		local SupportsWebViews = p1 and p1.supportsWebViews or supportsWebViews
		
		return if SupportsWebViews() then "Webview" else "QrCode"
	end
end

local function openExternalUrl(p1)
	-- upvalues: Parent1 (copy)
	local Default = require(Parent1.LinkingProtocol).LinkingProtocol.default
	Default:openURL(p1):andThen(function(Enabled)
		-- upvalues: Default (copy), p1 (copy)
		if Enabled == false then
			Default:openURL(p1)
		end
	end)
end

return function(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), getPresentation (copy), Parent (copy), openExternalUrl (copy), AccountSettingsPageModule (copy), WebViewWindowModule (copy), isInApp (copy)
	ArgCheckModule.isType(p2, "table", "openAccountSettings options")
	local T = if type(p2) == "table" then p2 else {}
	ArgCheckModule.isNonEmptyString(T.surfaceKey, "options.surfaceKey")
	local OnClosed = T.onClosed
	local Presentation = getPresentation(p3)
	
	if Presentation == "QrCode" then
		(p3 and p3.showQrCode or require(Parent.QrCodePresenter).show)(p1, OnClosed)
		
		return
	end
	if Presentation == "ExternalBrowser" then
		(p3 and p3.openExternalUrl or openExternalUrl)(AccountSettingsPageModule.getUrl(p1))
		
		return
	else
		local config = {
			windowType = if IsInApp() then "Fullscreen" else "Dialog",
			onClosed = OnClosed
		}
		local IsInApp = p3 and p3.isInApp or isInApp;
		(p3 and p3.webViewWindow or WebViewWindowModule.getDefault()).open(AccountSettingsPageModule.getUrl(p1), AccountSettingsPageModule.getTitle(p1), config)
	end
end