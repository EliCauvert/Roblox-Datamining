local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local displayModule = require(parent.Display)
local useSignalState = require(parent.SignalsReact).useSignalState
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(value) --[[ line: 30 | named "InsetBackground" ]]
	-- upvalues: useSignalState (ref), displayModule (ref), useTokens (ref), cryoModule (ref), reactModule (ref)
	local var3 = if value.excludeGlobalGuiInset then { left = 0, top = 0, right = 0, bottom = 0 } else useSignalState(displayModule.GetDisplayStore().getGuiInset)
	local var4 = useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding)
	local var5 = useTokens()
	local var6 = cryoModule.Dictionary.join({
		BorderSizePixel = 0,
		BackgroundTransparency = var5.Color.Surface.Surface_0.Transparency,
		BackgroundColor3 = var5.Color.Surface.Surface_0.Color3
	}, value.frameProps or {})
	local var7 = var3.left + var4.left
	local var8 = var3.right + var4.right
	local var9 = var3.top + var4.top
	local var10 = var3.bottom + var4.bottom
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		InsetBackgroundTop = if value.directions.top and var9 > 0 then reactModule.createElement("Frame", cryoModule.Dictionary.join({
			Position = UDim2.new(0, if value.directions.left then -var7 else 0, 0, -var9),
			Size = UDim2.new(1, (if value.directions.left then var7 else 0) + (if value.directions.right then var8 else 0), 0, var9)
		}, cryoModule.Dictionary.join(var6, value.topFrameProps or {}))) else nil,
		InsetBackgroundBottom = if value.directions.bottom and var10 > 0 then reactModule.createElement("Frame", cryoModule.Dictionary.join({
			Position = UDim2.new(0, if value.directions.left then -var7 else 0, 1, 0),
			Size = UDim2.new(1, (if value.directions.left then var7 else 0) + (if value.directions.right then var8 else 0), 0, var10)
		}, cryoModule.Dictionary.join(var6, value.bottomFrameProps or {}))) else nil,
		InsetBackgroundLeft = if value.directions.left and var7 > 0 then reactModule.createElement("Frame", cryoModule.Dictionary.join({
			Position = UDim2.new(0, -var7, 0, if value.directions.top then -var9 else 0),
			Size = UDim2.new(0, var7, 1, (if value.directions.top then var9 else 0) + (if value.directions.bottom then var10 else 0))
		}, cryoModule.Dictionary.join(var6, value.leftFrameProps or {}))) else nil,
		InsetBackgroundRight = if value.directions.right and var8 > 0 then reactModule.createElement("Frame", cryoModule.Dictionary.join({
			Position = UDim2.new(1, 0, 0, if value.directions.top then -var9 else 0),
			Size = UDim2.new(0, var8, 1, (if value.directions.top then var9 else 0) + (if value.directions.bottom then var10 else 0))
		}, cryoModule.Dictionary.join(var6, value.rightFrameProps or {}))) else nil
	})
end