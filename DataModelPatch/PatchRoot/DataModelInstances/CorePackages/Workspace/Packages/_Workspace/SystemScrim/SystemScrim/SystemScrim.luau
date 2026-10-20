local Parent = script:FindFirstAncestor("SystemScrim").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)

return function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.store.autoDismiss)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseSignalStateResult (copy)
		p1.store.backgroundScrimActivated:Fire()
		
		if UseSignalStateResult then
			p1.store.setVisibility(false)
		end
	end, { UseSignalStateResult })
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(p1.store.transparency)
	
	return if SignalsReactModule.useSignalState(p1.store.visible) then ReactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		Visible = true,
		BackgroundTransparency = UseSignalBindingResult,
		BackgroundColor3 = Color3.new(0, 0, 0),
		Text = "",
		AutoButtonColor = false,
		BorderSizePixel = 0,
		[ReactModule.Event.Activated] = UseResult
	}) else nil
end