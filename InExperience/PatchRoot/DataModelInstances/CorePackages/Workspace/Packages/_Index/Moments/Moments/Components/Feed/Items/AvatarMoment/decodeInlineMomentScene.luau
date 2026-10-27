local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Moments.Components.Feed.FeedTypes)
local DecodeMomentSceneProtoModule = require(script.Parent.decodeMomentSceneProto)

local function defaultDeserializeInstancesAsync(Buffer1)
	return game:GetService("SerializationService"):DeserializeInstancesAsync(Buffer1)
end

local function defaultBase64Decode(Input)
	return game:GetService("EncodingService"):Base64Decode(Input)
end

local function defaultDecodeMomentScene(p1)
	-- upvalues: DecodeMomentSceneProtoModule (copy)
	return DecodeMomentSceneProtoModule(p1)
end

local function defaultDestroyInstance(Object)
	Object:Destroy()
end

local function destroyRoots(List, Callback)
	for _, value in List do
		pcall(function()
			-- upvalues: Callback (copy), value (copy)
			Callback(value)
		end)
	end
end

local function findRecipeValue(List)
	local MomentSceneData = nil
	for _, value in List do
		local MomentScene = if value.Name == "MomentScene" then value else value:FindFirstChild("MomentScene", true)
		local NoMomentScene = MomentScene == nil
		
		if not NoMomentScene then
			MomentSceneData = MomentScene:FindFirstChild("MomentSceneData")
			NoMomentScene = MomentSceneData == nil or not MomentSceneData:IsA("StringValue")
		end
		if not NoMomentScene then
			return MomentSceneData
		end
	end
	return nil
end

local function _(p1: number)
	return if typeof(p1) == "number" and p1 > 0 then p1 else nil
end

local function parseMomentScenesAsset(List, OutfitId)
	-- upvalues: Parent (copy)
	local ParseSceneAssetFunction = require(Parent.MomentScenes).parseSceneAsset
	local ParseSceneAssetResult = nil
	
	for _, value in List do
		ParseSceneAssetResult = ParseSceneAssetFunction(value)
		
		if ParseSceneAssetResult.type ~= nil or next(ParseSceneAssetResult.args) ~= nil then
			local Type = ParseSceneAssetResult.type or "AvatarMoment"
			
			if Type ~= "AvatarMoment" then
				error(`Inline MomentScene type {Type} is not AvatarMoment`)
			end
			local OutfitId1: number = ParseSceneAssetResult.args.outfitId
			local OutfitId2 = if typeof(OutfitId1) == "number" and OutfitId1 > 0 then OutfitId1 else nil
			
			if OutfitId2 == nil then
				error("Inline MomentScene has no valid outfit id")
			end
			if OutfitId2 ~= OutfitId then
				error(`MomentScene outfit {OutfitId2} does not match Post annotation {OutfitId}`)
			end
			return { type = "AvatarMoment", args = ParseSceneAssetResult.args }
		end
	end
	error("Inline MomentScene RBXM has neither MomentScene/MomentSceneData nor a MomentScenes Type/Args folder")
end

local function optionalUtf8String(Buf)
	local Text = if typeof(Buf) == "buffer" then buffer.tostring(Buf) elseif typeof(Buf) == "string" then Buf else ""
	
	if Text == "" then
		return nil
	end
	if utf8.len(Text) == nil then
		error("MomentScene emote_name is not valid UTF-8")
	end
	return Text
end

return function(Buf, OutfitId: number, p1)
	-- upvalues: defaultDeserializeInstancesAsync (copy), defaultBase64Decode (copy), defaultDecodeMomentScene (copy), defaultDestroyInstance (copy), findRecipeValue (copy), parseMomentScenesAsset (copy), optionalUtf8String (copy), destroyRoots (copy)
	if buffer.len(Buf) == 0 then
		error("Inline MomentScene RBXM is empty")
	end
	if OutfitId <= 0 then
		error("Avatar annotation has no valid outfit id")
	end
	local P10 = p1 or {}
	local DeserializeInstancesAsync = P10.deserializeInstancesAsync or defaultDeserializeInstancesAsync
	local Base64Decode = P10.base64Decode or defaultBase64Decode
	local DecodeMomentScene = P10.decodeMomentScene or defaultDecodeMomentScene
	local DestroyInstance = P10.destroyInstance or defaultDestroyInstance
	local t = {}
	local Success, Result = pcall(function()
		-- upvalues: t (ref), DeserializeInstancesAsync (copy), Buf (copy), findRecipeValue (upval), parseMomentScenesAsset (upval), OutfitId (copy), Base64Decode (copy), DecodeMomentScene (copy), optionalUtf8String (upval)
		t = DeserializeInstancesAsync(Buf)
		local RecipeValue = findRecipeValue(t)
		
		if RecipeValue == nil then
			return parseMomentScenesAsset(t, OutfitId)
		end
		local Value = RecipeValue.Value
		
		if Value == "" then
			error("MomentSceneData is empty")
		end
		local DecodeMomentSceneResult = DecodeMomentScene((Base64Decode(buffer.fromstring(Value))))
		local OutfitId1: number = DecodeMomentSceneResult.outfit_id
		local OutfitId2 = if typeof(OutfitId1) == "number" and OutfitId1 > 0 then OutfitId1 else nil
		
		if OutfitId2 == nil then
			error("MomentScene recipe has no valid outfit id")
		end
		if OutfitId2 ~= OutfitId then
			error(`MomentScene outfit {OutfitId2} does not match Post annotation {OutfitId}`)
		end
		local EmoteAssetId: number = DecodeMomentSceneResult.emote_asset_id
		local EmoteAssetId1 = if typeof(EmoteAssetId) == "number" and EmoteAssetId > 0 then EmoteAssetId else nil
		local BackgroundAssetId: number = DecodeMomentSceneResult.background_asset_id
		
		return {
			type = "AvatarMoment",
			args = {
				outfitId = OutfitId2,
				emoteId = EmoteAssetId1,
				backgroundAssetId = if typeof(BackgroundAssetId) == "number" and BackgroundAssetId > 0 then BackgroundAssetId else nil,
				emote = optionalUtf8String(DecodeMomentSceneResult.emote_name)
			}
		}
	end)
	destroyRoots(t, DestroyInstance)
	
	if not Success then
		error(Result)
	end
	return Result
end