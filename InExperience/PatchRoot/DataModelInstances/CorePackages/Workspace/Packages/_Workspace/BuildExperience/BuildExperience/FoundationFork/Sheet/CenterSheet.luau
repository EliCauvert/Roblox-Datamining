local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
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
	local var24 = withDefaultsModule(p0, t)
	local var25 = useOverlayModule()
	local var26 = useTokensModule()
	local var27 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var28 = useScaledValueModule(DIALOG_SIZES[var24.size])
	local var29 = useScaledValueModule(600)
	local size800 = var26.Size.Size_800
	local var30, var31 = reactModule.useBinding(var29)
	local var32 = if var30 then var30:map(function(p2) --[[ line: 69 ]]
		-- upvalues: var24 (ref)
		if var24.centerSheetHeight then
			return if var24.centerSheetHeight > 0 and var24.centerSheetHeight <= 1 then p2 * var24.centerSheetHeight elseif var24.centerSheetHeight > 1 then math.min(var24.centerSheetHeight, p2) else nil
		end
	end) else nil
	local var33, var34 = reactModule.useState(true)
	local var35 = reactModule.useRef(false)
	local var36, var37 = useAnimatedBinding(1, function() --[[ line: 84 ]]
		-- upvalues: var35 (ref), var24 (ref)
		if var35.current then
			var24.onClose()
		end
	end)
	local var38, var39 = useAnimatedBinding(size800, function() --[[ line: 90 ]]
		-- upvalues: var34 (ref)
		var34(false)
	end)
	local var40, var41 = reactModule.useBinding(false)
	local var42, var43 = reactModule.useBinding(false)
	local var44 = nil
	local var45 = nil
	local var46 = nil
	
	if flagsModule.FoundationSheetFullBleed then
		var44 = childrenHasFullBleedModule(var24.children)
		local var47, var48 = reactModule.useBinding(0)
		var45 = var47
		var46 = var48
	end
	local var49, var50 = reactModule.useBinding(0)
	local var51, var52 = reactModule.useBinding(0)
	local var53 = reactModule.useRef(nil)
	local var54, var55 = reactModule.useState(nil)
	local var56 = if flagsModule.FoundationCenterSheetUseStableContainer then reactModule.useMemo(function() --[[ line: 112 ]]
		local frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.AutomaticSize = Enum.AutomaticSize.XY
		
		return frame
	end, {}) else nil
	
	if flagsModule.FoundationCenterSheetUseStableContainer then
		reactModule.useEffect(function() --[[ line: 122 ]]
			-- upvalues: var56 (ref)
			return function() --[[ line: 123 ]]
				-- upvalues: var56 (copy)
				var56:Destroy()
			end
		end, {})
	end
	local var57 = if flagsModule.FoundationCenterSheetUseStableContainer then reactModule.useCallback(function(p3) --[[ line: 131 ]]
		-- upvalues: var56 (ref)
		if p3 then
			var56.Parent = p3
			
			return
		end
		var56.Parent = nil
	end, {}) else nil
	reactModule.useEffect(function() --[[ line: 143 ]]
		-- upvalues: reducedMotion (ref), var39 (ref), otterModule (copy), var37 (ref), var26 (ref)
		if reducedMotion then
			var39(otterModule.instant(0))
			var37(otterModule.instant(0))
			
			return
		end
		var39(otterModule.ease(0, {
			easingStyle = var26.Ease.StandardOut,
			duration = var26.Time.Time_300
		}))
		var37(otterModule.ease(0, { duration = var26.Time.Time_100 }))
	end, {})
	local var58 = reactModule.useCallback(function() --[[ line: 159 ]]
		-- upvalues: var35 (ref), reducedMotion (ref), var39 (ref), otterModule (copy), size800 (ref), var37 (ref), var26 (ref), var34 (ref)
		if var35.current then return end
		if reducedMotion then
			var35.current = true
			var39(otterModule.instant(size800))
			var37(otterModule.instant(1))
			
			return
		end
		var39(otterModule.ease(size800, {
			easingStyle = var26.Ease.StandardIn,
			duration = var26.Time.Time_100
		}))
		var37(otterModule.ease(1, { duration = var26.Time.Time_100 }))
		var34(true)
		var35.current = true
	end, { size800, reducedMotion })
	reactModule.useImperativeHandle(var24.sheetRef, function() --[[ line: 180 ]]
		-- upvalues: var58 (ref)
		return { close = var58 }
	end, {})
	local createElement = reactModule.createElement
	createElement = createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = if var24.centerSheetHeight and var32 then var32:map(function(p4) --[[ line: 222 ]]
			return if p4 then UDim2.new(1, 0, 0, p4) else nil
		end) else nil,
		sizeConstraint = if var24.centerSheetHeight and var30 then {
			MaxSize = var30:map(function(p5) --[[ line: 228 ]]
				return Vector2.new(1e999, p5)
			end)
		} else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onActivated = dashModule.noop,
		onAbsoluteSizeChanged = function(value) --[[ line: 239 ]]
			-- upvalues: var52 (ref)
			var52(value.AbsoluteSize.Y)
		end,
		ref = p1,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		tag = {
			["bg-surface-100 stroke-default stroke-standard radius-large"] = true,
			["size-full-0 auto-y"] = var24.centerSheetHeight == nil
		},
		testId = var24.testId
	}, {
		Content = reactModule.createElement(viewModule, {
			tag = "col items-center size-full-0 auto-y clip",
			Size = if var24.centerSheetHeight and var32 then var32:map(function(p6) --[[ line: 255 ]]
				return if p6 then UDim2.new(1, 0, 0, p6) else nil
			end) else nil
		}, reactModule.createElement(sheetContextModule.Provider, {
			value = reactModule.useMemo(function() --[[ line: 187 ]]
				-- upvalues: dashModule (copy), var40 (ref), var41 (ref), var32 (ref), var49 (ref), var50 (ref), var42 (ref), var43 (ref), flagsModule (copy), var44 (write), var45 (write), var46 (write), var58 (ref), sheetTypeModule (copy), var24 (ref), var53 (ref), var54 (ref), var55 (ref)
				return {
					actionsHeight = 0,
					sheetHeightAvailable = 0,
					safeAreaPadding = 0,
					bottomPadding = 0,
					innerScrollingEnabled = true,
					setActionsHeight = dashModule.noop,
					hasActionsDivider = var40,
					setHasActionsDivider = var41,
					sheetContentHeight = var32,
					setSheetContentHeight = dashModule.noop,
					setSheetHeightAvailable = dashModule.noop,
					innerScrollY = var49,
					setInnerScrollY = var50,
					hasHeader = var42,
					setHasHeader = var43,
					hasFullBleed = if flagsModule.FoundationSheetFullBleed then var44 else nil,
					fullBleedHeight = if flagsModule.FoundationSheetFullBleed then var45 else nil,
					setFullBleedHeight = if flagsModule.FoundationSheetFullBleed then var46 else nil,
					closeSheet = var58,
					hasRadius = if flagsModule.FoundationSheetFullBleed then true else nil,
					sheetType = sheetTypeModule.Center,
					testId = var24.testId,
					closeAffordanceRef = var53,
					contentStartRef = var54,
					setContentStartRef = var55
				}
			end, {
				var24.testId, var58, var54, var53, var32, var44
			})
		}, reactModule.createElement(elevationOwnerScope, { owner = var27 }, var24.children))),
		CloseAffordance = reactModule.createElement(closeAffordanceModule, {
			onActivated = var58,
			ref = var53,
			NextSelectionDown = var54,
			variant = if flagsModule.FoundationSheetFullBleed and var44 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
			Position = UDim2.new(1, -var26.Margin.Small, 0, var26.Margin.Small),
			AnchorPoint = Vector2.new(1, 0),
			Visible = var42:map(function(p7) --[[ line: 274 ]]
				return not p7
			end),
			testId = `{var24.testId}--close-affordance`
		})
	})
	local var59 = reactModule.createElement(imageModule, {
		ZIndex = 1,
		tag = "anchor-center-left",
		Image = SHADOW_IMAGE,
		Size = var51:map(function(p8) --[[ line: 283 ]]
			-- upvalues: SHADOW_SIZE (copy)
			return UDim2.new(1, SHADOW_SIZE * 2, 0, p8 + SHADOW_SIZE * 2)
		end),
		Position = UDim2.new(0, -SHADOW_SIZE, 0.5, 0),
		slice = {
			scale = 2,
			center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
		},
		imageStyle = var26.Color.Extended.Black.Black_10
	})
	local var60 = var25
	
	if var60 then
		var60 = reactModule.createElement
		var60 = var60(reactModule.Fragment, nil, {
			OverlayPortal = reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
				tag = "size-full",
				ZIndex = var27.zIndex,
				testId = `{var24.testId}--surface`
			}, {
				SheetContainer = reactModule.createElement(viewModule, {
					ZIndex = 2,
					tag = "col align-y-center anchor-center-center size-full padding-medium",
					ref = var57,
					sizeConstraint = { MaxSize = Vector2.new(var28, var29) },
					Position = var38:map(function(p9) --[[ line: 312 ]]
						return UDim2.new(0.5, 0, 0.5, p9)
					end),
					testId = `{var24.testId}--center-sheet-container`,
					GroupTransparency = if var33 then var38:map(function(p10) --[[ line: 318 ]]
						-- upvalues: size800 (ref)
						return p10 / size800
					end) else nil,
					onAbsoluteSizeChanged = if var24.centerSheetHeight and var31 then function(p11) --[[ line: 323 ]]
						-- upvalues: var26 (ref), var31 (ref), var29 (ref)
						var31(math.min(p11.AbsoluteSize.Y - var26.Margin.Medium * 2, var29))
					end else nil
				}, if not flagsModule.FoundationCenterSheetUseStableContainer then {
					Sheet = createElement,
					Shadow = reactModule.createElement("Folder", nil, var59)
				} else nil),
				Backdrop = reactModule.createElement(viewModule, {
					ZIndex = 1,
					Size = UDim2.fromScale(2, 2),
					Position = UDim2.fromScale(-0.5, -0.5),
					stateLayer = { affordance = stateLayerAffordanceModule.None },
					backgroundStyle = var36:map(function(p12) --[[ line: 343 ]]
						-- upvalues: var26 (ref)
						return {
							Color3 = var26.Color.Common.Backdrop.Color3,
							Transparency = math.lerp(var26.Color.Common.Backdrop.Transparency, 1, p12)
						}
					end),
					onActivated = var58,
					testId = `{var24.testId}--backdrop`
				})
			}), var25),
			SheetContent = if flagsModule.FoundationCenterSheetUseStableContainer then reactRobloxModule.createPortal({ Sheet = createElement, Shadow = var59 }, var56) else nil
		})
	end
	return var60
end))