local t = {
	new = function()
		return {}
	end
}

function t.fromJSON(p1)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.name = p1.name
	var1.code = p1.code
	var1.prefix = p1.prefix
	var1.localizedName = p1.localizedName
	var1.isDefault = p1.isDefault
	
	return var1
end

return t