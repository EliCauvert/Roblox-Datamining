local Parent = script.Parent.Parent
local CryoModule = require(Parent.Parent.Cryo)
local GetFFlagUGCValidationEyebrowEyelashSupportModule = require(Parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)
local UGCValidationValueToStringVector3Precision = game:DefineFastFlag("UGCValidationValueToStringVector3Precision", false)

local function _(p1, p2): number --[[ Line: 9 | Named "round" ]]
	local v1 = 10 ^ (p2 or 0)
	
	return math.floor(p1 * v1 + 0.5) / v1
end

local function valueToString(Entry): string --[[ Line: 14 ]]
	-- upvalues: CryoModule (copy), UGCValidationValueToStringVector3Precision (copy), GetFFlagUGCValidationEyebrowEyelashSupportModule (copy), valueToString (copy)
	local ValueType = typeof(Entry)
	
	if Entry == CryoModule.None then
		return "not defined"
	end
	if ValueType == "Vector3" then
		return string.format(if UGCValidationValueToStringVector3Precision then "%g, %g, %g" else "%d, %d, %d", math.floor(Entry.X * 100 + 0.5) / 100, math.floor(Entry.Y * 100 + 0.5) / 100, math.floor(Entry.Z * 100 + 0.5) / 100)
	end
	if ValueType == "Color3" then
		return string.format("%d, %d, %d", math.floor(Entry.r * 255), math.floor(Entry.g * 255), (math.floor(Entry.b * 255)))
	end
	if not GetFFlagUGCValidationEyebrowEyelashSupportModule() or ValueType ~= "table" or Entry[1] == nil then
		return (tostring(Entry))
	end
	local Text = tostring(Entry[1])
	
	for i = 2, #Entry do
		Text ..= ", " .. valueToString(Entry[i])
	end
	return Text
end

return valueToString