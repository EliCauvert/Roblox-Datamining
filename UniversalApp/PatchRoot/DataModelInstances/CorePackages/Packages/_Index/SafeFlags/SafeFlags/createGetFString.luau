return function(Name, DefaultValue) --[[ Line: 1 | Named "createGetFString" ]]
	local Success, Result = pcall(function() --[[ Line: 2 ]]
		-- upvalues: Name (copy), DefaultValue (copy)
		game:DefineFastString(Name, DefaultValue)
	end)
	
	return if Success or not Result:match("The current thread cannot call") then function() --[[ Line: 12 ]]
		-- upvalues: Name (copy)
		return game:GetFastString(Name)
	end else function() --[[ Line: 7 ]]
		-- upvalues: DefaultValue (copy)
		return DefaultValue
	end
end