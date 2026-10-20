local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local LocalizeStringsFunction = require(Parent.Localization).localizeStrings
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local OpenInfoPeekViewFunction = require(Parent.DiscoveryRouting).OpenInfoPeekView
local OpenCloseOnlyInteractiveAlertFunction = require(Parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local SduiResponsiveHelpers = require(Parent.SduiCoreSystem).SduiResponsiveHelpers

return function(_, _, p1)
	-- upvalues: LocalizeStringsFunction (copy), SduiResponsiveHelpers (copy), GetInputModeStoreFunction (copy), ResponsiveModule (copy), OpenInfoPeekViewFunction (copy), OpenCloseOnlyInteractiveAlertFunction (copy), CloseCentralOverlayFunction (copy)
	local DispatchFunction: (any) -> () = p1.dependencies.dispatch
	local LocalizeStringsResult = LocalizeStringsFunction(p1.dependencies.localization, {
		SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic",
		SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
	})
	local IsPortraitOrientation = SduiResponsiveHelpers.isPortraitOrientation()
	local SponsoredDisclosure = LocalizeStringsResult.SponsoredDisclosure
	local SponsoredTitle = LocalizeStringsResult.SponsoredTitle
	
	if GetInputModeStoreFunction(false).getLastInputType(false) == ResponsiveModule.Input.Touch and IsPortraitOrientation then
		DispatchFunction(OpenInfoPeekViewFunction(SponsoredTitle, SponsoredDisclosure))
		
		return
	else
		DispatchFunction(OpenCloseOnlyInteractiveAlertFunction(SponsoredTitle, SponsoredDisclosure, function()
			-- upvalues: DispatchFunction (copy), CloseCentralOverlayFunction (upval)
			return DispatchFunction(CloseCentralOverlayFunction())
		end))
	end
end