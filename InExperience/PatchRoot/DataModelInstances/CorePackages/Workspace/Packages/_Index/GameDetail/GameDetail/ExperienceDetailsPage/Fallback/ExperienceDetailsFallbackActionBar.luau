local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local useGameInfoModule = require(script.Parent.Parent.useGameInfo)
local playButton = require(parent.GamePlayButton).PlayButton
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox
local fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox
local fFlagSduiEdpPersistentActionBarPlayButton = sharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton
local fFlagLuaAppLaunchWhenLoadingEdp = sharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = sharedFlagsModule.FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp

return {
	Skeleton = reactModule.memo(function(p0) --[[ line: 34 | named "ExperienceDetailsActionBarSkeleton" ]]
		-- upvalues: useTokens (ref), reactModule (ref), view (ref), fFlagSduiEdpPersistentActionBarPlayButton (ref), skeleton (ref), radius (ref), playButton (ref), fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox (ref), fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox (ref), buttonSize (ref), foundationModule (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref)
		local size1200 = useTokens().Size.Size_1200
		
		return reactModule.createElement(view, {
			testId = "--edp-fallback-action-bar-skeleton",
			tag = if fFlagSduiEdpPersistentActionBarPlayButton then "row align-y-center gap-small auto-xy" else "row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-top-medium bg-surface-0 stroke-default"
		}, {
			IconButtonSkeleton1 = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(size1200, size1200),
				radius = radius.Medium
			}),
			IconButtonSkeleton2 = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(size1200, size1200),
				radius = radius.Medium
			}),
			PlayBtnContainer = if fFlagSduiEdpPersistentActionBarPlayButton then nil else reactModule.createElement(view, { tag = "grow auto-y", LayoutOrder = 3 }, {
				PlayBtn = reactModule.createElement(playButton, {
					testId = "--edp-fallback-play-button",
					universeId = p0.universeId,
					referralSource = p0.referralSource,
					launchSource = p0.launchSource,
					experienceJoinData = p0.experienceJoinData,
					placeId = p0.placeIdOverride,
					useUIBloxButton = if fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox then fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox else nil,
					buttonSize = buttonSize.Large,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then true else nil,
					launchOnReleaseAfterUnmount = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then true else nil
				})
			})
		})
	end),
	Error = reactModule.memo(function(p1) --[[ line: 79 | named "ExperienceDetailsActionBarError" ]]
		-- upvalues: useGameInfoModule (ref), fFlagSduiEdpPersistentActionBarPlayButton (ref), reactModule (ref), view (ref), playButton (ref), fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox (ref), fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox (ref), buttonSize (ref), foundationModule (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref)
		local var4 = useGameInfoModule(p1.universeId)
		
		return if var4 ~= nil and var4.isUnavailable == true then nil elseif fFlagSduiEdpPersistentActionBarPlayButton then nil else reactModule.createElement(view, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-top-medium bg-surface-0 stroke-default",
			testId = "--edp-fallback-action-bar-error"
		}, {
			PlayBtnContainer = reactModule.createElement(view, { tag = "grow auto-y", LayoutOrder = 1 }, {
				PlayBtn = reactModule.createElement(playButton, {
					testId = "--edp-fallback-play-button",
					universeId = p1.universeId,
					referralSource = p1.referralSource,
					launchSource = p1.launchSource,
					experienceJoinData = p1.experienceJoinData,
					placeId = p1.placeIdOverride,
					useUIBloxButton = if fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox then fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox else true,
					buttonSize = buttonSize.Large,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then true else nil,
					launchOnReleaseAfterUnmount = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then true else nil
				})
			})
		})
	end)
}