local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SetAnimationPreviewModule = require(Modules.AvatarExperience.Common.Actions.SetAnimationPreview)
local UseEffectOnMountFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount
local TutilsModule = require(CorePackages.Packages.tutils)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local list = {
	{
		Label = "Feature.Avatar.Label.Idle",
		AssetType = ConstantsModule.AssetTypeIdStrings.IdleAnimation
	},
	{
		Label = "Feature.Avatar.Label.Walk",
		AssetType = ConstantsModule.AssetTypeIdStrings.WalkAnimation
	},
	{
		Label = "Feature.Avatar.Label.Run",
		AssetType = ConstantsModule.AssetTypeIdStrings.RunAnimation
	},
	{
		Label = "Feature.Avatar.Label.Jump",
		AssetType = ConstantsModule.AssetTypeIdStrings.JumpAnimation
	},
	{
		Label = "Feature.Avatar.Label.Fall",
		AssetType = ConstantsModule.AssetTypeIdStrings.FallAnimation
	},
	{
		Label = "Feature.Avatar.Label.Climb",
		AssetType = ConstantsModule.AssetTypeIdStrings.ClimbAnimation
	},
	{
		Label = "Feature.Avatar.Label.Swim",
		AssetType = ConstantsModule.AssetTypeIdStrings.SwimAnimation
	}
}

local function getAssetIds(p1)
	-- upvalues: ConstantsModule (copy)
	local Ids = {}
	
	if p1 and p1.items then
		for _, item in p1.items do
			if item.type == ConstantsModule.ItemType.Asset then
				Ids[#Ids + 1] = item.id
			end
		end
	end
	return Ids
end

local function getAssetInfosByAssetType(p2, p3)
	-- upvalues: getAssetIds (copy)
	local t = {}
	local Flag = false
	
	for _, value in getAssetIds(p3) do
		local v1 = p2[value]
		
		if not v1 then
			return nil
		end
		if not v1.assetType then
			return nil
		end
		assert(v1.assetType, "silence type checker")
		t[v1.assetType] = v1
		Flag = true
	end
	return if Flag then t else nil
end

local function selectAssetInfos(p4)
	return p4.AvatarExperience.Common.AssetInfos
end

return function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), UseEffectOnMountFunction (copy), ItemDataModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), selectAssetInfos (copy), getAssetInfosByAssetType (copy), TutilsModule (copy), list (copy), SetAnimationPreviewModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	UseEffectOnMountFunction(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end)
	local UseSelectorResult = UseSelectorFunction(ReactModule.useCallback(function(p4)
		-- upvalues: UseStateResult1 (copy), UseStateResult3 (copy), ItemDataModule (upval)
		return if UseStateResult1 and UseStateResult3 then ItemDataModule(p4.AvatarExperience.Common, UseStateResult1, UseStateResult3) else nil
	end, { UseStateResult1, UseStateResult3 }), GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(selectAssetInfos, GetUseSelectorDeepEqualsFunction())
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), getAssetInfosByAssetType (upval), UseSelectorResult1 (copy), TutilsModule (upval), UseRefResult2 (copy), list (upval), UseRefResult1 (copy)
		if UseSelectorResult ~= nil then
			local AssetInfosByAssetType = getAssetInfosByAssetType(UseSelectorResult1, UseSelectorResult)
			
			if not TutilsModule.deepEqual(AssetInfosByAssetType, UseRefResult2.current) then
				UseRefResult2.current = AssetInfosByAssetType
				
				if AssetInfosByAssetType then
					local Current = {}
					
					for _, value in list do
						if AssetInfosByAssetType[value.AssetType] then
							Current[#Current + 1] = value
						end
					end
					UseRefResult1.current = Current
					
					return
				else
					UseRefResult1.current = {}
				end
			end
		end
	end, { UseSelectorResult, UseSelectorResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseDispatchResult (copy), SetAnimationPreviewModule (upval)
		if UseStateResult > 0 and #UseRefResult1.current > 0 then
			local CurrentEntry = UseRefResult1.current[UseStateResult]
			local CurrentEntry1 = if CurrentEntry and UseRefResult2.current and UseRefResult2.current[CurrentEntry.AssetType] then UseRefResult2.current[CurrentEntry.AssetType] else nil
			
			if CurrentEntry1 then
				UseDispatchResult(SetAnimationPreviewModule(CurrentEntry1.id, CurrentEntry.AssetType))
			end
		end
	end, { UseStateResult })
	
	return (ReactModule.useCallback(function(p4, p5, p6)
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseRefResult (copy), UseStateResult2 (copy), UseRefResult1 (copy)
		UseStateResult2_1(p4)
		UseStateResult2_2(p5)
		
		if p6 == "2" and not UseRefResult.current then
			UseRefResult.current = true
			task.spawn(function()
				-- upvalues: UseStateResult2 (upval), UseRefResult (upval), UseRefResult1 (upval)
				UseStateResult2(function(p7)
					return if p7 == 0 then 1 else p7
				end)
				while UseRefResult.current do
					task.wait(2)
					UseStateResult2(function(p7: number): number
						-- upvalues: UseRefResult1 (upval)
						local v2 = p7 + 1
						
						return if #UseRefResult1.current < v2 then 1 else v2
					end)
				end
			end)
		end
	end, {}))
end