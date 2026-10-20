local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UseCompositionLayoutFunction = require(Parent.AppComposition).useCompositionLayout
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FormFactor = MomentsCommonModule.Enums.FormFactor
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local MomentLayoutModule = require(script.Parent.momentLayout)
local MomentOverlayInsetContextModule = require(script.Parent.MomentOverlayInsetContext)
local MomentPushedFeedSafeAreaContextModule = require(script.Parent.MomentPushedFeedSafeAreaContext)
local MomentsFixSkeletonNavBarInset = game:DefineFastFlag("MomentsFixSkeletonNavBarInset", false)
local FFlagMomentsFeedAboveNavBarModule = require(Moments.Flags.FFlagMomentsFeedAboveNavBar)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseFormFactorFunction (copy), UseCompositionLayoutFunction (copy), UseDeviceInsetsFunction (copy), FormFactor (copy), ReactModule (copy), MomentPushedFeedSafeAreaContextModule (copy), MomentOverlayInsetContextModule (copy), MomentsFixSkeletonNavBarInset (copy), FFlagMomentsFeedAboveNavBarModule (copy), View (copy), Skeleton (copy), Radius (copy), MomentLayoutModule (copy), GradientBackdrop (copy)
	local UseTokensResult = UseTokensFunction()
	local UseFormFactorResult = UseFormFactorFunction()
	local UseCompositionLayoutResult = UseCompositionLayoutFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local IsUseFormFactorResultMatch = UseFormFactorResult == FormFactor.Wide
	local Margin: number = UseCompositionLayoutResult.margin
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 0))
	local ScaledXLarge = 2 * UseTokensResult.Padding.XLarge
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy), ScaledXLarge (copy)
		UseBindingResult2(UDim2.new(1, 0, 0, Frame.AbsoluteSize.Y + ScaledXLarge))
	end, { ScaledXLarge })
	local UseMomentPushedFeedSafeAreaResult = MomentPushedFeedSafeAreaContextModule.useMomentPushedFeedSafeArea()
	local UseDeviceInsetsResult1 = if UseMomentPushedFeedSafeAreaResult == nil then UseDeviceInsetsResult else UseMomentPushedFeedSafeAreaResult
	local UseMomentOverlayInsetResult: number = MomentOverlayInsetContextModule.useMomentOverlayInset()
	local UseMomentOverlayInsetResult1 = if MomentsFixSkeletonNavBarInset then UseMomentOverlayInsetResult else 0
	local IsUseMomentOverlayInsetResultAbove = UseMomentOverlayInsetResult1 > 0
	
	if FFlagMomentsFeedAboveNavBarModule then
		UseMomentOverlayInsetResult1 = 0
		IsUseMomentOverlayInsetResultAbove = UseMomentOverlayInsetResult > 0
	end
	local Largest = math.max(UseTokensResult.Padding.XLarge, if UseDeviceInsetsResult1 == nil then 0 else UseDeviceInsetsResult1.bottom)
	local NewMedium: number = if IsUseMomentOverlayInsetResultAbove then UseTokensResult.Padding.Medium + UseMomentOverlayInsetResult1 else Largest + UseMomentOverlayInsetResult1
	local config = {
		CreatorRow = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-left align-y-center gap-small auto-xy"
		}, {
			Avatar = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				radius = Radius.Circle,
				Size = UDim2.fromOffset(MomentLayoutModule.AVATAR_SIZE, MomentLayoutModule.AVATAR_SIZE)
			}),
			Username = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				radius = Radius.Medium,
				Size = UDim2.fromOffset(MomentLayoutModule.USERNAME_SHIMMER.X, MomentLayoutModule.USERNAME_SHIMMER.Y)
			})
		}),
		Description = ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			radius = Radius.Medium,
			Size = UDim2.fromOffset(if IsUseFormFactorResultMatch then 280 else 200, 14)
		}),
		Experience = ReactModule.createElement(Skeleton, {
			LayoutOrder = 3,
			radius = Radius.Medium,
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000)
		})
	}
	local BOTTOMUIMAXSIZE = MomentLayoutModule.BOTTOM_UI_MAX_SIZE
	
	return ReactModule.createElement(View, {
		tag = "size-full clip bg-surface-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Media = ReactModule.createElement(View, { tag = "size-full", ZIndex = 1 }, {
			Shimmer = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1) })
		}),
		Overlay = ReactModule.createElement(View, {
			tag = "position-bottom-center anchor-bottom-center size-full-0 auto-y",
			ZIndex = 2
		}, {
			Backdrop = ReactModule.createElement(GradientBackdrop, {
				rotation = 270,
				color3 = UseTokensResult.Color.Common.Scrim.Color3,
				size = UseBindingResult
			}),
			InfoFrame = if UseDeviceInsetsResult1 == nil then ReactModule.createElement(View, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-moment-item-skeleton-info-frame",
				ZIndex = 2,
				padding = {
					top = UDim.new(0, UseTokensResult.Padding.XLarge),
					left = UDim.new(0, Margin),
					right = UDim.new(0, Margin),
					bottom = UDim.new(0, NewMedium)
				},
				sizeConstraint = { MaxSize = BOTTOMUIMAXSIZE },
				onAbsoluteSizeChanged = UseResult
			}, config) else ReactModule.createElement(View, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-moment-item-skeleton-info-frame",
				ZIndex = 2,
				padding = {
					top = UDim.new(0, UseTokensResult.Padding.XLarge),
					left = UDim.new(0, (math.max(Margin, UseDeviceInsetsResult1.left))),
					right = UDim.new(0, (math.max(Margin, UseDeviceInsetsResult1.right))),
					bottom = UDim.new(0, NewMedium)
				},
				sizeConstraint = { MaxSize = BOTTOMUIMAXSIZE },
				onAbsoluteSizeChanged = UseResult
			}, config)
		})
	})
end