local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local requestInternalWrapper = require(parent.Http).NetworkLayers.requestInternalWrapper
local coreScriptsRootProvider = require(parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local roactNavigationModule = require(parent.RoactNavigation)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local roactServices = require(parent.RoactServices).RoactServices
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local dynamicReportContainerModule = require(parent.GenericAbuseReporting.DynamicReportContainer)
local _ = require(parent.GenericAbuseReporting.AbuseVector)
local t = {
	isFocused = function()
		return true
	end,
	addListener = function(_, _)
		return { remove = function() end }
	end
}

return function(p0)
	-- upvalues: reactModule (ref), coreScriptsRootProvider (ref), roactNavigationModule (ref), t (ref), roactServices (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), dynamicReportContainerModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 10,
		Size = UDim2.fromScale(1, 1)
	}, {
		Providers = reactModule.createElement(coreScriptsRootProvider, {}, {
			Navigation = reactModule.createElement(roactNavigationModule.Provider, { value = t }, {
				Services = reactModule.createElement(roactServices.ServiceProvider, {
					services = { [roactNetworking] = requestInternalWrapper(httpService) }
				}, {
					FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
						isIsolated = true,
						isAutoFocusRoot = true,
						frameProps = { Size = UDim2.fromScale(1, 1) },
						surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
					}, {
						DynamicReport = reactModule.createElement(dynamicReportContainerModule, {
							abuseVector = p0.abuseVector,
							targetId = p0.targetId,
							onClose = p0.onClose
						})
					})
				})
			})
		})
	})
end