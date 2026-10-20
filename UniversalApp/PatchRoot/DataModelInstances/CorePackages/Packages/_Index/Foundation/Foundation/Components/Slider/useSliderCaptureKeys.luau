local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local UserInputService = require(Foundation.Utility.Wrappers.Services).UserInputService
local ConstantsModule = require(script.Parent.constants)

local function _(Value): boolean
	-- upvalues: ConstantsModule (copy)
	return table.find(ConstantsModule.enter, Value) ~= nil or table.find(ConstantsModule.thumbSwitch, Value) ~= nil
end

return function(p1, Current)
	-- upvalues: ReactModule (copy), UserInputService (copy), ConstantsModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UserInputService (upval), ConstantsModule (upval), UseRefResult (copy)
		if not p1 then return end
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
			-- upvalues: ConstantsModule (upval), UseRefResult (upval)
			local KeyCode = Input.KeyCode
			
			if table.find(ConstantsModule.enter, KeyCode) ~= nil or table.find(ConstantsModule.thumbSwitch, KeyCode) ~= nil then
				UseRefResult.current()
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { p1 })
end