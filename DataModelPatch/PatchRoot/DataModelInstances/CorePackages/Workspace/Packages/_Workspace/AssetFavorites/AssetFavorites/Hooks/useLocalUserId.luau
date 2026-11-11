local Players = game:GetService("Players")
local StudioService = if game:GetService("RunService"):IsStudio() then game:GetService("StudioService") else nil

return function(p1)
	-- upvalues: Players (copy), StudioService (copy)
	local P0 = p1 or Players
	
	return if P0.LocalPlayer then P0.LocalPlayer.UserId elseif StudioService then StudioService:GetUserId() else 0
end