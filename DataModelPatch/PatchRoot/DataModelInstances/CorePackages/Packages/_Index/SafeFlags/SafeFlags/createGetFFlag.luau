return function(Name, p1)
	local Success, Result = pcall(function()
		-- upvalues: Name (copy), p1 (copy)
		game:DefineFastFlag(Name, if p1 then p1 else false)
	end)
	
	return if Success or not Result:match("The current thread cannot call") then function()
		-- upvalues: Name (copy)
		return game:GetFastFlag(Name)
	end else function(): boolean
		-- upvalues: Name (copy)
		return Name:match("^Debug") == nil
	end
end