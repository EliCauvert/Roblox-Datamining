local playersService = game:GetService("Players")
local var1 = if game:GetService("RunService"):IsStudio() then game:GetService("StudioService") else nil

return function(p1)
	-- upvalues: playersService (ref), var1 (ref)
	p1 = p1 or playersService
	
	return if p1.LocalPlayer then p1.LocalPlayer.UserId elseif var1 then var1:GetUserId() else 0
end