local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Components.Types)
local blendColorsModule = require(foundation.Utility.blendColors)
local getOriginalBackgroundStyleModule = require(script.Parent.getOriginalBackgroundStyle)
local getStateLayerStyleModule = require(script.Parent.getStateLayerStyle)
local joinBindablesModule = require(foundation.Utility.joinBindables)
local mapBindableModule = require(foundation.Utility.mapBindable)
local useCursorModule = require(foundation.Providers.Cursor.useCursor)
local useGuiControlStateModule = require(foundation.Utility.Control.useGuiControlState)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local _ = require(foundation.Enums.StateLayerMode)
local controlStateModule = require(foundation.Enums.ControlState)
local t = { component = "ImageButton", isDisabled = false }
local color = Color3.fromRGB(163, 162, 165)

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useTokensModule (ref), useCursorModule (ref), controlStateModule (ref), color (ref), getOriginalBackgroundStyleModule (ref), stateLayerAffordanceModule (ref), getStateLayerStyleModule (ref), blendColorsModule (ref), joinBindablesModule (ref), useGuiControlStateModule (ref), mapBindableModule (ref), flagsModule (ref), dashModule (ref)
	local var17 = withDefaultsModule(p0, t)
	local var18 = reactModule.useRef(nil)
	local var19 = useTokensModule()
	local var20 = useCursorModule(var17.cursor)
	local var21, var22 = reactModule.useBinding(controlStateModule.Initialize)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var21 (ref), controlStateModule (copy), var18 (ref), color (copy), var23 (ref), var22 (ref), var17 (ref)
		if var21:getValue() == controlStateModule.Default and var18.current ~= nil then
			local backgroundColor3Styled = var18.current:GetStyled("BackgroundColor3")
			local backgroundTransparencyStyled = var18.current:GetStyled("BackgroundTransparency")
			
			if backgroundColor3Styled ~= color or backgroundTransparencyStyled ~= 0 then
				var23.current = {
					Color3 = backgroundColor3Styled,
					Transparency = backgroundTransparencyStyled
				}
			end
		end
		var22(p2)
		
		if var17.onStateChanged ~= nil then
			var17.onStateChanged(p2)
		end
	end, { var17.onStateChanged })
	local var25 = reactModule.useMemo(function()
		-- upvalues: getOriginalBackgroundStyleModule (copy), var17 (ref)
		return getOriginalBackgroundStyleModule(var17.BackgroundColor3, var17.BackgroundTransparency)
	end, { var17.BackgroundColor3, var17.BackgroundTransparency })
	local var26 = reactModule.useCallback(function(p3, p4, p5, p6)
		-- upvalues: controlStateModule (copy), stateLayerAffordanceModule (copy), var23 (ref), getStateLayerStyleModule (copy), var19 (ref), blendColorsModule (copy)
		if p3 == controlStateModule.Initialize or p3 == controlStateModule.Default or (p3 == controlStateModule.Disabled or p6 == stateLayerAffordanceModule.None) then
			return p4
		end
		local t = { Color3 = p4.Color3, Transparency = p4.Transparency }
		
		if p4.Color3 == nil then
			t.Color3 = if var23.current then var23.current.Color3 else nil
		end
		if p4.Transparency == nil then
			t.Transparency = if var23.current then var23.current.Transparency else nil
		end
		return blendColorsModule(t, getStateLayerStyleModule(var19, p5, p3))
	end, {
		var19,
		var17.BackgroundColor3,
		var17.BackgroundTransparency
	})
	local var27 = reactModule.useMemo(function()
		-- upvalues: joinBindablesModule (copy), var21 (ref), var25 (ref), var17 (ref), var26 (ref)
		return joinBindablesModule({
			controlState = var21,
			backgroundStyle = var25,
			mode = if var17.stateLayer then var17.stateLayer.mode else nil,
			affordance = if var17.stateLayer then var17.stateLayer.affordance else nil
		}, function(p7)
			-- upvalues: var26 (copy)
			return var26(p7.controlState, p7.backgroundStyle, p7.mode, p7.affordance)
		end)
	end, {
		var25,
		var21,
		var26,
		if var17.stateLayer then var17.stateLayer.mode else nil,
		if var17.stateLayer then var17.stateLayer.affordance else nil
	})
	local var28 = useGuiControlStateModule(var18, var24)
	reactModule.useImperativeHandle(p1, function()
		-- upvalues: var18 (ref)
		return var18.current
	end, {})
	local var29 = dashModule.union(var17, {
		BackgroundColor3 = mapBindableModule(var27, function(p8)
			return p8.Color3
		end),
		BackgroundTransparency = mapBindableModule(var27, function(p9)
			return p9.Transparency
		end),
		Active = not var17.isDisabled,
		Interactable = not var17.isDisabled,
		[reactModule.Event.Activated] = if not var17.isDisabled then var17.onActivated else nil,
		[reactModule.Event.SecondaryActivated] = if flagsModule.FoundationInteractableSecondaryActivated and not var17.isDisabled then var17.onSecondaryActivated else nil,
		[reactModule.Event.MouseButton2Click] = if flagsModule.FoundationInteractableSecondaryActivated or var17.isDisabled then nil else var17.onSecondaryActivated,
		ref = var28,
		SelectionImageObject = var17.SelectionImageObject or var20
	})
	var29.component = nil
	var29.isDisabled = nil
	var29.onActivated = nil
	var29.onSecondaryActivated = nil
	var29.onStateChanged = nil
	var29.stateLayer = nil
	var29.cursor = nil
	
	return reactModule.createElement(var17.component, var29)
end))