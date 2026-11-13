local Parent = script.Parent
local Parent1 = Parent.Parent
local ArgCheckModule = require(Parent1.ArgCheck)
local IsTenFootInterface = require(Parent1.AppCommonLib).isTenFootInterface
local AccountSettingsPageModule = require(Parent.AccountSettingsPage)
local WebViewWindowModule = require(Parent.WebViewWindow)

local function supportsWebViews()
	-- upvalues: Parent1 (copy)
	return require(Parent1.UniversalAppPolicy).getAppFeaturePolicies().getWebViewSupport()
end

local function isInApp(): boolean
	return game.GameId == 0
end

local function _(p1)
	-- upvalues: IsTenFootInterface (copy), supportsWebViews (copy)
	local Internal = p1 and p1.internal
	
	if Internal and Internal.presentation then
		return Internal.presentation
	else
		local IsConsole = p1 and p1.isConsole or IsTenFootInterface
		local SupportsWebViews = p1 and p1.supportsWebViews or supportsWebViews
		
		return if IsConsole() or not SupportsWebViews() then "QrCode" else "Webview"
	end
end

return function(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), IsTenFootInterface (copy), supportsWebViews (copy), Parent (copy), WebViewWindowModule (copy), AccountSettingsPageModule (copy), isInApp (copy)
	ArgCheckModule.isType(p2, "table", "openAccountSettings options")
	local T = if type(p2) == "table" then p2 else {}
	ArgCheckModule.isNonEmptyString(T.surfaceKey, "options.surfaceKey")
	local OnClosed = T.onClosed
	local Internal = p3 and p3.internal
	local QrCode = nil
	
	if Internal and Internal.presentation then
		QrCode = Internal.presentation
	else
		local IsConsole = p3 and p3.isConsole or IsTenFootInterface
		local SupportsWebViews = p3 and p3.supportsWebViews or supportsWebViews
		QrCode = if IsConsole() or not SupportsWebViews() then "QrCode" else "Webview"
	end
	if QrCode == "QrCode" then
		(p3 and p3.showQrCode or require(Parent.QrCodePresenter).show)(p1, OnClosed)
		
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