local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local t = {}

local function _(value)
	return string.match(value, "^rbxassetid://(%d+)$")
end

local function getAssetUrlId(value)
	local var1 = string.match(value, "^https?://www%.(.+)") or string.match(value, "^https?://(.+)")
	
	if not var1 then
		return nil
	end
	var1 = string.match(var1, "^sitetest%d%.robloxlabs(.+)") or string.match(var1, "^roblox(.+)")
	
	return if var1 then string.match(var1, "^%.com//?asset/%?id=(%d+)$") else nil
end

local function getAssetDeliveryAssetUrlId(value)
	local match = string.match(value, "^https?://assetdelivery%.(.+)")
	
	if not match then
		return nil
	end
	match = string.match(match, "^sitetest%d%.robloxlabs(.+)") or string.match(match, "^roblox(.+)")
	
	return if match then string.match(match, "^%.com/v1/asset/%?id=(%d+)$") else nil
end

local _ = function(value)
	-- upvalues: getAssetUrlId (ref), getAssetDeliveryAssetUrlId (ref)
	local var1 = tonumber(value)
	
	if var1 ~= nil then
		return var1
	end
	local match = string.match(value, "^rbxassetid://(%d+)$")
	
	if match ~= nil then
		return match
	end
	local var2 = getAssetUrlId(value)
	
	if var2 ~= nil then
		return var2
	end
	local var3 = getAssetDeliveryAssetUrlId(value)
	
	return if var3 == nil then nil else var3
end

local _ = function(p1, p2, p3)
	if not p3 then
		return false
	elseif not p3.allowEditableInstances then
		return false
	end
	local var1 = p3.editableImages[p1]
	
	if var1 and var1[p2] and var1[p2].instance then
		return true
	end
	local var2 = p3.editableMeshes[p1]
	
	return var2 and var2[p2] and var2[p2].instance
end

local function parseContentId(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: getAssetUrlId (ref), getAssetDeliveryAssetUrlId (ref)
	local var1
	local var2 = p4[p5]
	
	if var2 == "" then
		local var3
		if not p7 then
			var3 = false
		elseif p7.allowEditableInstances then
			var1 = p7.editableImages[p4]
			
			if var1 and var1[p5] and var1[p5].instance then
				var3 = true
			else
				local var4 = p7.editableMeshes[p4]
				var3 = if var4 and var4[p5] and var4[p5].instance then true else false
			end
		else
			var3 = false
		end
		if not var3 then
			if p6 then
				return false, {
					string.format("%s.%s cannot be empty", p4:GetFullName(), p5)
				}
			end
		elseif p3 then
			table.insert(p3, { fieldName = p5, instance = p4 })
		end
		return true
	else
		local var5
		var1 = tonumber(var2)
		
		if var1 == nil then
			var1 = string.match(var2, "^rbxassetid://(%d+)$")
			
			if var1 == nil then
				var1 = getAssetUrlId(var2)
				
				if var1 == nil then
					var1 = getAssetDeliveryAssetUrlId(var2)
					var5 = if var1 ~= nil then nil else var1
				else
					var5 = var1
				end
			else
				var5 = var1
			end
		else
			var5 = var1
		end
		if var5 == nil then
			return false, {
				string.format("Could not parse ContentId %s in %s.%s. Please make sure you are using a valid URL with a valid ID.", var2, p4:GetFullName(), p5)
			}
		elseif p2[var5] == nil then
			p2[var5] = { fieldName = p5, instance = p4 }
			table.insert(p1, var5)
		end
		if p3 then
			table.insert(p3, { fieldName = p5, instance = p4, id = var5 })
		end
		return true
	end
end

local function parseWithErrorCheckInternal(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: constantsModule (ref), failureReasonsAccumulatorModule (ref), parseContentId (ref)
	p5 = p5 or constantsModule.CONTENT_ID_FIELDS
	local var1 = failureReasonsAccumulatorModule.new()
	local descendants = p4:GetDescendants()
	table.insert(descendants, p4)
	
	for i, v in pairs(descendants) do
		local className = p5[v.ClassName]
		
		if className then
			local className_1 = p6 and p6[v.ClassName]
			
			for i_1, v_1 in ipairs(className) do
				var1:updateReasons(parseContentId(p1, p2, p3, v, v_1, className_1 and className_1[v_1], p7))
			end
		end
	end
	return var1:getFinalResults()
end

function t.tryGetAssetIdFromContentId(value)
	-- upvalues: getAssetUrlId (ref), getAssetDeliveryAssetUrlId (ref)
	local var2 = tonumber(value)
	
	if var2 ~= nil then
		return var2
	end
	local match = string.match(value, "^rbxassetid://(%d+)$")
	
	if match ~= nil then
		return match
	end
	local var3 = getAssetUrlId(value)
	
	if var3 ~= nil then
		return var3
	end
	local var4 = getAssetDeliveryAssetUrlId(value)
	
	return if var4 == nil then nil else var4
end

function t.parseWithErrorCheck(p8, p9, p10, p11, p12, p13)
	-- upvalues: parseWithErrorCheckInternal (ref)
	return parseWithErrorCheckInternal(p8, p9, nil, p10, p11, p12, p13)
end

function t.parse(p8, p9, p10)
	-- upvalues: parseWithErrorCheckInternal (ref)
	local t = {}
	assert(parseWithErrorCheckInternal({}, {}, t, p8, p9, nil, p10))
	
	return t
end

return t