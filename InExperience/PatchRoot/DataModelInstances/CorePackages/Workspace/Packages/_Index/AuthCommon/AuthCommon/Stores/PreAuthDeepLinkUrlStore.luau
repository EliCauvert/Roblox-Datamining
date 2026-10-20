local Url = nil

return {
	getUrl = function()
		-- upvalues: Url (ref)
		return Url
	end,
	setUrl = function(Value)
		-- upvalues: Url (ref)
		Url = Value
	end
}