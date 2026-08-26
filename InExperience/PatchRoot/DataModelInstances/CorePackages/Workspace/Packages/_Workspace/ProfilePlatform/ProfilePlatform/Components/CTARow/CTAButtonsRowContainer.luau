local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local horizontalPageMargin = require(parent.UIBlox).App.Container.HorizontalPageMargin
local CTAButtonsRowModule = require(profilePlatform.Components.CTARow.CTAButtonsRow)
local useMapJsonToButtonListModule = require(profilePlatform.Components.CTARow.useMapJsonToButtonList)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useIsMeTabModule = require(profilePlatform.Hooks.useIsMeTab)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local socialStopwatchModule = require(parent.SocialStopwatch)
local loadingStagesExtensionModule = require(profilePlatform.Analytics.LoadingStagesExtension)
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useMapJsonToButtonListModule (ref), fFlagAXEnableProfileTab (ref), useIsMeTabModule (ref), useProfileAnalyticsContextModule (ref), useEffectOnMount (ref), socialStopwatchModule (ref), eventNamesModule (ref), loadingStagesExtensionModule (ref), reactModule (ref), CTAButtonsRowModule (ref), horizontalPageMargin (ref)
	local var1 = useMapJsonToButtonListModule(useProfileWrapperContextModule().profileId)
	local var2 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local var3 = useProfileAnalyticsContextModule()
	useEffectOnMount(function()
		-- upvalues: socialStopwatchModule (copy), var3 (ref), eventNamesModule (copy), loadingStagesExtensionModule (copy)
		local var4 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var3.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var4 then var4.timeElapsed else nil,
			status = loadingStagesExtensionModule.CTALoaded
		})
	end)
	
	return if fFlagAXEnableProfileTab and var2 then reactModule.createElement(CTAButtonsRowModule, { buttonList = var1, layoutOrder = p1.layoutOrder }) else reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Content = reactModule.createElement(CTAButtonsRowModule, { layoutOrder = 1, buttonList = var1 })
	})
end