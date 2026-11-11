local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local CrossDeviceLoginModule = require(Modules.LuaApp.Thunks.Authentication.CrossDeviceLogin)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local LoginCodeStatusModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodeStatus)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local GetIXPLayerParametersModule = require(Modules.LuaApp.Http.Requests.GetIXPLayerParameters)
local GetFFlagCrossDeviceInstructionExperimentModule = require(Modules.LuaApp.Flags.GetFFlagCrossDeviceInstructionExperiment)
local GetFFlagEnableCrossDeviceLoginUsingQRCodesModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes)
local GetFFlagDisableCDLQrCodeForMaquettesFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagDisableCDLQrCodeForMaquettes
local GetFFlagEnableShortLinkCodeForVRCDLFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableShortLinkCodeForVRCDL
local LoginCodePrompt = RoactModule.PureComponent:extend("LoginCodePrompt")
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local LoginCodeComponentModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodeComponent)
local ShortLinkLoginCodeComponentModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.ShortLinkLoginCodeComponent)
local LoginCodeOverlayModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodeOverlay)

function LoginCodePrompt.init(p1)
	-- upvalues: LoginCodeStatusModule (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (copy), UrlBuilderModule (copy)
	p1:setState({
		DeviceCode = "",
		AccountPictureUrl = "",
		DisplayName = "",
		AltTitle = nil,
		AltInstruction = nil,
		AltMobileInstruction = nil,
		AltDesktopInstruction = nil,
		Status = LoginCodeStatusModule.Created
	})
	
	function p1.fetchCode(Networking)
		-- upvalues: p1 (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (upval), UrlBuilderModule (upval)
		p1.props.fetchCode(Networking):andThen(function(Result)
			-- upvalues: p1 (upval), GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (upval), UrlBuilderModule (upval)
			if p1.isMounted then
				if GetFFlagEnableCrossDeviceLoginUsingQRCodesModule() and Result.QrCodePath then
					p1:setState({
						DeviceCode = Result.DeviceCode,
						QrCodeUrl = UrlBuilderModule.fromString("apis:auth-token-service" .. Result.QrCodePath)()
					})
				else
					p1:setState({ DeviceCode = Result.DeviceCode })
				end
				p1.pollLoginStatus(49, Result.DeviceCode, Result.PrivateKey)
			end
		end, function(p2)
			-- upvalues: p1 (upval)
			p1.closeWithError(p2)
		end)
	end
	
	local function _(p2, p3, p4)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), p2 (copy), p3 (copy), p4 (copy)
			wait(6)
			
			if p1.isMounted then
				if p2 > 0 then
					p1.pollLoginStatus(p2 - 1, p3, p4)
					
					return
				end
				p1.codeExpired()
			end
		end)
	end
	
	function p1.pollLoginStatus(p2, DeviceCode, PrivateKey)
		-- upvalues: p1 (copy), LoginCodeStatusModule (upval)
		p1.props.getLoginStatus(p1.props.networking, DeviceCode, PrivateKey):andThen(function(Result)
			-- upvalues: p1 (upval), LoginCodeStatusModule (upval), DeviceCode (copy), PrivateKey (copy), p2 (copy)
			if p1.isMounted then
				if Result.Status == LoginCodeStatusModule.Validated then
					p1.props.closeCentralOverlay()
					
					if p1.props.loginCallback then
						p1.props.loginCallback(DeviceCode, PrivateKey)
						
						return
					end
				else
					if Result.Status == LoginCodeStatusModule.Expired or Result.Status == LoginCodeStatusModule.Cancelled then
						p1.codeExpired()
						
						return
					end
					if p1.state.DisplayName == "" and Result.AccountName ~= "" then
						p1.props.authAnalytics.reportScreenLoaded("confirmPrompt")
					end
					p1:setState({
						Status = Result.Status,
						DisplayName = Result.AccountName,
						AccountPictureUrl = Result.AccountPictureUrl
					})
					spawn(function()
						-- upvalues: p1 (upval), p2 (copy), DeviceCode (copy), PrivateKey (copy)
						wait(6)
						
						if p1.isMounted then
							if p2 > 0 then
								p1.pollLoginStatus(p2 - 1, DeviceCode, PrivateKey)
								
								return
							end
							p1.codeExpired()
						end
					end)
				end
			end
		end, function(p3)
			-- upvalues: p1 (upval)
			if p3.Body == "\"CodeInvalid\"" then
				p1.codeExpired()
				
				return
			else
				p1.closeWithError(p3)
			end
		end)
	end
	
	function p1.codeExpired()
		-- upvalues: p1 (copy), LoginCodeStatusModule (upval)
		if p1.isMounted then
			p1:setState({
				DeviceCode = "",
				AccountPictureUrl = "",
				DisplayName = "",
				Status = LoginCodeStatusModule.Created
			})
			p1.fetchCode(p1.props.networking)
		end
	end
	
	function p1.closeButtonPressed()
		-- upvalues: p1 (copy)
		if p1.state.DeviceCode ~= "" then
			p1.props.cancelLoginCode(p1.props.networking, p1.state.DeviceCode)
		end
		p1.props.closeCentralOverlay()
	end
	
	function p1.closeWithError(p2)
		-- upvalues: p1 (copy)
		if p2 and p2.Body == "\"InvalidLocation\"" then
			p1.props.setLocationErrorToast()
		else
			p1.props.setNetworkingErrorToast()
		end
		p1.closeButtonPressed()
	end
end

function LoginCodePrompt.didMount(p1)
	-- upvalues: EventStreamConstantsModule (copy), GetFFlagCrossDeviceInstructionExperimentModule (copy), GetIXPLayerParametersModule (copy)
	p1.isMounted = true
	p1.props.authAnalytics.reportScreenLoaded(EventStreamConstantsModule.Context.CrossDeviceKey)
	p1.fetchCode(p1.props.networking)
	
	if GetFFlagCrossDeviceInstructionExperimentModule() then
		GetIXPLayerParametersModule(p1.props.networking, "PlayerApp.CrossDeviceLogin.DisplayCode", {
			"alt_title",
			"alt_instruction",
			"alt_mobile_instruction",
			"alt_desktop_instruction"
		}):andThen(function(Result)
			-- upvalues: p1 (copy)
			local ResponseBody = Result and Result.responseBody
			
			if type(ResponseBody) == "table" and (next(ResponseBody) and p1.isMounted) then
				p1:setState({
					AltTitle = if ResponseBody.alt_title == "" then nil else ResponseBody.alt_title or nil,
					AltInstruction = if ResponseBody.alt_instruction == "" then nil else ResponseBody.alt_instruction or nil,
					AltMobileInstruction = if ResponseBody.alt_mobile_instruction == "" then nil else ResponseBody.alt_mobile_instruction or nil,
					AltDesktopInstruction = if ResponseBody.alt_desktop_instruction == "" then nil else ResponseBody.alt_desktop_instruction or nil
				})
			end
		end)
	end
end

function LoginCodePrompt.willUnmount(p1)
	p1.isMounted = false
end

function LoginCodePrompt.render(p1)
	-- upvalues: WithStyleFunction (copy), GetFFlagEnableShortLinkCodeForVRCDLFunction (copy), IsVRAppBuildFunction (copy), RoactModule (copy), ShortLinkLoginCodeComponentModule (copy), LoginCodeComponentModule (copy), LoginCodeOverlayModule (copy)
	local IsDualLayout = p1.props.isDualLayout or p1.state.DisplayName == ""
	local IsNotDisplayNameMatch: boolean = p1.props.isDualLayout and p1.state.DisplayName ~= ""
	
	return WithStyleFunction(function(_)
		-- upvalues: GetFFlagEnableShortLinkCodeForVRCDLFunction (upval), IsVRAppBuildFunction (upval), RoactModule (upval), ShortLinkLoginCodeComponentModule (upval), p1 (copy), LoginCodeComponentModule (upval), IsDualLayout (copy), IsNotDisplayNameMatch (copy), LoginCodeOverlayModule (upval)
		local Element = if GetFFlagEnableShortLinkCodeForVRCDLFunction() and IsVRAppBuildFunction() then RoactModule.createElement(ShortLinkLoginCodeComponentModule, {
			ShortLink = "roblox.com/quest",
			DeviceCode = p1.state.DeviceCode
		}) else RoactModule.createElement(LoginCodeComponentModule, {
			Status = p1.state.Status,
			DeviceCode = p1.state.DeviceCode,
			AccountPictureUrl = p1.state.AccountPictureUrl,
			DisplayName = p1.state.DisplayName,
			QrCodeUrl = p1.state.QrCodeUrl,
			showCodeView = IsDualLayout,
			showConfirmLoginText = IsNotDisplayNameMatch,
			AltTitle = p1.state.AltTitle,
			AltInstruction = p1.state.AltInstruction,
			AltMobileInstruction = p1.state.AltMobileInstruction,
			AltDesktopInstruction = p1.state.AltDesktopInstruction,
			disableCdlQrCodeForMaquettes = p1.props.disableCdlQrCodeForMaquettes,
			hideDeviceCode = p1.props.hideDeviceCode,
			showLockIcon = p1.props.showLockIcon,
			isDualLayout = p1.props.isDualLayout,
			isCrossApp = p1.props.isCrossApp
		})
		
		return if p1.props.isOverlay then RoactModule.createElement(LoginCodeOverlayModule, {
			loginCode = Element,
			screenSize = p1.props.screenSize,
			onCloseClicked = p1.closeButtonPressed
		}, { ViewContainer = Element }) else Element
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), CrossDeviceLoginModule (copy), SetNetworkingErrorToastModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy)
	return {
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		fetchCode = function(p1)
			-- upvalues: Callback (copy), CrossDeviceLoginModule (upval)
			return Callback(CrossDeviceLoginModule.FetchDeviceCode(p1))
		end,
		getLoginStatus = function(p1, p2, p3)
			-- upvalues: Callback (copy), CrossDeviceLoginModule (upval)
			return Callback(CrossDeviceLoginModule.GetLoginStatus(p1, p2, p3))
		end,
		cancelLoginCode = function(p1, p2)
			-- upvalues: Callback (copy), CrossDeviceLoginModule (upval)
			return Callback(CrossDeviceLoginModule.CancelLoginCode(p1, p2))
		end,
		setNetworkingErrorToast = function(_)
			-- upvalues: Callback (copy), SetNetworkingErrorToastModule (upval)
			Callback(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
		end,
		setLocationErrorToast = function(_)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
			Callback(SetCurrentToastMessageModule({
				toastMessage = "Authentication.CrossDevice.Label.NotAvailableOnNetwork",
				toastType = ToastTypeModule.NetworkingError
			}))
		end
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	authAnalytics = RoactAnalyticsAuthEventsModule
})(LoginCodePrompt)))

if GetFFlagDisableCDLQrCodeForMaquettesFunction() then
	v1 = RoactAppPolicy.connect(function(p1, _)
		return {
			disableCdlQrCodeForMaquettes = p1.getDisableCDLQrCodeForMaquettes() or false
		}
	end)(v1)
end
return v1