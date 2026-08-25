local t = {
	Vector3FromXYRotPlusDistance = function(p0, p1, p2)
		return CFrame.fromEulerAnglesXYZ(math.rad(p0), math.rad(p1), 0).LookVector * p2
	end
}

function t.Vector3FromJson(p3)
	-- upvalues: t (ref)
	local var1, var2, var3 = unpack(p3:split("/"))
	local var4 = tonumber(var1)
	local var5 = tonumber(var2)
	local var6 = tonumber(var3)
	
	return if var4 and var5 and var6 then t.Vector3FromXYRotPlusDistance(var4, var5, var6) else Vector3.new(0, 0, 0)
end

return t