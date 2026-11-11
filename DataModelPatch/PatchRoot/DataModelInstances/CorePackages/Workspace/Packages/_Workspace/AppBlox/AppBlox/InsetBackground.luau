local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local DisplayModule = require(Parent.Display)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: UseSignalStateFunction (copy), DisplayModule (copy), UseTokensFunction (copy), CryoModule (copy), ReactModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(DisplayModule.GetDisplayStore().getGuiInset)
	local Config = if p1.excludeGlobalGuiInset then { left = 0, top = 0, right = 0, bottom = 0 } else UseSignalStateResult
	local UseSignalStateResult1 = UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding)
	local UseTokensResult = UseTokensFunction()
	local JoinResult = CryoModule.Dictionary.join({
		BorderSizePixel = 0,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
	}, p1.frameProps or {})
	local NewLeft = Config.left + UseSignalStateResult1.left
	local NewRight = Config.right + UseSignalStateResult1.right
	local NewTop = Config.top + UseSignalStateResult1.top
	local NewBottom = Config.bottom + UseSignalStateResult1.bottom
	local JoinResult1 = CryoModule.Dictionary.join({
		Position = UDim2.new(0, if p1.directions.left then -NewLeft else 0, 0, -NewTop),
		Size = UDim2.new(1, (if p1.directions.left then NewLeft else 0) + (if p1.directions.right then NewRight else 0), 0, NewTop)
	}, CryoModule.Dictionary.join(JoinResult, p1.topFrameProps or {}))
	local JoinResult2 = CryoModule.Dictionary.join({
		Position = UDim2.new(0, if p1.directions.left then -NewLeft else 0, 1, 0),
		Size = UDim2.new(1, (if p1.directions.left then NewLeft else 0) + (if p1.directions.right then NewRight else 0), 0, NewBottom)
	}, CryoModule.Dictionary.join(JoinResult, p1.bottomFrameProps or {}))
	local JoinResult3 = CryoModule.Dictionary.join({
		Position = UDim2.new(0, -NewLeft, 0, if p1.directions.top then -NewTop else 0),
		Size = UDim2.new(0, NewLeft, 1, (if p1.directions.top then NewTop else 0) + (if p1.directions.bottom then NewBottom else 0))
	}, CryoModule.Dictionary.join(JoinResult, p1.leftFrameProps or {}))
	local JoinResult4 = CryoModule.Dictionary.join({
		Position = UDim2.new(1, 0, 0, if p1.directions.top then -NewTop else 0),
		Size = UDim2.new(0, NewRight, 1, (if p1.directions.top then NewTop else 0) + (if p1.directions.bottom then NewBottom else 0))
	}, CryoModule.Dictionary.join(JoinResult, p1.rightFrameProps or {}))
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		InsetBackgroundTop = if p1.directions.top and NewTop > 0 then ReactModule.createElement("Frame", JoinResult1) else nil,
		InsetBackgroundBottom = if p1.directions.bottom and NewBottom > 0 then ReactModule.createElement("Frame", JoinResult2) else nil,
		InsetBackgroundLeft = if p1.directions.left and NewLeft > 0 then ReactModule.createElement("Frame", JoinResult3) else nil,
		InsetBackgroundRight = if p1.directions.right and NewRight > 0 then ReactModule.createElement("Frame", JoinResult4) else nil
	})
end