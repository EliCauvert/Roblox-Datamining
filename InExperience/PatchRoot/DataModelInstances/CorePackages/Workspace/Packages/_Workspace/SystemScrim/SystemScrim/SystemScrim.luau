local parent = script:FindFirstAncestor("SystemScrim").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)

return function(p0) --[[ line: 23 | named "SystemScrim" ]]
	-- upvalues: signalsReactModule (ref), reactModule (ref)
	local var2 = signalsReactModule.useSignalState(p0.store.autoDismiss)
	
	return if signalsReactModule.useSignalState(p0.store.visible) then reactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		Visible = true,
		BackgroundTransparency = signalsReactModule.useSignalBinding(p0.store.transparency),
		BackgroundColor3 = Color3.new(0, 0, 0),
		Text = "",
		AutoButtonColor = false,
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = reactModule.useCallback(function() --[[ line: 26 ]]
			-- upvalues: p0 (ref), var2 (ref)
			p0.store.backgroundScrimActivated:Fire()
			
			if var2 then
				p0.store.setVisibility(false)
			end
		end, { var2 })
	}) else nil
end