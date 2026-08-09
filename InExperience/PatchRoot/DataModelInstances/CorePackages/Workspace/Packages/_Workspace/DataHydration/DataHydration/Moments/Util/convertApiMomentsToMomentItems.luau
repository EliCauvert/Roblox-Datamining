local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local momentStatus = require(dataHydration.Parent.MomentsTypes).Enums.MomentStatus
local uDim2 = UDim2.fromScale(0.5, 0.5)
local builderSansMedium = Enum.Font.BuilderSansMedium
local color3 = Color3.new(0, 0, 0)
local center = Enum.TextXAlignment.Center

local function _(p0) --[[ line: 20 | named "toCaptureType" ]]
	return if p0 == "Screenshot" then Enum.CaptureType.Screenshot else Enum.CaptureType.Video
end

local _ = function(p1) --[[ line: 28 | named "toMomentStatus" ]]
	-- upvalues: momentStatus (ref)
	return if p1 == momentStatus.Deleted then momentStatus.Deleted else momentStatus.Public
end

local function toEnumItem(p2, p3, p4) --[[ line: 36 ]]
	if typeof(p3) == "EnumItem" then
		return p3
	elseif type(p3) ~= "string" then
		return p4
	end
	local var9 = string.match(p3, "([^%.]+)$") or p3
	local ok, status = pcall(function() --[[ line: 45 ]]
		-- upvalues: p2 (ref), var9 (ref)
		return p2[var9]
	end)
	
	return if ok and status ~= nil then status else p4
end

local function toColor3(p5) --[[ line: 54 ]]
	-- upvalues: color3 (ref)
	if typeof(p5) == "Color3" then
		return p5
	elseif type(p5) ~= "table" then
		return color3
	end
	local r = p5.R or (p5.r or (p5.Red or (p5.red or p5[1])))
	local g = p5.G or (p5.g or (p5.Green or (p5.green or p5[2])))
	local b = p5.B or (p5.b or (p5.Blue or (p5.blue or p5[3])))
	
	return if not (type(r) ~= "number" or type(g) ~= "number" or type(b) ~= "number") then if r > 1 or g > 1 or b > 1 then Color3.fromRGB(r, g, b) else Color3.new(r, g, b) else color3
end

local function toUDim2(p6) --[[ line: 75 ]]
	-- upvalues: uDim2 (ref)
	if typeof(p6) == "UDim2" then
		return p6
	elseif type(p6) ~= "table" then
		return uDim2
	elseif type(p6[1]) == "number" and type(p6[2]) == "number" then
		return UDim2.fromScale(p6[1], p6[2])
	end
	local x = p6.X or p6.x
	local y = p6.Y or p6.y
	
	return if type(x) == "table" and type(y) == "table" then UDim2.new(x.Scale or (x.scale or 0), x.Offset or (x.offset or 0), y.Scale or (y.scale or 0), y.Offset or (y.offset or 0)) else UDim2.new(p6.XScale or (p6.xScale or (p6.scaleX or (p6[1] or 0.5))), p6.XOffset or (p6.xOffset or (p6.offsetX or (p6[2] or 0))), p6.YScale or (p6.yScale or (p6.scaleY or (p6[3] or 0.5))), p6.YOffset or (p6.yOffset or (p6.offsetY or (p6[4] or 0))))
end

local function normalizeTextOverlayEdit(p7) --[[ line: 106 ]]
	-- upvalues: toUDim2 (ref), toEnumItem (ref), builderSansMedium (ref), toColor3 (ref), center (ref)
	if type(p7) == "table" then
		local textOverlayStyle = p7.textOverlayStyle or {}
		
		return {
			position = toUDim2(p7.position),
			rotation = if type(p7.rotation) == "number" then p7.rotation else 0,
			scale = if type(p7.scale) == "number" then p7.scale else 1,
			text = if type(p7.text) == "string" then p7.text else "",
			textOverlayStyle = {
				font = toEnumItem(Enum.Font, textOverlayStyle.font, builderSansMedium),
				fontColor = toColor3(textOverlayStyle.fontColor),
				fontSize = if type(textOverlayStyle.fontSize) == "number" then textOverlayStyle.fontSize else 16,
				textXAlignment = toEnumItem(Enum.TextXAlignment, textOverlayStyle.textXAlignment, center)
			},
			zIndex = if type(p7.zIndex) == "number" then p7.zIndex else 1
		}
	end
	return nil
end

local function normalizeCaptureEdits(p8) --[[ line: 129 ]]
	-- upvalues: normalizeTextOverlayEdit (ref)
	if p8 == nil then
		return nil
	end
	local var16 = nil
	
	if type(p8.textOverlays) == "table" then
		local t = {}
		
		for i, v in p8.textOverlays do
			local var18 = normalizeTextOverlayEdit(v)
			
			if var18 ~= nil then
				table.insert(t, var18)
			end
		end
		if #t > 0 then
			var16 = t
		end
	end
	return { trim = p8.trim, music = p8.music, textOverlays = var16 }
end

local _ = function(p9) --[[ line: 155 | named "reactionTotal" ]]
	if p9 == nil or p9.counts == nil then
		return nil
	end
	local var19 = 0
	
	for i, v in p9.counts do
		var19 += v
	end
	return var19
end

local function convertApiMomentToMomentItem(p10) --[[ line: 168 ]]
	-- upvalues: normalizeCaptureEdits (ref), momentStatus (ref)
	local captionedAssetMoment = p10.captionedAssetMoment
	local owner = p10.owner
	local entityId = p10.entityId or p10.id
	
	if captionedAssetMoment == nil or captionedAssetMoment.assetId == nil or (owner == nil or owner.id == nil) or entityId == nil then
		return nil
	end
	local var27
	local var21 = if p10.primaryCta ~= nil then nil else p10.primaryCta.experienceCta
	local var22 = normalizeCaptureEdits(if captionedAssetMoment.captureType == "Screenshot" then captionedAssetMoment.screenshotCaptureEdits else captionedAssetMoment.videoCaptureEdits)
	local var23 = if (captionedAssetMoment.status or p10.status) == momentStatus.Deleted then momentStatus.Deleted else momentStatus.Public
	local t = {
		assetId = captionedAssetMoment.assetId,
		creatorId = owner.id,
		isModerated = captionedAssetMoment.isModerated
	}
	local t_1 = {
		assetToken = captionedAssetMoment.assetToken,
		assetTotalDuration = captionedAssetMoment.assetTotalDuration,
		assetAccessContext = captionedAssetMoment.assetAccessContext,
		captureType = if captionedAssetMoment.captureType == "Screenshot" then Enum.CaptureType.Screenshot else Enum.CaptureType.Video,
		description = captionedAssetMoment.caption,
		edits = var22,
		experienceName = if var21 ~= nil then nil else var21.experienceName
	}
	local reactions = p10.reactions
	
	if reactions == nil or reactions.counts == nil then
		var27 = nil
	else
		local var26 = 0
		
		for i, v in reactions.counts do
			var26 += v
		end
		var27 = var26
	end
	t_1.likeCount = var27
	t_1.placeId = if var21 ~= nil then nil else var21.placeId
	t_1.universeId = if var21 ~= nil then nil else var21.experienceId
	t.metadata = t_1
	t.momentId = entityId
	t.recommendationMetadata = {
		itemId = p10.feedItemId or entityId,
		tracingId = p10.feedSessionId
	}
	t.status = var23
	
	return t
end

return function(p11) --[[ line: 216 | named "convertApiMomentsToMomentItems" ]]
	-- upvalues: convertApiMomentToMomentItem (ref)
	local t = {}
	
	if p11 == nil then
		return t
	end
	for i, v in ipairs(p11) do
		local var29 = convertApiMomentToMomentItem(v)
		
		if var29 ~= nil then
			table.insert(t, var29)
		end
	end
	return t
end