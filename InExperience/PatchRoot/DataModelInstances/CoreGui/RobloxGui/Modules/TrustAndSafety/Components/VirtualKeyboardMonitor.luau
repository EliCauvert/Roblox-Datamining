local userInputService = game:GetService("UserInputService")
local t = {
	getInstance = function(p0) --[[ line: 6 ]]
		if not p0._initialized then
			p0:initialize()
			p0._initialized = true
		end
		return p0
	end,
	initialize = function(p1) --[[ line: 14 ]]
		-- upvalues: userInputService (ref)
		p1._isKeyboardJustOff = false
		userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ line: 16 ]]
			-- upvalues: userInputService (copy), p1 (ref)
			if not userInputService.OnScreenKeyboardVisible then
				p1._isKeyboardJustOff = true
			end
		end)
		userInputService.InputEnded:Connect(function(_) --[[ line: 21 ]]
			-- upvalues: p1 (ref)
			if p1._isKeyboardJustOff then
				p1._isKeyboardJustOff = false
			end
		end)
	end,
	isKeyboardJustOff = function(p2) --[[ line: 32 ]]
		return p2._isKeyboardJustOff
	end
}

return {
	getInstance = function() --[[ line: 37 ]]
		-- upvalues: t (ref)
		return t:getInstance()
	end
}