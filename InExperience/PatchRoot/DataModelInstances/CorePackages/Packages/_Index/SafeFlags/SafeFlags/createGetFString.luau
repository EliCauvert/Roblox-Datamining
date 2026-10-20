return function(Name, DefaultValue)
	local Success, Result = pcall(function()
		-- upvalues: Name (copy), DefaultValue (copy)
		game:DefineFastString(Name, DefaultValue)
	end)
	
	return if Success or not Result:match("The current thread cannot call") then function()
		-- upvalues: Name (copy)
		return game:GetFastString(Name)
	end else function()
		-- upvalues: DefaultValue (copy)
		return DefaultValue
	end
end