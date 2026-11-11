local Parent = script.Parent.Parent.Parent
local GuiService = game:GetService("GuiService")
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection

return function()
	-- upvalues: ReactModule (copy), GuiService (copy), UseEventConnectionFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(GuiService.TopbarInset)
	UseEventConnectionFunction(GuiService:GetPropertyChangedSignal("TopbarInset"), function()
		-- upvalues: UseStateResult2 (copy), GuiService (upval)
		UseStateResult2(GuiService.TopbarInset)
	end)
	
	return UseStateResult
end