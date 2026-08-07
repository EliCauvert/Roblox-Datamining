local parent = script.Parent.Parent.Parent
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

local _ = function() --[[ line: 12 ]]
	-- upvalues: guiService (ref)
	local guiInset, guiInset_1 = guiService:GetGuiInset()
	
	return {
		bottom = guiInset_1.Y,
		left = guiInset.X,
		right = guiInset_1.X,
		top = guiInset.Y
	}
end

return function() --[[ line: 22 ]]
	-- upvalues: reactModule (ref), guiService (ref), useEventConnection (ref), userInputService (ref)
	local useState = reactModule.useState
	local guiInset, guiInset_1 = guiService:GetGuiInset()
	useState, var7 = useState({
		bottom = guiInset_1.Y,
		left = guiInset.X,
		right = guiInset_1.X,
		top = guiInset.Y
	})
	
	local var8 = function() --[[ line: 25 ]]
		-- upvalues: var7 (ref), guiService (copy)
		local guiInset, guiInset_1 = guiService:GetGuiInset()
		var7({
			bottom = guiInset_1.Y,
			left = guiInset.X,
			right = guiInset_1.X,
			top = guiInset.Y
		})
	end
	
	useEventConnection(guiService.SafeZoneOffsetsChanged, var8)
	useEventConnection(userInputService:GetPropertyChangedSignal("BottomBarSize"), var8)
	useEventConnection(userInputService:GetPropertyChangedSignal("RightBarSize"), var8)
	
	return useState
end