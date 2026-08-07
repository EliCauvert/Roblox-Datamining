local parent = script.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.SettingsService)
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local fieldModule = require(parent.Field)
local reactUtilsModule = require(parent_1.ReactUtils)
local signalsReactModule = require(parent_1.SignalsReact)
local view = foundationModule.View
local text = foundationModule.Text
local createNextOrder = reactUtilsModule.createNextOrder
local useTokens = foundationModule.Hooks.useTokens
local enums = foundationModule.Enums
local controlState = enums.ControlState
local stateLayerAffordance = enums.StateLayerAffordance

return function(p0) --[[ line: 26 ]]
	-- upvalues: useTokens (ref), createNextOrder (ref), reactModule (ref), controlState (ref), signalsReactModule (ref), view (ref), stateLayerAffordance (ref), text (ref), fieldModule (ref)
	local var5 = useTokens()
	local var6 = createNextOrder()
	local uDim2 = UDim2.fromScale(0.5, 1)
	local uDim2_1 = UDim2.fromScale(0.5, 1)
	local t = {
		Transparency = 0.9,
		Color3 = var5.Color.Extended.Gray.Gray_700.Color3
	}
	local t_1 = { Transparency = 1, Color3 = t.Color3 }
	local var11, var12 = reactModule.useBinding(t_1)
	
	return reactModule.createElement(view, {
		tag = "auto-y row size-full-1300 radius-medium",
		backgroundStyle = var11,
		onStateChanged = reactModule.useCallback(function(p1) --[[ line: 36 ]]
			-- upvalues: var12 (ref), controlState (copy), t_1 (ref), t (ref)
			var12(if p1 == controlState.Default then t_1 else t)
		end, { var12 }),
		stateLayer = { affordance = stateLayerAffordance.None },
		Visible = signalsReactModule.useSignalBinding(p0.subscribeVisible),
		LayoutOrder = p0.layoutOrder
	}, {
		LabelContainer = reactModule.createElement(view, {
			tag = "auto-y gui-object-defaults col padding-left-small padding-y-large",
			Size = uDim2_1,
			LayoutOrder = var6()
		}, {
			Label = reactModule.createElement(text, {
				tag = "auto-y grow size-full-0 text-align-x-left text-wrap text-label-large",
				LayoutOrder = var6(),
				textStyle = var5.Color.Extended.White.White_100,
				Text = p0.label
			}),
			Padding = if p0.description then reactModule.createElement(view, { tag = "size-full-200", LayoutOrder = var6() }) else nil,
			Description = if p0.description then reactModule.createElement(text, {
				tag = "auto-y size-full-0 text-align-x-left text-wrap text-label-small",
				LayoutOrder = var6(),
				textStyle = var5.Color.Extended.White.White_80,
				Text = p0.description
			}) else nil
		}),
		FieldContainer = reactModule.createElement(view, {
			tag = "row align-x-right align-y-center",
			Size = uDim2,
			LayoutOrder = var6()
		}, {
			reactModule.createElement(view, {
				tag = "row align-x-center align-y-center auto-xy padding-right-small padding-y-medium"
			}, reactModule.createElement(fieldModule, p0))
		})
	})
end