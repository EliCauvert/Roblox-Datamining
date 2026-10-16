local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local RequestInternalWrapperFunction = require(Parent.Http).NetworkLayers.requestInternalWrapper
local CoreScriptsRootProvider = require(Parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactServices = require(Parent.RoactServices).RoactServices
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local DynamicReportContainerModule = require(Parent.GenericAbuseReporting.DynamicReportContainer)
local _ = require(Parent.GenericAbuseReporting.AbuseVector)
local config = {
	isFocused = function(): boolean --[[ Line: 30 ]]
		return true
	end,
	addListener = function(_, _) --[[ Line: 33 ]]
		return { remove = function() --[[ Line: 35 ]] end }
	end
}

return function(p1) --[[ Line: 40 | Named "ShopAbuseReportOverlay" ]]
	-- upvalues: ReactModule (copy), CoreScriptsRootProvider (copy), RoactNavigationModule (copy), config (copy), RoactServices (copy), RoactNetworking (copy), RequestInternalWrapperFunction (copy), HttpService (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), DynamicReportContainerModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 10,
		Size = UDim2.fromScale(1, 1)
	}, {
		Providers = ReactModule.createElement(CoreScriptsRootProvider, {}, {
			Navigation = ReactModule.createElement(RoactNavigationModule.Provider, { value = config }, {
				Services = ReactModule.createElement(RoactServices.ServiceProvider, {
					services = {
						[RoactNetworking] = RequestInternalWrapperFunction(HttpService)
					}
				}, {
					FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
						isIsolated = true,
						isAutoFocusRoot = true,
						frameProps = { Size = UDim2.fromScale(1, 1) },
						surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
					}, {
						DynamicReport = ReactModule.createElement(DynamicReportContainerModule, {
							abuseVector = p1.abuseVector,
							targetId = p1.targetId,
							onClose = p1.onClose
						})
					})
				})
			})
		})
	})
end