local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local UseStateFunction = require(Parent.React).useState

return function() --[[ Line: 12 | Named "useSystemMenuDetection" ]]
	-- upvalues: UseStateFunction (copy), UseEventConnectionFunction (copy), GuiService (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	UseEventConnectionFunction(GuiService.MenuOpened, function() --[[ Line: 15 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end)
	UseEventConnectionFunction(GuiService.MenuClosed, function() --[[ Line: 19 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end)
	
	return UseStateResult
end