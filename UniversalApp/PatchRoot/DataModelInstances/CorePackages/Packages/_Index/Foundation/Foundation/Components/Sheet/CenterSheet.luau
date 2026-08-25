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
	local var9 = if var7 then var7:map(function(p1)
		-- upvalues: var1 (ref)
		if var1.centerSheetHeight then
			return if var1.centerSheetHeight > 0 and var1.centerSheetHeight <= 1 then p1 * var1.centerSheetHeight elseif var1.centerSheetHeight > 1 then math.min(var1.centerSheetHeight, p1) else nil
		end
	end) else nil
	local var1, var2 = reactModule.useState(true)
	local var3 = reactModule.useRef(false)
	local var4, var5 = useAnimatedBinding(1, function()
		-- upvalues: var3 (ref), var1 (ref)
		if var3.current then
			var1.onClose()
		end
	end)
	local var6, var7 = useAnimatedBinding(size800, function()
		-- upvalues: var2 (ref)
		var2(false)
	end)
	local var8, var9 = reactModule.useBinding(false)
	local var10, var11 = reactModule.useBinding(false)
	local _ = nil
	local _ = nil
	local _ = nil
	local var12 = childrenHasFullBleedModule(var1.children)
	local var13, var14 = reactModule.useBinding(0)
	local var15 = var13
	local var16 = var14
	local var17, var18 = reactModule.useBinding(0)
	local var19, var20 = reactModule.useBinding(0)
	local var21 = reactModule.useRef(nil)
	local var22, var23 = reactModule.useState(nil)
	local var24 = reactModule.useMemo(function()
		local frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.AutomaticSize = Enum.AutomaticSize.XY
		
		return frame
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var24 (ref)
		return function()
			-- upvalues: var24 (copy)
			var24:Destroy()
		end
	end, {})
	local var25 = reactModule.useCallback(function(p1)
		-- upvalues: var24 (ref)
		if p1 then
			var24.Parent = p1
			
			return
		end
		var24.Parent = nil
	end, {})
	reactModule.useEffect(function()
		-- upvalues: reducedMotion (ref), var7 (ref), otterModule (copy), var5 (ref), var3 (ref)
		if reducedMotion then
			var7(otterModule.instant(0))
			var5(otterModule.instant(0))
			
			return
		end
		var7(otterModule.ease(0, {
			easingStyle = var3.Ease.StandardOut,
			duration = var3.Time.Time_300
		}))
		var5(otterModule.ease(0, { duration = var3.Time.Time_100 }))
	end, {})
	local var26 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), reducedMotion (ref), var7 (ref), otterModule (copy), size800 (ref), var5 (ref), var3 (ref), var2 (ref)
		if var3.current then return end
		if reducedMotion then
			var3.current = true
			var7(otterModule.instant(size800))
			var5(otterModule.instant(1))
			
			return
		end
		var7(otterModule.ease(size800, {
			easingStyle = var3.Ease.StandardIn,
			duration = var3.Time.Time_100
		}))
		var5(otterModule.ease(1, { duration = var3.Time.Time_100 }))
		var2(true)
		var3.current = true
	end, { size800, reducedMotion })
	reactModule.useImperativeHandle(var1.sheetRef, function()
		-- upvalues: var26 (ref)
		return { close = var26 }
	end, {})
	local createElement = reactModule.createElement
	createElement = createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = if var1.centerSheetHeight and var9 then var9:map(function(p1)
			return if p1 then UDim2.new(1, 0, 0, p1) else nil
		end) else nil,
		sizeConstraint = if var1.centerSheetHeight and var7 then {
			MaxSize = var7:map(function(p1)
				return Vector2.new(1e999, p1)
			end)
		} else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onActivated = dashModule.noop,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var20 (ref)
			var20(value.AbsoluteSize.Y)
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
			Size = if var1.centerSheetHeight and var9 then var9:map(function(p1)
				return if p1 then UDim2.new(1, 0, 0, p1) else nil
			end) else nil
		}, reactModule.createElement(sheetContextModule.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: dashModule (copy), var8 (ref), var9 (ref), var9 (ref), var17 (ref), var18 (ref), var10 (ref), var11 (ref), var12 (write), var15 (write), var16 (write), var26 (ref), sheetTypeModule (copy), var1 (ref), var21 (ref), var22 (ref), var23 (ref)
				return {
					actionsHeight = 0,
					sheetHeightAvailable = 0,
					safeAreaPadding = 0,
					bottomPadding = 0,
					innerScrollingEnabled = true,
					hasRadius = true,
					setActionsHeight = dashModule.noop,
					hasActionsDivider = var8,
					setHasActionsDivider = var9,
					sheetContentHeight = var9,
					setSheetContentHeight = dashModule.noop,
					setSheetHeightAvailable = dashModule.noop,
					innerScrollY = var17,
					setInnerScrollY = var18,
					hasHeader = var10,
					setHasHeader = var11,
					hasFullBleed = var12,
					fullBleedHeight = var15,
					setFullBleedHeight = var16,
					closeSheet = var26,
					sheetType = sheetTypeModule.Center,
					testId = var1.testId,
					closeAffordanceRef = var21,
					contentStartRef = var22,
					setContentStartRef = var23
				}
			end, {
				var1.testId, var26, var22, var21, var9, var12
			})
		}, reactModule.createElement(elevationOwnerScope, { owner = var4 }, var1.children))),
		CloseAffordance = reactModule.createElement(closeAffordanceModule, {
			onActivated = var26,
			ref = var21,
			NextSelectionDown = var22,
			variant = if var12 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
			Position = UDim2.new(1, -var3.Margin.Small, 0, var3.Margin.Small),
			AnchorPoint = Vector2.new(1, 0),
			Visible = var10:map(function(p1)
				return not p1
			end),
			testId = `{var1.testId}--close-affordance`
		})
	})
	local var1 = reactModule.createElement(imageModule, {
		ZIndex = 1,
		tag = "anchor-center-left",
		Image = SHADOW_IMAGE,
		Size = var19:map(function(p1)
			-- upvalues: SHADOW_SIZE (copy)
			return UDim2.new(1, SHADOW_SIZE * 2, 0, p1 + SHADOW_SIZE * 2)
		end),
		Position = UDim2.new(0, -SHADOW_SIZE, 0.5, 0),
		slice = {
			scale = 2,
			center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
		},
		imageStyle = var3.Color.Extended.Black.Black_10
	})
	local var2 = var2
	
	if var2 then
		var2 = reactModule.createElement
		var2 = var2(reactModule.Fragment, nil, {
			OverlayPortal = reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
				tag = "size-full",
				ZIndex = var4.zIndex,
				testId = `{var1.testId}--surface`
			}, {
				SheetContainer = reactModule.createElement(viewModule, {
					ZIndex = 2,
					tag = "col align-y-center anchor-center-center size-full padding-medium",
					ref = var25,
					sizeConstraint = { MaxSize = Vector2.new(var5, var6) },
					Position = var6:map(function(p1)
						return UDim2.new(0.5, 0, 0.5, p1)
					end),
					testId = `{var1.testId}--center-sheet-container`,
					GroupTransparency = if var1 then var6:map(function(p1)
						-- upvalues: size800 (ref)
						return p1 / size800
					end) else nil,
					onAbsoluteSizeChanged = if var1.centerSheetHeight and var8 then function(p1)
						-- upvalues: var3 (ref), var8 (ref), var6 (ref)
						var8(math.min(p1.AbsoluteSize.Y - var3.Margin.Medium * 2, var6))
					end else nil
				}, nil),
				Backdrop = reactModule.createElement(viewModule, {
					ZIndex = 1,
					Size = UDim2.fromScale(2, 2),
					Position = UDim2.fromScale(-0.5, -0.5),
					stateLayer = { affordance = stateLayerAffordanceModule.None },
					backgroundStyle = var4:map(function(p1)
						-- upvalues: var3 (ref)
						return {
							Color3 = var3.Color.Common.Backdrop.Color3,
							Transparency = math.lerp(var3.Color.Common.Backdrop.Transparency, 1, p1)
						}
					end),
					onActivated = var26,
					testId = `{var1.testId}--backdrop`
				})
			}), var2),
			SheetContent = reactRobloxModule.createPortal({ Sheet = createElement, Shadow = var1 }, var24)
		})
	end
	return var2
end))