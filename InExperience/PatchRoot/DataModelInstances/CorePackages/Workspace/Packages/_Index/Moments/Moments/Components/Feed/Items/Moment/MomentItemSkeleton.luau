local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local appCompositionModule = require(parent.AppComposition)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useCompositionLayout = appCompositionModule.useCompositionLayout
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local useTokens = foundationModule.Hooks.useTokens
local formFactor = momentsCommonModule.Enums.FormFactor
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local momentLayoutModule = require(script.Parent.momentLayout)
local momentOverlayInsetContextModule = require(script.Parent.MomentOverlayInsetContext)
local momentPushedFeedSafeAreaContextModule = require(script.Parent.MomentPushedFeedSafeAreaContext)
local momentsFixSkeletonNavBarInset = game:DefineFastFlag("MomentsFixSkeletonNavBarInset", false)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)
local getFFlagMomentsPushedFeedSafeAreaModule = require(moments.Flags.GetFFlagMomentsPushedFeedSafeArea)

return function(p1)
	-- upvalues: useTokens (ref), useFormFactor (ref), fFlagMomentsUseCompositionLibraryModule (ref), useCompositionLayout (ref), useDeviceInsets (ref), formFactor (ref), reactModule (ref), momentPushedFeedSafeAreaContextModule (ref), getFFlagMomentsPushedFeedSafeAreaModule (ref), momentOverlayInsetContextModule (ref), momentsFixSkeletonNavBarInset (ref), view (ref), skeleton (ref), radius (ref), momentLayoutModule (ref), gradientBackdrop (ref)
	local var1 = useTokens()
	local var2 = useFormFactor()
	local var3 = nil
	local var4 = nil
	
	if fFlagMomentsUseCompositionLibraryModule then
		var3 = useCompositionLayout()
		var4 = useDeviceInsets()
	end
	local var5 = var2 == formFactor.Wide
	local var6 = if var3 ~= nil then var1.Padding.XLarge else var3.margin
	local var7, var8 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var9 = 2 * var1.Padding.XLarge
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), var9 (ref)
		var8(UDim2.new(1, 0, 0, p2.AbsoluteSize.Y + var9))
	end, { var9 })
	local var11 = momentPushedFeedSafeAreaContextModule.useMomentPushedFeedSafeArea()
	local var12 = if getFFlagMomentsPushedFeedSafeAreaModule() and var11 ~= nil then var11 else var4
	local var13 = if momentsFixSkeletonNavBarInset then momentOverlayInsetContextModule.useMomentOverlayInset() else 0
	local maxValue = math.max(var1.Padding.XLarge, if var12 ~= nil then 0 else var12.bottom)
	maxValue = if fFlagMomentsUseCompositionLibraryModule and var13 > 0 then var1.Padding.Medium + var13 else maxValue + var13
	local t = {
		CreatorRow = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-left align-y-center gap-small auto-xy"
		}, {
			Avatar = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				radius = radius.Circle,
				Size = UDim2.fromOffset(momentLayoutModule.AVATAR_SIZE, momentLayoutModule.AVATAR_SIZE)
			}),
			Username = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				radius = radius.Medium,
				Size = UDim2.fromOffset(momentLayoutModule.USERNAME_SHIMMER.X, momentLayoutModule.USERNAME_SHIMMER.Y)
			})
		}),
		Description = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			radius = radius.Medium,
			Size = UDim2.fromOffset(if var5 then 280 else 200, 14)
		}),
		Experience = reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			radius = radius.Medium,
			Size = UDim2.fromOffset(var1.Size.Size_1000, var1.Size.Size_1000)
		})
	}
	local var14 = if fFlagMomentsUseCompositionLibraryModule then momentLayoutModule.BOTTOM_UI_MAX_SIZE elseif var5 then momentLayoutModule.BOTTOM_UI_MAX_SIZE else nil
	
	return reactModule.createElement(view, {
		tag = "size-full clip bg-surface-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Media = reactModule.createElement(view, { tag = "size-full", ZIndex = 1 }, {
			Shimmer = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
		}),
		Overlay = reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center size-full-0 auto-y",
			ZIndex = 2
		}, {
			Backdrop = reactModule.createElement(gradientBackdrop, {
				rotation = 270,
				color3 = var1.Color.Common.Scrim.Color3,
				size = var7
			}),
			InfoFrame = if var12 ~= nil then reactModule.createElement(view, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-moment-item-skeleton-info-frame",
				ZIndex = 2,
				padding = {
					top = UDim.new(0, var1.Padding.XLarge),
					left = UDim.new(0, var6),
					right = UDim.new(0, var6),
					bottom = UDim.new(0, maxValue)
				},
				sizeConstraint = { MaxSize = var14 },
				onAbsoluteSizeChanged = var10
			}, t) else reactModule.createElement(view, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-moment-item-skeleton-info-frame",
				ZIndex = 2,
				padding = {
					top = UDim.new(0, var1.Padding.XLarge),
					left = UDim.new(0, math.max(var6, var12.left)),
					right = UDim.new(0, math.max(var6, var12.right)),
					bottom = UDim.new(0, maxValue)
				},
				sizeConstraint = { MaxSize = var14 },
				onAbsoluteSizeChanged = var10
			}, t)
		})
	})
end