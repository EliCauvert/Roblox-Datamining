local roduxModule = require(script:FindFirstAncestor("ContactsToast").Parent.Rodux)

return function(p0, p1) --[[ line: 5 ]]
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(p1 or function(p2) --[[ line: 6 ]]
		return p2
	end, p0 or {}, { roduxModule.thunkMiddleware })
end