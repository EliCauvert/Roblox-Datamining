local function cross(Vector, Vector1)
	return {
		X = Vector.Y * Vector1.Z - Vector.Z * Vector1.Y,
		Y = Vector.Z * Vector1.X - Vector.X * Vector1.Z,
		Z = Vector.X * Vector1.Y - Vector.Y * Vector1.X
	}
end

local function transform(Entry, Vector)
	return {
		X = Entry[4] * Vector.X + Entry[5] * Vector.Y + Entry[6] * Vector.Z,
		Y = Entry[7] * Vector.X + Entry[8] * Vector.Y + Entry[9] * Vector.Z,
		Z = Entry[10] * Vector.X + Entry[11] * Vector.Y + Entry[12] * Vector.Z
	}
end

return {
	add = function(Vector, Vector1)
		return { X = Vector.X + Vector1.X, Y = Vector.Y + Vector1.Y }
	end,
	sub = function(Vector, Vector1)
		return { X = Vector.X - Vector1.X, Y = Vector.Y - Vector1.Y }
	end,
	scale = function(Vector, p1)
		return { X = Vector.X * p1, Y = Vector.Y * p1 }
	end,
	length = function(Vector): number
		return (math.sqrt(Vector.X * Vector.X + Vector.Y * Vector.Y))
	end,
	vadd = function(Vector, Vector1)
		return {
			X = Vector.X + Vector1.X,
			Y = Vector.Y + Vector1.Y,
			Z = Vector.Z + Vector1.Z
		}
	end,
	vsub = function(Vector, Vector1)
		return {
			X = Vector.X - Vector1.X,
			Y = Vector.Y - Vector1.Y,
			Z = Vector.Z - Vector1.Z
		}
	end,
	vscale = function(Vector, p1)
		return {
			X = Vector.X * p1,
			Y = Vector.Y * p1,
			Z = Vector.Z * p1
		}
	end,
	dot = function(Vector, Vector1)
		return Vector.X * Vector1.X + Vector.Y * Vector1.Y + Vector.Z * Vector1.Z
	end,
	magnitude = function(Vector): number
		return (math.sqrt(Vector.X * Vector.X + Vector.Y * Vector.Y + Vector.Z * Vector.Z))
	end,
	unit = function(Vector)
		local SquareRoot = math.sqrt(Vector.X * Vector.X + Vector.Y * Vector.Y + Vector.Z * Vector.Z)
		local v1: number = if SquareRoot > 0 then 1 / SquareRoot else 0
		
		return { X = Vector.X * v1, Y = Vector.Y * v1, Z = Vector.Z * v1 }
	end,
	frame = function(Vector)
		return {
			Vector.X, Vector.Y, Vector.Z, 1, 0, 0, 0, 1, 0, 0, 0, 1
		}
	end,
	transform = transform,
	multiply = function(Entry1, Entry)
		-- upvalues: transform (copy)
		local TransformResult = transform(Entry1, { X = Entry[1], Y = Entry[2], Z = Entry[3] })
		local config = {
			X = Entry1[1] + TransformResult.X,
			Y = Entry1[2] + TransformResult.Y,
			Z = Entry1[3] + TransformResult.Z
		}
		local list = {
			config.X, config.Y, config.Z, 1, 0, 0, 0, 1, 0, 0, 0, 1
		}
		
		for i = 0, 2 do
			for i1 = 0, 2 do
				list[i * 3 + 4 + i1] = 0 + Entry1[i * 3 + 4 + 0] * Entry[i1 + 4] + Entry1[i * 3 + 4 + 1] * Entry[i1 + 7] + Entry1[i * 3 + 4 + 2] * Entry[i1 + 10]
			end
		end
		return list
	end,
	rotation = function(Angle: number, Angle1: number, Angle2: number)
		local Cosine = math.cos(Angle)
		local Sine = math.sin(Angle)
		local Cosine1 = math.cos(Angle1)
		local Sine1 = math.sin(Angle1)
		local Cosine2 = math.cos(Angle2)
		local Sine2 = math.sin(Angle2)
		
		return {
			0, 0, 0, Cosine1 * Cosine2 + Sine1 * Sine * Sine2,
			-Cosine1 * Sine2 + Sine1 * Sine * Cosine2, Sine1 * Cosine, Cosine * Sine2,
			Cosine * Cosine2, -Sine, -Sine1 * Cosine2 + Cosine1 * Sine * Sine2,
			Sine1 * Sine2 + Cosine1 * Sine * Cosine2, Cosine1 * Cosine
		}
	end,
	lookAt = function(Vector, Vector1)
		-- upvalues: cross (copy)
		local Vector2 = {
			X = Vector.X - Vector1.X,
			Y = Vector.Y - Vector1.Y,
			Z = Vector.Z - Vector1.Z
		}
		local SquareRoot = math.sqrt(Vector2.X * Vector2.X + Vector2.Y * Vector2.Y + Vector2.Z * Vector2.Z)
		local v1: number = if SquareRoot > 0 then 1 / SquareRoot else 0
		local Vector3 = {
			X = Vector2.X * v1,
			Y = Vector2.Y * v1,
			Z = Vector2.Z * v1
		}
		local CrossResult = cross({ X = 0, Y = 1, Z = 0 }, Vector3)
		local SquareRoot1 = math.sqrt(CrossResult.X * CrossResult.X + CrossResult.Y * CrossResult.Y + CrossResult.Z * CrossResult.Z)
		local v2: number = if SquareRoot1 > 0 then 1 / SquareRoot1 else 0
		local Vector4 = {
			X = CrossResult.X * v2,
			Y = CrossResult.Y * v2,
			Z = CrossResult.Z * v2
		}
		
		if math.sqrt(Vector4.X * Vector4.X + Vector4.Y * Vector4.Y + Vector4.Z * Vector4.Z) < 0.000001 then
			local CrossResult1 = cross({ X = 0, Y = 0, Z = 1 }, Vector3)
			local SquareRoot2 = math.sqrt(CrossResult1.X * CrossResult1.X + CrossResult1.Y * CrossResult1.Y + CrossResult1.Z * CrossResult1.Z)
			local v3: number = if SquareRoot2 > 0 then 1 / SquareRoot2 else 0
			Vector4 = {
				X = CrossResult1.X * v3,
				Y = CrossResult1.Y * v3,
				Z = CrossResult1.Z * v3
			}
		end
		local CrossResult2 = cross(Vector3, Vector4)
		
		return {
			Vector.X, Vector.Y, Vector.Z, Vector4.X, CrossResult2.X, Vector3.X, Vector4.Y,
			CrossResult2.Y, Vector3.Y, Vector4.Z, CrossResult2.Z, Vector3.Z
		}
	end
}