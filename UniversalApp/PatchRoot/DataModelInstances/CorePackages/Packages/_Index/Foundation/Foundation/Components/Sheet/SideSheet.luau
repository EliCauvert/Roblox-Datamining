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
local useScaledValueModule = require(foundation.Utility.useScaledValue)
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
	size = if flagsModule.FoundationSideSheetNewWidthCalculation then dialogSizeModule.Medium else nil
}
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 69 | named "SideSheet" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useHardwareInsetsModule (ref), flagsModule (ref), useScreenSizeModule (ref), t (ref), useScaledValueModule (ref), reactModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), dashModule (ref), sheetTypeModule (ref), reactRobloxModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var28 = withDefaultsModule(p0, t_1)
	local var29 = useOverlayModule()
	local var30 = useTokensModule()
	local var31 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var32 = if flagsModule.FoundationSideSheetNewWidthCalculation then useScreenSizeModule() else nil
	local right = useHardwareInsetsModule(var29).right
	local var33 = var28.displaySize == Enum.DisplaySize.Small
	local TARGET_WIDTH = nil
	local var34 = nil
	local var35 = nil
	
	if flagsModule.FoundationSideSheetNewWidthCalculation then
		local scale = var30.Config.UI.Scale
		TARGET_WIDTH = t[var28.size].TARGET_WIDTH
		var34 = t[var28.size].MIN * scale
		var35 = t[var28.size].MAX * scale
	end
	local var36 = if flagsModule.FoundationSideSheetNewWidthCalculation then math.clamp(var32.X * TARGET_WIDTH, var34, var35) else useScaledValueModule(if var33 then 400 else 360)
	local medium = var30.Padding.Medium
	local var37 = reactModule.useRef(false)
	local var38, var39 = useAnimatedBinding(1, function() --[[ line: 99 ]]
		-- upvalues: var37 (ref), var28 (ref)
		if var37.current then
			var28.onClose()
		end
	end)
	local var40 = -(right + (if var33 then 0 else medium))
	local var41, var42 = useAnimatedBinding(var40)
	local var43, var44 = reactModule.useBinding(false)
	local var45, var46 = reactModule.useBinding(false)
	local var47 = nil
	local var48 = nil
	local var49 = nil
	
	if flagsModule.FoundationSheetFullBleed then
		var47 = childrenHasFullBleedModule(var28.children)
		local var50, var51 = reactModule.useBinding(0)
		var48 = var50
		var49 = var51
	end
	local var52, var53 = reactModule.useBinding(0)
	local var54 = reactModule.useRef(nil)
	local var55, var56 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: reducedMotion (ref), var42 (ref), otterModule (copy), var36 (ref), var39 (ref), var30 (ref)
		if reducedMotion then
			var42(otterModule.instant(var36))
			var39(otterModule.instant(0))
			
			return
		end
		var42(otterModule.ease(var36, {
			easingStyle = var30.Ease.StandardOut,
			duration = var30.Time.Time_300
		}))
		var39(otterModule.ease(0, { duration = var30.Time.Time_100 }))
	end, { var36, reducedMotion })
	local var57 = reactModule.useCallback(function() --[[ line: 139 ]]
		-- upvalues: var37 (ref), reducedMotion (ref), var42 (ref), otterModule (copy), var40 (ref), var39 (ref), var30 (ref)
		if var37.current then return end
		if reducedMotion then
			var37.current = true
			var42(otterModule.instant(var40))
			var39(otterModule.instant(1))
			
			return
		end
		var42(otterModule.ease(var40, {
			easingStyle = var30.Ease.StandardIn,
			duration = var30.Time.Time_100
		}))
		var39(otterModule.ease(1, { duration = var30.Time.Time_100 }))
		var37.current = true
	end, { var40, reducedMotion })
	reactModule.useImperativeHandle(var28.sheetRef, function() --[[ line: 159 ]]
		-- upvalues: var57 (ref)
		return { close = var57 }
	end, {})
	local uDim2 = UDim2.new(0, var36 + (if var33 then right else 0), 1, if var33 then 0 else -medium * 2)
	local var59 = var41:map(function(p2) --[[ line: 172 ]]
		-- upvalues: var33 (ref), medium (ref)
		return UDim2.new(1, if var33 then -p2 else -(p2 + medium), 0, if var33 then 0 else medium)
	end)
	local var60 = reactModule.useMemo(function() --[[ line: 182 ]]
		-- upvalues: dashModule (copy), var43 (ref), var44 (ref), var52 (ref), var53 (ref), var45 (ref), var46 (ref), flagsModule (copy), var47 (write), var48 (write), var49 (write), var57 (ref), var33 (ref), sheetTypeModule (copy), var28 (ref), var54 (ref), var55 (ref), var56 (ref)
		return {
			actionsHeight = 0,
			sheetHeightAvailable = 0,
			safeAreaPadding = 0,
			bottomPadding = 0,
			innerScrollingEnabled = true,
			setActionsHeight = dashModule.noop,
			hasActionsDivider = var43,
			setHasActionsDivider = var44,
			setSheetHeightAvailable = dashModule.noop,
			innerScrollY = var52,
			setInnerScrollY = var53,
			hasHeader = var45,
			setHasHeader = var46,
			hasFullBleed = if flagsModule.FoundationSheetFullBleed then var47 else nil,
			fullBleedHeight = if flagsModule.FoundationSheetFullBleed then var48 else nil,
			setFullBleedHeight = if flagsModule.FoundationSheetFullBleed then var49 else nil,
			closeSheet = var57,
			hasRadius = if flagsModule.FoundationSheetFullBleed then not var33 else nil,
			sheetType = sheetTypeModule.Side,
			testId = var28.testId,
			closeAffordanceRef = var54,
			contentStartRef = var55,
			setContentStartRef = var56
		}
	end, {
		var28.testId, var57, var55, var54, var47,
		if flagsModule.FoundationSheetFullBleed then var33 else nil
	})
	local var61 = var29
	
	if var61 then
		var61 = reactRobloxModule.createPortal
		var61 = var61(reactModule.createElement(viewModule, {
			tag = "size-full",
			ZIndex = var31.zIndex,
			testId = `{var28.testId}--surface`
		}, {
			Sheet = reactModule.createElement(viewModule, {
				ClipsDescendants = true,
				ZIndex = 3,
				Size = uDim2,
				Position = var59,
				padding = if var33 and right > 0 then { right = UDim.new(0, right) } else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				ref = p1,
				selection = typesModule.nonSelectable,
				selectionGroup = typesModule.isolatedSelectionGroup,
				tag = {
					["stroke-standard stroke-default bg-surface-100"] = true,
					["radius-large"] = not var33
				},
				testId = var28.testId
			}, {
				Content = reactModule.createElement(viewModule, { tag = "col items-center size-full-full clip" }, reactModule.createElement(sheetContextModule.Provider, { value = var60 }, reactModule.createElement(elevationOwnerScope, { owner = var31 }, var28.children))),
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					onActivated = var57,
					ref = var54,
					NextSelectionDown = var55,
					variant = if flagsModule.FoundationSheetFullBleed and var47 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var30.Margin.Small, 0, var30.Margin.Small),
					AnchorPoint = Vector2.new(1, 0),
					Visible = var45:map(function(p3) --[[ line: 268 ]]
						return not p3
					end),
					testId = `{var28.testId}--close-affordance`
				})
			}),
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				Image = SHADOW_IMAGE,
				Size = uDim2 + UDim2.fromOffset(SHADOW_SIZE * 2, SHADOW_SIZE * 2),
				Position = var59:map(function(p4) --[[ line: 277 ]]
					-- upvalues: SHADOW_SIZE (copy)
					return p4 + UDim2.fromOffset(-SHADOW_SIZE, -SHADOW_SIZE)
				end),
				slice = {
					scale = 2,
					center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
				},
				imageStyle = var30.Color.Extended.Black.Black_10
			}),
			Backdrop = reactModule.createElement(viewModule, {
				ZIndex = 1,
				Size = UDim2.fromScale(2, 2),
				Position = UDim2.fromScale(-0.5, -0.5),
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				backgroundStyle = var38:map(function(p5) --[[ line: 294 ]]
					-- upvalues: var30 (ref)
					return {
						Color3 = var30.Color.Common.Backdrop.Color3,
						Transparency = math.lerp(var30.Color.Common.Backdrop.Transparency, 1, p5)
					}
				end),
				onActivated = var57,
				testId = `{var28.testId}--backdrop`
			})
		}), var29)
	end
	return var61
end))