local _ = require("./engine")

local function quaternionFromRotation(Entry)
	local Entry1: number = Entry[1]
	local Entry2 = Entry[2]
	local Entry3 = Entry[3]
	local Entry4 = Entry[4]
	local Entry5: number = Entry[5]
	local Entry6 = Entry[6]
	local Entry7 = Entry[7]
	local Entry8 = Entry[8]
	local Entry9: number = Entry[9]
	local NewEntry = Entry1 + Entry5 + Entry9
	
	if NewEntry > 0 then
		local ScaledSquareRoot = math.sqrt(NewEntry + 1) * 2
		
		return (Entry8 - Entry6) / ScaledSquareRoot, (Entry3 - Entry7) / ScaledSquareRoot, (Entry4 - Entry2) / ScaledSquareRoot, ScaledSquareRoot / 4
	elseif Entry5 < Entry1 and Entry9 < Entry1 then
		local ScaledSquareRoot = math.sqrt(Entry1 + 1 - Entry5 - Entry9) * 2
		
		return ScaledSquareRoot / 4, (Entry2 + Entry4) / ScaledSquareRoot, (Entry3 + Entry7) / ScaledSquareRoot, (Entry8 - Entry6) / ScaledSquareRoot
	elseif Entry9 < Entry5 then
		local ScaledSquareRoot = math.sqrt(Entry5 + 1 - Entry1 - Entry9) * 2
		
		return (Entry2 + Entry4) / ScaledSquareRoot, ScaledSquareRoot / 4, (Entry6 + Entry8) / ScaledSquareRoot, (Entry3 - Entry7) / ScaledSquareRoot
	else
		local ScaledSquareRoot = math.sqrt(Entry9 + 1 - Entry1 - Entry5) * 2
		
		return (Entry3 + Entry7) / ScaledSquareRoot, (Entry6 + Entry8) / ScaledSquareRoot, ScaledSquareRoot / 4, (Entry4 - Entry2) / ScaledSquareRoot
	end
end

local function rotationFromQuaternion(p1, p2, p3, p4)
	return {
		1 - (p2 * p2 + p3 * p3) * 2, (p1 * p2 - p3 * p4) * 2, (p1 * p3 + p2 * p4) * 2,
		(p1 * p2 + p3 * p4) * 2, 1 - (p1 * p1 + p3 * p3) * 2, (p2 * p3 - p1 * p4) * 2,
		(p1 * p3 - p2 * p4) * 2, (p2 * p3 + p1 * p4) * 2, 1 - (p1 * p1 + p2 * p2) * 2
	}
end

return {
	create = function(p1)
		-- upvalues: quaternionFromRotation (copy), rotationFromQuaternion (copy)
		local Datatypes = p1.datatypes
		local t = {}
		local Vector2Function = Datatypes.Vector2
		
		if Vector2Function ~= nil then
			t.Vector2 = {
				arity = 2,
				encode = function(Vector, Entry)
					local Y = Vector.Y
					Entry[1] = Vector.X
					Entry[2] = Y
				end,
				decode = function(Entry)
					-- upvalues: Vector2Function (copy)
					return Vector2Function(Entry[1], Entry[2])
				end
			}
		end
		local Vector3Function = Datatypes.Vector3
		
		if Vector3Function ~= nil then
			t.Vector3 = {
				arity = 3,
				encode = function(Vector, Entry)
					local Y = Vector.Y
					local Z = Vector.Z
					Entry[1] = Vector.X
					Entry[2] = Y
					Entry[3] = Z
				end,
				decode = function(Entry)
					-- upvalues: Vector3Function (copy)
					return Vector3Function(Entry[1], Entry[2], Entry[3])
				end
			}
		end
		local Color3Function = Datatypes.Color3
		
		if Color3Function ~= nil then
			t.Color3 = {
				arity = 3,
				encode = function(p2, Entry)
					local G = p2.G
					local B = p2.B
					Entry[1] = p2.R
					Entry[2] = G
					Entry[3] = B
				end,
				decode = function(Entry)
					-- upvalues: Color3Function (copy)
					return Color3Function(Entry[1], Entry[2], Entry[3])
				end,
				normalise = function(Entry)
					Entry[1] = math.clamp(Entry[1], 0, 1)
					Entry[2] = math.clamp(Entry[2], 0, 1)
					Entry[3] = math.clamp(Entry[3], 0, 1)
				end
			}
		end
		local UDimFunction = Datatypes.UDim
		
		if UDimFunction ~= nil then
			t.UDim = {
				arity = 2,
				encode = function(p2, Entry)
					local Offset = p2.Offset
					Entry[1] = p2.Scale
					Entry[2] = Offset
				end,
				decode = function(Entry)
					-- upvalues: UDimFunction (copy)
					return UDimFunction(Entry[1], (math.round(Entry[2])))
				end
			}
		end
		local UDim2Function = Datatypes.UDim2
		
		if UDim2Function ~= nil then
			t.UDim2 = {
				arity = 4,
				encode = function(Vector, Entry)
					local Offset = Vector.X.Offset
					Entry[1] = Vector.X.Scale
					Entry[2] = Offset
					local Offset1 = Vector.Y.Offset
					Entry[3] = Vector.Y.Scale
					Entry[4] = Offset1
				end,
				decode = function(Entry)
					-- upvalues: UDim2Function (copy)
					return UDim2Function(Entry[1], math.round(Entry[2]), Entry[3], (math.round(Entry[4])))
				end
			}
		end
		local CFrameFunction = Datatypes.CFrame
		local ReadCFrameFunction = p1.readCFrame
		
		if CFrameFunction ~= nil and ReadCFrameFunction ~= nil then
			t.CFrame = {
				arity = 7,
				encode = function(p2, Entry)
					-- upvalues: ReadCFrameFunction (copy), quaternionFromRotation (upval)
					local ReadCFrameResult4
					Entry[1], Entry[2], Entry[3], ReadCFrameResult4 = ReadCFrameFunction(p2)
					local QuaternionFromRotationResult, QuaternionFromRotationResult2, QuaternionFromRotationResult3, QuaternionFromRotationResult4 = quaternionFromRotation(ReadCFrameResult4)
					
					if Entry[4] ~= nil and Entry[4] * QuaternionFromRotationResult + Entry[5] * QuaternionFromRotationResult2 + Entry[6] * QuaternionFromRotationResult3 + Entry[7] * QuaternionFromRotationResult4 < 0 then
						QuaternionFromRotationResult = -QuaternionFromRotationResult
						QuaternionFromRotationResult2 = -QuaternionFromRotationResult2
						QuaternionFromRotationResult3 = -QuaternionFromRotationResult3
						QuaternionFromRotationResult4 = -QuaternionFromRotationResult4
					end
					Entry[4] = QuaternionFromRotationResult
					Entry[5] = QuaternionFromRotationResult2
					Entry[6] = QuaternionFromRotationResult3
					Entry[7] = QuaternionFromRotationResult4
				end,
				normalise = function(Entry)
					local SquareRoot = math.sqrt(Entry[4] * Entry[4] + Entry[5] * Entry[5] + Entry[6] * Entry[6] + Entry[7] * Entry[7])
					
					if SquareRoot < 0.000000001 then
						Entry[4] = 0
						Entry[5] = 0
						Entry[6] = 0
						Entry[7] = 1
						
						return
					else
						local EntryRatio = Entry[5] / SquareRoot
						local EntryRatio1 = Entry[6] / SquareRoot
						local EntryRatio2 = Entry[7] / SquareRoot
						Entry[4] /= SquareRoot
						Entry[5] = EntryRatio
						Entry[6] = EntryRatio1
						Entry[7] = EntryRatio2
					end
				end,
				decode = function(Entry)
					-- upvalues: CFrameFunction (copy), rotationFromQuaternion (upval)
					return CFrameFunction({ X = Entry[1], Y = Entry[2], Z = Entry[3] }, (rotationFromQuaternion(Entry[4], Entry[5], Entry[6], Entry[7])))
				end
			}
		end
		return t
	end,
	quaternionFromRotation = quaternionFromRotation,
	rotationFromQuaternion = rotationFromQuaternion
}