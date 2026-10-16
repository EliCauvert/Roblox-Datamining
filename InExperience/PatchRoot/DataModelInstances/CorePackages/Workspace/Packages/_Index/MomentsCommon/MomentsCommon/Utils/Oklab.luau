local function _(p1): vector --[[ Line: 7 | Named "fromSrgb" ]]
	local DotProductPower = vector.dot(p1, vector.create(0.4122214615345001, 0.5363325476646423, 0.05144599452614784)) ^ 0.3333333333333333
	local DotProductPower1 = vector.dot(p1, vector.create(0.21190349757671356, 0.6806995272636414, 0.10739696025848389)) ^ 0.3333333333333333
	local DotProductPower2 = vector.dot(p1, vector.create(0.08830246329307556, 0.2817188501358032, 0.6299787163734436)) ^ 0.3333333333333333
	
	return (vector.create(DotProductPower * 0.2104542553 + DotProductPower1 * 0.793617785 - DotProductPower2 * 0.0040720468, DotProductPower * 1.9779984951 - DotProductPower1 * 2.428592205 + DotProductPower2 * 0.4505937099, DotProductPower * 0.0259040371 + DotProductPower1 * 0.7827717662 - DotProductPower2 * 0.808675766))
end

local function toSrgb(Vector1): vector --[[ Line: 19 ]]
	local Vec = vector.create(Vector1.x + Vector1.y * 0.3963377774 + Vector1.z * 0.2158037573, Vector1.x - Vector1.y * 0.1055613458 - Vector1.z * 0.0638541728, Vector1.x - Vector1.y * 0.0894841775 - Vector1.z * 1.291485548)
	local ScaledVec: vector = Vec * Vec * Vec
	local X: number = ScaledVec.x
	local Y: number = ScaledVec.y
	local Z: number = ScaledVec.z
	
	return (vector.create(X * 4.0767416621 - Y * 3.3077115913 + Z * 0.2309699292, X * -1.2684380046 + Y * 2.6097574011 - Z * 0.3413193965, X * -0.0041960863 - Y * 0.7034186147 + Z * 1.707614701))
end

return {
	fromColor3 = function(p1): vector --[[ Line: 38 ]]
		local Vec = vector.create(p1.R, p1.G, p1.B)
		local DotProductPower = vector.dot(Vec, vector.create(0.4122214615345001, 0.5363325476646423, 0.05144599452614784)) ^ 0.3333333333333333
		local DotProductPower1 = vector.dot(Vec, vector.create(0.21190349757671356, 0.6806995272636414, 0.10739696025848389)) ^ 0.3333333333333333
		local DotProductPower2 = vector.dot(Vec, vector.create(0.08830246329307556, 0.2817188501358032, 0.6299787163734436)) ^ 0.3333333333333333
		
		return (vector.create(DotProductPower * 0.2104542553 + DotProductPower1 * 0.793617785 - DotProductPower2 * 0.0040720468, DotProductPower * 1.9779984951 - DotProductPower1 * 2.428592205 + DotProductPower2 * 0.4505937099, DotProductPower * 0.0259040371 + DotProductPower1 * 0.7827717662 - DotProductPower2 * 0.808675766))
	end,
	toColor3 = function(Vector1): Color3 --[[ Line: 42 ]]
		-- upvalues: toSrgb (copy)
		local Srgb = toSrgb(Vector1)
		
		return Color3.new(Srgb.x, Srgb.y, Srgb.z)
	end,
	lerp = function(p1, p2, p3): Color3 --[[ Line: 47 ]]
		-- upvalues: toSrgb (copy)
		local Vec = vector.create(p1.R, p1.G, p1.B)
		local DotProductPower = vector.dot(Vec, vector.create(0.4122214615345001, 0.5363325476646423, 0.05144599452614784)) ^ 0.3333333333333333
		local DotProductPower1 = vector.dot(Vec, vector.create(0.21190349757671356, 0.6806995272636414, 0.10739696025848389)) ^ 0.3333333333333333
		local DotProductPower2 = vector.dot(Vec, vector.create(0.08830246329307556, 0.2817188501358032, 0.6299787163734436)) ^ 0.3333333333333333
		local Vec1 = vector.create(DotProductPower * 0.2104542553 + DotProductPower1 * 0.793617785 - DotProductPower2 * 0.0040720468, DotProductPower * 1.9779984951 - DotProductPower1 * 2.428592205 + DotProductPower2 * 0.4505937099, DotProductPower * 0.0259040371 + DotProductPower1 * 0.7827717662 - DotProductPower2 * 0.808675766)
		local Vec11 = vector.create(p2.R, p2.G, p2.B)
		local DotProductPower3 = vector.dot(Vec11, vector.create(0.4122214615345001, 0.5363325476646423, 0.05144599452614784)) ^ 0.3333333333333333
		local DotProductPower31 = vector.dot(Vec11, vector.create(0.21190349757671356, 0.6806995272636414, 0.10739696025848389)) ^ 0.3333333333333333
		local DotProductPower4 = vector.dot(Vec11, vector.create(0.08830246329307556, 0.2817188501358032, 0.6299787163734436)) ^ 0.3333333333333333
		local ClampResult = vector.clamp(toSrgb((vector.lerp(Vec1, vector.create(DotProductPower3 * 0.2104542553 + DotProductPower31 * 0.793617785 - DotProductPower4 * 0.0040720468, DotProductPower3 * 1.9779984951 - DotProductPower31 * 2.428592205 + DotProductPower4 * 0.4505937099, DotProductPower3 * 0.0259040371 + DotProductPower31 * 0.7827717662 - DotProductPower4 * 0.808675766), p3))), vector.create(0, 0, 0), vector.create(1, 1, 1))
		
		return Color3.new(ClampResult.x, ClampResult.y, ClampResult.z)
	end
}