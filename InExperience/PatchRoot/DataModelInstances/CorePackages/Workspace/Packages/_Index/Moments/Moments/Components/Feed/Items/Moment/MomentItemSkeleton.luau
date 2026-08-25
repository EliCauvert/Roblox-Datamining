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
local momentPushedFeedSafeAreaContextModule = require(script.Parent.MomentPushedFeedSafeAreaContext)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)
local getFFlagMomentsPushedFeedSafeAreaModule = require(moments.Flags.GetFFlagMomentsPushedFeedSafeArea)

return function(p0)
	-- upvalues: useTokens (ref), useFormFactor (ref), fFlagMomentsUseCompositionLibraryModule (ref), useCompositionLayout (ref), useDeviceInsets (ref), formFactor (ref), reactModule (ref), momentPushedFeedSafeAreaContextModule (ref), getFFlagMomentsPushedFeedSafeAreaModule (ref), view (ref), skeleton (ref), radius (ref), momentLayoutModule (ref), gradientBackdrop (ref)
	local var9 = useTokens()
	local var10 = useFormFactor()
	local var11 = nil
	local var12 = nil
	
	if fFlagMomentsUseCompositionLibraryModule then
		var11 = useCompositionLayout()
		var12 = useDeviceInsets()
	end
	local var13 = var10 == formFactor.Wide
	local var14 = if var11 ~= nil then var9.Padding.XLarge else var11.margin
	local var15, var16 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var17 = 2 * var9.Padding.XLarge
	local var18 = reactModule.useCallback(function(p1)
		-- upvalues: var16 (ref), var17 (ref)
		var16(UDim2.new(1, 0, 0, p1.AbsoluteSize.Y + var17))
	end, { var17 })
	local var19 = momentPushedFeedSafeAreaContextModule.useMomentPushedFeedSafeArea()
	local var20 = if getFFlagMomentsPushedFeedSafeAreaModule() and var19 ~= nil then var19 else var12
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
			Size = UDim2.fromOffset(if var13 then 280 else 200, 14)
		}),
		Experience = reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			radius = radius.Medium,
			Size = UDim2.fromOffset(var9.Size.Size_1000, var9.Size.Size_1000)
		})
	}
	local var22 = if fFlagMomentsUseCompositionLibraryModule then momentLayoutModule.BOTTOM_UI_MAX_SIZE elseif var13 then momentLayoutModule.BOTTOM_UI_MAX_SIZE else nil
	
	return reactModule.createElement(view, {
		tag = "size-full clip bg-surface-0",
		LayoutOrder = p0.layoutOrder
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
				color3 = var9.Color.Common.Scrim.Color3,
				size = var15
			}),
			InfoFrame = if var20 ~= nil then reactModule.createElement(view, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-moment-item-skeleton-info-frame",
				ZIndex = 2,
				padding = {
					top = UDim.new(0, var9.Padding.XLarge),
					left = UDim.new(0, var14),
					right = UDim.new(0, var14),
					bottom = UDim.new(0, var9.Padding.XLarge)
				},
				sizeConstraint = { MaxSize = var22 },
				onAbsoluteSizeChanged = var18
			}, t) else reactModule.createElement(view, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-moment-item-skeleton-info-frame",
				ZIndex = 2,
				padding = {
					top = UDim.new(0, var9.Padding.XLarge),
					left = UDim.new(0, math.max(var14, var20.left)),
					right = UDim.new(0, math.max(var14, var20.right)),
					bottom = UDim.new(0, math.max(var9.Padding.XLarge, var20.bottom))
				},
				sizeConstraint = { MaxSize = var22 },
				onAbsoluteSizeChanged = var18
			}, t)
		})
	})
end