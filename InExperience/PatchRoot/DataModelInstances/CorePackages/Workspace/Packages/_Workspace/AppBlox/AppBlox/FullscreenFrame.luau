local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local DisplayModule = require(Parent.Display)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return ReactModule.forwardRef(function(p1, Ref) --[[ Line: 10 | Named "FullscreenFrame" ]]
	-- upvalues: UseSelectorFunction (copy), UseSignalStateFunction (copy), DisplayModule (copy), CryoModule (copy), ReactModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 11 ]]
		return p2.GlobalGuiInset
	end)
	local UseSignalStateResult = UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding)
	
	return ReactModule.createElement("Frame", (CryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -UseSelectorResult.left - UseSignalStateResult.left, 0, -UseSelectorResult.top - UseSignalStateResult.top),
		Size = UDim2.new(1, UseSelectorResult.left + UseSelectorResult.right + UseSignalStateResult.left + UseSignalStateResult.right, 1, UseSelectorResult.top + UseSelectorResult.bottom + UseSignalStateResult.top + UseSignalStateResult.bottom),
		ref = Ref
	}, p1 or {})))
end)