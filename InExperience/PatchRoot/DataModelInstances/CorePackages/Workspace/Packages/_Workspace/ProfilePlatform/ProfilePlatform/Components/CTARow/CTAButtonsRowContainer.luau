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
local fFlagAddCTAButtonAnalyticsModule = require(profilePlatform.Flags.FFlagAddCTAButtonAnalytics)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab

return function(p0) --[[ line: 26 | named "CTAButtonRowContainer" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useMapJsonToButtonListModule (ref), fFlagAXEnableProfileTab (ref), useIsMeTabModule (ref), fFlagAddCTAButtonAnalyticsModule (ref), useProfileAnalyticsContextModule (ref), useEffectOnMount (ref), socialStopwatchModule (ref), eventNamesModule (ref), loadingStagesExtensionModule (ref), reactModule (ref), CTAButtonsRowModule (ref), horizontalPageMargin (ref)
	local var11 = useMapJsonToButtonListModule(useProfileWrapperContextModule().profileId)
	local var12 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	
	if fFlagAddCTAButtonAnalyticsModule then
		local var13 = useProfileAnalyticsContextModule()
		useEffectOnMount(function() --[[ line: 34 ]]
			-- upvalues: socialStopwatchModule (copy), var13 (ref), eventNamesModule (copy), loadingStagesExtensionModule (copy)
			local var14 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
			var13.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
				isProfilePlatform = true,
				statValue = if var14 then var14.timeElapsed else nil,
				status = loadingStagesExtensionModule.CTALoaded
			})
		end)
	end
	return if fFlagAXEnableProfileTab and var12 then reactModule.createElement(CTAButtonsRowModule, { buttonList = var11, layoutOrder = p0.layoutOrder }) else reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p0.layoutOrder
	}, {
		Content = reactModule.createElement(CTAButtonsRowModule, { layoutOrder = 1, buttonList = var11 })
	})
end