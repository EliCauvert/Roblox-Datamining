-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local cryoModule = require(parent.Parent.Cryo)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local valueToStringModule = require(parent.util.valueToString)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)

local function comparitorMethodImpl(p0, p1, p2) --[[ line: 45 ]]
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

local function doesPropertyMatchExpectations(p3, p4, p5) --[[ line: 63 ]]
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

local function validatePropertyValue(p6, p7, p8, p9, p10, p11) --[[ line: 98 ]]
	-- upvalues: doesPropertyMatchExpectations (ref), analyticsModule (ref), valueToStringModule (ref)
	if doesPropertyMatchExpectations(p9, p10, p11) then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateProperties_PropertyMismatch, nil, p6)
	
	return false, {
		string.format("Property %s of %s is invalid. Expected to be %s %s.", p8, p7:GetFullName(), p11, valueToStringModule(p10))
	}
end

local function _(p12, p13) --[[ line: 123 | named "extractSubProperty" ]]
	if typeof(p13) == "CFrame" and p12 == "PositionMagnitude" then
		return true, p13.Position.Magnitude
	elseif typeof(p13) == "CFrame" and p12 == "Orientation" then
		return true, Vector3.new(p13:ToOrientation())
	elseif typeof(p13) == "CFrame" and p12 == "Position" then
		return true, p13.Position
	end
	return false
end

local function getAllActiveTestsOnProperty(p14, p15, p16, p17) --[[ line: 135 ]]
	-- upvalues: constantsModule (ref), getAllActiveTestsOnProperty (ref)
	if typeof(p17) ~= "table" then
		return {
			{
				p15,
				p16,
				p17,
				constantsModule.COMPARISON_METHODS.FUZZY_EQ
			}
		}
	end
	for i, v in p17 do
		if i == constantsModule.INCLUSION_METHODS.INCLUSION_LIST then
			if table.find(v, p14) == nil then
				return {}
			end
		elseif i == constantsModule.INCLUSION_METHODS.EXCLUSION_LIST and table.find(v, p14) ~= nil then
			return {}
		end
	end
	local t = {}
	
	for v, v_1 in constantsModule.COMPARISON_METHODS do
		if p17[v_1] ~= nil then
			table.insert(t, { p15, p16, p17[v_1], v_1 })
		end
	end
	local var12 = 1
	while p17[var12] ~= nil do
		local var13 = getAllActiveTestsOnProperty(p14, p15, p16, p17[var12])
		table.move(var13, 1, #var13, #t + 1, t)
		var12 += 1
	end
	for i_2, v_2 in p17 do
		local var14, position
		if typeof(p16) == "CFrame" and i_2 == "PositionMagnitude" then
			var14 = true
			position = p16.Position.Magnitude
		elseif typeof(p16) == "CFrame" and i_2 == "Orientation" then
			var14 = true
			position = Vector3.new(p16:ToOrientation())
		elseif typeof(p16) == "CFrame" and i_2 == "Position" then
			var14 = true
			position = p16.Position
		else
			var14 = false
			position = nil
		end
		if var14 then
			for i_3, v_3 in getAllActiveTestsOnProperty(p14, i_2, position, v_2) do
				v_3[1] = p15 .. "." .. v_3[1]
				table.insert(t, v_3)
			end
		end
	end
	return t
end

return function(p18, p19, p20) --[[ line: 195 | named "validatePropertyRequirements" ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), constantsModule (ref), analyticsModule (ref), getAllActiveTestsOnProperty (ref), validatePropertyValue (ref)
	if p19 == nil then
		p19 = p20.assetTypeEnum
	end
	local descendants = p18:GetDescendants()
	table.insert(descendants, p18)
	local var16 = failureReasonsAccumulatorModule.new()
	
	for i, v in descendants do
		for i_1, v_1 in constantsModule.PROPERTIES do
			if v:IsA(i_1) then
				for i_2, v_2 in v_1 do
					local ok, status = pcall(function() --[[ line: 215 ]]
						-- upvalues: v (ref), i_2 (ref)
						return v[i_2]
					end)
					
					if ok then
						for i_3, v_3 in getAllActiveTestsOnProperty(p19, i_2, status, v_2) do
							local unpacked, unpacked_1, unpacked_2, unpacked_3 = table.unpack(v_3)
							var16:updateReasons(validatePropertyValue(p20, v, unpacked, unpacked_1, unpacked_2, unpacked_3))
						end
					else
						analyticsModule.reportFailure(analyticsModule.ErrorType.validateProperties_PropertyDoesNotExist, nil, p20)
						var16:updateReasons(false, {
							string.format("Property '%s' not found in '%s'", i_2, v:GetFullName())
						})
					end
				end
			end
		end
	end
	return var16:getFinalResults()
end