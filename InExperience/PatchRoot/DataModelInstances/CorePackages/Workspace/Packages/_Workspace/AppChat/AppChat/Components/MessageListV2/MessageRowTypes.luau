local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local MessageRowModule = require(script.Parent.MessageRow)

return {
	MessageRowType = ViewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), ReactModule (copy), MessageRowModule (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
		
		return ReactModule.createElement(MessageRowModule, {
			key = UseSignalStateResult.stable_key,
			item = UseSignalStateResult
		})
	end, {
		hideWhilePending = true,
		readiness = ViewRecyclerModule.RecyclableViewReadiness.ReadyOnCommit
	}),
	EndSpacerItem = ViewRecyclerModule.createPinnedItem({
		key = "EndSpacer",
		value = {},
		itemType = ViewRecyclerModule.createRecyclableView(function()
			-- upvalues: ReactModule (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 10)
			})
		end)
	})
}