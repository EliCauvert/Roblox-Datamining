local UserInputService = game:GetService("UserInputService")
local config = {
	_initialized = false,
	_isKeyboardJustOff = false,
	getInstance = function(p1) --[[ Line: 8 ]]
		if not p1._initialized then
			p1:initialize()
			p1._initialized = true
		end
		return p1
	end,
	initialize = function(p1) --[[ Line: 16 ]]
		-- upvalues: UserInputService (copy)
		p1._isKeyboardJustOff = false
		UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 18 ]]
			-- upvalues: UserInputService (upval), p1 (copy)
			if not UserInputService.OnScreenKeyboardVisible then
				p1._isKeyboardJustOff = true
			end
		end)
		UserInputService.InputEnded:Connect(function(_) --[[ Line: 23 ]]
			-- upvalues: p1 (copy)
			if p1._isKeyboardJustOff then
				p1._isKeyboardJustOff = false
			end
		end)
	end,
	isKeyboardJustOff = function(p1) --[[ Line: 35 ]]
		return p1._isKeyboardJustOff
	end
}

return {
	getInstance = function() --[[ Line: 40 ]]
		-- upvalues: config (copy)
		return config:getInstance()
	end
}