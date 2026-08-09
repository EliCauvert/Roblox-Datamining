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
	local var27 = withDefaultsModule(p0, t_1)
	local var28 = useOverlayModule()
	local var29 = useTokensModule()
	local var30 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var31 = if flagsModule.FoundationSideSheetNewWidthCalculation then useScreenSizeModule() else nil
	local right = useHardwareInsetsModule(var28).right
	local var32 = var27.displaySize == Enum.DisplaySize.Small
	local TARGET_WIDTH = nil
	local var33 = nil
	local var34 = nil
	
	if flagsModule.FoundationSideSheetNewWidthCalculation then
		local scale = var29.Config.UI.Scale
		TARGET_WIDTH = t[var27.size].TARGET_WIDTH
		var33 = t[var27.size].MIN * scale
		var34 = t[var27.size].MAX * scale
	end
	local var35 = if flagsModule.FoundationSideSheetNewWidthCalculation then math.clamp(var31.X * TARGET_WIDTH, var33, var34) else useScaledValueModule(if var32 then 400 else 360)
	local medium = var29.Padding.Medium
	local var36 = reactModule.useRef(false)
	local var37, var38 = useAnimatedBinding(1, function() --[[ line: 99 ]]
		-- upvalues: var36 (ref), var27 (ref)
		if var36.current then
			var27.onClose()
		end
	end)
	local var39 = -(right + (if var32 then 0 else medium))
	local var40, var41 = useAnimatedBinding(var39)
	local var42, var43 = reactModule.useBinding(false)
	local var44, var45 = reactModule.useBinding(false)
	local var46 = nil
	local var47 = nil
	local var48 = nil
	
	if flagsModule.FoundationSheetFullBleed then
		var46 = childrenHasFullBleedModule(var27.children)
		local var49, var50 = reactModule.useBinding(0)
		var47 = var49
		var48 = var50
	end
	local var51, var52 = reactModule.useBinding(0)
	local var53 = reactModule.useRef(nil)
	local var54, var55 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: reducedMotion (ref), var41 (ref), otterModule (copy), var35 (ref), var38 (ref), var29 (ref)
		if reducedMotion then
			var41(otterModule.instant(var35))
			var38(otterModule.instant(0))
			
			return
		end
		var41(otterModule.ease(var35, {
			easingStyle = var29.Ease.StandardOut,
			duration = var29.Time.Time_300
		}))
		var38(otterModule.ease(0, { duration = var29.Time.Time_100 }))
	end, { var35, reducedMotion })
	local var56 = reactModule.useCallback(function() --[[ line: 139 ]]
		-- upvalues: var36 (ref), reducedMotion (ref), var41 (ref), otterModule (copy), var39 (ref), var38 (ref), var29 (ref)
		if var36.current then return end
		if reducedMotion then
			var36.current = true
			var41(otterModule.instant(var39))
			var38(otterModule.instant(1))
			
			return
		end
		var41(otterModule.ease(var39, {
			easingStyle = var29.Ease.StandardIn,
			duration = var29.Time.Time_100
		}))
		var38(otterModule.ease(1, { duration = var29.Time.Time_100 }))
		var36.current = true
	end, { var39, reducedMotion })
	reactModule.useImperativeHandle(var27.sheetRef, function() --[[ line: 159 ]]
		-- upvalues: var56 (ref)
		return { close = var56 }
	end, {})
	local uDim2 = UDim2.new(0, var35 + (if var32 then right else 0), 1, if var32 then 0 else -medium * 2)
	local var58 = var40:map(function(p2) --[[ line: 172 ]]
		-- upvalues: var32 (ref), medium (ref)
		return UDim2.new(1, if var32 then -p2 else -(p2 + medium), 0, if var32 then 0 else medium)
	end)
	local var59 = reactModule.useMemo(function() --[[ line: 182 ]]
		-- upvalues: dashModule (copy), var42 (ref), var43 (ref), var51 (ref), var52 (ref), var44 (ref), var45 (ref), flagsModule (copy), var46 (write), var47 (write), var48 (write), var56 (ref), var32 (ref), sheetTypeModule (copy), var27 (ref), var53 (ref), var54 (ref), var55 (ref)
		return {
			actionsHeight = 0,
			sheetHeightAvailable = 0,
			safeAreaPadding = 0,
			bottomPadding = 0,
			innerScrollingEnabled = true,
			setActionsHeight = dashModule.noop,
			hasActionsDivider = var42,
			setHasActionsDivider = var43,
			setSheetHeightAvailable = dashModule.noop,
			innerScrollY = var51,
			setInnerScrollY = var52,
			hasHeader = var44,
			setHasHeader = var45,
			hasFullBleed = if flagsModule.FoundationSheetFullBleed then var46 else nil,
			fullBleedHeight = if flagsModule.FoundationSheetFullBleed then var47 else nil,
			setFullBleedHeight = if flagsModule.FoundationSheetFullBleed then var48 else nil,
			closeSheet = var56,
			hasRadius = if flagsModule.FoundationSheetFullBleed then not var32 else nil,
			sheetType = sheetTypeModule.Side,
			testId = var27.testId,
			closeAffordanceRef = var53,
			contentStartRef = var54,
			setContentStartRef = var55
		}
	end, {
		var27.testId, var56, var54, var53, var46,
		if flagsModule.FoundationSheetFullBleed then var32 else nil
	})
	local var60 = var28
	
	if var60 then
		var60 = reactRobloxModule.createPortal
		var60 = var60(reactModule.createElement(viewModule, {
			tag = "size-full",
			ZIndex = var30.zIndex,
			testId = `{var27.testId}--surface`
		}, {
			Sheet = reactModule.createElement(viewModule, {
				ClipsDescendants = true,
				ZIndex = 3,
				Size = uDim2,
				Position = var58,
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
				Content = reactModule.createElement(viewModule, { tag = "col items-center size-full-full clip" }, reactModule.createElement(sheetContextModule.Provider, { value = var59 }, reactModule.createElement(elevationOwnerScope, { owner = var30 }, var27.children))),
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					onActivated = var56,
					ref = var53,
					NextSelectionDown = var54,
					variant = if flagsModule.FoundationSheetFullBleed and var46 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var29.Margin.Small, 0, var29.Margin.Small),
					AnchorPoint = Vector2.new(1, 0),
					Visible = var44:map(function(p3) --[[ line: 268 ]]
						return not p3
					end),
					testId = `{var27.testId}--close-affordance`
				})
			}),
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				Image = SHADOW_IMAGE,
				Size = uDim2 + UDim2.fromOffset(SHADOW_SIZE * 2, SHADOW_SIZE * 2),
				Position = var58:map(function(p4) --[[ line: 277 ]]
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
				backgroundStyle = var37:map(function(p5) --[[ line: 294 ]]
					-- upvalues: var29 (ref)
					return {
						Color3 = var29.Color.Common.Backdrop.Color3,
						Transparency = math.lerp(var29.Color.Common.Backdrop.Transparency, 1, p5)
					}
				end),
				onActivated = var56,
				testId = `{var27.testId}--backdrop`
			})
		}), var28)
	end
	return var60
end))