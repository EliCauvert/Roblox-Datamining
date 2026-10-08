local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local createNextOrder = require(parent.ReactUtils).createNextOrder
local _ = require(script.Parent.Parent.Types)

return function(p1)
	-- upvalues: createNextOrder (ref), signalsReactModule (ref), reactModule (ref), foundationModule (ref)
	local var1 = createNextOrder()
	local var2 = signalsReactModule.useSignalBinding(p1.getIdentity)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-x-left align-y-center gap-xsmall auto-xy",
		LayoutOrder = p1.LayoutOrder
	}, {
		avatar = reactModule.createElement(foundationModule.Image, {
			tag = "size-400-400 stroke-standard stroke-default radius-circle",
			Image = var2:map(function(p2)
				return if p2 and p2.avatarContent then p2.avatarContent else ""
			end),
			LayoutOrder = var1()
		}),
		displayName = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy",
			Text = var2:map(function(p2)
				return if p2 then `{p2.displayName}:` else ""
			end),
			LayoutOrder = var1()
		})
	})
end