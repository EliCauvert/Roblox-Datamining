local parent = script.Parent.Parent.Parent
local cryoModule = require(parent.Parent.Cryo)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local valueToStringModule = require(parent.util.valueToString)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.MAKEUP
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum
	},
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {}
}

local function comparitorMethodImpl(p0, p1, p2)
	-- upvalues: constantsModule (ref)
	if p2 == constantsModule.COMPARISON_METHODS.SMALLER then
		return p0 < p1
	elseif p2 == constantsModule.COMPARISON_METHODS.SMALLER_EQ then
		return p0 <= p1
	elseif p2 == constantsModule.COMPARISON_METHODS.FUZZY_EQ then
		return math.abs(p0 - p1) <= 0.00001
	elseif p2 == constantsModule.COMPARISON_METHODS.EXACT_EQ then
		return p0 == p1
	elseif p2 == constantsModule.COMPARISON_METHODS.GREATER_EQ then
		return p1 <= p0
	elseif p2 == constantsModule.COMPARISON_METHODS.GREATER then
		return p1 < p0
	end
	error("Invalid comparitor method: " .. p2)
end

local function doesPropertyMatchExpectations(p3, p4, p5)
	-- upvalues: cryoModule (ref), getFFlagUGCValidationEyebrowEyelashSupportModule (ref), constantsModule (ref), doesPropertyMatchExpectations (ref), comparitorMethodImpl (ref)
	if p4 == cryoModule.None then
		return p3 == nil
	elseif getFFlagUGCValidationEyebrowEyelashSupportModule() and typeof(p4) == "table" and p5 == constantsModule.COMPARISON_METHODS.FOUND_IN then
		local var10 = false
		
		for i, v in p4 do
			var10 = var10 or doesPropertyMatchExpectations(p3, v, constantsModule.COMPARISON_METHODS.EXACT_EQ)
		end
		return var10
	else
		return typeof(p3) == typeof(p4) and (if typeof(p4) == "number" then comparitorMethodImpl(p3, p4, p5) elseif typeof(p4) == "Vector3" then comparitorMethodImpl(p3.X, p4.X, p5) and (comparitorMethodImpl(p3.Y, p4.Y, p5) and comparitorMethodImpl(p3.Z, p4.Z, p5)) elseif typeof(p4) == "Color3" then comparitorMethodImpl(p3.R, p4.R, p5) and (comparitorMethodImpl(p3.G, p4.G, p5) and comparitorMethodImpl(p3.B, p4.B, p5)) else p3 == p4)
	end
end

local function _(p6, p7)
	if typeof(p7) == "CFrame" and p6 == "PositionMagnitude" then
		return true, p7.Position.Magnitude
	elseif typeof(p7) == "CFrame" and p6 == "Orientation" then
		return true, Vector3.new(p7:ToOrientation())
	elseif typeof(p7) == "CFrame" and p6 == "Position" then
		return true, p7.Position
	end
	return false
end

local function getAllActiveTestsOnProperty(p8, p9, p10, p11)
	-- upvalues: constantsModule (ref), getAllActiveTestsOnProperty (ref)
	if typeof(p11) ~= "table" then
		return {
			{
				p9,
				p10,
				p11,
				constantsModule.COMPARISON_METHODS.FUZZY_EQ
			}
		}
	end
	for i, v in p11 do
		if i == constantsModule.INCLUSION_METHODS.INCLUSION_LIST then
			if table.find(v, p8) == nil then
				return {}
			end
		elseif i == constantsModule.INCLUSION_METHODS.EXCLUSION_LIST and table.find(v, p8) ~= nil then
			return {}
		end
	end
	local t = {}
	
	for v, v_1 in constantsModule.COMPARISON_METHODS do
		if p11[v_1] ~= nil then
			table.insert(t, { p9, p10, p11[v_1], v_1 })
		end
	end
	local var12 = 1
	while p11[var12] ~= nil do
		local var13 = getAllActiveTestsOnProperty(p8, p9, p10, p11[var12])
		table.move(var13, 1, #var13, #t + 1, t)
		var12 += 1
	end
	for i_2, v_2 in p11 do
		local var14, position
		if typeof(p10) == "CFrame" and i_2 == "PositionMagnitude" then
			var14 = true
			position = p10.Position.Magnitude
		elseif typeof(p10) == "CFrame" and i_2 == "Orientation" then
			var14 = true
			position = Vector3.new(p10:ToOrientation())
		elseif typeof(p10) == "CFrame" and i_2 == "Position" then
			var14 = true
			position = p10.Position
		else
			var14 = false
			position = nil
		end
		if var14 then
			for i_3, v_3 in getAllActiveTestsOnProperty(p8, i_2, position, v_2) do
				v_3[1] = p9 .. "." .. v_3[1]
				table.insert(t, v_3)
			end
		end
	end
	return t
end

function t.run(p12, p13)
	-- upvalues: constantsModule (ref), errorSourceStringsModule (ref), getAllActiveTestsOnProperty (ref), doesPropertyMatchExpectations (ref), valueToStringModule (ref)
	local rootInstance = p13.rootInstance
	local assetType = p13.uploadEnum.assetType
	local descendants = rootInstance:GetDescendants()
	table.insert(descendants, rootInstance)
	
	for i, v in descendants do
		for i_1, v_1 in constantsModule.PROPERTIES do
			if v:IsA(i_1) then
				for i_2, v_2 in v_1 do
					local ok, status = pcall(function()
						-- upvalues: v (ref), i_2 (ref)
						return v[i_2]
					end)
					
					if ok then
						for i_3, v_3 in getAllActiveTestsOnProperty(assetType, i_2, status, v_2) do
							local unpacked, unpacked_1, unpacked_2, unpacked_3 = table.unpack(v_3)
							
							if not doesPropertyMatchExpectations(unpacked_1, unpacked_2, unpacked_3) then
								p12:fail(errorSourceStringsModule.Keys.PropertyValueInvalid, {
									PropertyName = unpacked,
									InstancePath = v:GetFullName(),
									ComparisonMethod = unpacked_3,
									ExpectedValue = valueToStringModule(unpacked_2)
								})
							end
						end
					else
						p12:fail(errorSourceStringsModule.Keys.PropertyNotFound, { PropertyName = i_2, InstancePath = v:GetFullName() })
					end
				end
			end
		end
	end
end

return t