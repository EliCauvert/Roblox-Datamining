local Parent = script.Parent.Parent.Parent
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection

local function _() --[[ Line: 12 ]]
	-- upvalues: GuiService (copy)
	local GuiInset, GuiInset2 = GuiService:GetGuiInset()
	
	return {
		bottom = GuiInset2.Y,
		left = GuiInset.X,
		right = GuiInset2.X,
		top = GuiInset.Y
	}
end

return function() --[[ Line: 22 ]]
	-- upvalues: ReactModule (copy), GuiService (copy), UseEventConnectionFunction (copy), UserInputService (copy)
	local UseStateFunction = ReactModule.useState
	local GuiInset, GuiInset2 = GuiService:GetGuiInset()
	local UseStateResult, UseStateResult2 = UseStateFunction({
		bottom = GuiInset2.Y,
		left = GuiInset.X,
		right = GuiInset2.X,
		top = GuiInset.Y
	})
	
	local function v11() --[[ Line: 25 ]]
		-- upvalues: UseStateResult2 (copy), GuiService (upval)
		local GuiInset, GuiInset2 = GuiService:GetGuiInset()
		UseStateResult2({
			bottom = GuiInset2.Y,
			left = GuiInset.X,
			right = GuiInset2.X,
			top = GuiInset.Y
		})
	end
	
	UseEventConnectionFunction(GuiService.SafeZoneOffsetsChanged, v11)
	UseEventConnectionFunction(UserInputService:GetPropertyChangedSignal("BottomBarSize"), v11)
	UseEventConnectionFunction(UserInputService:GetPropertyChangedSignal("RightBarSize"), v11)
	
	return UseStateResult
end