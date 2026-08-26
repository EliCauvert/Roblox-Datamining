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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useTokensModule (ref), useCursorModule (ref), controlStateModule (ref), color (ref), getOriginalBackgroundStyleModule (ref), stateLayerAffordanceModule (ref), getStateLayerStyleModule (ref), blendColorsModule (ref), joinBindablesModule (ref), useGuiControlStateModule (ref), mapBindableModule (ref), flagsModule (ref), dashModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = reactModule.useRef(nil)
	local var3 = useTokensModule()
	local var4 = useCursorModule(var1.cursor)
	local var5, var6 = reactModule.useBinding(controlStateModule.Initialize)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), controlStateModule (copy), var2 (ref), color (copy), var7 (ref), var6 (ref), var1 (ref)
		if var5:getValue() == controlStateModule.Default and var2.current ~= nil then
			local backgroundColor3Styled = var2.current:GetStyled("BackgroundColor3")
			local backgroundTransparencyStyled = var2.current:GetStyled("BackgroundTransparency")
			
			if backgroundColor3Styled ~= color or backgroundTransparencyStyled ~= 0 then
				var7.current = {
					Color3 = backgroundColor3Styled,
					Transparency = backgroundTransparencyStyled
				}
			end
		end
		var6(p3)
		
		if var1.onStateChanged ~= nil then
			var1.onStateChanged(p3)
		end
	end, { var1.onStateChanged })
	local var9 = reactModule.useMemo(function()
		-- upvalues: getOriginalBackgroundStyleModule (copy), var1 (ref)
		return getOriginalBackgroundStyleModule(var1.BackgroundColor3, var1.BackgroundTransparency)
	end, { var1.BackgroundColor3, var1.BackgroundTransparency })
	local var10 = reactModule.useCallback(function(p3, p4, p5, p6)
		-- upvalues: controlStateModule (copy), stateLayerAffordanceModule (copy), var7 (ref), getStateLayerStyleModule (copy), var3 (ref), blendColorsModule (copy)
		if p3 == controlStateModule.Initialize or p3 == controlStateModule.Default or (p3 == controlStateModule.Disabled or p6 == stateLayerAffordanceModule.None) then
			return p4
		end
		local t = { Color3 = p4.Color3, Transparency = p4.Transparency }
		
		if p4.Color3 == nil then
			t.Color3 = if var7.current then var7.current.Color3 else nil
		end
		if p4.Transparency == nil then
			t.Transparency = if var7.current then var7.current.Transparency else nil
		end
		return blendColorsModule(t, getStateLayerStyleModule(var3, p5, p3))
	end, {
		var3,
		var1.BackgroundColor3,
		var1.BackgroundTransparency
	})
	local var11 = reactModule.useMemo(function()
		-- upvalues: joinBindablesModule (copy), var5 (ref), var9 (ref), var1 (ref), var10 (ref)
		return joinBindablesModule({
			controlState = var5,
			backgroundStyle = var9,
			mode = if var1.stateLayer then var1.stateLayer.mode else nil,
			affordance = if var1.stateLayer then var1.stateLayer.affordance else nil
		}, function(p3)
			-- upvalues: var10 (copy)
			return var10(p3.controlState, p3.backgroundStyle, p3.mode, p3.affordance)
		end)
	end, {
		var9,
		var5,
		var10,
		if var1.stateLayer then var1.stateLayer.mode else nil,
		if var1.stateLayer then var1.stateLayer.affordance else nil
	})
	local var12 = useGuiControlStateModule(var2, var8)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var2 (ref)
		return var2.current
	end, {})
	local var13 = dashModule.union(var1, {
		BackgroundColor3 = mapBindableModule(var11, function(p3)
			return p3.Color3
		end),
		BackgroundTransparency = mapBindableModule(var11, function(p3)
			return p3.Transparency
		end),
		Active = not var1.isDisabled,
		Interactable = not var1.isDisabled,
		[reactModule.Event.Activated] = if not var1.isDisabled then var1.onActivated else nil,
		[reactModule.Event.SecondaryActivated] = if flagsModule.FoundationInteractableSecondaryActivated and not var1.isDisabled then var1.onSecondaryActivated else nil,
		[reactModule.Event.MouseButton2Click] = if flagsModule.FoundationInteractableSecondaryActivated or var1.isDisabled then nil else var1.onSecondaryActivated,
		ref = var12,
		SelectionImageObject = var1.SelectionImageObject or var4
	})
	var13.component = nil
	var13.isDisabled = nil
	var13.onActivated = nil
	var13.onSecondaryActivated = nil
	var13.onStateChanged = nil
	var13.stateLayer = nil
	var13.cursor = nil
	
	return reactModule.createElement(var1.component, var13)
end))