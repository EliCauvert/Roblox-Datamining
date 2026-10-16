local Parent = script.Parent
local Parent1 = Parent.Parent
local _ = require(Parent1.SettingsService)
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local FieldModule = require(Parent.Field)
local SignalsReactModule = require(Parent1.SignalsReact)
local View = FoundationModule.View
local Text = FoundationModule.Text
local CreateNextOrderFunction = require(Parent1.ReactUtils).createNextOrder
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Enums = FoundationModule.Enums
local ControlState = Enums.ControlState
local StateLayerAffordance = Enums.StateLayerAffordance

return function(p1) --[[ Line: 26 ]]
	-- upvalues: UseTokensFunction (copy), CreateNextOrderFunction (copy), ReactModule (copy), ControlState (copy), SignalsReactModule (copy), View (copy), StateLayerAffordance (copy), Text (copy), FieldModule (copy)
	local UseTokensResult = UseTokensFunction()
	local NextOrder = CreateNextOrderFunction()
	local _UDim2 = UDim2.fromScale(0.5, 1)
	local _UDim2_1 = UDim2.fromScale(0.5, 1)
	local config = {
		Transparency = 0.9,
		Color3 = UseTokensResult.Color.Extended.Gray.Gray_700.Color3
	}
	local config1 = { Transparency = 1, Color3 = config.Color3 }
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(config1)
	
	return ReactModule.createElement(View, {
		tag = "auto-y row size-full-1300 radius-medium",
		backgroundStyle = UseBindingResult,
		onStateChanged = ReactModule.useCallback(function(Default) --[[ Line: 36 ]]
			-- upvalues: UseBindingResult2 (copy), ControlState (upval), config1 (copy), config (copy)
			UseBindingResult2(if Default == ControlState.Default then config1 else config)
		end, { UseBindingResult2 }),
		stateLayer = { affordance = StateLayerAffordance.None },
		Visible = SignalsReactModule.useSignalBinding(p1.subscribeVisible),
		LayoutOrder = p1.layoutOrder
	}, {
		LabelContainer = ReactModule.createElement(View, {
			tag = "auto-y gui-object-defaults col padding-left-small padding-y-large",
			Size = _UDim2_1,
			LayoutOrder = NextOrder()
		}, {
			Label = ReactModule.createElement(Text, {
				tag = "auto-y grow size-full-0 text-align-x-left text-wrap text-label-large",
				LayoutOrder = NextOrder(),
				textStyle = UseTokensResult.Color.Extended.White.White_100,
				Text = p1.label
			}),
			Padding = if p1.description then ReactModule.createElement(View, { tag = "size-full-200", LayoutOrder = NextOrder() }) else nil,
			Description = if p1.description then ReactModule.createElement(Text, {
				tag = "auto-y size-full-0 text-align-x-left text-wrap text-label-small",
				LayoutOrder = NextOrder(),
				textStyle = UseTokensResult.Color.Extended.White.White_80,
				Text = p1.description
			}) else nil
		}),
		FieldContainer = ReactModule.createElement(View, {
			tag = "row align-x-right align-y-center",
			Size = _UDim2,
			LayoutOrder = NextOrder()
		}, {
			ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center auto-xy padding-right-small padding-y-medium"
			}, ReactModule.createElement(FieldModule, p1))
		})
	})
end