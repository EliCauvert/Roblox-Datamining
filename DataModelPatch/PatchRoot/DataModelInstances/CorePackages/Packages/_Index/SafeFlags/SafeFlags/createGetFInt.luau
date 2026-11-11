return function(Name, DefaultValue)
	local Success, Result = pcall(function()
		-- upvalues: Name (copy), DefaultValue (copy)
		game:DefineFastInt(Name, DefaultValue)
	end)
	
	return if Success or not Result:match("The current thread cannot call") then function()
		-- upvalues: Name (copy)
		return game:GetFastInt(Name)
	end else function()
		-- upvalues: DefaultValue (copy)
		return DefaultValue
	end
end