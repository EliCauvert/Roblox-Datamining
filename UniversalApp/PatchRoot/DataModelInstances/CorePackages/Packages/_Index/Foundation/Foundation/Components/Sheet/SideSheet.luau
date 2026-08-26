local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local useAnimatedBinding = require(parent.ReactOtter).useAnimatedBinding
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local constantsModule = require(foundation.Constants)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local sheetContextModule = require(script.Parent.SheetContext)
local typesModule = require(script.Parent.Types)
local sheetTypeModule = require(script.Parent.SheetType)
local useElevationModule = require(foundation.Providers.Elevation.useElevation)
local elevationOwnerScope = require(foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local elevationLayerModule = require(foundation.Enums.ElevationLayer)
local dialogSizeModule = require(foundation.Enums.DialogSize)
local childrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local useHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local useScreenSizeModule = require(script.Parent.useScreenSize)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local imageModule = require(foundation.Components.Image)
local viewModule = require(foundation.Components.View)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local t = {
	[dialogSizeModule.Medium] = { TARGET_WIDTH = 0.4, MIN = 360, MAX = 440 },
	[dialogSizeModule.Large] = { TARGET_WIDTH = 0.5, MIN = 440, MAX = 640 }
}
local t_1 = {
	testId = "--foundation-sheet",
	size = dialogSizeModule.Medium
}
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useHardwareInsetsModule (ref), useScreenSizeModule (ref), t (ref), reactModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), dashModule (ref), sheetTypeModule (ref), reactRobloxModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var1 = withDefaultsModule(p1, t_1)
	local var2 = useOverlayModule()
	local var3 = useTokensModule()
	local var4 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var5 = useScreenSizeModule()
	local right = useHardwareInsetsModule(var2).right
	local var6 = var1.displaySize == Enum.DisplaySize.Small
	local clampedValue = math.clamp(var5.X * t[var1.size].TARGET_WIDTH, t[var1.size].MIN * var3.Config.UI.Scale, t[var1.size].MAX * var3.Config.UI.Scale)
	local medium = var3.Padding.Medium
	local var7 = reactModule.useRef(false)
	local var8, var9 = useAnimatedBinding(1, function()
		-- upvalues: var7 (ref), var1 (ref)
		if var7.current then
			var1.onClose()
		end
	end)
	local var10 = -(right + (if var6 then 0 else medium))
	local var11, var12 = useAnimatedBinding(var10)
	local var13, var14 = reactModule.useBinding(false)
	local var15, var16 = reactModule.useBinding(false)
	local _ = nil
	local _ = nil
	local _ = nil
	local var17 = childrenHasFullBleedModule(var1.children)
	local var18, var19 = reactModule.useBinding(0)
	local var20 = var18
	local var21 = var19
	local var22, var23 = reactModule.useBinding(0)
	local var24 = reactModule.useRef(nil)
	local var25, var26 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: reducedMotion (ref), var12 (ref), otterModule (copy), clampedValue (ref), var9 (ref), var3 (ref)
		if reducedMotion then
			var12(otterModule.instant(clampedValue))
			var9(otterModule.instant(0))
			
			return
		end
		var12(otterModule.ease(clampedValue, {
			easingStyle = var3.Ease.StandardOut,
			duration = var3.Time.Time_300
		}))
		var9(otterModule.ease(0, { duration = var3.Time.Time_100 }))
	end, { clampedValue, reducedMotion })
	local var27 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), reducedMotion (ref), var12 (ref), otterModule (copy), var10 (ref), var9 (ref), var3 (ref)
		if var7.current then return end
		if reducedMotion then
			var7.current = true
			var12(otterModule.instant(var10))
			var9(otterModule.instant(1))
			
			return
		end
		var12(otterModule.ease(var10, {
			easingStyle = var3.Ease.StandardIn,
			duration = var3.Time.Time_100
		}))
		var9(otterModule.ease(1, { duration = var3.Time.Time_100 }))
		var7.current = true
	end, { var10, reducedMotion })
	reactModule.useImperativeHandle(var1.sheetRef, function()
		-- upvalues: var27 (ref)
		return { close = var27 }
	end, {})
	local uDim2 = UDim2.new(0, clampedValue + (if var6 then right else 0), 1, if var6 then 0 else -medium * 2)
	local var28 = var11:map(function(p3)
		-- upvalues: var6 (ref), medium (ref)
		return UDim2.new(1, if var6 then -p3 else -(p3 + medium), 0, if var6 then 0 else medium)
	end)
	local var1 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), var13 (ref), var14 (ref), var22 (ref), var23 (ref), var15 (ref), var16 (ref), var17 (write), var20 (write), var21 (write), var27 (ref), var6 (ref), sheetTypeModule (copy), var1 (ref), var24 (ref), var25 (ref), var26 (ref)
		return {
			actionsHeight = 0,
			sheetHeightAvailable = 0,
			safeAreaPadding = 0,
			bottomPadding = 0,
			innerScrollingEnabled = true,
			setActionsHeight = dashModule.noop,
			hasActionsDivider = var13,
			setHasActionsDivider = var14,
			setSheetHeightAvailable = dashModule.noop,
			innerScrollY = var22,
			setInnerScrollY = var23,
			hasHeader = var15,
			setHasHeader = var16,
			hasFullBleed = var17,
			fullBleedHeight = var20,
			setFullBleedHeight = var21,
			closeSheet = var27,
			hasRadius = not var6,
			sheetType = sheetTypeModule.Side,
			testId = var1.testId,
			closeAffordanceRef = var24,
			contentStartRef = var25,
			setContentStartRef = var26
		}
	end, {
		var1.testId, var27, var25, var24, var17, var6
	})
	local var2 = var2
	
	if var2 then
		var2 = reactRobloxModule.createPortal
		var2 = var2(reactModule.createElement(viewModule, {
			tag = "size-full",
			ZIndex = var4.zIndex,
			testId = `{var1.testId}--surface`
		}, {
			Sheet = reactModule.createElement(viewModule, {
				ClipsDescendants = true,
				ZIndex = 3,
				Size = uDim2,
				Position = var28,
				padding = if var6 and right > 0 then { right = UDim.new(0, right) } else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				ref = p2,
				selection = typesModule.nonSelectable,
				selectionGroup = typesModule.isolatedSelectionGroup,
				tag = {
					["stroke-standard stroke-default bg-surface-100"] = true,
					["radius-large"] = not var6
				},
				testId = var1.testId
			}, {
				Content = reactModule.createElement(viewModule, { tag = "col items-center size-full-full clip" }, reactModule.createElement(sheetContextModule.Provider, { value = var1 }, reactModule.createElement(elevationOwnerScope, { owner = var4 }, var1.children))),
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					onActivated = var27,
					ref = var24,
					NextSelectionDown = var25,
					variant = if var17 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var3.Margin.Small, 0, var3.Margin.Small),
					AnchorPoint = Vector2.new(1, 0),
					Visible = var15:map(function(p3)
						return not p3
					end),
					testId = `{var1.testId}--close-affordance`
				})
			}),
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				Image = SHADOW_IMAGE,
				Size = uDim2 + UDim2.fromOffset(SHADOW_SIZE * 2, SHADOW_SIZE * 2),
				Position = var28:map(function(p3)
					-- upvalues: SHADOW_SIZE (copy)
					return p3 + UDim2.fromOffset(-SHADOW_SIZE, -SHADOW_SIZE)
				end),
				slice = {
					scale = 2,
					center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
				},
				imageStyle = var3.Color.Extended.Black.Black_10
			}),
			Backdrop = reactModule.createElement(viewModule, {
				ZIndex = 1,
				Size = UDim2.fromScale(2, 2),
				Position = UDim2.fromScale(-0.5, -0.5),
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				backgroundStyle = var8:map(function(p3)
					-- upvalues: var3 (ref)
					return {
						Color3 = var3.Color.Common.Backdrop.Color3,
						Transparency = math.lerp(var3.Color.Common.Backdrop.Transparency, 1, p3)
					}
				end),
				onActivated = var27,
				testId = `{var1.testId}--backdrop`
			})
		}), var2)
	end
	return var2
end))