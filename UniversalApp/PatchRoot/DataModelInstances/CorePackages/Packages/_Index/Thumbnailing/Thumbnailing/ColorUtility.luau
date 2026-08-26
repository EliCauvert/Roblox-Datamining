return {
	Color3FromString = function(p1)
		local var1, var2, var3 = unpack(p1:split("/"))
		
		return Color3.fromRGB(tonumber(var1), tonumber(var2), tonumber(var3))
	end
}