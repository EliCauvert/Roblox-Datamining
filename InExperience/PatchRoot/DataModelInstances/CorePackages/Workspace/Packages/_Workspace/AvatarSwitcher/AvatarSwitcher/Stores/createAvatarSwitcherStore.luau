local AvatarEditorService = game:GetService("AvatarEditorService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local Url = require(Parent.Http).Url
local CryoModule = require(Parent.Cryo)
local InventoryItemAvailability = require(Parent.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local SendAXCounterV2Function = require(Parent.AvatarExperienceAnalytics).sendAXCounterV2
local ApplyOutfitModule = require(AvatarSwitcher.Utils.applyOutfit)
local ExperienceAvatarSupportTypeModule = require(AvatarSwitcher.Enums.ExperienceAvatarSupportType)
local ConstantsModule = require(AvatarSwitcher.Constants)
local FFlagAvatarSwitcherUseAvatarInventoryEndpoint = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherUseAvatarInventoryEndpoint
local FFlagAvatarSwitcherAccurateAvatarWarning = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local FFlagAvatarSwitcherCounters = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherCounters
local FFlagAvatarSwitcherExpiredItemsWarning = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherExpiredItemsWarning
local FFlagAXInventoryIncludeUnavailableItems = require(Parent.AvatarExperienceFlags).FFlagAXInventoryIncludeUnavailableItems
local AvatarSwitcherPcallApplyOutfit = game:DefineFastFlag("AvatarSwitcherPcallApplyOutfit", false)
local _ = require(AvatarSwitcher.types)
local Text = Url.AVATAR_URL .. "v1/avatar-inventory?"
local Text1 = Url.AVATAR_URL .. "v2/avatar/experience/get-experience-avatar-support"

return function()
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), AvatarEditorService (copy), FFlagAvatarSwitcherAccurateAvatarWarning (copy), CryoModule (copy), FFlagAvatarSwitcherUseAvatarInventoryEndpoint (copy), FFlagAXInventoryIncludeUnavailableItems (copy), Text (copy), Url (copy), HttpRbxApiService (copy), HttpService (copy), FFlagAvatarSwitcherCounters (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), InventoryItemAvailability (copy), FFlagAvatarSwitcherExpiredItemsWarning (copy), AvatarSwitcherPcallApplyOutfit (copy), ApplyOutfitModule (copy), Text1 (copy), ExperienceAvatarSupportTypeModule (copy), Players (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction({})
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(nil)
	local Signal5, Signal2_4 = CreateSignalFunction(false)
	local Signal6, Signal2_5 = CreateSignalFunction(false)
	local Signal7, Signal2_6 = CreateSignalFunction(nil)
	local Signal8, Signal2_7 = CreateSignalFunction(nil)
	local Signal9, Signal2_8 = CreateSignalFunction(nil)
	local Computed = CreateComputedFunction(function(p1): boolean
		-- upvalues: Signal3 (copy), Signal (copy)
		return Signal3(p1) and #Signal(p1) == 0
	end)
	local Computed1 = CreateComputedFunction(function(p1)
		-- upvalues: Signal4 (copy), Signal1 (copy)
		local SignalResult = Signal4(p1)
		
		return if SignalResult == nil then nil else Signal1(p1)[SignalResult]
	end)
	
	local function toggleRespawnPrompt(p1)
		-- upvalues: Signal2_4 (copy)
		Signal2_4(p1)
	end
	
	local function fetchOutfitDetails(OutfitId)
		-- upvalues: AvatarEditorService (upval), FFlagAvatarSwitcherAccurateAvatarWarning (upval), Signal2_1 (copy), CryoModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: AvatarEditorService (upval), OutfitId (copy)
			return AvatarEditorService:GetOutfitDetailsAsync(OutfitId)
		end)
		
		if not Success then
			warn(`Avatar Switcher: failed to fetch outfit details for outfitId {OutfitId}.`, Result)
			
			return
		end
		local List = nil
		
		if FFlagAvatarSwitcherAccurateAvatarWarning then
			List = {}
			
			if Result.Assets then
				for _, asset in Result.Assets do
					table.insert(List, asset.Id)
				end
			end
		end
		local config = {
			id = Result.Id,
			name = Result.Name,
			rigType = if Result.PlayerAvatarType == "R6" then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15,
			assetIds = if FFlagAvatarSwitcherAccurateAvatarWarning then List else nil
		}
		Signal2_1(function(p1)
			-- upvalues: CryoModule (upval), OutfitId (copy), config (copy)
			return CryoModule.Dictionary.join(p1, { [OutfitId] = config })
		end)
	end
	
	local function selectOutfit(p1)
		-- upvalues: Signal2_3 (copy), FFlagAvatarSwitcherUseAvatarInventoryEndpoint (upval), Computed1 (copy), fetchOutfitDetails (copy)
		Signal2_3(p1)
		
		if not FFlagAvatarSwitcherUseAvatarInventoryEndpoint and p1 ~= nil and Computed1(false) == nil then
			fetchOutfitDetails(p1)
		end
	end
	
	local Pages = nil
	local Flag = false
	
	local function fetchNextOutfitsPage_DEPRECATED()
		-- upvalues: Flag (ref), Signal3 (copy), Pages (ref), Signal2_2 (copy), AvatarEditorService (upval), Signal2 (copy)
		if Flag or Signal3(false) then return end
		Flag = true
		
		if Pages then
			if Pages.IsFinished then return end
			local Success1, Result1 = pcall(function()
				-- upvalues: Pages (upval)
				Pages:AdvanceToNextPageAsync()
			end)
			
			if not Success1 then
				warn("Avatar Switcher: failed to fetch next page of user outfits.", Result1)
				Signal2_2(true)
			end
		else
			local Success, Result = pcall(function()
				-- upvalues: AvatarEditorService (upval)
				return AvatarEditorService:GetOutfitsAsync(Enum.OutfitSource.Created, Enum.OutfitType.Avatar)
			end)
			
			if Success then
				Pages = Result
			else
				warn("Avatar Switcher: failed to fetch first page of user outfits.", Result)
				Signal2_2(true)
			end
		end
		if Pages then
			local CurrentPage = Pages:GetCurrentPage()
			Signal2(function(Tbl)
				-- upvalues: CurrentPage (copy)
				local Copy = table.clone(Tbl)
				
				for _, value in CurrentPage do
					table.insert(Copy, { id = value.Id, name = value.Name })
				end
				return Copy
			end)
			
			if Pages.IsFinished then
				Signal2_2(true)
			end
		end
		Flag = false
	end
	
	local NextPageToken = nil
	
	local function fetchNextOutfitsPage()
		-- upvalues: Flag (ref), Signal3 (copy), NextPageToken (ref), FFlagAXInventoryIncludeUnavailableItems (upval), Text (upval), Url (upval), HttpRbxApiService (upval), HttpService (upval), FFlagAvatarSwitcherCounters (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), Signal2_2 (copy), Signal8 (copy), InventoryItemAvailability (upval), FFlagAvatarSwitcherExpiredItemsWarning (upval), FFlagAvatarSwitcherAccurateAvatarWarning (upval), Signal2 (copy), CryoModule (upval), Signal2_1 (copy)
		if Flag or Signal3(false) then return end
		Flag = true
		local Text1 = Text .. Url:makeQueryString({
			pageToken = NextPageToken,
			pageLimit = 25,
			sortOption = "recentAdded",
			["itemCategories[0].itemType"] = "outfit",
			["itemCategories[0].itemSubType"] = 3,
			includeUnavailableItems = if FFlagAXInventoryIncludeUnavailableItems then true else nil
		})
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Text1 (copy), HttpService (upval)
			return HttpService:JSONDecode((HttpRbxApiService:GetAsyncFullUrl(Text1)))
		end)
		
		if Success then
			if Result.nextPageToken then
				NextPageToken = Result.nextPageToken
			else
				Signal2_2(true)
			end
			local AvatarInventoryItems = Result.avatarInventoryItems or {}
			local List1 = {}
			local t = {}
			local SignalResult = Signal8(false)
			
			for _, avatarInventoryItem in AvatarInventoryItems do
				if avatarInventoryItem.availabilityStatus ~= InventoryItemAvailability.PartiallyAvailableWithUnavailableSubitems then
					local R6 = if avatarInventoryItem.outfitDetail and avatarInventoryItem.outfitDetail.playerAvatarType == "R6" then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15
					local IsRMatch: boolean = SignalResult == Enum.HumanoidRigType.R6 and R6 == Enum.HumanoidRigType.R15
					local IsAvailabilityStatusMatch = if FFlagAvatarSwitcherExpiredItemsWarning then avatarInventoryItem.availabilityStatus == InventoryItemAvailability.PartiallyAvailableWithExpiredSubitems else nil
					local List = nil
					
					if FFlagAvatarSwitcherAccurateAvatarWarning then
						List = {}
						
						if avatarInventoryItem.outfitDetail and avatarInventoryItem.outfitDetail.assets then
							for _, asset in avatarInventoryItem.outfitDetail.assets do
								table.insert(List, asset.id)
							end
						end
					end
					table.insert(List1, {
						id = avatarInventoryItem.itemId,
						name = avatarInventoryItem.itemName,
						hasWarning = if FFlagAvatarSwitcherExpiredItemsWarning then IsRMatch or IsAvailabilityStatusMatch else IsRMatch
					})
					t[avatarInventoryItem.itemId] = {
						id = avatarInventoryItem.itemId,
						name = avatarInventoryItem.itemName,
						rigType = R6,
						availabilityStatus = if FFlagAvatarSwitcherExpiredItemsWarning then avatarInventoryItem.availabilityStatus else nil,
						assetIds = if FFlagAvatarSwitcherAccurateAvatarWarning then List else nil
					}
				end
			end
			Signal2(function(p1)
				-- upvalues: CryoModule (upval), List1 (copy)
				return CryoModule.List.join(p1, List1)
			end)
			Signal2_1(function(p1)
				-- upvalues: CryoModule (upval), t (copy)
				return CryoModule.Dictionary.join(p1, t)
			end)
			Flag = false
			
			return
		else
			warn("Avatar Switcher: failed to fetch user outfits.", Result)
			
			if FFlagAvatarSwitcherCounters then
				SendAXCounterV2Function(ConstantsModule.Counters.OutfitFetchFailed)
			end
			Signal2_2(true)
			Flag = false
		end
	end
	
	local function switchAvatar()
		-- upvalues: Computed1 (copy), Signal2_5 (copy), FFlagAvatarSwitcherCounters (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), AvatarSwitcherPcallApplyOutfit (upval), ApplyOutfitModule (upval), Signal2_8 (copy)
		local ComputedResult = Computed1(false)
		
		if not ComputedResult then return end
		Signal2_5(true)
		
		if FFlagAvatarSwitcherCounters then
			SendAXCounterV2Function(ConstantsModule.Counters.SwitchAvatar)
		end
		if AvatarSwitcherPcallApplyOutfit then
			local Success, Result = pcall(function()
				-- upvalues: ApplyOutfitModule (upval), ComputedResult (copy)
				ApplyOutfitModule(ComputedResult.id, ComputedResult.rigType)
			end)
			
			if not Success then
				SendAXCounterV2Function(ConstantsModule.Counters.ApplyOutfitFailed, { errorMessage = tostring(Result) })
			end
		else
			ApplyOutfitModule(ComputedResult.id, ComputedResult.rigType)
		end
		Signal2_8(ComputedResult.name)
		Signal2_5(false)
	end
	
	local function fetchExperienceAvatarSupportType()
		-- upvalues: HttpRbxApiService (upval), Text1 (upval), HttpService (upval), ExperienceAvatarSupportTypeModule (upval), Signal2_6 (copy), Signal2_7 (copy), FFlagAvatarSwitcherCounters (upval), SendAXCounterV2Function (upval), ConstantsModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Text1 (upval), HttpService (upval)
			return HttpService:JSONDecode((HttpRbxApiService:GetAsyncFullUrl(Text1)))
		end)
		
		if Success then
			local ExperienceAvatarSupportType = Result.experienceAvatarSupportType
			Signal2_6(if ExperienceAvatarSupportType == 0 then ExperienceAvatarSupportTypeModule.NoSupport elseif ExperienceAvatarSupportType == 2 then ExperienceAvatarSupportTypeModule.FullSupport else ExperienceAvatarSupportTypeModule.UnknownSupport)
			local ExperienceAvatarType = Result.experienceAvatarType
			Signal2_7(if ExperienceAvatarType == 1 then Enum.HumanoidRigType.R6 elseif ExperienceAvatarType == 3 then Enum.HumanoidRigType.R15 else nil)
			
			if FFlagAvatarSwitcherCounters then
				SendAXCounterV2Function(ConstantsModule.Counters.AvatarSupportTypeFetched, {
					supportType = tostring(ExperienceAvatarSupportType),
					avatarType = tostring(ExperienceAvatarType)
				})
				
				return
			end
		else
			Signal2_6(ExperienceAvatarSupportTypeModule.UnknownSupport)
			Signal2_7(nil)
			
			if FFlagAvatarSwitcherCounters then
				SendAXCounterV2Function(ConstantsModule.Counters.AvatarSupportTypeFetchFailed)
			end
		end
	end
	
	local function clearPendingAvatarName()
		-- upvalues: Signal2_8 (copy)
		Signal2_8(nil)
	end
	
	if Players.LocalPlayer then
		Players.LocalPlayer.CharacterAdded:Connect(function()
			-- upvalues: Signal2_8 (copy)
			Signal2_8(nil)
		end)
	end
	return {
		getOutfits = Signal,
		getLastPageReached = Signal3,
		getSelectedOutfitId = Signal4,
		getSelectedOutfitDetails = Computed1,
		getRespawnPromptShown = Signal5,
		getIsSwitching = Signal6,
		getIsEmpty = Computed,
		getExperienceAvatarSupportType = Signal7,
		getExperienceAvatarType = Signal8,
		getPendingAvatarName = Signal9,
		toggleRespawnPrompt = toggleRespawnPrompt,
		selectOutfit = selectOutfit,
		fetchNextOutfitsPage = if FFlagAvatarSwitcherUseAvatarInventoryEndpoint then fetchNextOutfitsPage else fetchNextOutfitsPage_DEPRECATED,
		switchAvatar = switchAvatar,
		fetchExperienceAvatarSupportType = fetchExperienceAvatarSupportType,
		clearPendingAvatarName = clearPendingAvatarName
	}
end