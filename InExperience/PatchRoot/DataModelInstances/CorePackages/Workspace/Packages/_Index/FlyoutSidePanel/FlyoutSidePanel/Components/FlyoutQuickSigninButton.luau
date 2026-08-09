local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)

return function(value) --[[ line: 26 | named "FlyoutQuickSigninButton" ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), flyoutContentSettingsModule (ref), flyoutAnalyticsModule (ref), useLocalization (ref), button (ref), buttonVariant (ref), buttonSize (ref)
	local var5 = useDispatch()
	local var6 = useRoactService(appEventIngestService)
	
	return reactModule.createElement(button, {
		isDisabled = false,
		text = useLocalization({ title = "Authentication.CrossDevice.Heading.QuickLogin" }).title,
		variant = buttonVariant.Standard,
		LayoutOrder = value.layoutOrder,
		onActivated = reactModule.useCallback(function() --[[ line: 30 ]]
			-- upvalues: value (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (ref), navigateDown (copy), flyoutContentSettingsModule (copy), flyoutAnalyticsModule (copy), var6 (ref)
			value.closeDrawer()
			local t = { name = appPage.CrossDeviceLogin }
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t))
			else
				var5(navigateDown(t))
			end
			flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var6, flyoutContentSettingsModule.ItemType.QuickSignin)
		end, { var6, value.closeDrawer }),
		size = buttonSize.Large,
		width = UDim.new(1, 0)
	})
end