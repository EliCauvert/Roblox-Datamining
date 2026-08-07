local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local useEventConnection = require(parent.ReactUtils).useEventConnection
local useState = require(parent.React).useState

return function() --[[ line: 12 | named "useSystemMenuDetection" ]]
	-- upvalues: useState (ref), useEventConnection (ref), guiService (ref)
	local var1, var2 = useState(false)
	useEventConnection(guiService.MenuOpened, function() --[[ line: 15 ]]
		-- upvalues: var2 (ref)
		var2(true)
	end)
	useEventConnection(guiService.MenuClosed, function() --[[ line: 19 ]]
		-- upvalues: var2 (ref)
		var2(false)
	end)
	
	return var1
end