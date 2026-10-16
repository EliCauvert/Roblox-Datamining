return function(Name, p1) --[[ Line: 1 | Named "createGetFFlag" ]]
	local Success, Result = pcall(function() --[[ Line: 2 ]]
		-- upvalues: Name (copy), p1 (copy)
		game:DefineFastFlag(Name, if p1 then p1 else false)
	end)
	
	return if Success or not Result:match("The current thread cannot call") then function() --[[ Line: 13 ]]
		-- upvalues: Name (copy)
		return game:GetFastFlag(Name)
	end else function(): boolean --[[ Line: 7 ]]
		-- upvalues: Name (copy)
		return Name:match("^Debug") == nil
	end
end