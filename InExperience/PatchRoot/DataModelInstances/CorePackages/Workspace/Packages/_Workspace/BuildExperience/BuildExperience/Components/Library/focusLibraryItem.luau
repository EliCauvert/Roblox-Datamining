return function(p1, p2)
	local ok, status = pcall(function()
		return game:GetService("ExperienceService")
	end)
	
	if ok and status ~= nil then
		pcall(function()
			-- upvalues: status (ref), p1 (ref), p2 (ref)
			status:ExecuteCrossExperienceCall("TeamCreate.Focus", { itemId = p1 }, function()
				-- upvalues: p2 (copy)
				p2()
			end, function() end)
		end)
		
		return
	end
end