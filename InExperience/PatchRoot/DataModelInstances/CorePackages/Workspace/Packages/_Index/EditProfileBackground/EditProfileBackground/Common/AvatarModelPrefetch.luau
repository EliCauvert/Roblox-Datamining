local promiseModule = require(script:FindFirstAncestor("EditProfileBackground").Parent.Promise)
local playersService = game:GetService("Players")
local t = {}
local t_1 = {
	prefetch = function(p1)
		-- upvalues: t (ref), promiseModule (ref), playersService (ref)
		if t[p1] then
			return
		end
		t[p1] = promiseModule.new(function(p2, p3)
			-- upvalues: playersService (copy), p1 (ref)
			local ok, status = pcall(function()
				-- upvalues: playersService (copy), p1 (copy)
				return playersService:CreateHumanoidModelFromUserIdAsync(p1)
			end)
			
			if ok and status then
				p2(status)
				
				return
			end
			p3("CharacterModelCreationFailed")
		end)
	end
}

function t_1.get(p1)
	-- upvalues: t (ref), t_1 (ref)
	if t[p1] then
		return t[p1]
	end
	t_1.prefetch(p1)
	
	return t[p1]
end

function t_1.clear(p1)
	-- upvalues: t (ref)
	t[p1] = nil
end

return t_1