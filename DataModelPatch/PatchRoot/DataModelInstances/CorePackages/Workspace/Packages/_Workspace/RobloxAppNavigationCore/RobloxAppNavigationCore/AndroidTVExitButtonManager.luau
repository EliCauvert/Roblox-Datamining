local FFlagAndroidTVExitWithB = require(script:FindFirstAncestor("RobloxAppNavigationCore").Parent.SharedFlags).FFlagAndroidTVExitWithB
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local List = {}

local function _()
	-- upvalues: List (copy), ContextActionService (ref), UserInputService (ref)
	if #List == 1 then
		ContextActionService:BindCoreActionAtPriority("AndroidTVExitWithB", function(_, UserInputState, _)
			-- upvalues: UserInputService (upval), List (upval)
			if UserInputState == Enum.UserInputState.Begin and not UserInputService:GamepadSupports(UserInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
				for _, value in List do
					value()
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, -1e999, Enum.KeyCode.ButtonB)
	end
end

local _ = function()
	-- upvalues: List (copy), ContextActionService (ref)
	if #List == 0 then
		ContextActionService:UnbindCoreAction("AndroidTVExitWithB")
	end
end

return {
	register = function(p1)
		-- upvalues: FFlagAndroidTVExitWithB (copy), List (copy), ContextActionService (ref), UserInputService (ref)
		if not FFlagAndroidTVExitWithB then
			return function() end
		end
		table.insert(List, p1)
		
		if #List == 1 then
			ContextActionService:BindCoreActionAtPriority("AndroidTVExitWithB", function(_, UserInputState, _)
				-- upvalues: UserInputService (upval), List (upval)
				if UserInputState == Enum.UserInputState.Begin and not UserInputService:GamepadSupports(UserInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
					for _, value in List do
						value()
					end
				end
				return Enum.ContextActionResult.Pass
			end, false, -1e999, Enum.KeyCode.ButtonB)
		end
		return function()
			-- upvalues: List (upval), p1 (copy), ContextActionService (upval)
			for i = #List, 1, -1 do
				if List[i] ~= p1 then
					continue
				end
				table.remove(List, i)
				break
			end
			if #List == 0 then
				ContextActionService:UnbindCoreAction("AndroidTVExitWithB")
			end
		end
	end,
	setMocks = function(Value, Value1)
		-- upvalues: ContextActionService (ref), UserInputService (ref)
		ContextActionService = Value
		UserInputService = Value1
	end
}