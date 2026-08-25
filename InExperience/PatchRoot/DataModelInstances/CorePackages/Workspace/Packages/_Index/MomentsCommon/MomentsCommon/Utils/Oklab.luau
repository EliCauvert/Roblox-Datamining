local t = {
	fromColor3 = function(p0)
		local vec = vector.create(p0.R, p0.G, p0.B)
		local var3 = vector.dot(vec, Vector3.new(0.412221461535, 0.536332547665, 0.051445994526)) ^ 0.333333333333
		local var4 = vector.dot(vec, Vector3.new(0.211903497577, 0.680699527264, 0.107396960258)) ^ 0.333333333333
		local var5 = vector.dot(vec, Vector3.new(0.088302463293, 0.281718850136, 0.629978716373)) ^ 0.333333333333
		
		return vector.create(var3 * 0.2104542553 + var4 * 0.793617785 - var5 * 0.0040720468, var3 * 1.9779984951 - var4 * 2.428592205 + var5 * 0.4505937099, var3 * 0.0259040371 + var4 * 0.7827717662 - var5 * 0.808675766)
	end
}

local function _(p1)
	local var6 = vector.dot(p1, Vector3.new(0.412221461535, 0.536332547665, 0.051445994526)) ^ 0.333333333333
	local var7 = vector.dot(p1, Vector3.new(0.211903497577, 0.680699527264, 0.107396960258)) ^ 0.333333333333
	local var8 = vector.dot(p1, Vector3.new(0.088302463293, 0.281718850136, 0.629978716373)) ^ 0.333333333333
	
	return vector.create(var6 * 0.2104542553 + var7 * 0.793617785 - var8 * 0.0040720468, var6 * 1.9779984951 - var7 * 2.428592205 + var8 * 0.4505937099, var6 * 0.0259040371 + var7 * 0.7827717662 - var8 * 0.808675766)
end

local function toSrgb(p2)
	local vec = vector.create(p2.x + p2.y * 0.3963377774 + p2.z * 0.2158037573, p2.x - p2.y * 0.1055613458 - p2.z * 0.0638541728, p2.x - p2.y * 0.0894841775 - p2.z * 1.291485548)
	vec = vec * vec * vec
	local x = vec.x
	local y = vec.y
	local z = vec.z
	
	return vector.create(x * 4.0767416621 - y * 3.3077115913 + z * 0.2309699292, x * -1.2684380046 + y * 2.6097574011 - z * 0.3413193965, x * -0.0041960863 - y * 0.7034186147 + z * 1.707614701)
end

function t.toColor3(p3)
	-- upvalues: toSrgb (ref)
	local var10 = toSrgb(p3)
	
	return Color3.new(var10.x, var10.y, var10.z)
end

function t.lerp(startValue, endValue, alpha)
	-- upvalues: toSrgb (ref)
	local vec = vector.create(startValue.R, startValue.G, startValue.B)
	local var12 = vector.dot(vec, Vector3.new(0.412221461535, 0.536332547665, 0.051445994526)) ^ 0.333333333333
	local var13 = vector.dot(vec, Vector3.new(0.211903497577, 0.680699527264, 0.107396960258)) ^ 0.333333333333
	local var14 = vector.dot(vec, Vector3.new(0.088302463293, 0.281718850136, 0.629978716373)) ^ 0.333333333333
	local vec_1 = vector.create(var12 * 0.2104542553 + var13 * 0.793617785 - var14 * 0.0040720468, var12 * 1.9779984951 - var13 * 2.428592205 + var14 * 0.4505937099, var12 * 0.0259040371 + var13 * 0.7827717662 - var14 * 0.808675766)
	local vec_2 = vector.create(endValue.R, endValue.G, endValue.B)
	local var17 = vector.dot(vec_2, Vector3.new(0.412221461535, 0.536332547665, 0.051445994526)) ^ 0.333333333333
	local var18 = vector.dot(vec_2, Vector3.new(0.211903497577, 0.680699527264, 0.107396960258)) ^ 0.333333333333
	local var19 = vector.dot(vec_2, Vector3.new(0.088302463293, 0.281718850136, 0.629978716373)) ^ 0.333333333333
	var17 = vector.clamp(toSrgb(vector.lerp(vec_1, vector.create(var17 * 0.2104542553 + var18 * 0.793617785 - var19 * 0.0040720468, var17 * 1.9779984951 - var18 * 2.428592205 + var19 * 0.4505937099, var17 * 0.0259040371 + var18 * 0.7827717662 - var19 * 0.808675766), alpha)), Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
	
	return Color3.new(var17.x, var17.y, var17.z)
end

return t