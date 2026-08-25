local userInputService = game:GetService("UserInputService")
local t = {
	getInstance = function(p0)
		if not p0._initialized then
			p0:initialize()
			p0._initialized = true
		end
		return p0
	end,
	initialize = function(p1)
		-- upvalues: userInputService (ref)
		p1._isKeyboardJustOff = false
		userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: userInputService (copy), p1 (ref)
			if not userInputService.OnScreenKeyboardVisible then
				p1._isKeyboardJustOff = true
			end
		end)
		userInputService.InputEnded:Connect(function(_)
			-- upvalues: p1 (ref)
			if p1._isKeyboardJustOff then
				p1._isKeyboardJustOff = false
			end
		end)
	end,
	isKeyboardJustOff = function(p2)
		return p2._isKeyboardJustOff
	end
}

return {
	getInstance = function()
		-- upvalues: t (ref)
		return t:getInstance()
	end
}