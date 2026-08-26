local t = {
	fromColor3 = function(p1)
		local vec = vector.create(p1.R, p1.G, p1.B)
		local var1 = vector.dot(vec, Vector3.new(0.412221461535, 0.536332547665, 0.051445994526)) ^ 0.333333333333
		local var2 = vector.dot(vec, Vector3.new(0.211903497577, 0.680699527264, 0.107396960258)) ^ 0.333333333333
		local var3 = vector.dot(vec, Vector3.new(0.088302463293, 0.281718850136, 0.629978716373)) ^ 0.333333333333
		
		return vector.create(var1 * 0.2104542553 + var2 * 0.793617785 - var3 * 0.0040720468, var1 * 1.9779984951 - var2 * 2.428592205 + var3 * 0.4505937099, var1 * 0.0259040371 + var2 * 0.7827717662 - var3 * 0.808675766)
	end
}

local function _(p1)
	local var1 = vector.dot(p1, Vector3.new(0.412221461535, 0.536332547665, 0.051445994526)) ^ 0.333333333333
	local var2 = vector.dot(p1, Vector3.new(0.211903497577, 0.680699527264, 0.107396960258)) ^ 0.333333333333
	local var3 = vector.dot(p1, Vector3.new(0.088302463293, 0.281718850136, 0.629978716373)) ^ 0.333333333333
	
	return vector.create(var1 * 0.2104542553 + var2 * 0.793617785 - var3 * 0.0040720468, var1 * 1.9779984951 - var2 * 2.428592205 + var3 * 0.4505937099, var1 * 0.0259040371 + var2 * 0.7827717662 - var3 * 0.808675766)
end

local function toSrgb(p1)
	local vec = vector.create(p1.x + p1.y * 0.3963377774 + p1.z * 0.2158037573, p1.x - p1.y * 0.1055613458 - p1.z * 0.0638541728, p1.x - p1.y * 0.0894841775 - p1.z * 1.291485548)
	vec = vec * vec * vec
	local x = vec.x
	local y = vec.y
	local z = vec.z
	
	return vector.create(x * 4.0767416621 - y * 3.3077115913 + z * 0.2309699292, x * -1.2684380046 + y * 2.6097574011 - z * 0.3413193965, x * -0.0041960863 - y * 0.7034186147 + z * 1.707614701)
end

function t.toColor3(p1)
	-- upvalues: toSrgb (ref)
	local var1 = toSrgb(p1)
	
	return Color3.new(var1.x, var1.y, var1.z)
end

function t.lerp(startValue, endValue, alpha)
	-- upvalues: toSrgb (ref)
	local vec = vector.create(startValue.R, startValue.G, startValue.B)
	local var1 = vector.dot(vec, Vector3.new(0.412221461535, 0.536332547665, 0.051445994526)) ^ 0.333333333333
	local var2 = vector.dot(vec, Vector3.new(0.211903497577, 0.680699527264, 0.107396960258)) ^ 0.333333333333
	local var3 = vector.dot(vec, Vector3.new(0.088302463293, 0.281718850136, 0.629978716373)) ^ 0.333333333333
	local vec_1 = vector.create(var1 * 0.2104542553 + var2 * 0.793617785 - var3 * 0.0040720468, var1 * 1.9779984951 - var2 * 2.428592205 + var3 * 0.4505937099, var1 * 0.0259040371 + var2 * 0.7827717662 - var3 * 0.808675766)
	local vec_2 = vector.create(endValue.R, endValue.G, endValue.B)
	local var4 = vector.dot(vec_2, Vector3.new(0.412221461535, 0.536332547665, 0.051445994526)) ^ 0.333333333333
	local var5 = vector.dot(vec_2, Vector3.new(0.211903497577, 0.680699527264, 0.107396960258)) ^ 0.333333333333
	local var6 = vector.dot(vec_2, Vector3.new(0.088302463293, 0.281718850136, 0.629978716373)) ^ 0.333333333333
	var4 = vector.clamp(toSrgb(vector.lerp(vec_1, vector.create(var4 * 0.2104542553 + var5 * 0.793617785 - var6 * 0.0040720468, var4 * 1.9779984951 - var5 * 2.428592205 + var6 * 0.4505937099, var4 * 0.0259040371 + var5 * 0.7827717662 - var6 * 0.808675766), alpha)), Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
	
	return Color3.new(var4.x, var4.y, var4.z)
end

return t