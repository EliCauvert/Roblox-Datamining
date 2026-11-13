local _ = require("./types")
local CoreModule = require("../vendor/compose/core")
local t = {}
setmetatable(t, { __mode = "k" })

local function _(Key, p1)
	-- upvalues: t (copy)
	if t[Key] == p1 then
		t[Key] = nil
	end
	p1.height:set(0)
	p1.stop()
end

return {
	capture = function(p1, UserInputService, Box, Input, p2)
		-- upvalues: CoreModule (copy), t (copy)
		if UserInputService == nil or Input == nil or UserInputService.OnScreenKeyboardVisible ~= true then return end
		local TypesEnum = p1.types.Enum
		
		if Input.UserInputType ~= TypesEnum.UserInputType.Touch and Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 then return end
		if Input.UserInputState ~= TypesEnum.UserInputState.Begin and Input.UserInputState ~= TypesEnum.UserInputState.Change then return end
		local OnScreenKeyboardSize = UserInputService.OnScreenKeyboardSize
		
		if typeof(OnScreenKeyboardSize) ~= "Vector2" then return end
		local Y: number = OnScreenKeyboardSize.Y
		
		if Y <= 0 or CoreModule.owner.isDisposed(p2) then return end
		local Entry = t[p1.runtime]
		
		if Entry then
			local Runtime = p1.runtime
			
			if t[Runtime] == Entry then
				t[Runtime] = nil
			end
			Entry.height:set(0)
			Entry.stop()
		end
		local config = {
			box = Box,
			height = p1.Compose.cell(Y),
			stop = function() end
		}
		t[p1.runtime] = config
		config.stop = CoreModule.owner.watch(p2, function(Callback)
			-- upvalues: p1 (copy), Input (copy), TypesEnum (copy), config (copy), t (upval)
			local CallbackResult = Callback(p1.runtime.observe(Input, "UserInputState", { frame = true }))
			
			if CallbackResult == TypesEnum.UserInputState.End or CallbackResult == TypesEnum.UserInputState.Cancel then
				local Runtime = p1.runtime
				
				if t[Runtime] == config then
					t[Runtime] = nil
				end
				config.height:set(0)
				config.stop()
			end
		end, "keyboard-clearance")
	end,
	release = function(p1, Box)
		-- upvalues: t (copy)
		local Entry = t[p1.runtime]
		
		if Entry and Entry.box == Box then
			local Runtime = p1.runtime
			
			if t[Runtime] == Entry then
				t[Runtime] = nil
			end
			Entry.height:set(0)
			Entry.stop()
		end
	end,
	reader = function(p1, p2)
		-- upvalues: t (copy)
		if p2 == nil or not p2.GetPropertyChangedSignal then
			return function(): number
				return 0
			end
		else
			local OnScreenKeyboardVisibleResult = p1.observe.OnScreenKeyboardVisible(p2)
			local OnScreenKeyboardSizeResult = p1.observe.OnScreenKeyboardSize(p2)
			
			return function(Callback)
				-- upvalues: OnScreenKeyboardVisibleResult (copy), OnScreenKeyboardSizeResult (copy), t (upval), p1 (copy)
				if Callback(OnScreenKeyboardVisibleResult) == true then
					local CallbackResult = Callback(OnScreenKeyboardSizeResult)
					
					if typeof(CallbackResult) == "Vector2" and CallbackResult.Y > 0 then
						return CallbackResult.Y
					end
				end
				local Entry = t[p1.runtime]
				
				return if Entry == nil then 0 else Callback(Entry.height)
			end
		end
	end
}