local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BannerModule = require(Foundation.Components.Banner)
local _ = require(Foundation.Components.Banner.Banner)
local InternalFloatingElementModule = require(Foundation.Components.InternalFloatingElement)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local BannerSizeModule = require(Foundation.Enums.BannerSize)
local CardDensityModule = require(Foundation.Enums.CardDensity)
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local ScreenRegionModule = require(Foundation.Providers.ScreenRegion.ScreenRegion)
local ScreenRegionKindModule = require(Foundation.Providers.ScreenRegion.ScreenRegionKind)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { testId = "--foundation-floating-banner" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), InternalFloatingElementModule (copy), WithCommonPropsModule (copy), ElevationLayerModule (copy), ScreenRegionModule (copy), ScreenRegionKindModule (copy), ViewModule (copy), BannerModule (copy), BannerSizeModule (copy), CardDensityModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2 (copy)
		if not WithDefaultsModuleResult.isOpen then
			UseStateResult2(false)
		end
	end, { WithDefaultsModuleResult.isOpen })
	local OnCloseFunction = WithDefaultsModuleResult.onClose
	local Primary = if WithDefaultsModuleResult.actions then WithDefaultsModuleResult.actions.primary else nil
	
	return ReactModule.createElement(InternalFloatingElementModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		isOpen = WithDefaultsModuleResult.isOpen and not UseStateResult,
		onCloseComplete = WithDefaultsModuleResult.onCloseComplete,
		layer = ElevationLayerModule.Floating,
		queue = {
			region = ScreenRegionModule.Bottom,
			kind = ScreenRegionKindModule.FloatingBanner
		},
		ref = Ref
	}), {
		Fill = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = "shadow-overlay-100 size-full-0 auto-y radius-medium bg-surface-200",
			testId = `{WithDefaultsModuleResult.testId}--fill`
		}, {
			Banner = ReactModule.createElement(BannerModule, {
				size = BannerSizeModule.Small,
				density = CardDensityModule.Compact,
				title = WithDefaultsModuleResult.title,
				description = WithDefaultsModuleResult.description,
				thumbnail = WithDefaultsModuleResult.thumbnail,
				actions = ReactModule.useMemo(function()
					-- upvalues: Primary (copy), UseStateResult2 (copy)
					return if Primary == nil then nil else {
						primary = {
							onActivated = function()
								-- upvalues: UseStateResult2 (upval), Primary (upval)
								UseStateResult2(true)
								Primary.onActivated()
							end
						}
					}
				end, { Primary }),
				onClose = ReactModule.useMemo(function()
					-- upvalues: OnCloseFunction (copy), UseStateResult2 (copy)
					return if OnCloseFunction == nil then nil else function()
						-- upvalues: UseStateResult2 (upval), OnCloseFunction (upval)
						UseStateResult2(true)
						OnCloseFunction()
					end
				end, { OnCloseFunction }),
				testId = `{WithDefaultsModuleResult.testId}--banner`
			})
		})
	})
end))