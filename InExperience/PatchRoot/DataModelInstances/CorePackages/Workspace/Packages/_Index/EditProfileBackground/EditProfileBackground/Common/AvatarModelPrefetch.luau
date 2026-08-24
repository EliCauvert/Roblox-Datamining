local promiseModule = require(script:FindFirstAncestor("EditProfileBackground").Parent.Promise)
local playersService = game:GetService("Players")
local t = {}
local t_1 = {
	prefetch = function(p0)
		-- upvalues: t (ref), promiseModule (ref), playersService (ref)
		if t[p0] then
			return
		end
		t[p0] = promiseModule.new(function(p1, p2)
			-- upvalues: playersService (copy), p0 (ref)
			local ok, status = pcall(function()
				-- upvalues: playersService (copy), p0 (copy)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromUserIdAsync(p0) else game.Players:CreateHumanoidModelFromUserId(p0)
			end)
			
			if ok and status then
				p1(status)
				
				return
			end
			p2("CharacterModelCreationFailed")
		end)
	end
}

function t_1.get(p3)
	-- upvalues: t (ref), t_1 (ref)
	if t[p3] then
		return t[p3]
	end
	t_1.prefetch(p3)
	
	return t[p3]
end

function t_1.clear(p4)
	-- upvalues: t (ref)
	t[p4] = nil
end

return t_1