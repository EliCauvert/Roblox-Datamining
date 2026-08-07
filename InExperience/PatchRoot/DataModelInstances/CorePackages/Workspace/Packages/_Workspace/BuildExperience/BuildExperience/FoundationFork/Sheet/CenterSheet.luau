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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 50 | named "CenterSheet" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useScaledValueModule (ref), DIALOG_SIZES (ref), reactModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), dashModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), reactRobloxModule (ref)
	local var23 = withDefaultsModule(p0, t)
	local var24 = useOverlayModule()
	local var25 = useTokensModule()
	local var26 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var27 = useScaledValueModule(DIALOG_SIZES[var23.size])
	local var28 = useScaledValueModule(600)
	local size800 = var25.Size.Size_800
	local var29, var30 = reactModule.useBinding(var28)
	local var31 = if var29 then var29:map(function(p2) --[[ line: 67 ]]
		-- upvalues: var23 (ref)
		if var23.centerSheetHeight then
			return if var23.centerSheetHeight > 0 and var23.centerSheetHeight <= 1 then p2 * var23.centerSheetHeight elseif var23.centerSheetHeight > 1 then math.min(var23.centerSheetHeight, p2) else nil
		end
	end) else nil
	local var32, var33 = reactModule.useState(true)
	local var34 = reactModule.useRef(false)
	local var35, var36 = useAnimatedBinding(1, function() --[[ line: 82 ]]
		-- upvalues: var34 (ref), var23 (ref)
		if var34.current then
			var23.onClose()
		end
	end)
	local var37, var38 = useAnimatedBinding(size800, function() --[[ line: 88 ]]
		-- upvalues: var33 (ref)
		var33(false)
	end)
	local var39, var40 = reactModule.useBinding(false)
	local var41, var42 = reactModule.useBinding(false)
	local var43 = childrenHasFullBleedModule(var23.children)
	local var44, var45 = reactModule.useBinding(0)
	local var46, var47 = reactModule.useBinding(0)
	local var48, var49 = reactModule.useBinding(0)
	local var50 = reactModule.useRef(nil)
	local var51, var52 = reactModule.useState(nil)
	local var53 = reactModule.useMemo(function() --[[ line: 105 ]]
		local frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.AutomaticSize = Enum.AutomaticSize.XY
		
		return frame
	end, {})
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: var53 (ref)
		return function() --[[ line: 114 ]]
			-- upvalues: var53 (copy)
			var53:Destroy()
		end
	end, { var53 })
	local var54 = reactModule.useCallback(function(p3) --[[ line: 120 ]]
		-- upvalues: var53 (ref)
		if p3 then
			var53.Parent = p3
			
			return
		end
		var53.Parent = nil
	end, { var53 })
	reactModule.useEffect(function() --[[ line: 131 ]]
		-- upvalues: reducedMotion (ref), var38 (ref), otterModule (copy), var36 (ref), var25 (ref)
		if reducedMotion then
			var38(otterModule.instant(0))
			var36(otterModule.instant(0))
			
			return
		end
		var38(otterModule.ease(0, {
			easingStyle = var25.Ease.StandardOut,
			duration = var25.Time.Time_300
		}))
		var36(otterModule.ease(0, { duration = var25.Time.Time_100 }))
	end, {})
	local var55 = reactModule.useCallback(function() --[[ line: 147 ]]
		-- upvalues: var34 (ref), reducedMotion (ref), var38 (ref), otterModule (copy), size800 (ref), var36 (ref), var25 (ref), var33 (ref)
		if var34.current then return end
		if reducedMotion then
			var34.current = true
			var38(otterModule.instant(size800))
			var36(otterModule.instant(1))
			
			return
		end
		var38(otterModule.ease(size800, {
			easingStyle = var25.Ease.StandardIn,
			duration = var25.Time.Time_100
		}))
		var36(otterModule.ease(1, { duration = var25.Time.Time_100 }))
		var33(true)
		var34.current = true
	end, { size800, reducedMotion })
	reactModule.useImperativeHandle(var23.sheetRef, function() --[[ line: 168 ]]
		-- upvalues: var55 (ref)
		return { close = var55 }
	end, {})
	local createElement = reactModule.createElement
	createElement = createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = if var23.centerSheetHeight and var31 then var31:map(function(p4) --[[ line: 210 ]]
			return if p4 then UDim2.new(1, 0, 0, p4) else nil
		end) else nil,
		sizeConstraint = if var23.centerSheetHeight and var29 then {
			MaxSize = var29:map(function(p5) --[[ line: 216 ]]
				return Vector2.new(1e999, p5)
			end)
		} else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onActivated = dashModule.noop,
		onAbsoluteSizeChanged = function(value) --[[ line: 227 ]]
			-- upvalues: var49 (ref)
			var49(value.AbsoluteSize.Y)
		end,
		ref = p1,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		tag = {
			["bg-surface-100 stroke-default stroke-standard radius-large"] = true,
			["size-full-0 auto-y"] = var23.centerSheetHeight == nil
		},
		testId = var23.testId
	}, {
		Content = reactModule.createElement(viewModule, {
			tag = "col items-center size-full-0 auto-y clip",
			Size = if var23.centerSheetHeight and var31 then var31:map(function(p6) --[[ line: 243 ]]
				return if p6 then UDim2.new(1, 0, 0, p6) else nil
			end) else nil
		}, reactModule.createElement(sheetContextModule.Provider, {
			value = reactModule.useMemo(function() --[[ line: 175 ]]
				-- upvalues: dashModule (copy), var39 (ref), var40 (ref), var31 (ref), var46 (ref), var47 (ref), var41 (ref), var42 (ref), var43 (ref), var44 (ref), var45 (ref), var55 (ref), sheetTypeModule (copy), var23 (ref), var50 (ref), var51 (ref), var52 (ref)
				return {
					actionsHeight = 0,
					sheetHeightAvailable = 0,
					safeAreaPadding = 0,
					bottomPadding = 0,
					innerScrollingEnabled = true,
					hasRadius = true,
					setActionsHeight = dashModule.noop,
					hasActionsDivider = var39,
					setHasActionsDivider = var40,
					sheetContentHeight = var31,
					setSheetContentHeight = dashModule.noop,
					setSheetHeightAvailable = dashModule.noop,
					innerScrollY = var46,
					setInnerScrollY = var47,
					hasHeader = var41,
					setHasHeader = var42,
					hasFullBleed = var43,
					fullBleedHeight = var44,
					setFullBleedHeight = var45,
					closeSheet = var55,
					sheetType = sheetTypeModule.Center,
					testId = var23.testId,
					closeAffordanceRef = var50,
					contentStartRef = var51,
					setContentStartRef = var52
				}
			end, {
				var23.testId, var55, var51, var50, var31, var43
			})
		}, reactModule.createElement(elevationOwnerScope, { owner = var26 }, var23.children))),
		CloseAffordance = reactModule.createElement(closeAffordanceModule, {
			onActivated = var55,
			ref = var50,
			NextSelectionDown = var51,
			variant = if var43 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
			Position = UDim2.new(1, -var25.Margin.Small, 0, var25.Margin.Small),
			AnchorPoint = Vector2.new(1, 0),
			Visible = var41:map(function(p7) --[[ line: 260 ]]
				return not p7
			end),
			testId = `{var23.testId}--close-affordance`
		})
	})
	local var56 = reactModule.createElement(imageModule, {
		ZIndex = 1,
		tag = "anchor-center-left",
		Image = SHADOW_IMAGE,
		Size = var48:map(function(p8) --[[ line: 269 ]]
			-- upvalues: SHADOW_SIZE (copy)
			return UDim2.new(1, SHADOW_SIZE * 2, 0, p8 + SHADOW_SIZE * 2)
		end),
		Position = UDim2.new(0, -SHADOW_SIZE, 0.5, 0),
		slice = {
			scale = 2,
			center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
		},
		imageStyle = var25.Color.Extended.Black.Black_10
	})
	local var57 = var24
	
	if var57 then
		var57 = reactModule.createElement
		var57 = var57(reactModule.Fragment, nil, {
			OverlayPortal = reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
				tag = "size-full",
				ZIndex = var26.zIndex,
				testId = `{var23.testId}--surface`
			}, {
				SheetContainer = reactModule.createElement(viewModule, {
					ZIndex = 2,
					tag = "col align-y-center anchor-center-center size-full padding-medium",
					ref = var54,
					sizeConstraint = { MaxSize = Vector2.new(var27, var28) },
					Position = var37:map(function(p9) --[[ line: 296 ]]
						return UDim2.new(0.5, 0, 0.5, p9)
					end),
					testId = `{var23.testId}--center-sheet-container`,
					GroupTransparency = if var32 then var37:map(function(p10) --[[ line: 302 ]]
						-- upvalues: size800 (ref)
						return p10 / size800
					end) else nil,
					onAbsoluteSizeChanged = if var23.centerSheetHeight and var30 then function(p11) --[[ line: 307 ]]
						-- upvalues: var25 (ref), var30 (ref), var28 (ref)
						var30(math.min(p11.AbsoluteSize.Y - var25.Margin.Medium * 2, var28))
					end else nil
				}),
				Backdrop = reactModule.createElement(viewModule, {
					ZIndex = 1,
					Size = UDim2.fromScale(2, 2),
					Position = UDim2.fromScale(-0.5, -0.5),
					stateLayer = { affordance = stateLayerAffordanceModule.None },
					backgroundStyle = var35:map(function(p12) --[[ line: 320 ]]
						-- upvalues: var25 (ref)
						return {
							Color3 = var25.Color.Common.Backdrop.Color3,
							Transparency = math.lerp(var25.Color.Common.Backdrop.Transparency, 1, p12)
						}
					end),
					onActivated = var55,
					testId = `{var23.testId}--backdrop`
				})
			}), var24),
			SheetContent = reactRobloxModule.createPortal({ Sheet = createElement, Shadow = var56 }, var53)
		})
	end
	return var57
end))