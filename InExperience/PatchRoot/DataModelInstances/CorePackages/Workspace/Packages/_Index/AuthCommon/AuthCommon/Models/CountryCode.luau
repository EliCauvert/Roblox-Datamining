local t = {
	new = function()
		return {}
	end
}

function t.fromJSON(p0)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.name = p0.name
	var1.code = p0.code
	var1.prefix = p0.prefix
	var1.localizedName = p0.localizedName
	var1.isDefault = p0.isDefault
	
	return var1
end

return t