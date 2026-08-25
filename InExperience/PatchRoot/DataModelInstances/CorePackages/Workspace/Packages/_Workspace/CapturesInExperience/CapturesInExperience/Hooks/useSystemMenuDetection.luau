local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local useEventConnection = require(parent.ReactUtils).useEventConnection
local useState = require(parent.React).useState

return function()
	-- upvalues: useState (ref), useEventConnection (ref), guiService (ref)
	local var1, var2 = useState(false)
	useEventConnection(guiService.MenuOpened, function()
		-- upvalues: var2 (ref)
		var2(true)
	end)
	useEventConnection(guiService.MenuClosed, function()
		-- upvalues: var2 (ref)
		var2(false)
	end)
	
	return var1
end