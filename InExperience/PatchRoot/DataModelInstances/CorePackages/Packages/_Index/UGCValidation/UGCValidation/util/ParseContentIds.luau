local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getFFlagUGCValidateVersionedContentIdsModule = require(parent.flags.getFFlagUGCValidateVersionedContentIds)
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

local _ = function(p1)
	local match, match_1, match_2 = string.match(p1, "^(.*)&(%a+)=(%d+)$")
	
	if match == nil or string.lower(match_1) ~= "version" or #match_2 > 10 then
		return p1, nil
	end
	local var1 = tonumber(match_2)
	
	if var1 == nil or var1 < 1 then
		return p1, nil
	end
	return match, var1
end

local function tryParseVersionedContentId(p1)
	-- upvalues: getAssetUrlId (ref), getAssetDeliveryAssetUrlId (ref)
	local var1, var2
	local match, match_1, match_2 = string.match(p1, "^(.*)&(%a+)=(%d+)$")
	
	if match == nil or string.lower(match_1) ~= "version" or #match_2 > 10 then
		var1 = p1
		var2 = nil
	else
		local var3 = tonumber(match_2)
		
		if var3 == nil or var3 < 1 then
			var1 = p1
			var2 = nil
		else
			var1 = match
			var2 = var3
		end
	end
	match = string.match(var1, "^%d+$")
	
	if match ~= nil and var2 ~= nil then
		return nil, nil
	end
	match_1 = match or (string.match(var1, "^rbxassetid://(%d+)$") or (getAssetUrlId(var1) or getAssetDeliveryAssetUrlId(var1)))
	
	if match_1 == nil then
		return nil, nil
	end
	return string.gsub(match_1, "^0+(%d)", "%1"), var2
end

local function tryGetAssetIdFromContentIdInternal(value)
	-- upvalues: getFFlagUGCValidateVersionedContentIdsModule (ref), tryParseVersionedContentId (ref), getAssetUrlId (ref), getAssetDeliveryAssetUrlId (ref)
	if getFFlagUGCValidateVersionedContentIdsModule() then
		return tryParseVersionedContentId(value)
	end
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
	-- upvalues: tryGetAssetIdFromContentIdInternal (ref)
	local var1 = p4[p5]
	
	if var1 == "" then
		local var2
		if not p7 then
			var2 = false
		elseif p7.allowEditableInstances then
			local var3 = p7.editableImages[p4]
			
			if var3 and var3[p5] and var3[p5].instance then
				var2 = true
			else
				local var4 = p7.editableMeshes[p4]
				var2 = if var4 and var4[p5] and var4[p5].instance then true else false
			end
		else
			var2 = false
		end
		if not var2 then
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
		local var5 = tryGetAssetIdFromContentIdInternal(var1)
		
		if var5 == nil then
			return false, {
				string.format("Could not parse ContentId %s in %s.%s. Please make sure you are using a valid URL with a valid ID.", var1, p4:GetFullName(), p5)
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
	-- upvalues: tryGetAssetIdFromContentIdInternal (ref)
	return tryGetAssetIdFromContentIdInternal(value)
end

function t.tryParseContentId(p8)
	-- upvalues: getFFlagUGCValidateVersionedContentIdsModule (ref), tryParseVersionedContentId (ref), tryGetAssetIdFromContentIdInternal (ref)
	if getFFlagUGCValidateVersionedContentIdsModule() then
		return tryParseVersionedContentId(p8)
	end
	return tryGetAssetIdFromContentIdInternal(p8), nil
end

function t.getReferenceKey(p8, p9)
	return if p9 == nil then p8 else string.format("%s&version=%d", p8, p9)
end

function t.toAssetUri(value, p8)
	-- upvalues: t (ref)
	return "rbxassetid://" .. t.getReferenceKey(value, p8)
end

function t.getDistinctReferences(p8)
	-- upvalues: t (ref)
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p8 do
		for i_1, v_1 in v do
			local referenceKey = t.getReferenceKey(i, v_1.version)
			
			if not t_2[referenceKey] then
				t_2[referenceKey] = true
				table.insert(t_1, {
					key = referenceKey,
					uri = t.toAssetUri(i, v_1.version),
					assetId = i,
					entry = v_1
				})
			end
		end
	end
	return t_1
end

function t.parseWithErrorCheck(p9, p10, p11, p12, p13, p14)
	-- upvalues: parseWithErrorCheckInternal (ref)
	return parseWithErrorCheckInternal(p9, p10, nil, p11, p12, p13, p14)
end

function t.parse(p9, p10, p11)
	-- upvalues: parseWithErrorCheckInternal (ref)
	local t = {}
	assert(parseWithErrorCheckInternal({}, {}, t, p9, p10, nil, p11))
	
	return t
end

return t