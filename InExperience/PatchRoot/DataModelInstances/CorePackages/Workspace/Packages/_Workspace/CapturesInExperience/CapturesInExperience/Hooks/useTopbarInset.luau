local parent = script.Parent.Parent.Parent
local reactUtilsModule = require(parent.ReactUtils)
local guiService = game:GetService("GuiService")
local reactModule = require(parent.React)
local useEventConnection = reactUtilsModule.useEventConnection

return function() --[[ line: 11 ]]
	-- upvalues: reactModule (ref), guiService (ref), useEventConnection (ref)
	local var3, var4 = reactModule.useState(guiService.TopbarInset)
	useEventConnection(guiService:GetPropertyChangedSignal("TopbarInset"), function() --[[ line: 14 ]]
		-- upvalues: var4 (ref), guiService (copy)
		var4(guiService.TopbarInset)
	end)
	
	return var3
end