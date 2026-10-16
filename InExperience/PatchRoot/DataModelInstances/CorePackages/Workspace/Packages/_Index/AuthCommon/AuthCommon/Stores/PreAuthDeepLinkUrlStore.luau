local Url = nil

return {
	getUrl = function() --[[ Line: 4 ]]
		-- upvalues: Url (ref)
		return Url
	end,
	setUrl = function(Value) --[[ Line: 8 ]]
		-- upvalues: Url (ref)
		Url = Value
	end
}