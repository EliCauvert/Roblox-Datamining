local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local useAnimatedBinding = require(parent.ReactOtter).useAnimatedBinding
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local DIALOG_SIZES = require(foundation.Components.Dialog.useDialogVariants).DIALOG_SIZES
local constantsModule = require(foundation.Constants)
local dialogSizeModule = require(foundation.Enums.DialogSize)
local elevationLayerModule = require(foundation.Enums.ElevationLayer)
local useElevationModule = require(foundation.Providers.Elevation.useElevation)
local elevationOwnerScope = require(foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local flagsModule = require(foundation.Utility.Flags)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local sheetContextModule = require(script.Parent.SheetContext)
local typesModule = require(script.Parent.Types)
local sheetTypeModule = require(script.Parent.SheetType)
local childrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local imageModule = require(foundation.Components.Image)
local viewModule = require(foundation.Components.View)
local t = {
	testId = "--foundation-sheet",
	size = dialogSizeModule.Medium
}
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 52 | named "CenterSheet" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useScaledValueModule (ref), DIALOG_SIZES (ref), reactModule (ref), useAnimatedBinding (ref), flagsModule (ref), childrenHasFullBleedModule (ref), otterModule (ref), dashModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), reactRobloxModule (ref)
	local var25 = withDefaultsModule(p0, t)
	local var26 = useOverlayModule()
	local var27 = useTokensModule()
	local var28 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var29 = useScaledValueModule(DIALOG_SIZES[var25.size])
	local var30 = useScaledValueModule(600)
	local size800 = var27.Size.Size_800
	local var31, var32 = reactModule.useBinding(var30)
	local var33 = if var31 then var31:map(function(p2) --[[ line: 69 ]]
		-- upvalues: var25 (ref)
		if var25.centerSheetHeight then
			return if var25.centerSheetHeight > 0 and var25.centerSheetHeight <= 1 then p2 * var25.centerSheetHeight elseif var25.centerSheetHeight > 1 then math.min(var25.centerSheetHeight, p2) else nil
		end
	end) else nil
	local var34, var35 = reactModule.useState(true)
	local var36 = reactModule.useRef(false)
	local var37, var38 = useAnimatedBinding(1, function() --[[ line: 84 ]]
		-- upvalues: var36 (ref), var25 (ref)
		if var36.current then
			var25.onClose()
		end
	end)
	local var39, var40 = useAnimatedBinding(size800, function() --[[ line: 90 ]]
		-- upvalues: var35 (ref)
		var35(false)
	end)
	local var41, var42 = reactModule.useBinding(false)
	local var43, var44 = reactModule.useBinding(false)
	local var45 = nil
	local var46 = nil
	local var47 = nil
	
	if flagsModule.FoundationSheetFullBleed then
		var45 = childrenHasFullBleedModule(var25.children)
		local var48, var49 = reactModule.useBinding(0)
		var46 = var48
		var47 = var49
	end
	local var50, var51 = reactModule.useBinding(0)
	local var52, var53 = reactModule.useBinding(0)
	local var54 = reactModule.useRef(nil)
	local var55, var56 = reactModule.useState(nil)
	local var57 = if flagsModule.FoundationCenterSheetUseStableContainer then reactModule.useMemo(function() --[[ line: 112 ]]
		local frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.AutomaticSize = Enum.AutomaticSize.XY
		
		return frame
	end, {}) else nil
	
	if flagsModule.FoundationCenterSheetUseStableContainer then
		reactModule.useEffect(function() --[[ line: 122 ]]
			-- upvalues: var57 (ref)
			return function() --[[ line: 123 ]]
				-- upvalues: var57 (copy)
				var57:Destroy()
			end
		end, {})
	end
	local var58 = if flagsModule.FoundationCenterSheetUseStableContainer then reactModule.useCallback(function(p3) --[[ line: 131 ]]
		-- upvalues: var57 (ref)
		if p3 then
			var57.Parent = p3
			
			return
		end
		var57.Parent = nil
	end, {}) else nil
	reactModule.useEffect(function() --[[ line: 143 ]]
		-- upvalues: reducedMotion (ref), var40 (ref), otterModule (copy), var38 (ref), var27 (ref)
		if reducedMotion then
			var40(otterModule.instant(0))
			var38(otterModule.instant(0))
			
			return
		end
		var40(otterModule.ease(0, {
			easingStyle = var27.Ease.StandardOut,
			duration = var27.Time.Time_300
		}))
		var38(otterModule.ease(0, { duration = var27.Time.Time_100 }))
	end, {})
	local var59 = reactModule.useCallback(function() --[[ line: 159 ]]
		-- upvalues: var36 (ref), reducedMotion (ref), var40 (ref), otterModule (copy), size800 (ref), var38 (ref), var27 (ref), var35 (ref)
		if var36.current then return end
		if reducedMotion then
			var36.current = true
			var40(otterModule.instant(size800))
			var38(otterModule.instant(1))
			
			return
		end
		var40(otterModule.ease(size800, {
			easingStyle = var27.Ease.StandardIn,
			duration = var27.Time.Time_100
		}))
		var38(otterModule.ease(1, { duration = var27.Time.Time_100 }))
		var35(true)
		var36.current = true
	end, { size800, reducedMotion })
	reactModule.useImperativeHandle(var25.sheetRef, function() --[[ line: 180 ]]
		-- upvalues: var59 (ref)
		return { close = var59 }
	end, {})
	local createElement = reactModule.createElement
	createElement = createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = if var25.centerSheetHeight and var33 then var33:map(function(p4) --[[ line: 222 ]]
			return if p4 then UDim2.new(1, 0, 0, p4) else nil
		end) else nil,
		sizeConstraint = if var25.centerSheetHeight and var31 then {
			MaxSize = var31:map(function(p5) --[[ line: 228 ]]
				return Vector2.new(1e999, p5)
			end)
		} else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onActivated = dashModule.noop,
		onAbsoluteSizeChanged = function(value) --[[ line: 239 ]]
			-- upvalues: var53 (ref)
			var53(value.AbsoluteSize.Y)
		end,
		ref = p1,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		tag = {
			["bg-surface-100 stroke-default stroke-standard radius-large"] = true,
			["size-full-0 auto-y"] = var25.centerSheetHeight == nil
		},
		testId = var25.testId
	}, {
		Content = reactModule.createElement(viewModule, {
			tag = "col items-center size-full-0 auto-y clip",
			Size = if var25.centerSheetHeight and var33 then var33:map(function(p6) --[[ line: 255 ]]
				return if p6 then UDim2.new(1, 0, 0, p6) else nil
			end) else nil
		}, reactModule.createElement(sheetContextModule.Provider, {
			value = reactModule.useMemo(function() --[[ line: 187 ]]
				-- upvalues: dashModule (copy), var41 (ref), var42 (ref), var33 (ref), var50 (ref), var51 (ref), var43 (ref), var44 (ref), flagsModule (copy), var45 (write), var46 (write), var47 (write), var59 (ref), sheetTypeModule (copy), var25 (ref), var54 (ref), var55 (ref), var56 (ref)
				return {
					actionsHeight = 0,
					sheetHeightAvailable = 0,
					safeAreaPadding = 0,
					bottomPadding = 0,
					innerScrollingEnabled = true,
					setActionsHeight = dashModule.noop,
					hasActionsDivider = var41,
					setHasActionsDivider = var42,
					sheetContentHeight = var33,
					setSheetContentHeight = dashModule.noop,
					setSheetHeightAvailable = dashModule.noop,
					innerScrollY = var50,
					setInnerScrollY = var51,
					hasHeader = var43,
					setHasHeader = var44,
					hasFullBleed = if flagsModule.FoundationSheetFullBleed then var45 else nil,
					fullBleedHeight = if flagsModule.FoundationSheetFullBleed then var46 else nil,
					setFullBleedHeight = if flagsModule.FoundationSheetFullBleed then var47 else nil,
					closeSheet = var59,
					hasRadius = if flagsModule.FoundationSheetFullBleed then true else nil,
					sheetType = sheetTypeModule.Center,
					testId = var25.testId,
					closeAffordanceRef = var54,
					contentStartRef = var55,
					setContentStartRef = var56
				}
			end, {
				var25.testId, var59, var55, var54, var33, var45
			})
		}, reactModule.createElement(elevationOwnerScope, { owner = var28 }, var25.children))),
		CloseAffordance = reactModule.createElement(closeAffordanceModule, {
			onActivated = var59,
			ref = var54,
			NextSelectionDown = var55,
			variant = if flagsModule.FoundationSheetFullBleed and var45 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
			Position = UDim2.new(1, -var27.Margin.Small, 0, var27.Margin.Small),
			AnchorPoint = Vector2.new(1, 0),
			Visible = var43:map(function(p7) --[[ line: 274 ]]
				return not p7
			end),
			testId = `{var25.testId}--close-affordance`
		})
	})
	local var60 = reactModule.createElement(imageModule, {
		ZIndex = 1,
		tag = "anchor-center-left",
		Image = SHADOW_IMAGE,
		Size = var52:map(function(p8) --[[ line: 283 ]]
			-- upvalues: SHADOW_SIZE (copy)
			return UDim2.new(1, SHADOW_SIZE * 2, 0, p8 + SHADOW_SIZE * 2)
		end),
		Position = UDim2.new(0, -SHADOW_SIZE, 0.5, 0),
		slice = {
			scale = 2,
			center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
		},
		imageStyle = var27.Color.Extended.Black.Black_10
	})
	local var61 = var26
	
	if var61 then
		var61 = reactModule.createElement
		var61 = var61(reactModule.Fragment, nil, {
			OverlayPortal = reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
				tag = "size-full",
				ZIndex = var28.zIndex,
				testId = `{var25.testId}--surface`
			}, {
				SheetContainer = reactModule.createElement(viewModule, {
					ZIndex = 2,
					tag = "col align-y-center anchor-center-center size-full padding-medium",
					ref = var58,
					sizeConstraint = { MaxSize = Vector2.new(var29, var30) },
					Position = var39:map(function(p9) --[[ line: 312 ]]
						return UDim2.new(0.5, 0, 0.5, p9)
					end),
					testId = `{var25.testId}--center-sheet-container`,
					GroupTransparency = if var34 then var39:map(function(p10) --[[ line: 318 ]]
						-- upvalues: size800 (ref)
						return p10 / size800
					end) else nil,
					onAbsoluteSizeChanged = if var25.centerSheetHeight and var32 then function(p11) --[[ line: 323 ]]
						-- upvalues: var27 (ref), var32 (ref), var30 (ref)
						var32(math.min(p11.AbsoluteSize.Y - var27.Margin.Medium * 2, var30))
					end else nil
				}, if not flagsModule.FoundationCenterSheetUseStableContainer then {
					Sheet = createElement,
					Shadow = reactModule.createElement("Folder", nil, var60)
				} else nil),
				Backdrop = reactModule.createElement(viewModule, {
					ZIndex = 1,
					Size = UDim2.fromScale(2, 2),
					Position = UDim2.fromScale(-0.5, -0.5),
					stateLayer = { affordance = stateLayerAffordanceModule.None },
					backgroundStyle = var37:map(function(p12) --[[ line: 343 ]]
						-- upvalues: var27 (ref)
						return {
							Color3 = var27.Color.Common.Backdrop.Color3,
							Transparency = math.lerp(var27.Color.Common.Backdrop.Transparency, 1, p12)
						}
					end),
					onActivated = var59,
					testId = `{var25.testId}--backdrop`
				})
			}), var26),
			SheetContent = if flagsModule.FoundationCenterSheetUseStableContainer then reactRobloxModule.createPortal({ Sheet = createElement, Shadow = var60 }, var57) else nil
		})
	end
	return var61
end))