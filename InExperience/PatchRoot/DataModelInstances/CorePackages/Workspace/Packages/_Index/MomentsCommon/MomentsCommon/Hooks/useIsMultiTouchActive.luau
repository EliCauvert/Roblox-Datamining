local ReactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local UserInputService = game:GetService("UserInputService")
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState

return function(p1)
	-- upvalues: UseStateFunction (copy), UseEffectFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), UserInputService (upval)
		if p1 then
			local t = {}
			
			local function _()
				-- upvalues: t (copy), UseStateResult2 (upval)
				local Count = 0
				
				for _ in t do
					Count += 1
				end
				UseStateResult2(Count >= 2)
			end
			
			local TouchStartedConnection = UserInputService.TouchStarted:Connect(function(Touch)
				-- upvalues: t (copy), UseStateResult2 (upval)
				t[Touch] = true
				local Count = 0
				
				for _ in t do
					Count += 1
				end
				UseStateResult2(Count >= 2)
			end)
			local TouchEndedConnection = UserInputService.TouchEnded:Connect(function(Hit)
				-- upvalues: t (copy), UseStateResult2 (upval)
				t[Hit] = nil
				local Count = 0
				
				for _ in t do
					Count += 1
				end
				UseStateResult2(Count >= 2)
			end)
			
			return function()
				-- upvalues: TouchStartedConnection (copy), TouchEndedConnection (copy)
				TouchStartedConnection:Disconnect()
				TouchEndedConnection:Disconnect()
			end
		else
			UseStateResult2(false)
			
			return nil
		end
	end, { p1 })
	
	return UseStateResult
end