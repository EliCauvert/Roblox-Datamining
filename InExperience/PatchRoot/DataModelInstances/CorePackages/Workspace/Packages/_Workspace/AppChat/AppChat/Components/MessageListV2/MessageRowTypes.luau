local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local viewRecyclerModule = require(parent.ViewRecycler)
local messageRowModule = require(script.Parent.MessageRow)

return {
	MessageRowType = viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: signalsReactModule (ref), reactModule (ref), messageRowModule (ref)
		local var1 = signalsReactModule.useSignalState(p1.itemSignal)
		
		return reactModule.createElement(messageRowModule, { key = var1.stable_key, item = var1 })
	end, {
		hideWhilePending = true,
		readiness = viewRecyclerModule.RecyclableViewReadiness.ReadyOnCommit
	}),
	EndSpacerItem = viewRecyclerModule.createPinnedItem({
		key = "EndSpacer",
		value = {},
		itemType = viewRecyclerModule.createRecyclableView(function()
			-- upvalues: reactModule (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 10)
			})
		end)
	})
}