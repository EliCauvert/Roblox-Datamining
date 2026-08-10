local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 64 | named "SideSheet" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useHardwareInsetsModule (ref), useScreenSizeModule (ref), t (ref), reactModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), dashModule (ref), sheetTypeModule (ref), reactRobloxModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var25 = withDefaultsModule(p0, t_1)
	local var26 = useOverlayModule()
	local var27 = useTokensModule()
	local var28 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var29 = useScreenSizeModule()
	local right = useHardwareInsetsModule(var26).right
	local var30 = var25.displaySize == Enum.DisplaySize.Small
	local scale = var27.Config.UI.Scale
	local clampedValue = math.clamp(var29.X * t[var25.size].TARGET_WIDTH, t[var25.size].MIN * scale, t[var25.size].MAX * scale)
	local medium = var27.Padding.Medium
	local var32 = reactModule.useRef(false)
	local var33, var34 = useAnimatedBinding(1, function() --[[ line: 87 ]]
		-- upvalues: var32 (ref), var25 (ref)
		if var32.current then
			var25.onClose()
		end
	end)
	local var35 = -(right + (if var30 then 0 else medium))
	local var36, var37 = useAnimatedBinding(var35)
	local var38, var39 = reactModule.useBinding(false)
	local var40, var41 = reactModule.useBinding(false)
	local var42 = childrenHasFullBleedModule(var25.children)
	local var43, var44 = reactModule.useBinding(0)
	local var45, var46 = reactModule.useBinding(0)
	local var47 = reactModule.useRef(nil)
	local var48, var49 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: reducedMotion (ref), var37 (ref), otterModule (copy), clampedValue (ref), var34 (ref), var27 (ref)
		if reducedMotion then
			var37(otterModule.instant(clampedValue))
			var34(otterModule.instant(0))
			
			return
		end
		var37(otterModule.ease(clampedValue, {
			easingStyle = var27.Ease.StandardOut,
			duration = var27.Time.Time_300
		}))
		var34(otterModule.ease(0, { duration = var27.Time.Time_100 }))
	end, { clampedValue, reducedMotion })
	local var50 = reactModule.useCallback(function() --[[ line: 123 ]]
		-- upvalues: var32 (ref), reducedMotion (ref), var37 (ref), otterModule (copy), var35 (ref), var34 (ref), var27 (ref)
		if var32.current then return end
		if reducedMotion then
			var32.current = true
			var37(otterModule.instant(var35))
			var34(otterModule.instant(1))
			
			return
		end
		var37(otterModule.ease(var35, {
			easingStyle = var27.Ease.StandardIn,
			duration = var27.Time.Time_100
		}))
		var34(otterModule.ease(1, { duration = var27.Time.Time_100 }))
		var32.current = true
	end, { var35, reducedMotion })
	reactModule.useImperativeHandle(var25.sheetRef, function() --[[ line: 143 ]]
		-- upvalues: var50 (ref)
		return { close = var50 }
	end, {})
	local uDim2 = UDim2.new(0, clampedValue + (if var30 then right else 0), 1, if var30 then 0 else -medium * 2)
	local var52 = var36:map(function(p2) --[[ line: 156 ]]
		-- upvalues: var30 (ref), medium (ref)
		return UDim2.new(1, if var30 then -p2 else -(p2 + medium), 0, if var30 then 0 else medium)
	end)
	local var53 = reactModule.useMemo(function() --[[ line: 166 ]]
		-- upvalues: dashModule (copy), var38 (ref), var39 (ref), var45 (ref), var46 (ref), var40 (ref), var41 (ref), var42 (ref), var43 (ref), var44 (ref), var50 (ref), var30 (ref), sheetTypeModule (copy), var25 (ref), var47 (ref), var48 (ref), var49 (ref)
		return {
			actionsHeight = 0,
			sheetHeightAvailable = 0,
			safeAreaPadding = 0,
			bottomPadding = 0,
			innerScrollingEnabled = true,
			setActionsHeight = dashModule.noop,
			hasActionsDivider = var38,
			setHasActionsDivider = var39,
			setSheetHeightAvailable = dashModule.noop,
			innerScrollY = var45,
			setInnerScrollY = var46,
			hasHeader = var40,
			setHasHeader = var41,
			hasFullBleed = var42,
			fullBleedHeight = var43,
			setFullBleedHeight = var44,
			closeSheet = var50,
			hasRadius = not var30,
			sheetType = sheetTypeModule.Side,
			testId = var25.testId,
			closeAffordanceRef = var47,
			contentStartRef = var48,
			setContentStartRef = var49
		}
	end, {
		var25.testId, var50, var48, var47, var42, var30
	})
	local var54 = var26
	
	if var54 then
		var54 = reactRobloxModule.createPortal
		var54 = var54(reactModule.createElement(viewModule, {
			tag = "size-full",
			ZIndex = var28.zIndex,
			testId = `{var25.testId}--surface`
		}, {
			Sheet = reactModule.createElement(viewModule, {
				ClipsDescendants = true,
				ZIndex = 3,
				Size = uDim2,
				Position = var52,
				padding = if var30 and right > 0 then { right = UDim.new(0, right) } else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				ref = p1,
				selection = typesModule.nonSelectable,
				selectionGroup = typesModule.isolatedSelectionGroup,
				tag = {
					["stroke-standard stroke-default bg-surface-100"] = true,
					["radius-large"] = not var30
				},
				testId = var25.testId
			}, {
				Content = reactModule.createElement(viewModule, { tag = "col items-center size-full-full clip" }, reactModule.createElement(sheetContextModule.Provider, { value = var53 }, reactModule.createElement(elevationOwnerScope, { owner = var28 }, var25.children))),
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					onActivated = var50,
					ref = var47,
					NextSelectionDown = var48,
					variant = if var42 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var27.Margin.Small, 0, var27.Margin.Small),
					AnchorPoint = Vector2.new(1, 0),
					Visible = var40:map(function(p3) --[[ line: 252 ]]
						return not p3
					end),
					testId = `{var25.testId}--close-affordance`
				})
			}),
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				Image = SHADOW_IMAGE,
				Size = uDim2 + UDim2.fromOffset(SHADOW_SIZE * 2, SHADOW_SIZE * 2),
				Position = var52:map(function(p4) --[[ line: 261 ]]
					-- upvalues: SHADOW_SIZE (copy)
					return p4 + UDim2.fromOffset(-SHADOW_SIZE, -SHADOW_SIZE)
				end),
				slice = {
					scale = 2,
					center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
				},
				imageStyle = var27.Color.Extended.Black.Black_10
			}),
			Backdrop = reactModule.createElement(viewModule, {
				ZIndex = 1,
				Size = UDim2.fromScale(2, 2),
				Position = UDim2.fromScale(-0.5, -0.5),
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				backgroundStyle = var33:map(function(p5) --[[ line: 278 ]]
					-- upvalues: var27 (ref)
					return {
						Color3 = var27.Color.Common.Backdrop.Color3,
						Transparency = math.lerp(var27.Color.Common.Backdrop.Transparency, 1, p5)
					}
				end),
				onActivated = var50,
				testId = `{var25.testId}--backdrop`
			})
		}), var26)
	end
	return var54
end))