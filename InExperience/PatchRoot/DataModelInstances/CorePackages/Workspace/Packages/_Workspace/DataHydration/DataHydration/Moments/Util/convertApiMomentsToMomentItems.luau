local dataHydration = script:FindFirstAncestor("DataHydration")
local momentsTypesModule = require(dataHydration.Parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local fFlagMomentsStickerOverlayNormalizationModule = require(dataHydration.Moments.FFlagMomentsStickerOverlayNormalization)
local fFlagMomentsRequireApiFeedItemIdModule = require(dataHydration.Moments.FFlagMomentsRequireApiFeedItemId)
local momentStatus = momentsTypesModule.Enums.MomentStatus
local builderSansMedium = Enum.Font.BuilderSansMedium
local color3 = Color3.new(0, 0, 0)
local center = Enum.TextXAlignment.Center
local uDim2 = UDim2.fromScale(0.5, 0.5)

local function _(p0)
	return if p0 == "Screenshot" then Enum.CaptureType.Screenshot else Enum.CaptureType.Video
end

local _ = function(p1)
	-- upvalues: momentStatus (ref)
	return if p1 == momentStatus.Deleted then momentStatus.Deleted else momentStatus.Public
end

local function toEnumItem(p2, p3, p4)
	if typeof(p3) == "EnumItem" then
		return p3
	elseif type(p3) ~= "string" then
		return p4
	end
	local var13 = string.match(p3, "([^%.]+)$") or p3
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), var13 (ref)
		return p2[var13]
	end)
	
	return if ok and status ~= nil then status else p4
end

local function toColor3(p5)
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

local function toUDim2(p6)
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

local function normalizeTextOverlayEdit(p7)
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

local function normalizeStickerOverlayEdit(p8)
	-- upvalues: toUDim2 (ref)
	return if type(p8) == "table" then if type(p8.stickerURI) == "string" and p8.stickerURI ~= "" then {
		position = toUDim2(p8.position),
		rotation = if type(p8.rotation) == "number" then p8.rotation else 0,
		scale = if type(p8.scale) == "number" then p8.scale else 1,
		stickerSize = if type(p8.stickerSize) == "number" then p8.stickerSize else 1,
		stickerURI = if type(p8.stickerURI) == "string" then p8.stickerURI else "",
		zIndex = if type(p8.zIndex) == "number" then p8.zIndex else 1
	} else nil else nil
end

local function normalizeCaptureEdits(p9)
	-- upvalues: normalizeTextOverlayEdit (ref), fFlagMomentsStickerOverlayNormalizationModule (ref), normalizeStickerOverlayEdit (ref)
	if p9 == nil then
		return nil
	end
	local var20 = nil
	
	if type(p9.textOverlays) == "table" then
		local t = {}
		
		for i, v in p9.textOverlays do
			local var22 = normalizeTextOverlayEdit(v)
			
			if var22 ~= nil then
				table.insert(t, var22)
			end
		end
		if #t > 0 then
			var20 = t
		end
	end
	local var23 = nil
	
	if fFlagMomentsStickerOverlayNormalizationModule() and type(p9.stickerOverlays) == "table" then
		local t = {}
		
		for i, v in p9.stickerOverlays do
			local var25 = normalizeStickerOverlayEdit(v)
			
			if var25 ~= nil then
				table.insert(t, var25)
			end
		end
		if #t > 0 then
			var23 = t
		end
	end
	return {
		trim = p9.trim,
		music = p9.music,
		textOverlays = var20,
		stickerOverlays = var23
	}
end

local _ = function(p10)
	if p10 == nil or p10.counts == nil then
		return nil
	end
	local var26 = 0
	
	for i, v in p10.counts do
		var26 += v
	end
	return var26
end

local function convertApiMomentToMomentItem(p11)
	-- upvalues: fFlagMomentsRequireApiFeedItemIdModule (ref), normalizeCaptureEdits (ref), momentStatus (ref)
	local captionedAssetMoment = p11.captionedAssetMoment
	local owner = p11.owner
	local entityId = p11.entityId or p11.id
	local feedItemId = p11.feedItemId
	
	if captionedAssetMoment == nil or captionedAssetMoment.assetId == nil or (owner == nil or owner.id == nil) or entityId == nil or fFlagMomentsRequireApiFeedItemIdModule and (feedItemId == nil or feedItemId == "") then
		return nil
	end
	local var34
	local var28 = if p11.primaryCta ~= nil then nil else p11.primaryCta.experienceCta
	local var29 = normalizeCaptureEdits(if captionedAssetMoment.captureType == "Screenshot" then captionedAssetMoment.screenshotCaptureEdits else captionedAssetMoment.videoCaptureEdits)
	local var30 = if (captionedAssetMoment.status or p11.status) == momentStatus.Deleted then momentStatus.Deleted else momentStatus.Public
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
		edits = var29,
		experienceName = if var28 ~= nil then nil else var28.experienceName
	}
	local reactions = p11.reactions
	
	if reactions == nil or reactions.counts == nil then
		var34 = nil
	else
		local var33 = 0
		
		for i, v in reactions.counts do
			var33 += v
		end
		var34 = var33
	end
	t_1.likeCount = var34
	t_1.partnerUploadType = captionedAssetMoment.partnerUploadType
	t_1.placeId = if var28 ~= nil then nil else var28.placeId
	t_1.universeId = if var28 ~= nil then nil else var28.experienceId
	t.metadata = t_1
	t.momentId = entityId
	t.recommendationMetadata = { feedItemId = feedItemId, tracingId = p11.feedSessionId }
	t.status = var30
	
	return t
end

return function(p12)
	-- upvalues: convertApiMomentToMomentItem (ref)
	local t = {}
	
	if p12 == nil then
		return t
	end
	for i, v in ipairs(p12) do
		local var36 = convertApiMomentToMomentItem(v)
		
		if var36 ~= nil then
			table.insert(t, var36)
		end
	end
	return t
end