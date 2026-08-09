local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 48 | named "Interactable" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useTokensModule (ref), useCursorModule (ref), controlStateModule (ref), color (ref), getOriginalBackgroundStyleModule (ref), stateLayerAffordanceModule (ref), getStateLayerStyleModule (ref), blendColorsModule (ref), joinBindablesModule (ref), useGuiControlStateModule (ref), mapBindableModule (ref), dashModule (ref)
	local var16 = withDefaultsModule(p0, t)
	local var17 = reactModule.useRef(nil)
	local var18 = useTokensModule()
	local var19 = useCursorModule(var16.cursor)
	local var20, var21 = reactModule.useBinding(controlStateModule.Initialize)
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useCallback(function(p2) --[[ line: 56 ]]
		-- upvalues: var20 (ref), controlStateModule (copy), var17 (ref), color (copy), var22 (ref), var21 (ref), var16 (ref)
		if var20:getValue() == controlStateModule.Default and var17.current ~= nil then
			local backgroundColor3Styled = var17.current:GetStyled("BackgroundColor3")
			local backgroundTransparencyStyled = var17.current:GetStyled("BackgroundTransparency")
			
			if backgroundColor3Styled ~= color or backgroundTransparencyStyled ~= 0 then
				var22.current = {
					Color3 = backgroundColor3Styled,
					Transparency = backgroundTransparencyStyled
				}
			end
		end
		var21(p2)
		
		if var16.onStateChanged ~= nil then
			var16.onStateChanged(p2)
		end
	end, { var16.onStateChanged })
	local var24 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: getOriginalBackgroundStyleModule (copy), var16 (ref)
		return getOriginalBackgroundStyleModule(var16.BackgroundColor3, var16.BackgroundTransparency)
	end, { var16.BackgroundColor3, var16.BackgroundTransparency })
	local var25 = reactModule.useCallback(function(p3, p4, p5, p6) --[[ line: 78 ]]
		-- upvalues: controlStateModule (copy), stateLayerAffordanceModule (copy), var22 (ref), getStateLayerStyleModule (copy), var18 (ref), blendColorsModule (copy)
		if p3 == controlStateModule.Initialize or p3 == controlStateModule.Default or (p3 == controlStateModule.Disabled or p6 == stateLayerAffordanceModule.None) then
			return p4
		end
		local t = { Color3 = p4.Color3, Transparency = p4.Transparency }
		
		if p4.Color3 == nil then
			t.Color3 = if var22.current then var22.current.Color3 else nil
		end
		if p4.Transparency == nil then
			t.Transparency = if var22.current then var22.current.Transparency else nil
		end
		return blendColorsModule(t, getStateLayerStyleModule(var18, p5, p3))
	end, {
		var18,
		var16.BackgroundColor3,
		var16.BackgroundTransparency
	})
	local var26 = reactModule.useMemo(function() --[[ line: 121 ]]
		-- upvalues: joinBindablesModule (copy), var20 (ref), var24 (ref), var16 (ref), var25 (ref)
		return joinBindablesModule({
			controlState = var20,
			backgroundStyle = var24,
			mode = if var16.stateLayer then var16.stateLayer.mode else nil,
			affordance = if var16.stateLayer then var16.stateLayer.affordance else nil
		}, function(p7) --[[ line: 127 ]]
			-- upvalues: var25 (copy)
			return var25(p7.controlState, p7.backgroundStyle, p7.mode, p7.affordance)
		end)
	end, {
		var24,
		var20,
		var25,
		if var16.stateLayer then var16.stateLayer.mode else nil,
		if var16.stateLayer then var16.stateLayer.affordance else nil
	})
	local var27 = useGuiControlStateModule(var17, var23)
	reactModule.useImperativeHandle(p1, function() --[[ line: 142 ]]
		-- upvalues: var17 (ref)
		return var17.current
	end, {})
	local var28 = dashModule.union(var16, {
		BackgroundColor3 = mapBindableModule(var26, function(p8) --[[ line: 147 ]]
			return p8.Color3
		end),
		BackgroundTransparency = mapBindableModule(var26, function(p9) --[[ line: 150 ]]
			return p9.Transparency
		end),
		Active = not var16.isDisabled,
		Interactable = not var16.isDisabled,
		[reactModule.Event.Activated] = if not var16.isDisabled then var16.onActivated else nil,
		[reactModule.Event.MouseButton2Click] = if not var16.isDisabled then var16.onSecondaryActivated else nil,
		ref = var27,
		SelectionImageObject = var16.SelectionImageObject or var19
	})
	var28.component = nil
	var28.isDisabled = nil
	var28.onActivated = nil
	var28.onSecondaryActivated = nil
	var28.onStateChanged = nil
	var28.stateLayer = nil
	var28.cursor = nil
	
	return reactModule.createElement(var16.component, var28)
end))