local parent = script.Parent.Parent
local cryoModule = require(parent.Parent.Cryo)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)
local UGCValidationValueToStringVector3Precision = game:DefineFastFlag("UGCValidationValueToStringVector3Precision", false)

local function _(value, p1)
	local var1 = 10 ^ (p1 or 0)
	
	return math.floor(value * var1 + 0.5) / var1
end

local function valueToString(p1)
	-- upvalues: cryoModule (ref), UGCValidationValueToStringVector3Precision (ref), getFFlagUGCValidationEyebrowEyelashSupportModule (ref), valueToString (ref)
	local var1 = typeof(p1)
	
	if p1 == cryoModule.None then
		return "not defined"
	elseif var1 == "Vector3" then
		return string.format(if UGCValidationValueToStringVector3Precision then "%g, %g, %g" else "%d, %d, %d", math.floor(p1.X * 100 + 0.5) / 100, math.floor(p1.Y * 100 + 0.5) / 100, math.floor(p1.Z * 100 + 0.5) / 100)
	elseif var1 == "Color3" then
		return string.format("%d, %d, %d", math.floor(p1.r * 255), math.floor(p1.g * 255), math.floor(p1.b * 255))
	elseif not getFFlagUGCValidationEyebrowEyelashSupportModule() or var1 ~= "table" or p1[1] == nil then
		return tostring(p1)
	end
	local var2 = tostring(p1[1])
	
	for i = 2, #p1 do
		var2 ..= ", " .. valueToString(p1[i])
	end
	return var2
end

return valueToString