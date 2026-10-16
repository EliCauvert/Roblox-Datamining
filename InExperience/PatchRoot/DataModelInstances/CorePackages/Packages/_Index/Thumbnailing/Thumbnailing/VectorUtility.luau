local VectorUtilityModule = {
	Vector3FromXYRotPlusDistance = function(Degrees: number, Degrees1: number, Number) --[[ Line: 5 ]]
		return CFrame.fromEulerAnglesXYZ(math.rad(Degrees), math.rad(Degrees1), 0).LookVector * Number
	end
}

function VectorUtilityModule.Vector3FromJson(Text: string) --[[ Line: 11 ]]
	-- upvalues: VectorUtilityModule (copy)
	local Unpacked, Unpacked2, Unpacked3 = unpack(Text:split("/"))
	local Number: number? = tonumber(Unpacked)
	local Number1: number? = tonumber(Unpacked2)
	local Number2: number? = tonumber(Unpacked3)
	
	return if Number and Number1 and Number2 then VectorUtilityModule.Vector3FromXYRotPlusDistance(Number, Number1, Number2) else vector.create(0, 0, 0)
end

return VectorUtilityModule