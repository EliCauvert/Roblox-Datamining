local UserInputService = game:GetService("UserInputService")
local Packages = game:GetService("CorePackages").Packages
local ReactModule = require(Packages.React)
local LuauPolyfillModule = require(Packages.LuauPolyfill)
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout

local function _(Input): boolean
	return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
end

return function(p1)
	-- upvalues: ReactModule (copy), ClearTimeoutFunction (copy), SetTimeoutFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), ClearTimeoutFunction (upval), UseRefResult (copy)
		if UseRefResult1.current then
			ClearTimeoutFunction(UseRefResult1.current)
		end
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
	end, { UseRefResult1, UseRefResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UseStateResult2_2 (copy), UseRefResult1 (copy), SetTimeoutFunction (upval), p1 (copy), UseRefResult (copy), UserInputService (upval)
		UseResult()
		UseStateResult2_2(true)
		UseRefResult1.current = SetTimeoutFunction(function()
			-- upvalues: UseResult (upval), UseStateResult2_2 (upval)
			UseResult()
			UseStateResult2_2(false)
		end, p1)
		UseRefResult.current = UserInputService.InputBegan:Connect(function(Input, _)
			-- upvalues: UseResult (upval), UseStateResult2_2 (upval)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				UseResult()
				UseStateResult2_2(false)
				
				return
			end
		end)
	end, { UseRefResult1, UseRefResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return UseResult
	end, {})
	
	return UseStateResult, UseStateResult1, UseStateResult3, (ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseResult1 (copy)
		UseStateResult2(p2)
		UseStateResult2_1(p3)
		UseResult1()
	end, {}))
end