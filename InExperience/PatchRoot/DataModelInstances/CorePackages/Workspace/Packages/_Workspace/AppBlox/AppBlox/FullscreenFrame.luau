local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local displayModule = require(parent.Display)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useSelector (ref), useSignalState (ref), displayModule (ref), cryoModule (ref), reactModule (ref)
	local var3 = useSelector(function(p2)
		return p2.GlobalGuiInset
	end)
	local var4 = useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding)
	
	return reactModule.createElement("Frame", cryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		Position = UDim2.new(0, (-var3.left) - var4.left, 0, (-var3.top) - var4.top),
		Size = UDim2.new(1, var3.left + var3.right + var4.left + var4.right, 1, var3.top + var3.bottom + var4.top + var4.bottom),
		ref = p1
	}, p0 or {}))
end)