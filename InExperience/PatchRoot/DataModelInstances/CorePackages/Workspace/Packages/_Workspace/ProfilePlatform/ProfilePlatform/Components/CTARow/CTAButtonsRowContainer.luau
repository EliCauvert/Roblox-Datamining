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

return function(p0)
	-- upvalues: useProfileWrapperContextModule (ref), useMapJsonToButtonListModule (ref), fFlagAXEnableProfileTab (ref), useIsMeTabModule (ref), useProfileAnalyticsContextModule (ref), useEffectOnMount (ref), socialStopwatchModule (ref), eventNamesModule (ref), loadingStagesExtensionModule (ref), reactModule (ref), CTAButtonsRowModule (ref), horizontalPageMargin (ref)
	local var10 = useMapJsonToButtonListModule(useProfileWrapperContextModule().profileId)
	local var11 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local var12 = useProfileAnalyticsContextModule()
	useEffectOnMount(function()
		-- upvalues: socialStopwatchModule (copy), var12 (ref), eventNamesModule (copy), loadingStagesExtensionModule (copy)
		local var13 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var12.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var13 then var13.timeElapsed else nil,
			status = loadingStagesExtensionModule.CTALoaded
		})
	end)
	
	return if fFlagAXEnableProfileTab and var11 then reactModule.createElement(CTAButtonsRowModule, { buttonList = var10, layoutOrder = p0.layoutOrder }) else reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p0.layoutOrder
	}, {
		Content = reactModule.createElement(CTAButtonsRowModule, { layoutOrder = 1, buttonList = var10 })
	})
end