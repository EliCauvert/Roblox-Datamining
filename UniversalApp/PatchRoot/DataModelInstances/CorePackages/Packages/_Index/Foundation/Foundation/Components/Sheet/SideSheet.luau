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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 64 | named "SideSheet" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useHardwareInsetsModule (ref), useScreenSizeModule (ref), t (ref), reactModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), dashModule (ref), sheetTypeModule (ref), reactRobloxModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var26 = withDefaultsModule(p0, t_1)
	local var27 = useOverlayModule()
	local var28 = useTokensModule()
	local var29 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var30 = useScreenSizeModule()
	local right = useHardwareInsetsModule(var27).right
	local var31 = var26.displaySize == Enum.DisplaySize.Small
	local clampedValue = math.clamp(var30.X * t[var26.size].TARGET_WIDTH, t[var26.size].MIN * var28.Config.UI.Scale, t[var26.size].MAX * var28.Config.UI.Scale)
	local medium = var28.Padding.Medium
	local var33 = reactModule.useRef(false)
	local var34, var35 = useAnimatedBinding(1, function() --[[ line: 86 ]]
		-- upvalues: var33 (ref), var26 (ref)
		if var33.current then
			var26.onClose()
		end
	end)
	local var36 = -(right + (if var31 then 0 else medium))
	local var37, var38 = useAnimatedBinding(var36)
	local var39, var40 = reactModule.useBinding(false)
	local var41, var42 = reactModule.useBinding(false)
	local _ = nil
	local _ = nil
	local _ = nil
	local var43 = childrenHasFullBleedModule(var26.children)
	local var44, var45 = reactModule.useBinding(0)
	local var46 = var44
	local var47 = var45
	local var48, var49 = reactModule.useBinding(0)
	local var50 = reactModule.useRef(nil)
	local var51, var52 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 108 ]]
		-- upvalues: reducedMotion (ref), var38 (ref), otterModule (copy), clampedValue (ref), var35 (ref), var28 (ref)
		if reducedMotion then
			var38(otterModule.instant(clampedValue))
			var35(otterModule.instant(0))
			
			return
		end
		var38(otterModule.ease(clampedValue, {
			easingStyle = var28.Ease.StandardOut,
			duration = var28.Time.Time_300
		}))
		var35(otterModule.ease(0, { duration = var28.Time.Time_100 }))
	end, { clampedValue, reducedMotion })
	local var53 = reactModule.useCallback(function() --[[ line: 124 ]]
		-- upvalues: var33 (ref), reducedMotion (ref), var38 (ref), otterModule (copy), var36 (ref), var35 (ref), var28 (ref)
		if var33.current then return end
		if reducedMotion then
			var33.current = true
			var38(otterModule.instant(var36))
			var35(otterModule.instant(1))
			
			return
		end
		var38(otterModule.ease(var36, {
			easingStyle = var28.Ease.StandardIn,
			duration = var28.Time.Time_100
		}))
		var35(otterModule.ease(1, { duration = var28.Time.Time_100 }))
		var33.current = true
	end, { var36, reducedMotion })
	reactModule.useImperativeHandle(var26.sheetRef, function() --[[ line: 144 ]]
		-- upvalues: var53 (ref)
		return { close = var53 }
	end, {})
	local uDim2 = UDim2.new(0, clampedValue + (if var31 then right else 0), 1, if var31 then 0 else -medium * 2)
	local var55 = var37:map(function(p2) --[[ line: 157 ]]
		-- upvalues: var31 (ref), medium (ref)
		return UDim2.new(1, if var31 then -p2 else -(p2 + medium), 0, if var31 then 0 else medium)
	end)
	local var56 = reactModule.useMemo(function() --[[ line: 167 ]]
		-- upvalues: dashModule (copy), var39 (ref), var40 (ref), var48 (ref), var49 (ref), var41 (ref), var42 (ref), var43 (write), var46 (write), var47 (write), var53 (ref), var31 (ref), sheetTypeModule (copy), var26 (ref), var50 (ref), var51 (ref), var52 (ref)
		return {
			actionsHeight = 0,
			sheetHeightAvailable = 0,
			safeAreaPadding = 0,
			bottomPadding = 0,
			innerScrollingEnabled = true,
			setActionsHeight = dashModule.noop,
			hasActionsDivider = var39,
			setHasActionsDivider = var40,
			setSheetHeightAvailable = dashModule.noop,
			innerScrollY = var48,
			setInnerScrollY = var49,
			hasHeader = var41,
			setHasHeader = var42,
			hasFullBleed = var43,
			fullBleedHeight = var46,
			setFullBleedHeight = var47,
			closeSheet = var53,
			hasRadius = not var31,
			sheetType = sheetTypeModule.Side,
			testId = var26.testId,
			closeAffordanceRef = var50,
			contentStartRef = var51,
			setContentStartRef = var52
		}
	end, {
		var26.testId, var53, var51, var50, var43, var31
	})
	local var57 = var27
	
	if var57 then
		var57 = reactRobloxModule.createPortal
		var57 = var57(reactModule.createElement(viewModule, {
			tag = "size-full",
			ZIndex = var29.zIndex,
			testId = `{var26.testId}--surface`
		}, {
			Sheet = reactModule.createElement(viewModule, {
				ClipsDescendants = true,
				ZIndex = 3,
				Size = uDim2,
				Position = var55,
				padding = if var31 and right > 0 then { right = UDim.new(0, right) } else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				ref = p1,
				selection = typesModule.nonSelectable,
				selectionGroup = typesModule.isolatedSelectionGroup,
				tag = {
					["stroke-standard stroke-default bg-surface-100"] = true,
					["radius-large"] = not var31
				},
				testId = var26.testId
			}, {
				Content = reactModule.createElement(viewModule, { tag = "col items-center size-full-full clip" }, reactModule.createElement(sheetContextModule.Provider, { value = var56 }, reactModule.createElement(elevationOwnerScope, { owner = var29 }, var26.children))),
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					onActivated = var53,
					ref = var50,
					NextSelectionDown = var51,
					variant = if var43 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var28.Margin.Small, 0, var28.Margin.Small),
					AnchorPoint = Vector2.new(1, 0),
					Visible = var41:map(function(p3) --[[ line: 253 ]]
						return not p3
					end),
					testId = `{var26.testId}--close-affordance`
				})
			}),
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				Image = SHADOW_IMAGE,
				Size = uDim2 + UDim2.fromOffset(SHADOW_SIZE * 2, SHADOW_SIZE * 2),
				Position = var55:map(function(p4) --[[ line: 262 ]]
					-- upvalues: SHADOW_SIZE (copy)
					return p4 + UDim2.fromOffset(-SHADOW_SIZE, -SHADOW_SIZE)
				end),
				slice = {
					scale = 2,
					center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
				},
				imageStyle = var28.Color.Extended.Black.Black_10
			}),
			Backdrop = reactModule.createElement(viewModule, {
				ZIndex = 1,
				Size = UDim2.fromScale(2, 2),
				Position = UDim2.fromScale(-0.5, -0.5),
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				backgroundStyle = var34:map(function(p5) --[[ line: 279 ]]
					-- upvalues: var28 (ref)
					return {
						Color3 = var28.Color.Common.Backdrop.Color3,
						Transparency = math.lerp(var28.Color.Common.Backdrop.Transparency, 1, p5)
					}
				end),
				onActivated = var53,
				testId = `{var26.testId}--backdrop`
			})
		}), var27)
	end
	return var57
end))