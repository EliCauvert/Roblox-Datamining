local parent = script:FindFirstAncestor("SystemScrim").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)

return function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref)
	local var1 = signalsReactModule.useSignalState(p1.store.autoDismiss)
	
	return if signalsReactModule.useSignalState(p1.store.visible) then reactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		Visible = true,
		BackgroundTransparency = signalsReactModule.useSignalBinding(p1.store.transparency),
		BackgroundColor3 = Color3.new(0, 0, 0),
		Text = "",
		AutoButtonColor = false,
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var1 (ref)
			p1.store.backgroundScrimActivated:Fire()
			
			if var1 then
				p1.store.setVisibility(false)
			end
		end, { var1 })
	}) else nil
end