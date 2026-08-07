-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:08 2026 Pacific Standard Time.

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
local flagsModule = require(foundation.Utility.Flags)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 65 | named "SideSheet" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useHardwareInsetsModule (ref), useScreenSizeModule (ref), t (ref), reactModule (ref), useAnimatedBinding (ref), flagsModule (ref), childrenHasFullBleedModule (ref), otterModule (ref), dashModule (ref), sheetTypeModule (ref), reactRobloxModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var27 = withDefaultsModule(p0, t_1)
	local var28 = useOverlayModule()
	local var29 = useTokensModule()
	local var30 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var31 = useScreenSizeModule()
	local right = useHardwareInsetsModule(var28).right
	local var32 = var27.displaySize == Enum.DisplaySize.Small
	local clampedValue = math.clamp(var31.X * t[var27.size].TARGET_WIDTH, t[var27.size].MIN * var29.Config.UI.Scale, t[var27.size].MAX * var29.Config.UI.Scale)
	local medium = var29.Padding.Medium
	local var34 = reactModule.useRef(false)
	local var35, var36 = useAnimatedBinding(1, function() --[[ line: 87 ]]
		-- upvalues: var34 (ref), var27 (ref)
		if var34.current then
			var27.onClose()
		end
	end)
	local var37 = -(right + (if var32 then 0 else medium))
	local var38, var39 = useAnimatedBinding(var37)
	local var40, var41 = reactModule.useBinding(false)
	local var42, var43 = reactModule.useBinding(false)
	local var44 = nil
	local var45 = nil
	local var46 = nil
	
	if flagsModule.FoundationSheetFullBleed then
		var44 = childrenHasFullBleedModule(var27.children)
		local var47, var48 = reactModule.useBinding(0)
		var45 = var47
		var46 = var48
	end
	local var49, var50 = reactModule.useBinding(0)
	local var51 = reactModule.useRef(nil)
	local var52, var53 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 111 ]]
		-- upvalues: reducedMotion (ref), var39 (ref), otterModule (copy), clampedValue (ref), var36 (ref), var29 (ref)
		if reducedMotion then
			var39(otterModule.instant(clampedValue))
			var36(otterModule.instant(0))
			
			return
		end
		var39(otterModule.ease(clampedValue, {
			easingStyle = var29.Ease.StandardOut,
			duration = var29.Time.Time_300
		}))
		var36(otterModule.ease(0, { duration = var29.Time.Time_100 }))
	end, { clampedValue, reducedMotion })
	local var54 = reactModule.useCallback(function() --[[ line: 127 ]]
		-- upvalues: var34 (ref), reducedMotion (ref), var39 (ref), otterModule (copy), var37 (ref), var36 (ref), var29 (ref)
		if var34.current then return end
		if reducedMotion then
			var34.current = true
			var39(otterModule.instant(var37))
			var36(otterModule.instant(1))
			
			return
		end
		var39(otterModule.ease(var37, {
			easingStyle = var29.Ease.StandardIn,
			duration = var29.Time.Time_100
		}))
		var36(otterModule.ease(1, { duration = var29.Time.Time_100 }))
		var34.current = true
	end, { var37, reducedMotion })
	reactModule.useImperativeHandle(var27.sheetRef, function() --[[ line: 147 ]]
		-- upvalues: var54 (ref)
		return { close = var54 }
	end, {})
	local uDim2 = UDim2.new(0, clampedValue + (if var32 then right else 0), 1, if var32 then 0 else -medium * 2)
	local var56 = var38:map(function(p2) --[[ line: 160 ]]
		-- upvalues: var32 (ref), medium (ref)
		return UDim2.new(1, if var32 then -p2 else -(p2 + medium), 0, if var32 then 0 else medium)
	end)
	local var57 = reactModule.useMemo(function() --[[ line: 170 ]]
		-- upvalues: dashModule (copy), var40 (ref), var41 (ref), var49 (ref), var50 (ref), var42 (ref), var43 (ref), flagsModule (copy), var44 (write), var45 (write), var46 (write), var54 (ref), var32 (ref), sheetTypeModule (copy), var27 (ref), var51 (ref), var52 (ref), var53 (ref)
		return {
			actionsHeight = 0,
			sheetHeightAvailable = 0,
			safeAreaPadding = 0,
			bottomPadding = 0,
			innerScrollingEnabled = true,
			setActionsHeight = dashModule.noop,
			hasActionsDivider = var40,
			setHasActionsDivider = var41,
			setSheetHeightAvailable = dashModule.noop,
			innerScrollY = var49,
			setInnerScrollY = var50,
			hasHeader = var42,
			setHasHeader = var43,
			hasFullBleed = if flagsModule.FoundationSheetFullBleed then var44 else nil,
			fullBleedHeight = if flagsModule.FoundationSheetFullBleed then var45 else nil,
			setFullBleedHeight = if flagsModule.FoundationSheetFullBleed then var46 else nil,
			closeSheet = var54,
			hasRadius = if flagsModule.FoundationSheetFullBleed then not var32 else nil,
			sheetType = sheetTypeModule.Side,
			testId = var27.testId,
			closeAffordanceRef = var51,
			contentStartRef = var52,
			setContentStartRef = var53
		}
	end, {
		var27.testId, var54, var52, var51, var44,
		if flagsModule.FoundationSheetFullBleed then var32 else nil
	})
	local var58 = var28
	
	if var58 then
		var58 = reactRobloxModule.createPortal
		var58 = var58(reactModule.createElement(viewModule, {
			tag = "size-full",
			ZIndex = var30.zIndex,
			testId = `{var27.testId}--surface`
		}, {
			Sheet = reactModule.createElement(viewModule, {
				ClipsDescendants = true,
				ZIndex = 3,
				Size = uDim2,
				Position = var56,
				padding = if var32 and right > 0 then { right = UDim.new(0, right) } else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				ref = p1,
				selection = typesModule.nonSelectable,
				selectionGroup = typesModule.isolatedSelectionGroup,
				tag = {
					["stroke-standard stroke-default bg-surface-100"] = true,
					["radius-large"] = not var32
				},
				testId = var27.testId
			}, {
				Content = reactModule.createElement(viewModule, { tag = "col items-center size-full-full clip" }, reactModule.createElement(sheetContextModule.Provider, { value = var57 }, reactModule.createElement(elevationOwnerScope, { owner = var30 }, var27.children))),
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					onActivated = var54,
					ref = var51,
					NextSelectionDown = var52,
					variant = if flagsModule.FoundationSheetFullBleed and var44 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var29.Margin.Small, 0, var29.Margin.Small),
					AnchorPoint = Vector2.new(1, 0),
					Visible = var42:map(function(p3) --[[ line: 256 ]]
						return not p3
					end),
					testId = `{var27.testId}--close-affordance`
				})
			}),
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				Image = SHADOW_IMAGE,
				Size = uDim2 + UDim2.fromOffset(SHADOW_SIZE * 2, SHADOW_SIZE * 2),
				Position = var56:map(function(p4) --[[ line: 265 ]]
					-- upvalues: SHADOW_SIZE (copy)
					return p4 + UDim2.fromOffset(-SHADOW_SIZE, -SHADOW_SIZE)
				end),
				slice = {
					scale = 2,
					center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
				},
				imageStyle = var29.Color.Extended.Black.Black_10
			}),
			Backdrop = reactModule.createElement(viewModule, {
				ZIndex = 1,
				Size = UDim2.fromScale(2, 2),
				Position = UDim2.fromScale(-0.5, -0.5),
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				backgroundStyle = var35:map(function(p5) --[[ line: 282 ]]
					-- upvalues: var29 (ref)
					return {
						Color3 = var29.Color.Common.Backdrop.Color3,
						Transparency = math.lerp(var29.Color.Common.Backdrop.Transparency, 1, p5)
					}
				end),
				onActivated = var54,
				testId = `{var27.testId}--backdrop`
			})
		}), var28)
	end
	return var58
end))