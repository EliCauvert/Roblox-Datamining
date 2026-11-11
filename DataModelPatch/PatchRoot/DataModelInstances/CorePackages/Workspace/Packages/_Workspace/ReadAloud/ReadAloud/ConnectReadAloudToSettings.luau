return function(p1)
	local UserGameSettings = UserSettings():GetService("UserGameSettings")
	
	if UserGameSettings.ReadAloud then
		p1.Enable()
	end
	UserGameSettings:GetPropertyChangedSignal("ReadAloud"):Connect(function()
		-- upvalues: UserGameSettings (copy), p1 (copy)
		if UserGameSettings.ReadAloud then
			p1.Enable()
			p1.ReadSystemTextFromKey("SystemEnabled")
			
			return
		else
			p1.Disable()
		end
	end)
end