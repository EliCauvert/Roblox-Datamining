local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local momentsTypesModule = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local convertApiMomentCommentsModule = require(dataHydration.Moments.Util.convertApiMomentComments)
local fFlagMomentsStickerOverlayNormalizationModule = require(dataHydration.Moments.FFlagMomentsStickerOverlayNormalization)
local fFlagMomentsRequireApiFeedItemIdModule = require(dataHydration.Moments.FFlagMomentsRequireApiFeedItemId)
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local momentStatus = momentsTypesModule.Enums.MomentStatus
local builderSansMedium = Enum.Font.BuilderSansMedium
local color3 = Color3.new(0, 0, 0)
local center = Enum.TextXAlignment.Center
local uDim2 = UDim2.fromScale(0.5, 0.5)

local function _(p1)
	return if p1 == "Screenshot" then Enum.CaptureType.Screenshot else Enum.CaptureType.Video
end

local _ = function(p1)
	-- upvalues: momentStatus (ref)
	return if p1 == momentStatus.Deleted then momentStatus.Deleted else momentStatus.Public
end

local function toEnumItem(p1, p2, p3)
	if typeof(p2) == "EnumItem" then
		return p2
	elseif type(p2) ~= "string" then
		return p3
	end
	local var1 = string.match(p2, "([^%.]+)$") or p2
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), var1 (ref)
		return p1[var1]
	end)
	
	return if ok and status ~= nil then status else p3
end

local function toColor3(p1)
	-- upvalues: color3 (ref)
	if typeof(p1) == "Color3" then
		return p1
	elseif type(p1) ~= "table" then
		return color3
	end
	local r = p1.R or (p1.r or (p1.Red or (p1.red or p1[1])))
	local g = p1.G or (p1.g or (p1.Green or (p1.green or p1[2])))
	local b = p1.B or (p1.b or (p1.Blue or (p1.blue or p1[3])))
	
	return if not (type(r) ~= "number" or type(g) ~= "number" or type(b) ~= "number") then if r > 1 or g > 1 or b > 1 then Color3.fromRGB(r, g, b) else Color3.new(r, g, b) else color3
end

local function toUDim2(p1)
	-- upvalues: uDim2 (ref)
	if typeof(p1) == "UDim2" then
		return p1
	elseif type(p1) ~= "table" then
		return uDim2
	elseif type(p1[1]) == "number" and type(p1[2]) == "number" then
		return UDim2.fromScale(p1[1], p1[2])
	end
	local x = p1.X or p1.x
	local y = p1.Y or p1.y
	
	return if type(x) == "table" and type(y) == "table" then UDim2.new(x.Scale or (x.scale or 0), x.Offset or (x.offset or 0), y.Scale or (y.scale or 0), y.Offset or (y.offset or 0)) else UDim2.new(p1.XScale or (p1.xScale or (p1.scaleX or (p1[1] or 0.5))), p1.XOffset or (p1.xOffset or (p1.offsetX or (p1[2] or 0))), p1.YScale or (p1.yScale or (p1.scaleY or (p1[3] or 0.5))), p1.YOffset or (p1.yOffset or (p1.offsetY or (p1[4] or 0))))
end

local function normalizeTextOverlayEdit(p1)
	-- upvalues: toUDim2 (ref), toEnumItem (ref), builderSansMedium (ref), toColor3 (ref), center (ref)
	if type(p1) == "table" then
		local textOverlayStyle = p1.textOverlayStyle or {}
		
		return {
			position = toUDim2(p1.position),
			rotation = if type(p1.rotation) == "number" then p1.rotation else 0,
			scale = if type(p1.scale) == "number" then p1.scale else 1,
			text = if type(p1.text) == "string" then p1.text else "",
			textOverlayStyle = {
				font = toEnumItem(Enum.Font, textOverlayStyle.font, builderSansMedium),
				fontColor = toColor3(textOverlayStyle.fontColor),
				fontSize = if type(textOverlayStyle.fontSize) == "number" then textOverlayStyle.fontSize else 16,
				textXAlignment = toEnumItem(Enum.TextXAlignment, textOverlayStyle.textXAlignment, center)
			},
			zIndex = if type(p1.zIndex) == "number" then p1.zIndex else 1
		}
	end
	return nil
end

local function normalizeStickerOverlayEdit(p1)
	-- upvalues: toUDim2 (ref)
	return if type(p1) == "table" then if type(p1.stickerURI) == "string" and p1.stickerURI ~= "" then {
		position = toUDim2(p1.position),
		rotation = if type(p1.rotation) == "number" then p1.rotation else 0,
		scale = if type(p1.scale) == "number" then p1.scale else 1,
		stickerSize = if type(p1.stickerSize) == "number" then p1.stickerSize else 1,
		stickerURI = if type(p1.stickerURI) == "string" then p1.stickerURI else "",
		zIndex = if type(p1.zIndex) == "number" then p1.zIndex else 1
	} else nil else nil
end

local function normalizeTtsEdit(p1)
	if type(p1) ~= "table" then
		return nil
	end
	local var1 = tonumber(p1.assetId)
	
	return if var1 == nil or var1 <= 0 then nil else {
		text = if type(p1.text) == "string" then p1.text else "",
		voiceId = if type(p1.voiceId) == "number" then p1.voiceId else 0,
		startTime = if type(p1.startTime) == "number" then p1.startTime else 0,
		assetId = var1
	}
end

local function normalizeCaptureEdits(p1)
	-- upvalues: normalizeTextOverlayEdit (ref), fFlagMomentsStickerOverlayNormalizationModule (ref), normalizeStickerOverlayEdit (ref), normalizeTtsEdit (ref)
	if p1 == nil then
		return nil
	end
	local var1 = nil
	
	if type(p1.textOverlays) == "table" then
		local t = {}
		
		for i, v in p1.textOverlays do
			local var2 = normalizeTextOverlayEdit(v)
			
			if var2 ~= nil then
				table.insert(t, var2)
			end
		end
		if #t > 0 then
			var1 = t
		end
	end
	local var3 = nil
	
	if fFlagMomentsStickerOverlayNormalizationModule() and type(p1.stickerOverlays) == "table" then
		local t = {}
		
		for i, v in p1.stickerOverlays do
			local var4 = normalizeStickerOverlayEdit(v)
			
			if var4 ~= nil then
				table.insert(t, var4)
			end
		end
		if #t > 0 then
			var3 = t
		end
	end
	local var5 = nil
	
	if type(p1.ttsAudios) == "table" then
		local t = {}
		
		for i, v in p1.ttsAudios do
			local var6 = normalizeTtsEdit(v)
			
			if var6 ~= nil then
				table.insert(t, var6)
			end
		end
		if #t > 0 then
			var5 = t
		end
	end
	return {
		trim = p1.trim,
		music = p1.music,
		ttsAudios = var5,
		textOverlays = var1,
		stickerOverlays = var3
	}
end

local _ = function(p2)
	if p2 == nil or p2.counts == nil then
		return nil
	end
	local var7 = 0
	
	for i, v in p2.counts do
		var7 += v
	end
	return var7
end

local function convertApiMomentToMomentItem(p3)
	-- upvalues: fFlagMomentsRequireApiFeedItemIdModule (ref), normalizeCaptureEdits (ref), momentStatus (ref), fFlagMomentsComments (ref), convertApiMomentCommentsModule (ref)
	local captionedAssetMoment = p3.captionedAssetMoment
	local owner = p3.owner
	local entityId = p3.entityId or p3.id
	local feedItemId = p3.feedItemId
	
	if captionedAssetMoment == nil or captionedAssetMoment.assetId == nil or (owner == nil or owner.id == nil) or entityId == nil or fFlagMomentsRequireApiFeedItemIdModule and (feedItemId == nil or feedItemId == "") then
		return nil
	end
	local var8
	local var9 = if p3.primaryCta ~= nil then nil else p3.primaryCta.experienceCta
	local var10 = normalizeCaptureEdits(if captionedAssetMoment.captureType == "Screenshot" then captionedAssetMoment.screenshotCaptureEdits else captionedAssetMoment.videoCaptureEdits)
	local var11 = if (captionedAssetMoment.status or p3.status) == momentStatus.Deleted then momentStatus.Deleted else momentStatus.Public
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
		edits = var10,
		experienceName = if var9 ~= nil then nil else var9.experienceName
	}
	local reactions = p3.reactions
	
	if reactions == nil or reactions.counts == nil then
		var8 = nil
	else
		local var12 = 0
		
		for i, v in reactions.counts do
			var12 += v
		end
		var8 = var12
	end
	t_1.likeCount = var8
	t_1.partnerUploadType = captionedAssetMoment.partnerUploadType
	t_1.placeId = if var9 ~= nil then nil else var9.placeId
	t_1.universeId = if var9 ~= nil then nil else var9.experienceId
	t.metadata = t_1
	t.momentId = entityId
	t.recommendationMetadata = { feedItemId = feedItemId, tracingId = p3.feedSessionId }
	t.status = var11
	
	if fFlagMomentsComments then
		local var13 = convertApiMomentCommentsModule(p3.comments)
		
		if var13 ~= nil then
			t.comments = var13
		end
	end
	return t
end

return function(p4)
	-- upvalues: convertApiMomentToMomentItem (ref)
	local t = {}
	
	if p4 == nil then
		return t
	end
	for i, v in ipairs(p4) do
		local var14 = convertApiMomentToMomentItem(v)
		
		if var14 ~= nil then
			table.insert(t, var14)
		end
	end
	return t
end