local promiseModule = require(script:FindFirstAncestor("EditProfileBackground").Parent.Promise)
local playersService = game:GetService("Players")
local t = {}
local t_1 = {
	prefetch = function(p0) --[[ line: 11 ]]
		-- upvalues: t (ref), promiseModule (ref), playersService (ref)
		if t[p0] then
			return
		end
		t[p0] = promiseModule.new(function(p1, p2) --[[ line: 16 ]]
			-- upvalues: playersService (copy), p0 (ref)
			local ok, status = pcall(function() --[[ line: 17 ]]
				-- upvalues: playersService (copy), p0 (copy)
				return playersService:CreateHumanoidModelFromUserIdAsync(p0)
			end)
			
			if ok and status then
				p1(status)
				
				return
			end
			p2("CharacterModelCreationFailed")
		end)
	end
}

function t_1.get(p3) --[[ line: 28 ]]
	-- upvalues: t (ref), t_1 (ref)
	if t[p3] then
		return t[p3]
	end
	t_1.prefetch(p3)
	
	return t[p3]
end

function t_1.clear(p4) --[[ line: 37 ]]
	-- upvalues: t (ref)
	t[p4] = nil
end

return t_1