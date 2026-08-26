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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useScaledValueModule (ref), DIALOG_SIZES (ref), reactModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), dashModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), reactRobloxModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useOverlayModule()
	local var3 = useTokensModule()
	local var4 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var5 = useScaledValueModule(DIALOG_SIZES[var1.size])
	local var6 = useScaledValueModule(600)
	local size800 = var3.Size.Size_800
	local var7, var8 = reactModule.useBinding(var6)
	local var9 = if var7 then var7:map(function(p3)
		-- upvalues: var1 (ref)
		if var1.centerSheetHeight then
			return if var1.centerSheetHeight > 0 and var1.centerSheetHeight <= 1 then p3 * var1.centerSheetHeight elseif var1.centerSheetHeight > 1 then math.min(var1.centerSheetHeight, p3) else nil
		end
	end) else nil
	local var10, var11 = reactModule.useState(true)
	local var12 = reactModule.useRef(false)
	local var13, var14 = useAnimatedBinding(1, function()
		-- upvalues: var12 (ref), var1 (ref)
		if var12.current then
			var1.onClose()
		end
	end)
	local var15, var16 = useAnimatedBinding(size800, function()
		-- upvalues: var11 (ref)
		var11(false)
	end)
	local var17, var18 = reactModule.useBinding(false)
	local var19, var20 = reactModule.useBinding(false)
	local var21 = childrenHasFullBleedModule(var1.children)
	local var22, var23 = reactModule.useBinding(0)
	local var24, var25 = reactModule.useBinding(0)
	local var26, var27 = reactModule.useBinding(0)
	local var28 = reactModule.useRef(nil)
	local var29, var30 = reactModule.useState(nil)
	local var31 = reactModule.useMemo(function()
		local frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.AutomaticSize = Enum.AutomaticSize.XY
		
		return frame
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var31 (ref)
		return function()
			-- upvalues: var31 (copy)
			var31:Destroy()
		end
	end, { var31 })
	local var32 = reactModule.useCallback(function(p3)
		-- upvalues: var31 (ref)
		if p3 then
			var31.Parent = p3
			
			return
		end
		var31.Parent = nil
	end, { var31 })
	reactModule.useEffect(function()
		-- upvalues: reducedMotion (ref), var16 (ref), otterModule (copy), var14 (ref), var3 (ref)
		if reducedMotion then
			var16(otterModule.instant(0))
			var14(otterModule.instant(0))
			
			return
		end
		var16(otterModule.ease(0, {
			easingStyle = var3.Ease.StandardOut,
			duration = var3.Time.Time_300
		}))
		var14(otterModule.ease(0, { duration = var3.Time.Time_100 }))
	end, {})
	local var33 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), reducedMotion (ref), var16 (ref), otterModule (copy), size800 (ref), var14 (ref), var3 (ref), var11 (ref)
		if var12.current then return end
		if reducedMotion then
			var12.current = true
			var16(otterModule.instant(size800))
			var14(otterModule.instant(1))
			
			return
		end
		var16(otterModule.ease(size800, {
			easingStyle = var3.Ease.StandardIn,
			duration = var3.Time.Time_100
		}))
		var14(otterModule.ease(1, { duration = var3.Time.Time_100 }))
		var11(true)
		var12.current = true
	end, { size800, reducedMotion })
	reactModule.useImperativeHandle(var1.sheetRef, function()
		-- upvalues: var33 (ref)
		return { close = var33 }
	end, {})
	local createElement = reactModule.createElement
	createElement = createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = if var1.centerSheetHeight and var9 then var9:map(function(p3)
			return if p3 then UDim2.new(1, 0, 0, p3) else nil
		end) else nil,
		sizeConstraint = if var1.centerSheetHeight and var7 then {
			MaxSize = var7:map(function(p3)
				return Vector2.new(1e999, p3)
			end)
		} else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onActivated = dashModule.noop,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var27 (ref)
			var27(value.AbsoluteSize.Y)
		end,
		ref = p2,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		tag = {
			["bg-surface-100 stroke-default stroke-standard radius-large"] = true,
			["size-full-0 auto-y"] = var1.centerSheetHeight == nil
		},
		testId = var1.testId
	}, {
		Content = reactModule.createElement(viewModule, {
			tag = "col items-center size-full-0 auto-y clip",
			Size = if var1.centerSheetHeight and var9 then var9:map(function(p3)
				return if p3 then UDim2.new(1, 0, 0, p3) else nil
			end) else nil
		}, reactModule.createElement(sheetContextModule.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: dashModule (copy), var17 (ref), var18 (ref), var9 (ref), var24 (ref), var25 (ref), var19 (ref), var20 (ref), var21 (ref), var22 (ref), var23 (ref), var33 (ref), sheetTypeModule (copy), var1 (ref), var28 (ref), var29 (ref), var30 (ref)
				return {
					actionsHeight = 0,
					sheetHeightAvailable = 0,
					safeAreaPadding = 0,
					bottomPadding = 0,
					innerScrollingEnabled = true,
					hasRadius = true,
					setActionsHeight = dashModule.noop,
					hasActionsDivider = var17,
					setHasActionsDivider = var18,
					sheetContentHeight = var9,
					setSheetContentHeight = dashModule.noop,
					setSheetHeightAvailable = dashModule.noop,
					innerScrollY = var24,
					setInnerScrollY = var25,
					hasHeader = var19,
					setHasHeader = var20,
					hasFullBleed = var21,
					fullBleedHeight = var22,
					setFullBleedHeight = var23,
					closeSheet = var33,
					sheetType = sheetTypeModule.Center,
					testId = var1.testId,
					closeAffordanceRef = var28,
					contentStartRef = var29,
					setContentStartRef = var30
				}
			end, {
				var1.testId, var33, var29, var28, var9, var21
			})
		}, reactModule.createElement(elevationOwnerScope, { owner = var4 }, var1.children))),
		CloseAffordance = reactModule.createElement(closeAffordanceModule, {
			onActivated = var33,
			ref = var28,
			NextSelectionDown = var29,
			variant = if var21 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
			Position = UDim2.new(1, -var3.Margin.Small, 0, var3.Margin.Small),
			AnchorPoint = Vector2.new(1, 0),
			Visible = var19:map(function(p3)
				return not p3
			end),
			testId = `{var1.testId}--close-affordance`
		})
	})
	local var34 = reactModule.createElement(imageModule, {
		ZIndex = 1,
		tag = "anchor-center-left",
		Image = SHADOW_IMAGE,
		Size = var26:map(function(p3)
			-- upvalues: SHADOW_SIZE (copy)
			return UDim2.new(1, SHADOW_SIZE * 2, 0, p3 + SHADOW_SIZE * 2)
		end),
		Position = UDim2.new(0, -SHADOW_SIZE, 0.5, 0),
		slice = {
			scale = 2,
			center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
		},
		imageStyle = var3.Color.Extended.Black.Black_10
	})
	local var35 = var2
	
	if var35 then
		var35 = reactModule.createElement
		var35 = var35(reactModule.Fragment, nil, {
			OverlayPortal = reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
				tag = "size-full",
				ZIndex = var4.zIndex,
				testId = `{var1.testId}--surface`
			}, {
				SheetContainer = reactModule.createElement(viewModule, {
					ZIndex = 2,
					tag = "col align-y-center anchor-center-center size-full padding-medium",
					ref = var32,
					sizeConstraint = { MaxSize = Vector2.new(var5, var6) },
					Position = var15:map(function(p3)
						return UDim2.new(0.5, 0, 0.5, p3)
					end),
					testId = `{var1.testId}--center-sheet-container`,
					GroupTransparency = if var10 then var15:map(function(p3)
						-- upvalues: size800 (ref)
						return p3 / size800
					end) else nil,
					onAbsoluteSizeChanged = if var1.centerSheetHeight and var8 then function(p3)
						-- upvalues: var3 (ref), var8 (ref), var6 (ref)
						var8(math.min(p3.AbsoluteSize.Y - var3.Margin.Medium * 2, var6))
					end else nil
				}),
				Backdrop = reactModule.createElement(viewModule, {
					ZIndex = 1,
					Size = UDim2.fromScale(2, 2),
					Position = UDim2.fromScale(-0.5, -0.5),
					stateLayer = { affordance = stateLayerAffordanceModule.None },
					backgroundStyle = var13:map(function(p3)
						-- upvalues: var3 (ref)
						return {
							Color3 = var3.Color.Common.Backdrop.Color3,
							Transparency = math.lerp(var3.Color.Common.Backdrop.Transparency, 1, p3)
						}
					end),
					onActivated = var33,
					testId = `{var1.testId}--backdrop`
				})
			}), var2),
			SheetContent = reactRobloxModule.createPortal({ Sheet = createElement, Shadow = var34 }, var31)
		})
	end
	return var35
end))