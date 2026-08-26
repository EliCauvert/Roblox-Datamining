local userInputService = game:GetService("UserInputService")

return function(p1, p2)
	-- upvalues: userInputService (ref)
	for i, v in p1 do
		if not userInputService:GamepadSupports(p2, v) then
			return false
		end
	end
	return true
end