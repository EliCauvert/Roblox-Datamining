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
local fFlagMomentsFeedAboveNavBarModule = require(moments.Flags.FFlagMomentsFeedAboveNavBar)

return function(p1)
	-- upvalues: useTokens (ref), useFormFactor (ref), useCompositionLayout (ref), useDeviceInsets (ref), formFactor (ref), reactModule (ref), momentPushedFeedSafeAreaContextModule (ref), momentOverlayInsetContextModule (ref), momentsFixSkeletonNavBarInset (ref), fFlagMomentsFeedAboveNavBarModule (ref), view (ref), skeleton (ref), radius (ref), momentLayoutModule (ref), gradientBackdrop (ref)
	local var1 = useTokens()
	local var2 = useFormFactor()
	local var3 = useCompositionLayout()
	local var4 = useDeviceInsets()
	local var5 = var2 == formFactor.Wide
	local margin = var3.margin
	local var6, var7 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var8 = 2 * var1.Padding.XLarge
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), var8 (ref)
		var7(UDim2.new(1, 0, 0, p2.AbsoluteSize.Y + var8))
	end, { var8 })
	local var10 = momentPushedFeedSafeAreaContextModule.useMomentPushedFeedSafeArea()
	local var11 = if var10 ~= nil then var4 else var10
	local var12 = momentOverlayInsetContextModule.useMomentOverlayInset()
	local var13 = if momentsFixSkeletonNavBarInset then var12 else 0
	local var14 = var13 > 0
	
	if fFlagMomentsFeedAboveNavBarModule then
		var13 = 0
		var14 = var12 > 0
	end
	local var15 = if var14 then var1.Padding.Medium + var13 else math.max(var1.Padding.XLarge, if var11 ~= nil then 0 else var11.bottom) + var13
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
	local BOTTOM_UI_MAX_SIZE = momentLayoutModule.BOTTOM_UI_MAX_SIZE
	
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
				size = var6
			}),
			InfoFrame = if var11 ~= nil then reactModule.createElement(view, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-moment-item-skeleton-info-frame",
				ZIndex = 2,
				padding = {
					top = UDim.new(0, var1.Padding.XLarge),
					left = UDim.new(0, margin),
					right = UDim.new(0, margin),
					bottom = UDim.new(0, var15)
				},
				sizeConstraint = { MaxSize = BOTTOM_UI_MAX_SIZE },
				onAbsoluteSizeChanged = var9
			}, t) else reactModule.createElement(view, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-moment-item-skeleton-info-frame",
				ZIndex = 2,
				padding = {
					top = UDim.new(0, var1.Padding.XLarge),
					left = UDim.new(0, math.max(margin, var11.left)),
					right = UDim.new(0, math.max(margin, var11.right)),
					bottom = UDim.new(0, var15)
				},
				sizeConstraint = { MaxSize = BOTTOM_UI_MAX_SIZE },
				onAbsoluteSizeChanged = var9
			}, t)
		})
	})
end