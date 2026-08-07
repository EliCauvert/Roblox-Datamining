local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local t = {}

local function _(value) --[[ line: 16 | named "getRbxAssetId" ]]
	return string.match(value, "^rbxassetid://(%d+)$")
end

local function getAssetUrlId(value) --[[ line: 22 ]]
	local var7 = string.match(value, "^https?://www%.(.+)") or string.match(value, "^https?://(.+)")
	
	if not var7 then
		return nil
	end
	var7 = string.match(var7, "^sitetest%d%.robloxlabs(.+)") or string.match(var7, "^roblox(.+)")
	
	return if var7 then string.match(var7, "^%.com//?asset/%?id=(%d+)$") else nil
end

local function getAssetDeliveryAssetUrlId(value) --[[ line: 37 ]]
	local match = string.match(value, "^https?://assetdelivery%.(.+)")
	
	if not match then
		return nil
	end
	match = string.match(match, "^sitetest%d%.robloxlabs(.+)") or string.match(match, "^roblox(.+)")
	
	return if match then string.match(match, "^%.com/v1/asset/%?id=(%d+)$") else nil
end

local _ = function(value) --[[ line: 51 | named "tryGetAssetIdFromContentIdInternal" ]]
	-- upvalues: getAssetUrlId (ref), getAssetDeliveryAssetUrlId (ref)
	local var9 = tonumber(value)
	
	if var9 ~= nil then
		return var9
	end
	local match = string.match(value, "^rbxassetid://(%d+)$")
	
	if match ~= nil then
		return match
	end
	local var11 = getAssetUrlId(value)
	
	if var11 ~= nil then
		return var11
	end
	local var12 = getAssetDeliveryAssetUrlId(value)
	
	return if var12 == nil then nil else var12
end

local _ = function(p0, p1, p2) --[[ line: 75 | named "hasInExpCreatedEditableInstance" ]]
	if not p2 then
		return false
	elseif not p2.allowEditableInstances then
		return false
	end
	local var13 = p2.editableImages[p0]
	
	if var13 and var13[p1] and var13[p1].instance then
		return true
	end
	local var14 = p2.editableMeshes[p0]
	
	return var14 and var14[p1] and var14[p1].instance
end

local function parseContentId(p3, p4, p5, p6, p7, p8, p9) --[[ line: 105 ]]
	-- upvalues: getAssetUrlId (ref), getAssetDeliveryAssetUrlId (ref)
	local var17
	local var15 = p6[p7]
	
	if var15 == "" then
		local var16
		if not p9 then
			var16 = false
		elseif p9.allowEditableInstances then
			var17 = p9.editableImages[p6]
			
			if var17 and var17[p7] and var17[p7].instance then
				var16 = true
			else
				local var18 = p9.editableMeshes[p6]
				var16 = if var18 and var18[p7] and var18[p7].instance then true else false
			end
		else
			var16 = false
		end
		if not var16 then
			if p8 then
				return false, {
					string.format("%s.%s cannot be empty", p6:GetFullName(), p7)
				}
			end
		elseif p5 then
			table.insert(p5, { fieldName = p7, instance = p6 })
		end
		return true
	else
		local var19
		var17 = tonumber(var15)
		
		if var17 == nil then
			var17 = string.match(var15, "^rbxassetid://(%d+)$")
			
			if var17 == nil then
				var17 = getAssetUrlId(var15)
				
				if var17 == nil then
					var17 = getAssetDeliveryAssetUrlId(var15)
					var19 = if var17 ~= nil then nil else var17
				else
					var19 = var17
				end
			else
				var19 = var17
			end
		else
			var19 = var17
		end
		if var19 == nil then
			return false, {
				string.format("Could not parse ContentId %s in %s.%s. Please make sure you are using a valid URL with a valid ID.", var15, p6:GetFullName(), p7)
			}
		elseif p4[var19] == nil then
			p4[var19] = { fieldName = p7, instance = p6 }
			table.insert(p3, var19)
		end
		if p5 then
			table.insert(p5, { fieldName = p7, instance = p6, id = var19 })
		end
		return true
	end
end

local function parseWithErrorCheckInternal(p10, p11, p12, p13, p14, p15, p16) --[[ line: 150 ]]
	-- upvalues: constantsModule (ref), failureReasonsAccumulatorModule (ref), parseContentId (ref)
	p14 = p14 or constantsModule.CONTENT_ID_FIELDS
	local var21 = failureReasonsAccumulatorModule.new()
	local descendants = p13:GetDescendants()
	table.insert(descendants, p13)
	
	for i, v in pairs(descendants) do
		local className = p14[v.ClassName]
		
		if className then
			local className_1 = p15 and p15[v.ClassName]
			
			for i_1, v_1 in ipairs(className) do
				var21:updateReasons(parseContentId(p10, p11, p12, v, v_1, className_1 and className_1[v_1], p16))
			end
		end
	end
	return var21:getFinalResults()
end

function t.tryGetAssetIdFromContentId(value) --[[ line: 189 ]]
	-- upvalues: getAssetUrlId (ref), getAssetDeliveryAssetUrlId (ref)
	local var24 = tonumber(value)
	
	if var24 ~= nil then
		return var24
	end
	local match = string.match(value, "^rbxassetid://(%d+)$")
	
	if match ~= nil then
		return match
	end
	local var26 = getAssetUrlId(value)
	
	if var26 ~= nil then
		return var26
	end
	local var27 = getAssetDeliveryAssetUrlId(value)
	
	return if var27 == nil then nil else var27
end

function t.parseWithErrorCheck(p17, p18, p19, p20, p21, p22) --[[ line: 193 ]]
	-- upvalues: parseWithErrorCheckInternal (ref)
	return parseWithErrorCheckInternal(p17, p18, nil, p19, p20, p21, p22)
end

function t.parse(p23, p24, p25) --[[ line: 212 ]]
	-- upvalues: parseWithErrorCheckInternal (ref)
	local t = {}
	assert(parseWithErrorCheckInternal({}, {}, t, p23, p24, nil, p25))
	
	return t
end

return t