local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local useTokens = foundationModule.Hooks.useTokens
local formFactor = momentsCommonModule.Enums.FormFactor
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local momentLayoutModule = require(script.Parent.momentLayout)

return function(p0) --[[ line: 44 | named "MomentItemSkeleton" ]]
	-- upvalues: useTokens (ref), useFormFactor (ref), formFactor (ref), reactModule (ref), view (ref), skeleton (ref), gradientBackdrop (ref), momentLayoutModule (ref), radius (ref)
	local var4 = useTokens()
	local var5 = useFormFactor() == formFactor.Wide
	local var6, var7 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var8 = 2 * var4.Padding.XLarge
	
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
				color3 = var4.Color.Common.Scrim.Color3,
				size = var6
			}),
			InfoFrame = reactModule.createElement(view, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y padding-xlarge",
				ZIndex = 2,
				sizeConstraint = {
					MaxSize = if var5 then momentLayoutModule.BOTTOM_UI_MAX_SIZE else nil
				},
				onAbsoluteSizeChanged = reactModule.useCallback(function(p1) --[[ line: 52 ]]
					-- upvalues: var7 (ref), var8 (ref)
					var7(UDim2.new(1, 0, 0, p1.AbsoluteSize.Y + var8))
				end, { var8 })
			}, {
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
					Size = UDim2.fromOffset(var4.Size.Size_1000, var4.Size.Size_1000)
				})
			})
		})
	})
end