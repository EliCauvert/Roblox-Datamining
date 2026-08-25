local userInputService = game:GetService("UserInputService")

return function(p0, p1)
	-- upvalues: userInputService (ref)
	for i, v in p0 do
		if not userInputService:GamepadSupports(p1, v) then
			return false
		end
	end
	return true
end