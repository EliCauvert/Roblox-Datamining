local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local displayModule = require(parent.Display)
local useSignalState = require(parent.SignalsReact).useSignalState
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(value)
	-- upvalues: useSignalState (ref), displayModule (ref), useTokens (ref), cryoModule (ref), reactModule (ref)
	local var1 = if value.excludeGlobalGuiInset then { left = 0, top = 0, right = 0, bottom = 0 } else useSignalState(displayModule.GetDisplayStore().getGuiInset)
	local var2 = useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding)
	local var3 = useTokens()
	local var4 = cryoModule.Dictionary.join({
		BorderSizePixel = 0,
		BackgroundTransparency = var3.Color.Surface.Surface_0.Transparency,
		BackgroundColor3 = var3.Color.Surface.Surface_0.Color3
	}, value.frameProps or {})
	local var5 = var1.left + var2.left
	local var6 = var1.right + var2.right
	local var7 = var1.top + var2.top
	local var8 = var1.bottom + var2.bottom
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		InsetBackgroundTop = if value.directions.top and var7 > 0 then reactModule.createElement("Frame", cryoModule.Dictionary.join({
			Position = UDim2.new(0, if value.directions.left then -var5 else 0, 0, -var7),
			Size = UDim2.new(1, (if value.directions.left then var5 else 0) + (if value.directions.right then var6 else 0), 0, var7)
		}, cryoModule.Dictionary.join(var4, value.topFrameProps or {}))) else nil,
		InsetBackgroundBottom = if value.directions.bottom and var8 > 0 then reactModule.createElement("Frame", cryoModule.Dictionary.join({
			Position = UDim2.new(0, if value.directions.left then -var5 else 0, 1, 0),
			Size = UDim2.new(1, (if value.directions.left then var5 else 0) + (if value.directions.right then var6 else 0), 0, var8)
		}, cryoModule.Dictionary.join(var4, value.bottomFrameProps or {}))) else nil,
		InsetBackgroundLeft = if value.directions.left and var5 > 0 then reactModule.createElement("Frame", cryoModule.Dictionary.join({
			Position = UDim2.new(0, -var5, 0, if value.directions.top then -var7 else 0),
			Size = UDim2.new(0, var5, 1, (if value.directions.top then var7 else 0) + (if value.directions.bottom then var8 else 0))
		}, cryoModule.Dictionary.join(var4, value.leftFrameProps or {}))) else nil,
		InsetBackgroundRight = if value.directions.right and var6 > 0 then reactModule.createElement("Frame", cryoModule.Dictionary.join({
			Position = UDim2.new(1, 0, 0, if value.directions.top then -var7 else 0),
			Size = UDim2.new(0, var6, 1, (if value.directions.top then var7 else 0) + (if value.directions.bottom then var8 else 0))
		}, cryoModule.Dictionary.join(var4, value.rightFrameProps or {}))) else nil
	})
end