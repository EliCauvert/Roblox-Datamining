local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local userInputService = require(foundation.Utility.Wrappers.Services).UserInputService
local constantsModule = require(script.Parent.constants)

local function _(p1)
	-- upvalues: constantsModule (ref)
	return if table.find(constantsModule.enter, p1) == nil then table.find(constantsModule.thumbSwitch, p1) ~= nil else true
end

return function(p1, p2)
	-- upvalues: reactModule (ref), userInputService (ref), constantsModule (ref)
	local var1 = reactModule.useRef(p2)
	var1.current = p2
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), userInputService (copy), constantsModule (copy), var1 (ref)
		if p1 then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p3)
				-- upvalues: constantsModule (copy), var1 (copy)
				local keyCode = p3.KeyCode
				
				if if table.find(constantsModule.enter, keyCode) == nil then table.find(constantsModule.thumbSwitch, keyCode) ~= nil else true then
					var1.current()
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { p1 })
end