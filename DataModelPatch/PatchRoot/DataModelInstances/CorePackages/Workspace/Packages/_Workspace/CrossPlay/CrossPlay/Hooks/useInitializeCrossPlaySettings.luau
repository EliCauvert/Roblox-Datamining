local CrossPlay = script:FindFirstAncestor("CrossPlay")
local Parent = CrossPlay.Parent
local AppLifecycleObserverServiceOrStubModule = require(CrossPlay.ServiceWrappers.AppLifecycleObserverServiceOrStub)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local UseCrossPlayApiModule = require(CrossPlay.Hooks.useCrossPlayApi)
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty

return function()
	-- upvalues: UseCrossPlayApiModule (copy), UseSelectorFunction (copy), ReactModule (copy), UsePropertyFunction (copy), ThirdPartyUserService (copy), LoginStatus (copy), AppLifecycleObserverServiceOrStubModule (copy)
	local UseCrossPlayApiModuleResult = UseCrossPlayApiModule()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return {
			authenticationStatus = p1.AuthenticationStatus.status,
			preloading = p1.Startup.Preloading
		}
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Preloading = UseSelectorResult.preloading
	local IsAuthenticationStatusMatch: boolean = UsePropertyFunction(ThirdPartyUserService, "HasActiveUser") and UseSelectorResult.authenticationStatus == LoginStatus.LOGGED_IN
	ReactModule.useEffect(function()
		-- upvalues: IsAuthenticationStatusMatch (copy), UseStateResult (copy), Preloading (copy), UseCrossPlayApiModuleResult (copy), UseStateResult2 (copy)
		if IsAuthenticationStatusMatch == UseStateResult then return end
		if IsAuthenticationStatusMatch and Preloading then
			UseCrossPlayApiModuleResult.fetch()
		elseif not IsAuthenticationStatusMatch then
			UseCrossPlayApiModuleResult.reset()
		end
		UseStateResult2(IsAuthenticationStatusMatch)
	end, {
		UseCrossPlayApiModuleResult,
		IsAuthenticationStatusMatch,
		UseStateResult,
		Preloading
	})
	ReactModule.useEffect(function()
		-- upvalues: AppLifecycleObserverServiceOrStubModule (upval), UseCrossPlayApiModuleResult (copy)
		local OnBecomeActiveConnection = AppLifecycleObserverServiceOrStubModule.OnBecomeActive:connect(function()
			-- upvalues: UseCrossPlayApiModuleResult (upval)
			UseCrossPlayApiModuleResult.fetch()
		end)
		
		return function()
			-- upvalues: OnBecomeActiveConnection (copy)
			OnBecomeActiveConnection:disconnect()
		end
	end, { UseCrossPlayApiModuleResult })
end