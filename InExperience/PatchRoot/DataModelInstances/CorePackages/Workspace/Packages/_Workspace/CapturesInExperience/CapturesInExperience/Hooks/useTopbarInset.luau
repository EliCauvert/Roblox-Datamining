local parent = script.Parent.Parent.Parent
local reactUtilsModule = require(parent.ReactUtils)
local guiService = game:GetService("GuiService")
local reactModule = require(parent.React)
local useEventConnection = reactUtilsModule.useEventConnection

return function()
	-- upvalues: reactModule (ref), guiService (ref), useEventConnection (ref)
	local var1, var2 = reactModule.useState(guiService.TopbarInset)
	useEventConnection(guiService:GetPropertyChangedSignal("TopbarInset"), function()
		-- upvalues: var2 (ref), guiService (copy)
		var2(guiService.TopbarInset)
	end)
	
	return var1
end