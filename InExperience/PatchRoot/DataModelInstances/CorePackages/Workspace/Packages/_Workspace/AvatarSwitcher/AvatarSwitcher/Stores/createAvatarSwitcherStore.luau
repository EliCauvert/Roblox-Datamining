local avatarEditorService = game:GetService("AvatarEditorService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local url = require(parent.Http).Url
local cryoModule = require(parent.Cryo)
local inventoryItemAvailability = require(parent.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local applyOutfitModule = require(avatarSwitcher.Utils.applyOutfit)
local experienceAvatarSupportTypeModule = require(avatarSwitcher.Enums.ExperienceAvatarSupportType)
local constantsModule = require(avatarSwitcher.Constants)
local fFlagAvatarSwitcherUseAvatarInventoryEndpoint = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherUseAvatarInventoryEndpoint
local fFlagAvatarSwitcherAccurateAvatarWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local fFlagAvatarSwitcherCounters = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherCounters
local fFlagAvatarSwitcherExpiredItemsWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherExpiredItemsWarning
local fFlagAXInventoryIncludeUnavailableItems = require(parent.AvatarExperienceFlags).FFlagAXInventoryIncludeUnavailableItems
local avatarSwitcherPcallApplyOutfit = game:DefineFastFlag("AvatarSwitcherPcallApplyOutfit", false)
local _ = require(avatarSwitcher.types)
local text = url.AVATAR_URL .. "v1/avatar-inventory?"
local text_1 = url.AVATAR_URL .. "v2/avatar/experience/get-experience-avatar-support"

return function() --[[ line: 42 | named "createAvatarSwitcherStore" ]]
	-- upvalues: createSignal (ref), createComputed (ref), avatarEditorService (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref), cryoModule (ref), fFlagAvatarSwitcherUseAvatarInventoryEndpoint (ref), fFlagAXInventoryIncludeUnavailableItems (ref), text (ref), url (ref), httpRbxApiService (ref), httpService (ref), fFlagAvatarSwitcherCounters (ref), sendAXCounterV2 (ref), constantsModule (ref), inventoryItemAvailability (ref), fFlagAvatarSwitcherExpiredItemsWarning (ref), avatarSwitcherPcallApplyOutfit (ref), applyOutfitModule (ref), text_1 (ref), experienceAvatarSupportTypeModule (ref), playersService (ref)
	local var13, var14 = createSignal({})
	local var15, var16 = createSignal({})
	local var17, var18 = createSignal(false)
	local var19, var20 = createSignal(nil)
	local var21, var22 = createSignal(false)
	local var23, var24 = createSignal(false)
	local var25, var26 = createSignal(nil)
	local var27, var28 = createSignal(nil)
	local var29, var30 = createSignal(nil)
	local var31 = createComputed(function(p0) --[[ line: 54 ]]
		-- upvalues: var17 (ref), var13 (ref)
		return var17(p0) and #var13(p0) == 0
	end)
	local var32 = createComputed(function(p1) --[[ line: 58 ]]
		-- upvalues: var19 (ref), var15 (ref)
		local var44 = var19(p1)
		
		return if var44 == nil then nil else var15(p1)[var44]
	end)
	
	local function toggleRespawnPrompt(p2) --[[ line: 67 ]]
		-- upvalues: var22 (ref)
		var22(p2)
	end
	
	local function fetchOutfitDetails(p3) --[[ line: 71 ]]
		-- upvalues: avatarEditorService (copy), fFlagAvatarSwitcherAccurateAvatarWarning (copy), var16 (ref), cryoModule (copy)
		local ok, status = pcall(function() --[[ line: 72 ]]
			-- upvalues: avatarEditorService (copy), p3 (ref)
			return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then avatarEditorService:GetOutfitDetailsAsync(p3) else avatarEditorService:GetOutfitDetails(p3)
		end)
		
		if not ok then
			warn(`Avatar Switcher: failed to fetch outfit details for outfitId {p3}.`, status)
			
			return
		end
		local t = nil
		
		if fFlagAvatarSwitcherAccurateAvatarWarning then
			t = {}
			
			if status.Assets then
				for i, v in status.Assets do
					table.insert(t, v.Id)
				end
			end
		end
		local t_1 = {
			id = status.Id,
			name = status.Name,
			rigType = if status.PlayerAvatarType == "R6" then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15,
			assetIds = if fFlagAvatarSwitcherAccurateAvatarWarning then t else nil
		}
		var16(function(p4) --[[ line: 96 ]]
			-- upvalues: cryoModule (copy), p3 (ref), t_1 (ref)
			return cryoModule.Dictionary.join(p4, { [p3] = t_1 })
		end)
	end
	
	local function selectOutfit(p5) --[[ line: 105 ]]
		-- upvalues: var20 (ref), fFlagAvatarSwitcherUseAvatarInventoryEndpoint (copy), var32 (ref), fetchOutfitDetails (ref)
		var20(p5)
		
		if not fFlagAvatarSwitcherUseAvatarInventoryEndpoint and p5 ~= nil and var32(false) == nil then
			fetchOutfitDetails(p5)
		end
	end
	
	local var36 = nil
	local var37 = false
	
	local function fetchNextOutfitsPage_DEPRECATED() --[[ line: 122 ]]
		-- upvalues: var37 (write), var17 (ref), var36 (write), var18 (ref), avatarEditorService (copy), var14 (ref)
		if var37 or var17(false) then return end
		var37 = true
		
		if var36 then
			if var36.IsFinished then return end
			local ok, status = pcall(function() --[[ line: 132 ]]
				-- upvalues: var36 (copy)
				var36:AdvanceToNextPageAsync()
			end)
			
			if not ok then
				warn("Avatar Switcher: failed to fetch next page of user outfits.", status)
				var18(true)
			end
		else
			local ok, status = pcall(function() --[[ line: 140 ]]
				-- upvalues: avatarEditorService (copy)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then avatarEditorService:GetOutfitsAsync(Enum.OutfitSource.Created, Enum.OutfitType.Avatar) else avatarEditorService:GetOutfits(Enum.OutfitSource.Created, Enum.OutfitType.Avatar)
			end)
			
			if ok then
				var36 = status
			else
				warn("Avatar Switcher: failed to fetch first page of user outfits.", status)
				var18(true)
			end
		end
		if var36 then
			local currentPage = var36:GetCurrentPage()
			var14(function(p6) --[[ line: 157 ]]
				-- upvalues: currentPage (ref)
				local cloned = table.clone(p6)
				
				for i, v in currentPage do
					table.insert(cloned, { id = v.Id, name = v.Name })
				end
				return cloned
			end)
			
			if var36.IsFinished then
				var18(true)
			end
		end
		var37 = false
	end
	
	local var39 = nil
	
	local function fetchNextOutfitsPage() --[[ line: 176 ]]
		-- upvalues: var37 (write), var17 (ref), var39 (write), fFlagAXInventoryIncludeUnavailableItems (copy), text (copy), url (copy), httpRbxApiService (copy), httpService (copy), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), var18 (ref), var27 (ref), inventoryItemAvailability (copy), fFlagAvatarSwitcherExpiredItemsWarning (copy), fFlagAvatarSwitcherAccurateAvatarWarning (copy), var14 (ref), cryoModule (copy), var16 (ref)
		if var37 or var17(false) then return end
		var37 = true
		local text_1 = text .. url:makeQueryString({
			pageToken = var39,
			pageLimit = 25,
			sortOption = "recentAdded",
			["itemCategories[0].itemType"] = "outfit",
			["itemCategories[0].itemSubType"] = 3,
			includeUnavailableItems = if fFlagAXInventoryIncludeUnavailableItems then true else nil
		})
		local ok, status = pcall(function() --[[ line: 192 ]]
			-- upvalues: httpRbxApiService (copy), text_1 (ref), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(text_1))
		end)
		
		if ok then
			if status.nextPageToken then
				var39 = status.nextPageToken
			else
				var18(true)
			end
			local avatarInventoryItems = status.avatarInventoryItems or {}
			local t = {}
			local t_1 = {}
			local var53 = var27(false)
			
			for i, v in avatarInventoryItems do
				if v.availabilityStatus ~= inventoryItemAvailability.PartiallyAvailableWithUnavailableSubitems then
					local var54 = if v.outfitDetail and v.outfitDetail.playerAvatarType == "R6" then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15
					local var55 = var53 == Enum.HumanoidRigType.R6 and var54 == Enum.HumanoidRigType.R15
					local var56 = if fFlagAvatarSwitcherExpiredItemsWarning then v.availabilityStatus == inventoryItemAvailability.PartiallyAvailableWithExpiredSubitems else nil
					local t_2 = nil
					
					if fFlagAvatarSwitcherAccurateAvatarWarning then
						t_2 = {}
						
						if v.outfitDetail and v.outfitDetail.assets then
							for i_1, v_1 in v.outfitDetail.assets do
								table.insert(t_2, v_1.id)
							end
						end
					end
					table.insert(t, {
						id = v.itemId,
						name = v.itemName,
						hasWarning = if fFlagAvatarSwitcherExpiredItemsWarning then var55 or var56 else var55
					})
					t_1[v.itemId] = {
						id = v.itemId,
						name = v.itemName,
						rigType = var54,
						availabilityStatus = if fFlagAvatarSwitcherExpiredItemsWarning then v.availabilityStatus else nil,
						assetIds = if fFlagAvatarSwitcherAccurateAvatarWarning then t_2 else nil
					}
				end
			end
			var14(function(p7) --[[ line: 262 ]]
				-- upvalues: cryoModule (copy), t (ref)
				return cryoModule.List.join(p7, t)
			end)
			var16(function(p8) --[[ line: 265 ]]
				-- upvalues: cryoModule (copy), t_1 (ref)
				return cryoModule.Dictionary.join(p8, t_1)
			end)
			var37 = false
			
			return
		else
			warn("Avatar Switcher: failed to fetch user outfits.", status)
			
			if fFlagAvatarSwitcherCounters then
				sendAXCounterV2(constantsModule.Counters.OutfitFetchFailed)
			end
			var18(true)
			var37 = false
		end
	end
	
	local function switchAvatar() --[[ line: 273 ]]
		-- upvalues: var32 (ref), var24 (ref), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), avatarSwitcherPcallApplyOutfit (copy), applyOutfitModule (copy), var30 (ref)
		local var58 = var32(false)
		
		if not var58 then return end
		var24(true)
		
		if fFlagAvatarSwitcherCounters then
			sendAXCounterV2(constantsModule.Counters.SwitchAvatar)
		end
		if avatarSwitcherPcallApplyOutfit then
			local ok, status = pcall(function() --[[ line: 285 ]]
				-- upvalues: applyOutfitModule (copy), var58 (ref)
				applyOutfitModule(var58.id, var58.rigType)
			end)
			
			if not ok then
				sendAXCounterV2(constantsModule.Counters.ApplyOutfitFailed, { errorMessage = tostring(status) })
			end
		else
			applyOutfitModule(var58.id, var58.rigType)
		end
		var30(var58.name)
		var24(false)
	end
	
	local function fetchExperienceAvatarSupportType() --[[ line: 299 ]]
		-- upvalues: httpRbxApiService (copy), text_1 (copy), httpService (copy), experienceAvatarSupportTypeModule (copy), var26 (ref), var28 (ref), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy)
		local ok, status = pcall(function() --[[ line: 300 ]]
			-- upvalues: httpRbxApiService (copy), text_1 (copy), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(text_1))
		end)
		
		if ok then
			local experienceAvatarSupportType = status.experienceAvatarSupportType
			var26(if experienceAvatarSupportType == 0 then experienceAvatarSupportTypeModule.NoSupport elseif experienceAvatarSupportType == 2 then experienceAvatarSupportTypeModule.FullSupport else experienceAvatarSupportTypeModule.UnknownSupport)
			local experienceAvatarType = status.experienceAvatarType
			var28(if experienceAvatarType == 1 then Enum.HumanoidRigType.R6 elseif experienceAvatarType == 3 then Enum.HumanoidRigType.R15 else nil)
			
			if fFlagAvatarSwitcherCounters then
				sendAXCounterV2(constantsModule.Counters.AvatarSupportTypeFetched, {
					supportType = tostring(experienceAvatarSupportType),
					avatarType = tostring(experienceAvatarType)
				})
				
				return
			end
		else
			var26(experienceAvatarSupportTypeModule.UnknownSupport)
			var28(nil)
			
			if fFlagAvatarSwitcherCounters then
				sendAXCounterV2(constantsModule.Counters.AvatarSupportTypeFetchFailed)
			end
		end
	end
	
	local function clearPendingAvatarName() --[[ line: 335 ]]
		-- upvalues: var30 (ref)
		var30(nil)
	end
	
	if playersService.LocalPlayer then
		playersService.LocalPlayer.CharacterAdded:Connect(function() --[[ line: 340 ]]
			-- upvalues: var30 (ref)
			var30(nil)
		end)
	end
	return {
		getOutfits = var13,
		getLastPageReached = var17,
		getSelectedOutfitId = var19,
		getSelectedOutfitDetails = var32,
		getRespawnPromptShown = var21,
		getIsSwitching = var23,
		getIsEmpty = var31,
		getExperienceAvatarSupportType = var25,
		getExperienceAvatarType = var27,
		getPendingAvatarName = var29,
		toggleRespawnPrompt = toggleRespawnPrompt,
		selectOutfit = selectOutfit,
		fetchNextOutfitsPage = if fFlagAvatarSwitcherUseAvatarInventoryEndpoint then fetchNextOutfitsPage else fetchNextOutfitsPage_DEPRECATED,
		switchAvatar = switchAvatar,
		fetchExperienceAvatarSupportType = fetchExperienceAvatarSupportType,
		clearPendingAvatarName = clearPendingAvatarName
	}
end