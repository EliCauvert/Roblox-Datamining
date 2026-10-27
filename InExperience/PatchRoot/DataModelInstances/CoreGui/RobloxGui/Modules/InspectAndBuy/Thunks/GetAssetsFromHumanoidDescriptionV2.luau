local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local SetEquippedAssetsModule = require(Parent.Actions.SetEquippedAssets)
local ConstantsModule = require(Parent.Constants)
local GetAvatarPreviewModule = require(Parent.Thunks.GetAvatarPreview)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarBackgroundModule = require(CorePackages.Workspace.Packages.DataHydration.AvatarBackground)
local FFlagAXInspectAndBuyMakeupSupport = AvatarExperienceFlagsModule.FFlagAXInspectAndBuyMakeupSupport
local FFlagAXInspectAndBuyAvatarBackground = AvatarExperienceFlagsModule.FFlagAXInspectAndBuyAvatarBackground
local t = {}

local function getAssetIds(Humanoid: Humanoid)
	-- upvalues: ConstantsModule (copy), AssetInfoModule (copy), FFlagAXInspectAndBuyMakeupSupport (copy)
	local FromHumanoidDescriptionResults = {}
	local Flag = false
	
	for i, value in ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil then
			local Text = Humanoid[value] or ""
			local IsIMatch: boolean = i == tostring(Enum.AssetType.Head.Value) or i == tostring(Enum.AssetType.DynamicHead.Value)
			
			if not Flag or not IsIMatch then
				if IsIMatch then
					Flag = true
				end
				for _, value1 in string.split(Text) do
					if tonumber(value1) and value1 ~= "0" then
						table.insert(FromHumanoidDescriptionResults, AssetInfoModule.fromHumanoidDescription(value1))
					end
				end
			end
		end
	end
	for _, accessory in Humanoid:GetAccessories(true) do
		FromHumanoidDescriptionResults[#FromHumanoidDescriptionResults + 1] = AssetInfoModule.fromHumanoidDescriptionAccessory(accessory)
	end
	for _, emote in Humanoid:GetEmotes() do
		for _, value2 in emote do
			FromHumanoidDescriptionResults[#FromHumanoidDescriptionResults + 1] = AssetInfoModule.fromHumanoidDescription(value2)
		end
	end
	if FFlagAXInspectAndBuyMakeupSupport then
		for _, MakeupDescription in Humanoid:GetChildren() do
			if MakeupDescription:IsA("MakeupDescription") and MakeupDescription.AssetId > 0 then
				FromHumanoidDescriptionResults[#FromHumanoidDescriptionResults + 1] = AssetInfoModule.fromHumanoidDescription(MakeupDescription.AssetId)
			end
		end
	end
	return FromHumanoidDescriptionResults
end

local function withEquippedBackground(p1, Tbl, PlayerId)
	-- upvalues: PromiseModule (copy), AvatarBackgroundModule (copy), AssetInfoModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return if PlayerId == nil or PlayerId == "" then PromiseModule.resolve(Tbl) else AvatarBackgroundModule.getAvatarBackgroundStore(false).awaitAvatarBackground(PlayerId):andThen(function(Result)
		-- upvalues: Tbl (copy), AssetInfoModule (upval)
		if Result.assetId then
			local Copy = table.clone(Tbl)
			table.insert(Copy, AssetInfoModule.fromHumanoidDescription(Result.assetId))
			
			return Copy
		else
			return Tbl
		end
	end):catch(function()
		-- upvalues: p1 (copy), SendCounterModule (upval), ConstantsModule (upval), Tbl (copy)
		p1:dispatch(SendCounterModule(ConstantsModule.Counters.GetAvatarBackground .. ConstantsModule.CounterSuffix.RequestFailed))
		
		return Tbl
	end)
end

local function _(p1, p2, p3)
	-- upvalues: withEquippedBackground (copy), GetAvatarPreviewModule (copy)
	withEquippedBackground(p1, p2, p1:getState().playerId):andThen(function(Result)
		-- upvalues: p3 (copy), p1 (copy), GetAvatarPreviewModule (upval)
		if not p3 or p3() then
			p1:dispatch(GetAvatarPreviewModule(Result))
			
			return
		end
	end)
end

return function(Humanoid, p1, Callback)
	-- upvalues: ThunkModule (copy), t (copy), getAssetIds (copy), FFlagAXInspectAndBuyAvatarBackground (copy), withEquippedBackground (copy), GetAvatarPreviewModule (copy), SetEquippedAssetsModule (copy)
	return ThunkModule.new(script.Name, t, function(p2, _)
		-- upvalues: getAssetIds (upval), Humanoid (copy), p1 (copy), FFlagAXInspectAndBuyAvatarBackground (upval), Callback (copy), withEquippedBackground (upval), GetAvatarPreviewModule (upval), SetEquippedAssetsModule (upval)
		local AssetIds = getAssetIds(Humanoid)
		
		if p1 then
			p2:dispatch(SetEquippedAssetsModule(AssetIds))
			
			return
		end
		if FFlagAXInspectAndBuyAvatarBackground then
			withEquippedBackground(p2, AssetIds, p2:getState().playerId):andThen(function(Result)
				-- upvalues: Callback (copy), p2 (copy), GetAvatarPreviewModule (upval)
				if not Callback or Callback() then
					p2:dispatch(GetAvatarPreviewModule(Result))
					
					return
				end
			end)
			
			return
		else
			p2:dispatch(GetAvatarPreviewModule(AssetIds))
		end
	end)
end