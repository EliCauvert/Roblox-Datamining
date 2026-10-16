local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local EditProfileImageAnalyticsModule = require(AvatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local AvatarEditorService = game:GetService("AvatarEditorService")

local function _(p1) --[[ Line: 42 | Named "getEmoteLabel" ]]
	local Name = p1.Name or p1.name
	
	return if typeof(Name) == "string" and Name ~= "" then Name else ""
end

local function getCurrentPageItems(Pages) --[[ Line: 51 ]]
	local List = {}
	
	for _, value in Pages:GetCurrentPage() do
		local Name = value.Name or value.name
		table.insert(List, {
			id = tostring(value.AssetId),
			label = if typeof(Name) == "string" and Name ~= "" then Name else ""
		})
	end
	return List
end

return function() --[[ Line: 62 | Named "useOwnedEmotes" ]]
	-- upvalues: ReactModule (copy), CryoModule (copy), getCurrentPageItems (copy), AvatarEditorService (copy), EditProfileImageAnalyticsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Id, p1) --[[ Line: 73 ]]
		-- upvalues: UseStateResult2 (copy), CryoModule (upval)
		UseStateResult2(function(List) --[[ Line: 74 ]]
			-- upvalues: Id (copy), CryoModule (upval), p1 (copy)
			for _, value in List do
				if value.id == Id then
					return List
				end
			end
			return CryoModule.List.join({ { id = Id, label = p1 or "" } }, List)
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 88 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy), UseStateResult2_6 (copy)
		UseRefResult.current = nil
		UseRefResult1.current = false
		UseStateResult2_1(true)
		UseStateResult2_2(false)
		UseStateResult2_3(false)
		UseStateResult2_4(false)
		UseStateResult2_5(false)
		UseStateResult2_6(function(p2: number): number --[[ Line: 96 ]]
			return p2 + 1
		end)
	end, {})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 101 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy), getCurrentPageItems (upval), UseStateResult2 (copy), CryoModule (upval), UseStateResult2_3 (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil and not Current.IsFinished and not UseRefResult1.current then
			UseRefResult1.current = true
			UseStateResult2_4(true)
			UseStateResult2_5(false)
			task.spawn(function() --[[ Line: 110 ]]
				-- upvalues: Current (copy), getCurrentPageItems (upval), UseRefResult1 (upval), UseStateResult2_4 (upval), UseStateResult2 (upval), CryoModule (upval), UseStateResult2_3 (upval), UseStateResult2_5 (upval)
				local Success, Result = pcall(function() --[[ Line: 111 ]]
					-- upvalues: Current (upval), getCurrentPageItems (upval)
					Current:AdvanceToNextPageAsync()
					
					return (getCurrentPageItems(Current))
				end)
				UseRefResult1.current = false
				UseStateResult2_4(false)
				
				if Success then
					UseStateResult2(function(p2) --[[ Line: 119 ]]
						-- upvalues: CryoModule (upval), Result (copy)
						return CryoModule.List.join(p2, Result)
					end)
					UseStateResult2_3(not Current.IsFinished)
					
					return
				else
					UseStateResult2_5(true)
				end
			end)
			
			return
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 129 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy), AvatarEditorService (upval), getCurrentPageItems (upval), UseStateResult2 (copy), UseStateResult2_3 (copy), EditProfileImageAnalyticsModule (upval), UseStateResult2_2 (copy), UseStateResult2_1 (copy)
		local Flag = false
		UseRefResult.current = nil
		UseRefResult1.current = false
		UseStateResult2_4(false)
		UseStateResult2_5(false)
		task.spawn(function() --[[ Line: 136 ]]
			-- upvalues: AvatarEditorService (upval), getCurrentPageItems (upval), Flag (ref), UseRefResult (upval), UseStateResult2 (upval), UseStateResult2_3 (upval), EditProfileImageAnalyticsModule (upval), UseStateResult2_2 (upval), UseStateResult2_1 (upval)
			local Success, Result = pcall(function() --[[ Line: 137 ]]
				-- upvalues: AvatarEditorService (upval), getCurrentPageItems (upval)
				local InventoryAsync = AvatarEditorService:GetInventoryAsync({ Enum.AvatarAssetType.EmoteAnimation })
				
				return {
					items = getCurrentPageItems(InventoryAsync),
					pageObject = InventoryAsync
				}
			end)
			
			if Flag then return end
			if Success then
				UseRefResult.current = Result.pageObject
				UseStateResult2(Result.items)
				UseStateResult2_3(not Result.pageObject.IsFinished)
			else
				EditProfileImageAnalyticsModule.logFetchFailure({ assetType = "emotes" })
				UseStateResult2_2(true)
				UseStateResult2_3(false)
			end
			UseStateResult2_1(false)
		end)
		
		return function() --[[ Line: 163 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { UseStateResult7 })
	
	return {
		emoteItems = UseStateResult,
		isLoading = UseStateResult1,
		hasError = UseStateResult3,
		refetch = UseResult1,
		onMoreEmotes = UseResult2,
		hasMoreEmotes = UseStateResult4,
		isLoadingMoreEmotes = UseStateResult5,
		hasLoadMoreError = UseStateResult6,
		markEmoteOwned = UseResult
	}
end