local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)

local function _(Text: string): string
	return (string.match(Text, "^rbxassetid://(%d+)$"))
end

local function getAssetUrlId(Text: string)
	local Match: string = string.match(Text, "^https?://www%.(.+)") or string.match(Text, "^https?://(.+)")
	
	if Match then
		local Match1: string = string.match(Match, "^sitetest%d%.robloxlabs(.+)") or string.match(Match, "^roblox(.+)")
		
		return if Match1 then string.match(Match1, "^%.com//?asset/%?id=(%d+)$") else nil
	else
		return nil
	end
end

local function getAssetDeliveryAssetUrlId(Text: string)
	local Match: string? = string.match(Text, "^https?://assetdelivery%.(.+)")
	
	if Match then
		local Match1: string = string.match(Match, "^sitetest%d%.robloxlabs(.+)") or string.match(Match, "^roblox(.+)")
		
		return if Match1 then string.match(Match1, "^%.com/v1/asset/%?id=(%d+)$") else nil
	else
		return nil
	end
end

local _ = function(Text: string)
	-- upvalues: getAssetUrlId (copy), getAssetDeliveryAssetUrlId (copy)
	local Number: number? = tonumber(Text)
	
	if Number ~= nil then
		return Number
	end
	local Match: string? = string.match(Text, "^rbxassetid://(%d+)$")
	
	if Match ~= nil then
		return Match
	end
	local AssetUrlId = getAssetUrlId(Text)
	
	if AssetUrlId == nil then
		local AssetDeliveryAssetUrlId = getAssetDeliveryAssetUrlId(Text)
		
		return if AssetDeliveryAssetUrlId == nil then nil else AssetDeliveryAssetUrlId
	else
		return AssetUrlId
	end
end

local _ = function(p1, p2, p3): boolean
	if not p3 then
		return false
	elseif not p3.allowEditableInstances then
		return false
	else
		local EditableImage = p3.editableImages[p1]
		
		if EditableImage and EditableImage[p2] and EditableImage[p2].instance then
			return true
		else
			local EditableMesh = p3.editableMeshes[p1]
			
			return if EditableMesh and EditableMesh[p2] and EditableMesh[p2].instance then true else false
		end
	end
end

local function parseContentId(List1, p1, List, Object, FieldName, p2, p3)
	-- upvalues: getAssetUrlId (copy), getAssetDeliveryAssetUrlId (copy)
	local Text: string = Object[FieldName]
	
	if Text == "" then
		local Flag = nil
		if p3 then
			if p3.allowEditableInstances then
				local EditableImage = p3.editableImages[Object]
				
				if EditableImage and EditableImage[FieldName] and EditableImage[FieldName].instance then
					Flag = true
				else
					local EditableMesh = p3.editableMeshes[Object]
					Flag = if EditableMesh and EditableMesh[FieldName] and EditableMesh[FieldName].instance then true else false
				end
			else
				Flag = false
			end
		else
			Flag = false
		end
		if Flag then
			if List then
				table.insert(List, { fieldName = FieldName, instance = Object })
			end
		elseif p2 then
			return false, {
				string.format("%s.%s cannot be empty", Object:GetFullName(), FieldName)
			}
		end
		return true
	else
		local Number: number? = tonumber(Text)
		local Id = nil
		
		if Number == nil then
			local Match: string? = string.match(Text, "^rbxassetid://(%d+)$")
			
			if Match == nil then
				local AssetUrlId = getAssetUrlId(Text)
				
				if AssetUrlId == nil then
					local AssetDeliveryAssetUrlId = getAssetDeliveryAssetUrlId(Text)
					Id = if AssetDeliveryAssetUrlId == nil then nil else AssetDeliveryAssetUrlId
				else
					Id = AssetUrlId
				end
			else
				Id = Match
			end
		else
			Id = Number
		end
		if Id == nil then
			return false, {
				string.format("Could not parse ContentId %s in %s.%s. Please make sure you are using a valid URL with a valid ID.", Text, Object:GetFullName(), FieldName)
			}
		end
		if p1[Id] == nil then
			p1[Id] = { fieldName = FieldName, instance = Object }
			table.insert(List1, Id)
		end
		if List then
			table.insert(List, { fieldName = FieldName, instance = Object, id = Id })
		end
		return true
	end
end

local function parseWithErrorCheckInternal(p1, p2, p3, Object, p4, p5, p6)
	-- upvalues: ConstantsModule (copy), FailureReasonsAccumulatorModule (copy), parseContentId (copy)
	local P12 = p4 or ConstantsModule.CONTENT_ID_FIELDS
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	
	for _, descendant in pairs(Descendants) do
		local Entry = P12[descendant.ClassName]
		
		if Entry then
			local v1 = p5 and p5[descendant.ClassName]
			for _, value in ipairs(Entry) do
				NewFailureReasonsAccumulator:updateReasons(parseContentId(p1, p2, p3, descendant, value, v1 and v1[value], p6))
			end
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

return {
	tryGetAssetIdFromContentId = function(Text: string)
		-- upvalues: getAssetUrlId (copy), getAssetDeliveryAssetUrlId (copy)
		local Number: number? = tonumber(Text)
		
		if Number ~= nil then
			return Number
		end
		local Match: string? = string.match(Text, "^rbxassetid://(%d+)$")
		
		if Match ~= nil then
			return Match
		end
		local AssetUrlId = getAssetUrlId(Text)
		
		if AssetUrlId == nil then
			local AssetDeliveryAssetUrlId = getAssetDeliveryAssetUrlId(Text)
			
			return if AssetDeliveryAssetUrlId == nil then nil else AssetDeliveryAssetUrlId
		else
			return AssetUrlId
		end
	end,
	parseWithErrorCheck = function(p7, p8, p9, p10, p11, p12)
		-- upvalues: parseWithErrorCheckInternal (copy)
		return parseWithErrorCheckInternal(p7, p8, nil, p9, p10, p11, p12)
	end,
	parse = function(p7, p8, p9)
		-- upvalues: parseWithErrorCheckInternal (copy)
		local t = {}
		assert((parseWithErrorCheckInternal({}, {}, t, p7, p8, nil, p9)))
		
		return t
	end
}