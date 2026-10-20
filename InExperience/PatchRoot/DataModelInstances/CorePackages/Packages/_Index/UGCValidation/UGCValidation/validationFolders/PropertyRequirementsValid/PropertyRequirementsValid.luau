local Parent = script.Parent.Parent.Parent
local CryoModule = require(Parent.Parent.Cryo)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ValueToStringModule = require(Parent.util.valueToString)

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

local function doesPropertyMatchExpectations(Vector, Vector1, ComparisonMethod)
	-- upvalues: CryoModule (copy), ConstantsModule (copy), doesPropertyMatchExpectations (copy), comparitorMethodImpl (copy)
	if Vector1 == CryoModule.None then
		return Vector == nil
	end
	if typeof(Vector1) ~= "table" or ComparisonMethod ~= ConstantsModule.COMPARISON_METHODS.FOUND_IN then
		return typeof(Vector) == typeof(Vector1) and (if typeof(Vector1) == "number" then comparitorMethodImpl(Vector, Vector1, ComparisonMethod) elseif typeof(Vector1) == "Vector3" then comparitorMethodImpl(Vector.X, Vector1.X, ComparisonMethod) and (comparitorMethodImpl(Vector.Y, Vector1.Y, ComparisonMethod) and comparitorMethodImpl(Vector.Z, Vector1.Z, ComparisonMethod)) elseif typeof(Vector1) == "Color3" then comparitorMethodImpl(Vector.R, Vector1.R, ComparisonMethod) and (comparitorMethodImpl(Vector.G, Vector1.G, ComparisonMethod) and comparitorMethodImpl(Vector.B, Vector1.B, ComparisonMethod)) else Vector == Vector1)
	end
	local v1 = false
	
	for _, value in Vector1 do
		v1 = v1 or doesPropertyMatchExpectations(Vector, value, ConstantsModule.COMPARISON_METHODS.EXACT_EQ)
	end
	return v1
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

local function getAllActiveTestsOnProperty(Value, PropertyName, CF, List)
	-- upvalues: ConstantsModule (copy), getAllActiveTestsOnProperty (copy)
	if typeof(List) ~= "table" then
		return {
			{
				PropertyName,
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
			table.insert(List2, {
				PropertyName,
				CF,
				List[cOMPARISONMETHOD],
				cOMPARISONMETHOD
			})
		end
	end
	local Count = 1
	while List[Count] ~= nil do
		local AllActiveTestsOnProperty = getAllActiveTestsOnProperty(Value, PropertyName, CF, List[Count])
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
				value1[1] = PropertyName .. "." .. value1[1]
				table.insert(List2, value1)
			end
		end
	end
	return List2
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.MAKEUP
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadEnum
	},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: ConstantsModule (copy), ErrorSourceStringsModule (copy), getAllActiveTestsOnProperty (copy), doesPropertyMatchExpectations (copy), ValueToStringModule (copy)
		local RootInstance = p2.rootInstance
		local AssetType = p2.uploadEnum.assetType
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		for _, descendant in Descendants do
			for ClassName, pROPERTy in ConstantsModule.PROPERTIES do
				if descendant:IsA(ClassName) then
					for PropertyName, value in pROPERTy do
						local Success, Result = pcall(function()
							-- upvalues: descendant (copy), PropertyName (copy)
							return descendant[PropertyName]
						end)
						
						if not Success then
							p1:fail(ErrorSourceStringsModule.Keys.PropertyNotFound, {
								PropertyName = PropertyName,
								InstancePath = descendant:GetFullName()
							})
							continue
						end
						for _, value1 in getAllActiveTestsOnProperty(AssetType, PropertyName, Result, value) do
							local Unpacked, Unpacked2, Unpacked3, Unpacked4 = table.unpack(value1)
							
							if not doesPropertyMatchExpectations(Unpacked2, Unpacked3, Unpacked4) then
								p1:fail(ErrorSourceStringsModule.Keys.PropertyValueInvalid, {
									PropertyName = Unpacked,
									InstancePath = descendant:GetFullName(),
									ComparisonMethod = Unpacked4,
									ExpectedValue = ValueToStringModule(Unpacked3)
								})
							end
						end
					end
				end
			end
		end
	end
}