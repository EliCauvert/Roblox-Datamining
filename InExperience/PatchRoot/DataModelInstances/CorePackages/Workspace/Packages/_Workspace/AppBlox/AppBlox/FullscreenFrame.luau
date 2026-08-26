local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local displayModule = require(parent.Display)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useSelector (ref), useSignalState (ref), displayModule (ref), cryoModule (ref), reactModule (ref)
	local var1 = useSelector(function(p3)
		return p3.GlobalGuiInset
	end)
	local var2 = useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding)
	
	return reactModule.createElement("Frame", cryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		Position = UDim2.new(0, (-var1.left) - var2.left, 0, (-var1.top) - var2.top),
		Size = UDim2.new(1, var1.left + var1.right + var2.left + var2.right, 1, var1.top + var1.bottom + var2.top + var2.bottom),
		ref = p2
	}, p1 or {}))
end)