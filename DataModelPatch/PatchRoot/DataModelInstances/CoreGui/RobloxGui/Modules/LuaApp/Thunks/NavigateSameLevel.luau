local ResetNavigationHistoryModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.ResetNavigationHistory)

local function navigateSameLevel(p1, Name)
	local t = {}
	
	if #p1 > 1 then
		for i = 1, #p1 - 1 do
			t[i] = p1[i]
		end
	end
	local v1 = p1[#p1]
	local t1 = {}
	
	if v1 and #v1 > 1 then
		for i1 = 1, #v1 - 1 do
			t1[i1] = v1[i1]
		end
		t1[#t1 + 1] = { name = Name }
	else
		t1 = { { name = Name } }
	end
	t[#t + 1] = t1
	
	return t1, t
end

return function(p2, Name)
	-- upvalues: navigateSameLevel (copy), ResetNavigationHistoryModule (copy)
	return function(p3)
		-- upvalues: navigateSameLevel (upval), p2 (copy), Name (copy), ResetNavigationHistoryModule (upval)
		local NavigateSameLevelResult, NavigateSameLevelResult2 = navigateSameLevel(p2, Name)
		p3:dispatch(ResetNavigationHistoryModule(NavigateSameLevelResult, NavigateSameLevelResult2))
	end
end