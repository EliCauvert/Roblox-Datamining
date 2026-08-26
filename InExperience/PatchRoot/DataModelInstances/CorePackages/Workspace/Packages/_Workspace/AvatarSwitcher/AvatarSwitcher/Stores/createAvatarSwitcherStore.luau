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

return function()
	-- upvalues: createSignal (ref), createComputed (ref), avatarEditorService (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref), cryoModule (ref), fFlagAvatarSwitcherUseAvatarInventoryEndpoint (ref), fFlagAXInventoryIncludeUnavailableItems (ref), text (ref), url (ref), httpRbxApiService (ref), httpService (ref), fFlagAvatarSwitcherCounters (ref), sendAXCounterV2 (ref), constantsModule (ref), inventoryItemAvailability (ref), fFlagAvatarSwitcherExpiredItemsWarning (ref), avatarSwitcherPcallApplyOutfit (ref), applyOutfitModule (ref), text_1 (ref), experienceAvatarSupportTypeModule (ref), playersService (ref)
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal({})
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal(nil)
	local var9, var10 = createSignal(false)
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal(nil)
	local var15, var16 = createSignal(nil)
	local var17, var18 = createSignal(nil)
	local var19 = createComputed(function(p1)
		-- upvalues: var5 (ref), var1 (ref)
		return var5(p1) and #var1(p1) == 0
	end)
	local var20 = createComputed(function(p1)
		-- upvalues: var7 (ref), var3 (ref)
		local var21 = var7(p1)
		
		return if var21 == nil then nil else var3(p1)[var21]
	end)
	
	local function toggleRespawnPrompt(p1)
		-- upvalues: var10 (ref)
		var10(p1)
	end
	
	local function fetchOutfitDetails(p1)
		-- upvalues: avatarEditorService (copy), fFlagAvatarSwitcherAccurateAvatarWarning (copy), var4 (ref), cryoModule (copy)
		local ok, status = pcall(function()
			-- upvalues: avatarEditorService (copy), p1 (ref)
			return avatarEditorService:GetOutfitDetailsAsync(p1)
		end)
		
		if not ok then
			warn(`Avatar Switcher: failed to fetch outfit details for outfitId {p1}.`, status)
			
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
		var4(function(p2)
			-- upvalues: cryoModule (copy), p1 (ref), t_1 (ref)
			return cryoModule.Dictionary.join(p2, { [p1] = t_1 })
		end)
	end
	
	local function selectOutfit(p2)
		-- upvalues: var8 (ref), fFlagAvatarSwitcherUseAvatarInventoryEndpoint (copy), var20 (ref), fetchOutfitDetails (ref)
		var8(p2)
		
		if not fFlagAvatarSwitcherUseAvatarInventoryEndpoint and p2 ~= nil and var20(false) == nil then
			fetchOutfitDetails(p2)
		end
	end
	
	local var21 = nil
	local var22 = false
	
	local function fetchNextOutfitsPage_DEPRECATED()
		-- upvalues: var22 (write), var5 (ref), var21 (write), var6 (ref), avatarEditorService (copy), var2 (ref)
		if var22 or var5(false) then return end
		var22 = true
		
		if var21 then
			if var21.IsFinished then return end
			local ok, status = pcall(function()
				-- upvalues: var21 (copy)
				var21:AdvanceToNextPageAsync()
			end)
			
			if not ok then
				warn("Avatar Switcher: failed to fetch next page of user outfits.", status)
				var6(true)
			end
		else
			local ok, status = pcall(function()
				-- upvalues: avatarEditorService (copy)
				return avatarEditorService:GetOutfitsAsync(Enum.OutfitSource.Created, Enum.OutfitType.Avatar)
			end)
			
			if ok then
				var21 = status
			else
				warn("Avatar Switcher: failed to fetch first page of user outfits.", status)
				var6(true)
			end
		end
		if var21 then
			local currentPage = var21:GetCurrentPage()
			var2(function(p2)
				-- upvalues: currentPage (ref)
				local cloned = table.clone(p2)
				
				for i, v in currentPage do
					table.insert(cloned, { id = v.Id, name = v.Name })
				end
				return cloned
			end)
			
			if var21.IsFinished then
				var6(true)
			end
		end
		var22 = false
	end
	
	local var23 = nil
	
	local function fetchNextOutfitsPage()
		-- upvalues: var22 (write), var5 (ref), var23 (write), fFlagAXInventoryIncludeUnavailableItems (copy), text (copy), url (copy), httpRbxApiService (copy), httpService (copy), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), var6 (ref), var15 (ref), inventoryItemAvailability (copy), fFlagAvatarSwitcherExpiredItemsWarning (copy), fFlagAvatarSwitcherAccurateAvatarWarning (copy), var2 (ref), cryoModule (copy), var4 (ref)
		if var22 or var5(false) then return end
		var22 = true
		local text_1 = text .. url:makeQueryString({
			pageToken = var23,
			pageLimit = 25,
			sortOption = "recentAdded",
			["itemCategories[0].itemType"] = "outfit",
			["itemCategories[0].itemSubType"] = 3,
			includeUnavailableItems = if fFlagAXInventoryIncludeUnavailableItems then true else nil
		})
		local ok, status = pcall(function()
			-- upvalues: httpRbxApiService (copy), text_1 (ref), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(text_1))
		end)
		
		if ok then
			if status.nextPageToken then
				var23 = status.nextPageToken
			else
				var6(true)
			end
			local avatarInventoryItems = status.avatarInventoryItems or {}
			local t = {}
			local t_1 = {}
			local var24 = var15(false)
			
			for i, v in avatarInventoryItems do
				if v.availabilityStatus ~= inventoryItemAvailability.PartiallyAvailableWithUnavailableSubitems then
					local var25 = if v.outfitDetail and v.outfitDetail.playerAvatarType == "R6" then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15
					local var26 = var24 == Enum.HumanoidRigType.R6 and var25 == Enum.HumanoidRigType.R15
					local var27 = if fFlagAvatarSwitcherExpiredItemsWarning then v.availabilityStatus == inventoryItemAvailability.PartiallyAvailableWithExpiredSubitems else nil
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
						hasWarning = if fFlagAvatarSwitcherExpiredItemsWarning then var26 or var27 else var26
					})
					t_1[v.itemId] = {
						id = v.itemId,
						name = v.itemName,
						rigType = var25,
						availabilityStatus = if fFlagAvatarSwitcherExpiredItemsWarning then v.availabilityStatus else nil,
						assetIds = if fFlagAvatarSwitcherAccurateAvatarWarning then t_2 else nil
					}
				end
			end
			var2(function(p2)
				-- upvalues: cryoModule (copy), t (ref)
				return cryoModule.List.join(p2, t)
			end)
			var4(function(p2)
				-- upvalues: cryoModule (copy), t_1 (ref)
				return cryoModule.Dictionary.join(p2, t_1)
			end)
			var22 = false
			
			return
		else
			warn("Avatar Switcher: failed to fetch user outfits.", status)
			
			if fFlagAvatarSwitcherCounters then
				sendAXCounterV2(constantsModule.Counters.OutfitFetchFailed)
			end
			var6(true)
			var22 = false
		end
	end
	
	local function switchAvatar()
		-- upvalues: var20 (ref), var12 (ref), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), avatarSwitcherPcallApplyOutfit (copy), applyOutfitModule (copy), var18 (ref)
		local var28 = var20(false)
		
		if not var28 then return end
		var12(true)
		
		if fFlagAvatarSwitcherCounters then
			sendAXCounterV2(constantsModule.Counters.SwitchAvatar)
		end
		if avatarSwitcherPcallApplyOutfit then
			local ok, status = pcall(function()
				-- upvalues: applyOutfitModule (copy), var28 (ref)
				applyOutfitModule(var28.id, var28.rigType)
			end)
			
			if not ok then
				sendAXCounterV2(constantsModule.Counters.ApplyOutfitFailed, { errorMessage = tostring(status) })
			end
		else
			applyOutfitModule(var28.id, var28.rigType)
		end
		var18(var28.name)
		var12(false)
	end
	
	local function fetchExperienceAvatarSupportType()
		-- upvalues: httpRbxApiService (copy), text_1 (copy), httpService (copy), experienceAvatarSupportTypeModule (copy), var14 (ref), var16 (ref), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy)
		local ok, status = pcall(function()
			-- upvalues: httpRbxApiService (copy), text_1 (copy), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(text_1))
		end)
		
		if ok then
			local experienceAvatarSupportType = status.experienceAvatarSupportType
			var14(if experienceAvatarSupportType == 0 then experienceAvatarSupportTypeModule.NoSupport elseif experienceAvatarSupportType == 2 then experienceAvatarSupportTypeModule.FullSupport else experienceAvatarSupportTypeModule.UnknownSupport)
			local experienceAvatarType = status.experienceAvatarType
			var16(if experienceAvatarType == 1 then Enum.HumanoidRigType.R6 elseif experienceAvatarType == 3 then Enum.HumanoidRigType.R15 else nil)
			
			if fFlagAvatarSwitcherCounters then
				sendAXCounterV2(constantsModule.Counters.AvatarSupportTypeFetched, {
					supportType = tostring(experienceAvatarSupportType),
					avatarType = tostring(experienceAvatarType)
				})
				
				return
			end
		else
			var14(experienceAvatarSupportTypeModule.UnknownSupport)
			var16(nil)
			
			if fFlagAvatarSwitcherCounters then
				sendAXCounterV2(constantsModule.Counters.AvatarSupportTypeFetchFailed)
			end
		end
	end
	
	local function clearPendingAvatarName()
		-- upvalues: var18 (ref)
		var18(nil)
	end
	
	if playersService.LocalPlayer then
		playersService.LocalPlayer.CharacterAdded:Connect(function()
			-- upvalues: var18 (ref)
			var18(nil)
		end)
	end
	return {
		getOutfits = var1,
		getLastPageReached = var5,
		getSelectedOutfitId = var7,
		getSelectedOutfitDetails = var20,
		getRespawnPromptShown = var9,
		getIsSwitching = var11,
		getIsEmpty = var19,
		getExperienceAvatarSupportType = var13,
		getExperienceAvatarType = var15,
		getPendingAvatarName = var17,
		toggleRespawnPrompt = toggleRespawnPrompt,
		selectOutfit = selectOutfit,
		fetchNextOutfitsPage = if fFlagAvatarSwitcherUseAvatarInventoryEndpoint then fetchNextOutfitsPage else fetchNextOutfitsPage_DEPRECATED,
		switchAvatar = switchAvatar,
		fetchExperienceAvatarSupportType = fetchExperienceAvatarSupportType,
		clearPendingAvatarName = clearPendingAvatarName
	}
end