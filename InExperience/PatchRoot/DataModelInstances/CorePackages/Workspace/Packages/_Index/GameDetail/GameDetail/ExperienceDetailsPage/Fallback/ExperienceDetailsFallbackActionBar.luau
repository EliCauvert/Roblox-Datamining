local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseGameInfoModule = require(script.Parent.Parent.useGameInfo)
local PlayButton = require(Parent.GamePlayButton).PlayButton
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiEdpPersistentActionBarPlayButton = SharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton
local FFlagLuaAppLaunchWhenLoadingEdp = SharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local FFlagEnableGameJoinEarlyAccess = SharedFlagsModule.FFlagEnableGameJoinEarlyAccess

return {
	Skeleton = ReactModule.memo(function(p1)
		-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), FFlagSduiEdpPersistentActionBarPlayButton (copy), Skeleton (copy), Radius (copy), PlayButton (copy), ButtonSize (copy), FoundationModule (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), FFlagEnableGameJoinEarlyAccess (copy)
		local Size1200 = UseTokensFunction().Size.Size_1200
		
		return ReactModule.createElement(View, {
			testId = "--edp-fallback-action-bar-skeleton",
			tag = if FFlagSduiEdpPersistentActionBarPlayButton then "row align-y-center gap-small auto-xy" else "row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-top-medium bg-surface-0 stroke-default"
		}, {
			IconButtonSkeleton1 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(Size1200, Size1200),
				radius = Radius.Medium
			}),
			IconButtonSkeleton2 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(Size1200, Size1200),
				radius = Radius.Medium
			}),
			PlayBtnContainer = if FFlagSduiEdpPersistentActionBarPlayButton then nil else ReactModule.createElement(View, { tag = "grow auto-y", LayoutOrder = 3 }, {
				PlayBtn = ReactModule.createElement(PlayButton, {
					useUIBloxButton = true,
					launchOnReleaseAfterUnmount = true,
					testId = "--edp-fallback-play-button",
					universeId = p1.universeId,
					referralSource = p1.referralSource,
					launchSource = p1.launchSource,
					experienceJoinData = p1.experienceJoinData,
					placeId = p1.placeIdOverride,
					buttonSize = ButtonSize.Large,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					launchWhenLoading = if FFlagLuaAppLaunchWhenLoadingEdp then true else nil,
					enableEarlyAccessPlusTooltip = if FFlagEnableGameJoinEarlyAccess then true else nil,
					enableEarlyAccessState = if FFlagEnableGameJoinEarlyAccess then true else nil
				})
			})
		})
	end),
	Error = ReactModule.memo(function(p1)
		-- upvalues: UseGameInfoModule (copy), FFlagSduiEdpPersistentActionBarPlayButton (copy), ReactModule (copy), View (copy), PlayButton (copy), ButtonSize (copy), FoundationModule (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), FFlagEnableGameJoinEarlyAccess (copy)
		local UseGameInfoModuleResult = UseGameInfoModule(p1.universeId)
		local IsIsUnavailable: boolean = UseGameInfoModuleResult ~= nil and UseGameInfoModuleResult.isUnavailable == true
		
		return if IsIsUnavailable then nil elseif FFlagSduiEdpPersistentActionBarPlayButton then nil else ReactModule.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-top-medium bg-surface-0 stroke-default",
			testId = "--edp-fallback-action-bar-error"
		}, {
			PlayBtnContainer = ReactModule.createElement(View, { tag = "grow auto-y", LayoutOrder = 1 }, {
				PlayBtn = ReactModule.createElement(PlayButton, {
					useUIBloxButton = true,
					launchOnReleaseAfterUnmount = true,
					testId = "--edp-fallback-play-button",
					universeId = p1.universeId,
					referralSource = p1.referralSource,
					launchSource = p1.launchSource,
					experienceJoinData = p1.experienceJoinData,
					placeId = p1.placeIdOverride,
					buttonSize = ButtonSize.Large,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					launchWhenLoading = if FFlagLuaAppLaunchWhenLoadingEdp then true else nil,
					enableEarlyAccessPlusTooltip = if FFlagEnableGameJoinEarlyAccess then true else nil,
					enableEarlyAccessState = if FFlagEnableGameJoinEarlyAccess then true else nil
				})
			})
		})
	end)
}