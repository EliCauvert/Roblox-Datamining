local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local localizeStrings = require(parent.Localization).localizeStrings
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore
local openInfoPeekView = require(parent.DiscoveryRouting).OpenInfoPeekView
local openCloseOnlyInteractiveAlert = require(parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local sduiResponsiveHelpers = require(parent.SduiCoreSystem).SduiResponsiveHelpers

return function(_, _, p0) --[[ line: 19 ]]
	-- upvalues: localizeStrings (ref), sduiResponsiveHelpers (ref), getInputModeStore (ref), responsiveModule (ref), openInfoPeekView (ref), openCloseOnlyInteractiveAlert (ref), closeCentralOverlay (ref)
	local dispatch = p0.dependencies.dispatch
	local var1 = localizeStrings(p0.dependencies.localization, {
		SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic",
		SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
	})
	local var2 = sduiResponsiveHelpers.isPortraitOrientation()
	local lastInputType = getInputModeStore(false).getLastInputType(false)
	local sponsoredDisclosure = var1.SponsoredDisclosure
	local sponsoredTitle = var1.SponsoredTitle
	
	if lastInputType == responsiveModule.Input.Touch and var2 then
		dispatch(openInfoPeekView(sponsoredTitle, sponsoredDisclosure))
		
		return
	end
	dispatch(openCloseOnlyInteractiveAlert(sponsoredTitle, sponsoredDisclosure, function() --[[ line: 38 ]]
		-- upvalues: dispatch (ref), closeCentralOverlay (copy)
		return dispatch(closeCentralOverlay())
	end))
end