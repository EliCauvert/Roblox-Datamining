local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMomentsServeEDPVideos = SharedFlagsModule.FFlagMomentsServeEDPVideos
local GetFFlagMomentsRenderPostAssetsModule = require(Parent.MomentsCommon.GetFFlagMomentsRenderPostAssets)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConvertApiMomentCommentsModule = require(DataHydration.Moments.Util.convertApiMomentComments)
local FFlagMomentsStickerOverlayNormalizationModule = require(DataHydration.Moments.FFlagMomentsStickerOverlayNormalization)
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local FFlagMomentsCommentsIxpEnabled = SharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local FFlagEnableMomentsCommentReporting = SharedFlagsModule.FFlagEnableMomentsCommentReporting
local MomentStatus = require(Parent.MomentsTypes).Enums.MomentStatus
local BuilderSansMedium = Enum.Font.BuilderSansMedium
local _Color3 = Color3.new(0, 0, 0)
local Center = Enum.TextXAlignment.Center
local _UDim2 = UDim2.fromScale(0.5, 0.5)

local function _(p1) --[[ Line: 33 | Named "toCaptureType" ]]
	return if p1 == "Screenshot" then Enum.CaptureType.Screenshot else Enum.CaptureType.Video
end

local _ = function(Deleted) --[[ Line: 41 | Named "toMomentStatus" ]]
	-- upvalues: MomentStatus (copy)
	return if Deleted == MomentStatus.Deleted then MomentStatus.Deleted else MomentStatus.Public
end

local _ = function(p1) --[[ Line: 49 | Named "toMomentEntityType" ]]
	-- upvalues: FFlagMomentsServeEDPVideos (copy)
	return if p1 == "experience" or p1 == "ad" then p1 elseif FFlagMomentsServeEDPVideos and p1 == "edpVideo" then p1 else nil
end

local function toEnumItem(TextXAlignment, Text: string, BuilderSansMedium) --[[ Line: 59 ]]
	if typeof(Text) == "EnumItem" then
		return Text
	elseif type(Text) == "string" then
		local Match: string = string.match(Text, "([^%.]+)$") or Text
		local Success, Result = pcall(function() --[[ Line: 68 ]]
			-- upvalues: TextXAlignment (copy), Match (copy)
			return TextXAlignment[Match]
		end)
		
		return if Success and Result ~= nil then Result else BuilderSansMedium
	else
		return BuilderSansMedium
	end
end

local function toColor3(Entry) --[[ Line: 77 ]]
	-- upvalues: _Color3 (copy)
	if typeof(Entry) == "Color3" then
		return Entry
	elseif type(Entry) == "table" then
		local R = Entry.R or (Entry.r or (Entry.Red or (Entry.red or Entry[1])))
		local G = Entry.G or (Entry.g or (Entry.Green or (Entry.green or Entry[2])))
		local B = Entry.B or (Entry.b or (Entry.Blue or (Entry.blue or Entry[3])))
		
		return if type(R) == "number" and type(G) == "number" and type(B) == "number" then if R > 1 or G > 1 or B > 1 then Color3.fromRGB(R, G, B) else Color3.new(R, G, B) else _Color3
	else
		return _Color3
	end
end

local function toUDim2(Entry) --[[ Line: 98 ]]
	-- upvalues: _UDim2 (copy)
	if typeof(Entry) == "UDim2" then
		return Entry
	elseif type(Entry) ~= "table" then
		return _UDim2
	elseif type(Entry[1]) == "number" and type(Entry[2]) == "number" then
		return UDim2.fromScale(Entry[1], Entry[2])
	else
		local X = Entry.X or Entry.x
		local Y = Entry.Y or Entry.y
		
		return if type(X) == "table" and type(Y) == "table" then UDim2.new(X.Scale or (X.scale or 0), X.Offset or (X.offset or 0), Y.Scale or (Y.scale or 0), Y.Offset or (Y.offset or 0)) else UDim2.new(Entry.XScale or (Entry.xScale or (Entry.scaleX or (Entry[1] or 0.5))), Entry.XOffset or (Entry.xOffset or (Entry.offsetX or (Entry[2] or 0))), Entry.YScale or (Entry.yScale or (Entry.scaleY or (Entry[3] or 0.5))), Entry.YOffset or (Entry.yOffset or (Entry.offsetY or (Entry[4] or 0))))
	end
end

local function normalizeTextOverlayEdit(p1) --[[ Line: 129 ]]
	-- upvalues: toUDim2 (copy), toEnumItem (copy), BuilderSansMedium (copy), toColor3 (copy), Center (copy)
	if type(p1) == "table" then
		local TextOverlayStyle = p1.textOverlayStyle or {}
		
		return {
			position = toUDim2(p1.position),
			rotation = if type(p1.rotation) == "number" then p1.rotation else 0,
			scale = if type(p1.scale) == "number" then p1.scale else 1,
			text = if type(p1.text) == "string" then p1.text else "",
			textOverlayStyle = {
				font = toEnumItem(Enum.Font, TextOverlayStyle.font, BuilderSansMedium),
				fontColor = toColor3(TextOverlayStyle.fontColor),
				fontSize = if type(TextOverlayStyle.fontSize) == "number" then TextOverlayStyle.fontSize else 16,
				textXAlignment = toEnumItem(Enum.TextXAlignment, TextOverlayStyle.textXAlignment, Center)
			},
			zIndex = if type(p1.zIndex) == "number" then p1.zIndex else 1
		}
	else
		return nil
	end
end

local function normalizeStickerOverlayEdit(p1) --[[ Line: 152 ]]
	-- upvalues: toUDim2 (copy)
	return if type(p1) == "table" and (type(p1.stickerURI) == "string" and p1.stickerURI ~= "") then {
		position = toUDim2(p1.position),
		rotation = if type(p1.rotation) == "number" then p1.rotation else 0,
		scale = if type(p1.scale) == "number" then p1.scale else 1,
		stickerSize = if type(p1.stickerSize) == "number" then p1.stickerSize else 1,
		stickerURI = if type(p1.stickerURI) == "string" then p1.stickerURI else "",
		zIndex = if type(p1.zIndex) == "number" then p1.zIndex else 1
	} else nil
end

local function normalizeTtsEdit(p1) --[[ Line: 171 ]]
	if type(p1) == "table" then
		local Number: number? = tonumber(p1.assetId)
		
		return if Number == nil or Number <= 0 then nil else {
			text = if type(p1.text) == "string" then p1.text else "",
			voiceId = if type(p1.voiceId) == "number" then p1.voiceId else 0,
			startTime = if type(p1.startTime) == "number" then p1.startTime else 0,
			assetId = Number,
			assetAccessContext = if type(p1.assetAccessContext) == "string" then p1.assetAccessContext else nil
		}
	else
		return nil
	end
end

local function normalizeCaptureEdits(ScreenshotCaptureEdits) --[[ Line: 189 ]]
	-- upvalues: normalizeTextOverlayEdit (copy), FFlagMomentsStickerOverlayNormalizationModule (copy), normalizeStickerOverlayEdit (copy), normalizeTtsEdit (copy)
	if ScreenshotCaptureEdits == nil then
		return nil
	end
	local TextOverlays = nil
	
	if type(ScreenshotCaptureEdits.textOverlays) == "table" then
		local List = {}
		
		for _, textOverlay in ScreenshotCaptureEdits.textOverlays do
			local NormalizeTextOverlayEditResult = normalizeTextOverlayEdit(textOverlay)
			
			if NormalizeTextOverlayEditResult ~= nil then
				table.insert(List, NormalizeTextOverlayEditResult)
			end
		end
		if #List > 0 then
			TextOverlays = List
		end
	end
	local StickerOverlays = nil
	
	if FFlagMomentsStickerOverlayNormalizationModule() and type(ScreenshotCaptureEdits.stickerOverlays) == "table" then
		local List = {}
		
		for _, stickerOverlay in ScreenshotCaptureEdits.stickerOverlays do
			local NormalizeStickerOverlayEditResult = normalizeStickerOverlayEdit(stickerOverlay)
			
			if NormalizeStickerOverlayEditResult ~= nil then
				table.insert(List, NormalizeStickerOverlayEditResult)
			end
		end
		if #List > 0 then
			StickerOverlays = List
		end
	end
	local TtsAudios = nil
	
	if type(ScreenshotCaptureEdits.ttsAudios) == "table" then
		local List = {}
		
		for _, ttsAudio in ScreenshotCaptureEdits.ttsAudios do
			local NormalizeTtsEditResult = normalizeTtsEdit(ttsAudio)
			
			if NormalizeTtsEditResult ~= nil then
				table.insert(List, NormalizeTtsEditResult)
			end
		end
		if #List > 0 then
			TtsAudios = List
		end
	end
	return {
		trim = ScreenshotCaptureEdits.trim,
		music = ScreenshotCaptureEdits.music,
		ttsAudios = TtsAudios,
		textOverlays = TextOverlays,
		stickerOverlays = StickerOverlays
	}
end

local _ = function(p1): number? --[[ Line: 246 | Named "reactionTotal" ]]
	if p1 == nil or p1.counts == nil then
		return nil
	end
	local Total = 0
	
	for _, count in p1.counts do
		Total += count
	end
	return Total
end

local function convertApiMomentToMomentItem(p2) --[[ Line: 259 ]]
	-- upvalues: FFlagMomentsServeEDPVideos (copy), normalizeCaptureEdits (copy), MomentStatus (copy), FFlagEnableMomentsCommentReporting (copy), GetFFlagMomentsRenderPostAssetsModule (copy), FFlagMomentsComments (copy), FFlagMomentsCommentsIxpEnabled (copy), ConvertApiMomentCommentsModule (copy)
	local CaptionedAssetMoment = p2.captionedAssetMoment
	local Owner = p2.owner
	local IsEdpVideo = if FFlagMomentsServeEDPVideos then p2.entityType == "edpVideo" else nil
	local Id = if FFlagMomentsServeEDPVideos and IsEdpVideo then p2.id or (if CaptionedAssetMoment == nil or CaptionedAssetMoment.assetId == nil then nil else tostring(CaptionedAssetMoment.assetId)) else p2.entityId or p2.id
	local FeedItemId = p2.feedItemId
	
	if CaptionedAssetMoment == nil or CaptionedAssetMoment.assetId == nil or (not FFlagMomentsServeEDPVideos or not IsEdpVideo) and (Owner == nil or Owner.id == nil) or (Id == nil or FeedItemId == nil or FeedItemId == "") then
		return nil
	end
	local ExperienceCta = if p2.primaryCta == nil then nil else p2.primaryCta.experienceCta
	local Number = if FFlagMomentsServeEDPVideos then if ExperienceCta == nil then if IsEdpVideo then tonumber(p2.entityId) else nil else ExperienceCta.experienceId else nil
	local Status = CaptionedAssetMoment.status or p2.status
	local Deleted = if Status == MomentStatus.Deleted then MomentStatus.Deleted else MomentStatus.Public
	local config = {
		assetId = CaptionedAssetMoment.assetId,
		channelId = if FFlagEnableMomentsCommentReporting and type(p2.channelId) == "string" and p2.channelId ~= "" then p2.channelId else nil,
		creatorId = if FFlagMomentsServeEDPVideos and (Owner == nil or Owner.id == nil) then 0 else Owner.id,
		isModerated = CaptionedAssetMoment.isModerated
	}
	local Metadata = {
		assetToken = CaptionedAssetMoment.assetToken,
		assetTotalDuration = CaptionedAssetMoment.assetTotalDuration,
		assetAccessContext = CaptionedAssetMoment.assetAccessContext,
		captureType = if CaptionedAssetMoment.captureType == "Screenshot" then Enum.CaptureType.Screenshot else Enum.CaptureType.Video,
		description = CaptionedAssetMoment.caption,
		edits = normalizeCaptureEdits(if CaptionedAssetMoment.captureType == "Screenshot" then CaptionedAssetMoment.screenshotCaptureEdits else CaptionedAssetMoment.videoCaptureEdits),
		experienceName = if ExperienceCta == nil then nil else ExperienceCta.experienceName
	}
	local Reactions = p2.reactions
	local LikeCount = nil
	
	if Reactions == nil or Reactions.counts == nil then
		LikeCount = nil
	else
		local Total = 0
		
		for _, count in Reactions.counts do
			Total += count
		end
		LikeCount = Total
	end
	Metadata.likeCount = LikeCount
	Metadata.partnerUploadType = CaptionedAssetMoment.partnerUploadType
	Metadata.placeId = if ExperienceCta == nil then nil else ExperienceCta.placeId
	Metadata.universeId = if FFlagMomentsServeEDPVideos then Number elseif ExperienceCta == nil then nil else ExperienceCta.experienceId
	config.metadata = Metadata
	local EntityType = nil
	
	if FFlagMomentsServeEDPVideos then
		local EntityType1 = p2.entityType
		EntityType = if EntityType1 == "experience" or EntityType1 == "ad" then EntityType1 elseif FFlagMomentsServeEDPVideos and EntityType1 == "edpVideo" then EntityType1 else nil
	else
		EntityType = nil
	end
	config.entityType = EntityType
	config.momentId = Id
	config.postAsset = if GetFFlagMomentsRenderPostAssetsModule() and p2.postAsset ~= nil and p2.postAsset.postAssetId ~= nil then { postAssetId = p2.postAsset.postAssetId } else nil
	config.recommendationMetadata = { feedItemId = FeedItemId, tracingId = p2.feedSessionId }
	config.status = Deleted
	
	if FFlagMomentsComments or FFlagMomentsCommentsIxpEnabled then
		local ConvertApiMomentCommentsModuleResult = ConvertApiMomentCommentsModule(p2.comments)
		
		if ConvertApiMomentCommentsModuleResult ~= nil then
			config.comments = ConvertApiMomentCommentsModuleResult
		end
	end
	return config
end

return function(List) --[[ Line: 344 | Named "convertApiMomentsToMomentItems" ]]
	-- upvalues: convertApiMomentToMomentItem (copy)
	local List1 = {}
	
	if List == nil then
		return List1
	end
	for _, value in ipairs(List) do
		local ConvertApiMomentToMomentItemResult = convertApiMomentToMomentItem(value)
		
		if ConvertApiMomentToMomentItemResult ~= nil then
			table.insert(List1, ConvertApiMomentToMomentItemResult)
		end
	end
	return List1
end