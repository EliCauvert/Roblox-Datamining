local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local CTAButtonsRowModule = require(ProfilePlatform.Components.CTARow.CTAButtonsRow)
local UseMapJsonToButtonListModule = require(ProfilePlatform.Components.CTARow.useMapJsonToButtonList)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseIsMeTabModule = require(ProfilePlatform.Hooks.useIsMeTab)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local LoadingStagesExtensionModule = require(ProfilePlatform.Analytics.LoadingStagesExtension)
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab

return function(p1) --[[ Line: 24 | Named "CTAButtonRowContainer" ]]
	-- upvalues: UseProfileWrapperContextModule (copy), UseMapJsonToButtonListModule (copy), FFlagAXEnableProfileTab (copy), UseIsMeTabModule (copy), UseProfileAnalyticsContextModule (copy), UseEffectOnMountFunction (copy), SocialStopwatchModule (copy), EventNamesModule (copy), LoadingStagesExtensionModule (copy), ReactModule (copy), CTAButtonsRowModule (copy), HorizontalPageMargin (copy)
	local UseMapJsonToButtonListModuleResult = UseMapJsonToButtonListModule(UseProfileWrapperContextModule().profileId)
	local UseIsMeTabModuleResult = if FFlagAXEnableProfileTab then UseIsMeTabModule() else nil
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	UseEffectOnMountFunction(function() --[[ Line: 30 ]]
		-- upvalues: SocialStopwatchModule (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), LoadingStagesExtensionModule (upval)
		local GetResult = SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.ProfileOpened)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if GetResult then GetResult.timeElapsed else nil,
			status = LoadingStagesExtensionModule.CTALoaded
		})
	end)
	
	return if FFlagAXEnableProfileTab and UseIsMeTabModuleResult then ReactModule.createElement(CTAButtonsRowModule, {
		buttonList = UseMapJsonToButtonListModuleResult,
		layoutOrder = p1.layoutOrder
	}) else ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Content = ReactModule.createElement(CTAButtonsRowModule, {
			layoutOrder = 1,
			buttonList = UseMapJsonToButtonListModuleResult
		})
	})
end