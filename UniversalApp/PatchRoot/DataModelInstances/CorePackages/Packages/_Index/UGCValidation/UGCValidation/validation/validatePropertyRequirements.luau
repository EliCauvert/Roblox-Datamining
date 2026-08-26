local parent = script.Parent.Parent
local cryoModule = require(parent.Parent.Cryo)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local valueToStringModule = require(parent.util.valueToString)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)

local function comparitorMethodImpl(p1, p2, p3)
	-- upvalues: constantsModule (ref)
	if p3 == constantsModule.COMPARISON_METHODS.SMALLER then
		return p1 < p2
	elseif p3 == constantsModule.COMPARISON_METHODS.SMALLER_EQ then
		return p1 <= p2
	elseif p3 == constantsModule.COMPARISON_METHODS.FUZZY_EQ then
		return math.abs(p1 - p2) <= 0.00001
	elseif p3 == constantsModule.COMPARISON_METHODS.EXACT_EQ then
		return p1 == p2
	elseif p3 == constantsModule.COMPARISON_METHODS.GREATER_EQ then
		return p2 <= p1
	elseif p3 == constantsModule.COMPARISON_METHODS.GREATER then
		return p2 < p1
	end
	error("Invalid comparitor method: " .. p2)
end

local function doesPropertyMatchExpectations(p1, p2, p3)
	-- upvalues: cryoModule (ref), getFFlagUGCValidationEyebrowEyelashSupportModule (ref), constantsModule (ref), doesPropertyMatchExpectations (ref), comparitorMethodImpl (ref)
	if p2 == cryoModule.None then
		return p1 == nil
	elseif getFFlagUGCValidationEyebrowEyelashSupportModule() and typeof(p2) == "table" and p3 == constantsModule.COMPARISON_METHODS.FOUND_IN then
		local var1 = false
		
		for i, v in p2 do
			var1 = var1 or doesPropertyMatchExpectations(p1, v, constantsModule.COMPARISON_METHODS.EXACT_EQ)
		end
		return var1
	else
		return typeof(p1) == typeof(p2) and (if typeof(p2) == "number" then comparitorMethodImpl(p1, p2, p3) elseif typeof(p2) == "Vector3" then comparitorMethodImpl(p1.X, p2.X, p3) and (comparitorMethodImpl(p1.Y, p2.Y, p3) and comparitorMethodImpl(p1.Z, p2.Z, p3)) elseif typeof(p2) == "Color3" then comparitorMethodImpl(p1.R, p2.R, p3) and (comparitorMethodImpl(p1.G, p2.G, p3) and comparitorMethodImpl(p1.B, p2.B, p3)) else p1 == p2)
	end
end

local function validatePropertyValue(p4, p5, p6, p7, p8, p9)
	-- upvalues: doesPropertyMatchExpectations (ref), analyticsModule (ref), valueToStringModule (ref)
	if doesPropertyMatchExpectations(p7, p8, p9) then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateProperties_PropertyMismatch, nil, p4)
	
	return false, {
		string.format("Property %s of %s is invalid. Expected to be %s %s.", p6, p5:GetFullName(), p9, valueToStringModule(p8))
	}
end

local function _(p4, p5)
	if typeof(p5) == "CFrame" and p4 == "PositionMagnitude" then
		return true, p5.Position.Magnitude
	elseif typeof(p5) == "CFrame" and p4 == "Orientation" then
		return true, Vector3.new(p5:ToOrientation())
	elseif typeof(p5) == "CFrame" and p4 == "Position" then
		return true, p5.Position
	end
	return false
end

local function getAllActiveTestsOnProperty(p4, p5, p6, p7)
	-- upvalues: constantsModule (ref), getAllActiveTestsOnProperty (ref)
	if typeof(p7) ~= "table" then
		return {
			{
				p5,
				p6,
				p7,
				constantsModule.COMPARISON_METHODS.FUZZY_EQ
			}
		}
	end
	for i, v in p7 do
		if i == constantsModule.INCLUSION_METHODS.INCLUSION_LIST then
			if table.find(v, p4) == nil then
				return {}
			end
		elseif i == constantsModule.INCLUSION_METHODS.EXCLUSION_LIST and table.find(v, p4) ~= nil then
			return {}
		end
	end
	local t = {}
	
	for v, v_1 in constantsModule.COMPARISON_METHODS do
		if p7[v_1] ~= nil then
			table.insert(t, { p5, p6, p7[v_1], v_1 })
		end
	end
	local var2 = 1
	while p7[var2] ~= nil do
		local var3 = getAllActiveTestsOnProperty(p4, p5, p6, p7[var2])
		table.move(var3, 1, #var3, #t + 1, t)
		var2 += 1
	end
	for i_2, v_2 in p7 do
		local var4, position
		if typeof(p6) == "CFrame" and i_2 == "PositionMagnitude" then
			var4 = true
			position = p6.Position.Magnitude
		elseif typeof(p6) == "CFrame" and i_2 == "Orientation" then
			var4 = true
			position = Vector3.new(p6:ToOrientation())
		elseif typeof(p6) == "CFrame" and i_2 == "Position" then
			var4 = true
			position = p6.Position
		else
			var4 = false
			position = nil
		end
		if var4 then
			for i_3, v_3 in getAllActiveTestsOnProperty(p4, i_2, position, v_2) do
				v_3[1] = p5 .. "." .. v_3[1]
				table.insert(t, v_3)
			end
		end
	end
	return t
end

return function(p8, p9, p10)
	-- upvalues: failureReasonsAccumulatorModule (ref), constantsModule (ref), analyticsModule (ref), getAllActiveTestsOnProperty (ref), validatePropertyValue (ref)
	if p9 == nil then
		p9 = p10.assetTypeEnum
	end
	local descendants = p8:GetDescendants()
	table.insert(descendants, p8)
	local var5 = failureReasonsAccumulatorModule.new()
	
	for i, v in descendants do
		for i_1, v_1 in constantsModule.PROPERTIES do
			if v:IsA(i_1) then
				for i_2, v_2 in v_1 do
					local ok, status = pcall(function()
						-- upvalues: v (ref), i_2 (ref)
						return v[i_2]
					end)
					
					if ok then
						for i_3, v_3 in getAllActiveTestsOnProperty(p9, i_2, status, v_2) do
							local unpacked, unpacked_1, unpacked_2, unpacked_3 = table.unpack(v_3)
							var5:updateReasons(validatePropertyValue(p10, v, unpacked, unpacked_1, unpacked_2, unpacked_3))
						end
					else
						analyticsModule.reportFailure(analyticsModule.ErrorType.validateProperties_PropertyDoesNotExist, nil, p10)
						var5:updateReasons(false, {
							string.format("Property '%s' not found in '%s'", i_2, v:GetFullName())
						})
					end
				end
			end
		end
	end
	return var5:getFinalResults()
end