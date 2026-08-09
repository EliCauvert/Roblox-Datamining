local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local buttonSize = foundationModule.Enums.ButtonSize
local playButton = require(parent.GamePlayButton).PlayButton
local experienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local experienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local appPage = require(parent.RobloxAppEnums).AppPage
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox
local fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox
local fFlagLuaAppLaunchWhenLoadingEdp = sharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = sharedFlagsModule.FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp

return reactModule.memo(function(p0) --[[ line: 42 | named "ExperienceDetailsPersistentActionBar" ]]
	-- upvalues: reactModule (ref), view (ref), sduiFeatureEntryPoint (ref), appPage (ref), experienceDetailsPageConstantsModule (ref), experienceDetailsFallbackActionBarModule (ref), playButton (ref), fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox (ref), fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox (ref), buttonSize (ref), foundationModule (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref)
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = p0.onAbsoluteSizeChange
	}, {
		Content = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y gap-small bg-surface-0 align-x-center padding-x-medium padding-top-medium stroke-default",
			testId = "--edp-persistent-action-bar"
		}, {
			Row = reactModule.createElement(view, { tag = "row size-full-0 auto-y gap-small" }, {
				EntryPoint = reactModule.createElement(sduiFeatureEntryPoint, {
					LayoutOrder = 1,
					appPage = appPage.GameDetail,
					configKey = p0.configKey,
					identifier = experienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
					loadTimer = p0.loadTimer,
					Size = UDim2.fromScale(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					loadingSlot = reactModule.createElement(experienceDetailsFallbackActionBarModule.Skeleton, {
						universeId = p0.universeId,
						launchSource = p0.launchSource,
						referralSource = p0.referralSource,
						experienceJoinData = p0.experienceJoinData,
						placeIdOverride = p0.placeIdOverride
					}),
					errorSlot = reactModule.createElement(experienceDetailsFallbackActionBarModule.Error, {
						universeId = p0.universeId,
						launchSource = p0.launchSource,
						referralSource = p0.referralSource,
						experienceJoinData = p0.experienceJoinData,
						placeIdOverride = p0.placeIdOverride
					})
				}),
				PersistentPlayButton = reactModule.createElement(view, { tag = "grow auto-y", LayoutOrder = 2 }, {
					PlayBtn = reactModule.createElement(playButton, {
						testId = "--edp-persistent-play-button",
						universeId = p0.universeId,
						referralSource = p0.referralSource,
						launchSource = p0.launchSource,
						experienceJoinData = p0.experienceJoinData,
						useUIBloxButton = if fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox then fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox else true,
						placeId = p0.placeIdOverride,
						buttonSize = buttonSize.Large,
						fillBehavior = foundationModule.Enums.FillBehavior.Fill,
						launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then true else nil,
						launchOnReleaseAfterUnmount = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then true else nil
					})
				})
			})
		})
	})
end)