local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local TutilsModule = require(CorePackages.Packages.tutils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ClearAnimationPreviewModule = require(Modules.AvatarExperience.Common.Actions.ClearAnimationPreview)
local SetAnimationPreviewModule = require(Modules.AvatarExperience.Common.Actions.SetAnimationPreview)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local list = {
	ConstantsModule.AssetTypeIdStrings.IdleAnimation,
	ConstantsModule.AssetTypeIdStrings.WalkAnimation,
	ConstantsModule.AssetTypeIdStrings.RunAnimation,
	ConstantsModule.AssetTypeIdStrings.JumpAnimation,
	ConstantsModule.AssetTypeIdStrings.FallAnimation,
	ConstantsModule.AssetTypeIdStrings.ClimbAnimation,
	ConstantsModule.AssetTypeIdStrings.SwimAnimation
}

local function getAssetIds(p1)
	-- upvalues: ConstantsModule (copy)
	local Ids = {}
	
	if p1.items then
		for _, item in p1.items do
			if item.type == ConstantsModule.ItemType.Asset then
				table.insert(Ids, item.id)
			end
		end
	end
	return Ids
end

local function getAssetInfoByAssetType(AssetInfos, UseMemoResult)
	local t = {}
	
	for _, value in UseMemoResult do
		local AssetInfo = AssetInfos[value]
		
		if not AssetInfo or not AssetInfo.assetType then
			return nil
		end
		t[AssetInfo.assetType] = AssetInfo
	end
	return t
end

local function _(p2)
	-- upvalues: list (copy)
	local List = {}
	
	for _, value in list do
		if p2[value] then
			table.insert(List, value)
		end
	end
	return List
end

local _ = function(p3, p4)
	-- upvalues: getAssetInfoByAssetType (copy)
	return (getAssetInfoByAssetType(p3.AvatarExperience.Common.AssetInfos, p4))
end

return function(p3)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAnalytics (copy), UseLocalizationFunction (copy), ConstantsModule (copy), UseDispatchFunction (copy), ReactModule (copy), getAssetIds (copy), getAssetInfoByAssetType (copy), UseSelectorFunction (copy), TutilsModule (copy), list (copy), SetAnimationPreviewModule (copy), ClearAnimationPreviewModule (copy), FetchAssetOrBundleInfoModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseLocalizationResult = UseLocalizationFunction({
		[ConstantsModule.AssetTypeIdStrings.IdleAnimation] = "Feature.Avatar.Label.Idle",
		[ConstantsModule.AssetTypeIdStrings.WalkAnimation] = "Feature.Avatar.Label.Walk",
		[ConstantsModule.AssetTypeIdStrings.RunAnimation] = "Feature.Avatar.Label.Run",
		[ConstantsModule.AssetTypeIdStrings.JumpAnimation] = "Feature.Avatar.Label.Jump",
		[ConstantsModule.AssetTypeIdStrings.FallAnimation] = "Feature.Avatar.Label.Fall",
		[ConstantsModule.AssetTypeIdStrings.ClimbAnimation] = "Feature.Avatar.Label.Climb",
		[ConstantsModule.AssetTypeIdStrings.SwimAnimation] = "Feature.Avatar.Label.Swim"
	})
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: getAssetIds (upval), p3 (copy)
		return (getAssetIds(p3))
	end, { p3 })
	local UseSelectorResult = UseSelectorFunction(ReactModule.useCallback(function(p4)
		-- upvalues: UseMemoResult (copy), getAssetInfoByAssetType (upval)
		return (getAssetInfoByAssetType(p4.AvatarExperience.Common.AssetInfos, UseMemoResult))
	end, { UseMemoResult }), TutilsModule.deepEqual)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), list (upval)
		local UseSelectorResult1 = UseSelectorResult or {}
		local List = {}
		
		for _, value in list do
			if UseSelectorResult1[value] then
				table.insert(List, value)
			end
		end
		return List
	end, { UseSelectorResult })
	local UseMemoResultEntry = UseMemoResult1[UseStateResult]
	local UseSelectorResultEntry = if UseMemoResultEntry and UseSelectorResult then UseSelectorResult[UseMemoResultEntry] else nil
	local Id = if UseSelectorResultEntry then UseSelectorResultEntry.id else nil
	ReactModule.useEffect(function()
		-- upvalues: Id (copy), UseMemoResultEntry (copy), UseDispatchResult (copy), SetAnimationPreviewModule (upval), ClearAnimationPreviewModule (upval)
		if Id and UseMemoResultEntry then
			UseDispatchResult(SetAnimationPreviewModule(Id, UseMemoResultEntry))
		end
		return function()
			-- upvalues: UseDispatchResult (upval), ClearAnimationPreviewModule (upval)
			UseDispatchResult(ClearAnimationPreviewModule())
		end
	end, { UseDispatchResult, Id, UseMemoResultEntry })
	local CountUseMemoResult1 = #UseMemoResult1
	ReactModule.useEffect(function()
		-- upvalues: CountUseMemoResult1 (copy), UseStateResult2 (copy)
		local Connection = nil
		
		if CountUseMemoResult1 ~= 0 then
			UseStateResult2(1)
			local Count = 0
			Connection = game:GetService("RunService").Heartbeat:Connect(function(DeltaTime: number)
				-- upvalues: Count (ref), UseStateResult2 (upval), CountUseMemoResult1 (upval)
				Count += DeltaTime
				
				if Count > 2 then
					Count -= 2
					UseStateResult2(function(p4: number): number
						-- upvalues: CountUseMemoResult1 (upval)
						return p4 % CountUseMemoResult1 + 1
					end)
				end
			end)
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { CountUseMemoResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseDispatchResult (copy), FetchAssetOrBundleInfoModule (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), ConstantsModule (upval)
		for _, value in UseMemoResult do
			UseDispatchResult(FetchAssetOrBundleInfoModule(UseRoactServiceResult, UseRoactServiceResult1, value, ConstantsModule.ItemType.Asset))
		end
	end, {
		UseRoactServiceResult,
		UseRoactServiceResult1,
		UseMemoResult,
		UseDispatchResult
	})
	
	return {
		states = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult1 (copy), UseMemoResultEntry (copy), UseLocalizationResult (copy)
			local List = {}
			
			for _, value in UseMemoResult1 do
				table.insert(List, {
					isSelected = value == UseMemoResultEntry,
					text = UseLocalizationResult[value]
				})
			end
			return List
		end, {
			UseMemoResultEntry,
			UseMemoResult1,
			UseLocalizationResult
		})
	}
end