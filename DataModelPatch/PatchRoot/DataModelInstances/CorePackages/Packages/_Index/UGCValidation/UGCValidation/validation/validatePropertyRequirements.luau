local Parent = script.Parent.Parent
local CryoModule = require(Parent.Parent.Cryo)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValueToStringModule = require(Parent.util.valueToString)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetFFlagUGCValidationEyebrowEyelashSupportModule = require(Parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)

local function comparitorMethodImpl(B, B1, FOUNDIN): boolean?
	-- upvalues: ConstantsModule (copy)
	if FOUNDIN == ConstantsModule.COMPARISON_METHODS.SMALLER then
		return B < B1
	elseif FOUNDIN == ConstantsModule.COMPARISON_METHODS.SMALLER_EQ then
		return B <= B1
	elseif FOUNDIN == ConstantsModule.COMPARISON_METHODS.FUZZY_EQ then
		return math.abs(B - B1) <= 0.00001
	elseif FOUNDIN == ConstantsModule.COMPARISON_METHODS.EXACT_EQ then
		return B == B1
	elseif FOUNDIN == ConstantsModule.COMPARISON_METHODS.GREATER_EQ then
		return B1 <= B
	elseif FOUNDIN == ConstantsModule.COMPARISON_METHODS.GREATER then
		return B1 < B
	else
		error("Invalid comparitor method: " .. FOUNDIN)
	end
end

local function doesPropertyMatchExpectations(Vector, Vector1, EXACTEQ)
	-- upvalues: CryoModule (copy), GetFFlagUGCValidationEyebrowEyelashSupportModule (copy), ConstantsModule (copy), doesPropertyMatchExpectations (copy), comparitorMethodImpl (copy)
	if Vector1 == CryoModule.None then
		return Vector == nil
	end
	if not GetFFlagUGCValidationEyebrowEyelashSupportModule() or typeof(Vector1) ~= "table" or EXACTEQ ~= ConstantsModule.COMPARISON_METHODS.FOUND_IN then
		return typeof(Vector) == typeof(Vector1) and (if typeof(Vector1) == "number" then comparitorMethodImpl(Vector, Vector1, EXACTEQ) elseif typeof(Vector1) == "Vector3" then comparitorMethodImpl(Vector.X, Vector1.X, EXACTEQ) and (comparitorMethodImpl(Vector.Y, Vector1.Y, EXACTEQ) and comparitorMethodImpl(Vector.Z, Vector1.Z, EXACTEQ)) elseif typeof(Vector1) == "Color3" then comparitorMethodImpl(Vector.R, Vector1.R, EXACTEQ) and (comparitorMethodImpl(Vector.G, Vector1.G, EXACTEQ) and comparitorMethodImpl(Vector.B, Vector1.B, EXACTEQ)) else Vector == Vector1)
	end
	local v1 = false
	
	for _, value in Vector1 do
		v1 = v1 or doesPropertyMatchExpectations(Vector, value, ConstantsModule.COMPARISON_METHODS.EXACT_EQ)
	end
	return v1
end

local function validatePropertyValue(p1, Object, p2, Vector, Vector1, p3)
	-- upvalues: doesPropertyMatchExpectations (copy), AnalyticsModule (copy), ValueToStringModule (copy)
	if doesPropertyMatchExpectations(Vector, Vector1, p3) then
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateProperties_PropertyMismatch, nil, p1)
		
		return false, {
			string.format("Property %s of %s is invalid. Expected to be %s %s.", p2, Object:GetFullName(), p3, ValueToStringModule(Vector1))
		}
	end
end

local function _(p1, CF)
	if typeof(CF) == "CFrame" and p1 == "PositionMagnitude" then
		return true, CF.Position.Magnitude
	elseif typeof(CF) == "CFrame" and p1 == "Orientation" then
		return true, (Vector3.new(CF:ToOrientation()))
	elseif typeof(CF) == "CFrame" and p1 == "Position" then
		return true, CF.Position
	else
		return false
	end
end

local function getAllActiveTestsOnProperty(Value, Text, CF, List)
	-- upvalues: ConstantsModule (copy), getAllActiveTestsOnProperty (copy)
	if typeof(List) ~= "table" then
		return {
			{
				Text,
				CF,
				List,
				ConstantsModule.COMPARISON_METHODS.FUZZY_EQ
			}
		}
	end
	for i, List1 in List do
		if i == ConstantsModule.INCLUSION_METHODS.INCLUSION_LIST then
			if table.find(List1, Value) == nil then
				return {}
			end
		elseif i == ConstantsModule.INCLUSION_METHODS.EXCLUSION_LIST and table.find(List1, Value) ~= nil then
			return {}
		end
	end
	local List2 = {}
	
	for _, cOMPARISONMETHOD in ConstantsModule.COMPARISON_METHODS do
		if List[cOMPARISONMETHOD] ~= nil then
			table.insert(List2, { Text, CF, List[cOMPARISONMETHOD], cOMPARISONMETHOD })
		end
	end
	local Count = 1
	while List[Count] ~= nil do
		local AllActiveTestsOnProperty = getAllActiveTestsOnProperty(Value, Text, CF, List[Count])
		table.move(AllActiveTestsOnProperty, 1, #AllActiveTestsOnProperty, #List2 + 1, List2)
		Count += 1
	end
	for i1, value in List do
		local Flag = nil
		local Magnitude = nil
		if typeof(CF) == "CFrame" and i1 == "PositionMagnitude" then
			Flag = true
			Magnitude = CF.Position.Magnitude
		elseif typeof(CF) == "CFrame" and i1 == "Orientation" then
			Flag = true
			Magnitude = Vector3.new(CF:ToOrientation())
		elseif typeof(CF) == "CFrame" and i1 == "Position" then
			Flag = true
			Magnitude = CF.Position
		else
			Flag = false
			Magnitude = nil
		end
		if Flag then
			for _, value1 in getAllActiveTestsOnProperty(Value, i1, Magnitude, value) do
				value1[1] = Text .. "." .. value1[1]
				table.insert(List2, value1)
			end
		end
	end
	return List2
end

return function(Object, p1, p2)
	-- upvalues: FailureReasonsAccumulatorModule (copy), ConstantsModule (copy), AnalyticsModule (copy), getAllActiveTestsOnProperty (copy), validatePropertyValue (copy)
	if p1 == nil then
		p1 = p2.assetTypeEnum
	end
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for _, descendant in Descendants do
		for ClassName, pROPERTy in ConstantsModule.PROPERTIES do
			if descendant:IsA(ClassName) then
				for i, value in pROPERTy do
					local Success, Result = pcall(function()
						-- upvalues: descendant (copy), i (copy)
						return descendant[i]
					end)
					
					if not Success then
						AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateProperties_PropertyDoesNotExist, nil, p2)
						NewFailureReasonsAccumulator:updateReasons(false, {
							string.format("Property '%s' not found in '%s'", i, descendant:GetFullName())
						})
						continue
					end
					for _, value1 in getAllActiveTestsOnProperty(p1, i, Result, value) do
						local Unpacked, Unpacked2, Unpacked3, Unpacked4 = table.unpack(value1)
						NewFailureReasonsAccumulator:updateReasons(validatePropertyValue(p2, descendant, Unpacked, Unpacked2, Unpacked3, Unpacked4))
					end
				end
			end
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end