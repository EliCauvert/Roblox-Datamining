local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection

local function _(Mouse)
	local Target = Mouse.Target
	
	return if Target and Target:IsA("TextChannel") then Target else nil
end

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), UseEventConnectionFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: Frame (copy)
		local Target = Frame.Target
		
		return if Target and Target:IsA("TextChannel") then Target else nil
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function()
		-- upvalues: Frame (copy)
		return Frame.BackgroundColor3
	end)
	UseEventConnectionFunction(Frame:GetPropertyChangedSignal("Target"), function()
		-- upvalues: UseStateResult2 (copy), Frame (copy)
		local Target = Frame.Target
		UseStateResult2(if Target and Target:IsA("TextChannel") then Target else nil)
	end, { Frame })
	UseEventConnectionFunction(Frame:GetPropertyChangedSignal("BackgroundColor3"), function()
		-- upvalues: UseStateResult2_1 (copy), Frame (copy)
		UseStateResult2_1(Frame.BackgroundColor3)
	end, { Frame })
	
	return {
		target = UseStateResult,
		backgroundColor = UseStateResult1
	}
end