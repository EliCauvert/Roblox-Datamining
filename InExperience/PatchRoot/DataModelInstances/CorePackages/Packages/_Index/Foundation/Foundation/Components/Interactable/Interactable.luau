local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(Foundation.Components.Types)
local BlendColorsModule = require(Foundation.Utility.blendColors)
local GetOriginalBackgroundStyleModule = require(script.Parent.getOriginalBackgroundStyle)
local GetStateLayerStyleModule = require(script.Parent.getStateLayerStyle)
local JoinBindablesModule = require(Foundation.Utility.joinBindables)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UseCursorModule = require(Foundation.Providers.Cursor.useCursor)
local UseGuiControlStateModule = require(Foundation.Utility.Control.useGuiControlState)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local _ = require(Foundation.Enums.StateLayerMode)
local ControlStateModule = require(Foundation.Enums.ControlState)
local config = { component = "ImageButton", isDisabled = false }
local _Color3 = Color3.fromRGB(163, 162, 165)

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), UseTokensModule (copy), UseCursorModule (copy), ControlStateModule (copy), _Color3 (copy), GetOriginalBackgroundStyleModule (copy), StateLayerAffordanceModule (copy), GetStateLayerStyleModule (copy), BlendColorsModule (copy), JoinBindablesModule (copy), UseGuiControlStateModule (copy), MapBindableModule (copy), DashModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensModuleResult = UseTokensModule()
	local UseCursorModuleResult = UseCursorModule(WithDefaultsModuleResult.cursor)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ControlStateModule.Initialize)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetOriginalBackgroundStyleModule (upval), WithDefaultsModuleResult (copy)
		return GetOriginalBackgroundStyleModule(WithDefaultsModuleResult.BackgroundColor3, WithDefaultsModuleResult.BackgroundTransparency)
	end, {
		WithDefaultsModuleResult.BackgroundColor3,
		WithDefaultsModuleResult.BackgroundTransparency
	})
	local UseResult = ReactModule.useCallback(function(Default, p3, p4, None)
		-- upvalues: ControlStateModule (upval), StateLayerAffordanceModule (upval), UseRefResult1 (copy), GetStateLayerStyleModule (upval), UseTokensModuleResult (copy), BlendColorsModule (upval)
		if Default == ControlStateModule.Initialize or Default == ControlStateModule.Default or Default == ControlStateModule.Disabled or None == StateLayerAffordanceModule.None then
			return p3
		end
		local config = { Color3 = p3.Color3, Transparency = p3.Transparency }
		
		if p3.Color3 == nil then
			config.Color3 = if UseRefResult1.current then UseRefResult1.current.Color3 else nil
		end
		if p3.Transparency == nil then
			config.Transparency = if UseRefResult1.current then UseRefResult1.current.Transparency else nil
		end
		return BlendColorsModule(config, (GetStateLayerStyleModule(UseTokensModuleResult, p4, Default)))
	end, {
		UseTokensModuleResult,
		WithDefaultsModuleResult.BackgroundColor3,
		WithDefaultsModuleResult.BackgroundTransparency
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: JoinBindablesModule (upval), UseBindingResult (copy), UseMemoResult (copy), WithDefaultsModuleResult (copy), UseResult (copy)
		return JoinBindablesModule({
			controlState = UseBindingResult,
			backgroundStyle = UseMemoResult,
			mode = if WithDefaultsModuleResult.stateLayer then WithDefaultsModuleResult.stateLayer.mode else nil,
			affordance = if WithDefaultsModuleResult.stateLayer then WithDefaultsModuleResult.stateLayer.affordance else nil
		}, function(p3)
			-- upvalues: UseResult (upval)
			return UseResult(p3.controlState, p3.backgroundStyle, p3.mode, p3.affordance)
		end)
	end, {
		UseMemoResult,
		UseBindingResult,
		UseResult,
		if WithDefaultsModuleResult.stateLayer then WithDefaultsModuleResult.stateLayer.mode else nil,
		if WithDefaultsModuleResult.stateLayer then WithDefaultsModuleResult.stateLayer.affordance else nil
	})
	local UseGuiControlStateModuleResult = UseGuiControlStateModule(UseRefResult, (ReactModule.useCallback(function(p3)
		-- upvalues: UseBindingResult (copy), ControlStateModule (upval), UseRefResult (copy), _Color3 (upval), UseRefResult1 (copy), UseBindingResult2 (copy), WithDefaultsModuleResult (copy)
		if UseBindingResult:getValue() == ControlStateModule.Default and UseRefResult.current ~= nil then
			local BackgroundColor3Styled = UseRefResult.current:GetStyled("BackgroundColor3")
			local BackgroundTransparencyStyled = UseRefResult.current:GetStyled("BackgroundTransparency")
			
			if BackgroundColor3Styled ~= _Color3 or BackgroundTransparencyStyled ~= 0 then
				UseRefResult1.current = {
					Color3 = BackgroundColor3Styled,
					Transparency = BackgroundTransparencyStyled
				}
			end
		end
		UseBindingResult2(p3)
		
		if WithDefaultsModuleResult.onStateChanged ~= nil then
			WithDefaultsModuleResult.onStateChanged(p3)
		end
	end, { WithDefaultsModuleResult.onStateChanged })))
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {})
	local UnionResult = DashModule.union(WithDefaultsModuleResult, {
		BackgroundColor3 = MapBindableModule(UseMemoResult1, function(p3)
			return p3.Color3
		end),
		BackgroundTransparency = MapBindableModule(UseMemoResult1, function(p3)
			return p3.Transparency
		end),
		Active = not WithDefaultsModuleResult.isDisabled,
		Interactable = not WithDefaultsModuleResult.isDisabled,
		[ReactModule.Event.Activated] = if WithDefaultsModuleResult.isDisabled then nil else WithDefaultsModuleResult.onActivated,
		[ReactModule.Event.SecondaryActivated] = if WithDefaultsModuleResult.isDisabled then nil else WithDefaultsModuleResult.onSecondaryActivated,
		ref = UseGuiControlStateModuleResult,
		SelectionImageObject = WithDefaultsModuleResult.SelectionImageObject or UseCursorModuleResult
	})
	UnionResult.component = nil
	UnionResult.isDisabled = nil
	UnionResult.onActivated = nil
	UnionResult.onSecondaryActivated = nil
	UnionResult.onStateChanged = nil
	UnionResult.stateLayer = nil
	UnionResult.cursor = nil
	
	return ReactModule.createElement(WithDefaultsModuleResult.component, UnionResult)
end))