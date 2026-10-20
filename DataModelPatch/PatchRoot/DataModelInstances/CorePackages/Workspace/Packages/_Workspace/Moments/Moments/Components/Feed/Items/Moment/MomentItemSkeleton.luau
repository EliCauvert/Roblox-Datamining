local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FormFactor = MomentsCommonModule.Enums.FormFactor
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local MomentLayoutModule = require(script.Parent.momentLayout)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseFormFactorFunction (copy), FormFactor (copy), ReactModule (copy), View (copy), Skeleton (copy), GradientBackdrop (copy), MomentLayoutModule (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseFormFactorResultMatch = UseFormFactorFunction() == FormFactor.Wide
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 0))
	local ScaledXLarge = 2 * UseTokensResult.Padding.XLarge
	
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
			InfoFrame = ReactModule.createElement(View, {
				tag = "col align-x-left align-y-bottom gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y padding-xlarge",
				ZIndex = 2,
				sizeConstraint = {
					MaxSize = if IsUseFormFactorResultMatch then MomentLayoutModule.BOTTOM_UI_MAX_SIZE else nil
				},
				onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
					-- upvalues: UseBindingResult2 (copy), ScaledXLarge (copy)
					UseBindingResult2(UDim2.new(1, 0, 0, Frame.AbsoluteSize.Y + ScaledXLarge))
				end, { ScaledXLarge })
			}, {
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
			})
		})
	})
end