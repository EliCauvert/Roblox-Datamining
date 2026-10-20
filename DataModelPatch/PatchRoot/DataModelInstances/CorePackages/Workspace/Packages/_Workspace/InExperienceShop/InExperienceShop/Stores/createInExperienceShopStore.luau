local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PromiseModule = require(Parent.Promise)
local CreateSignalFunction = require(Parent.Signals).createSignal
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local ErrorsModule = require(InExperienceShop.Api.Errors)
local FetchAllShopDataModule = require(InExperienceShop.Api.fetchAllShopData)
local FetchShopWidgetsOnlyModule = require(InExperienceShop.Api.fetchShopWidgetsOnly)
local MultiGetProductInfoModule = require(InExperienceShop.Api.multiGetProductInfo)
local StreamMultiGetProductInfoModule = require(InExperienceShop.Api.streamMultiGetProductInfo)
local LogCounterModule = require(InExperienceShop.Internal.logCounter)
local ProductInfoFailedItemsCounterModule = require(InExperienceShop.Events.ProductInfoFailedItemsCounter)
local UserOwnsGamePassModule = require(InExperienceShop.Api.userOwnsGamePass)
local FFlagShopUseMockDataModule = require(InExperienceShop.Flags.FFlagShopUseMockData)
local FFlagShopUseMockUserOwnsGamePassModule = require(InExperienceShop.Flags.FFlagShopUseMockUserOwnsGamePass)
local FFlagShopUseMockMultiGetProductInfoModule = require(InExperienceShop.Flags.FFlagShopUseMockMultiGetProductInfo)
local FFlagEnableShopProductInfoRefreshModule = require(InExperienceShop.Flags.FFlagEnableShopProductInfoRefresh)
local FFlagEnablePartialDisplayInExperienceShopModule = require(InExperienceShop.Flags.FFlagEnablePartialDisplayInExperienceShop)
local _ = require(InExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local FFlagEnableRobuxInExperienceShop = require(Parent.SharedFlags).FFlagEnableRobuxInExperienceShop
local FIntShopOwnershipFetchMaxAttemptsModule = require(InExperienceShop.Flags.FIntShopOwnershipFetchMaxAttempts)
local MockFetchAllShopDataModule = require(InExperienceShop.Mocks.MockFetchAllShopData)
local MockMultiGetProductInfoModule = require(InExperienceShop.Mocks.MockMultiGetProductInfo)
local MockUserOwnsGamePassModule = require(InExperienceShop.Mocks.MockUserOwnsGamePass)
local PromoteBonusRobuxPackageToTopPicksModule = require(InExperienceShop.Api.promoteBonusRobuxPackageToTopPicks)
local BonusPromotionEligibilityModule = require(InExperienceShop.Api.BonusPromotionEligibility)
local SortRobuxPackagesByAmountDescendingModule = require(InExperienceShop.Utils.sortRobuxPackagesByAmountDescending)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagInExperienceShopExpectStringMetadataValuesModule = require(InExperienceShop.Flags.FFlagInExperienceShopExpectStringMetadataValues)

local function _(p1): boolean
	return type(p1) == "table" and type(p1.categories) == "table" and type(p1.sections) == "table"
end

local _ = function()
	-- upvalues: FFlagEnablePartialDisplayInExperienceShopModule (copy)
	return if typeof(FFlagEnablePartialDisplayInExperienceShopModule) == "function" then FFlagEnablePartialDisplayInExperienceShopModule() else FFlagEnablePartialDisplayInExperienceShopModule
end

return function()
	-- upvalues: CreateSignalFunction (copy), ConstantsModule (copy), SortRobuxPackagesByAmountDescendingModule (copy), PromoteBonusRobuxPackageToTopPicksModule (copy), FFlagEnableRobuxInExperienceShop (copy), BonusPromotionEligibilityModule (copy), FFlagShopUseMockUserOwnsGamePassModule (copy), MockUserOwnsGamePassModule (copy), UserOwnsGamePassModule (copy), FFlagEnableExperienceShopGlobalIconModule (copy), FFlagInExperienceShopExpectStringMetadataValuesModule (copy), InExperienceShop (copy), FFlagShopUseMockDataModule (copy), FFlagShopUseMockMultiGetProductInfoModule (copy), MockMultiGetProductInfoModule (copy), StreamMultiGetProductInfoModule (copy), LogCounterModule (copy), ProductInfoFailedItemsCounterModule (copy), ErrorsModule (copy), FFlagEnablePartialDisplayInExperienceShopModule (copy), FetchShopWidgetsOnlyModule (copy), MockFetchAllShopDataModule (copy), FetchAllShopDataModule (copy), FFlagEnableShopProductInfoRefreshModule (copy), MultiGetProductInfoModule (copy), PromiseModule (copy), Players (copy), MarketplaceService (copy), FIntShopOwnershipFetchMaxAttemptsModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction({})
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(nil)
	local Signal5, Signal2_4 = CreateSignalFunction(nil)
	local Signal6, Signal2_5 = CreateSignalFunction(false)
	local Signal7, Signal2_6 = CreateSignalFunction(false)
	local Signal8, Signal2_7 = CreateSignalFunction({})
	local Signal9, Signal2_8 = CreateSignalFunction({})
	local Signal10, Signal2_9 = CreateSignalFunction(ConstantsModule.MIN_COLUMNS)
	local t = {}
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	local Flag3 = false
	local FailedItems = {}
	local WithoutFeaturedPromotionResult = {}
	local Tbl = {}
	local t1 = {}
	
	local function _(Key, p1)
		-- upvalues: Tbl (copy), Signal2_8 (copy)
		Tbl[Key] = p1
		Signal2_8(table.clone(Tbl))
	end
	
	local function sortRobuxPackagesInSections(Tbl)
		-- upvalues: SortRobuxPackagesByAmountDescendingModule (upval)
		local Flag = false
		
		for _, value in Tbl do
			local RobuxPackages = value.robuxPackages
			
			if RobuxPackages ~= nil and #RobuxPackages > 1 then
				Flag = true
				break
			end
		end
		if not Flag then
			return Tbl
		end
		local Copy = table.clone(Tbl)
		
		for i, value1 in ipairs(Tbl) do
			local RobuxPackages = value1.robuxPackages
			
			if RobuxPackages ~= nil and #RobuxPackages > 1 then
				Copy[i] = {
					id = value1.id,
					name = value1.name,
					items = value1.items,
					paymentSessionId = value1.paymentSessionId,
					robuxPackages = SortRobuxPackagesByAmountDescendingModule(RobuxPackages),
					featuredRobuxPackage = value1.featuredRobuxPackage
				}
			end
		end
		return Copy
	end
	
	local _ = function()
		-- upvalues: PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (ref), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy)
		Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
	end
	
	local function writeOwnership(Key, p1)
		-- upvalues: Signal8 (copy), Signal2_7 (copy), FFlagEnableRobuxInExperienceShop (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (ref), BonusPromotionEligibilityModule (upval), Tbl (copy), Signal2_8 (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy)
		local Copy = table.clone(Signal8(false))
		Copy[Key] = p1
		Signal2_7(Copy)
		
		if not p1 or not FFlagEnableRobuxInExperienceShop then return end
		local FirstBonusRobuxPackage = PromoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(WithoutFeaturedPromotionResult)
		local BonusGamePassId = if FirstBonusRobuxPackage == nil then nil else PromoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(FirstBonusRobuxPackage)
		
		if BonusGamePassId ~= nil and BonusGamePassId == Key then
			Tbl[Key] = BonusPromotionEligibilityModule.Ineligible
			Signal2_8(table.clone(Tbl))
			Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			
			return
		end
	end
	
	local function fetchGamePassOwnership(Key)
		-- upvalues: t (copy), Signal8 (copy), FFlagShopUseMockUserOwnsGamePassModule (upval), MockUserOwnsGamePassModule (upval), UserOwnsGamePassModule (upval), writeOwnership (copy)
		if t[Key] then return end
		if Signal8(false)[Key] ~= nil then return end
		local Number: number? = tonumber(Key)
		
		if Number ~= nil then
			t[Key] = true;
			(if FFlagShopUseMockUserOwnsGamePassModule then MockUserOwnsGamePassModule else UserOwnsGamePassModule)(Number):andThen(function(Result)
				-- upvalues: Signal8 (upval), Key (copy), writeOwnership (upval)
				if Signal8(false)[Key] == nil then
					writeOwnership(Key, Result)
					
					return
				end
			end):catch(function(Err)
				-- upvalues: Key (copy)
				warn("[Shop] fetchGamePassOwnership failed", Key, (tostring(Err)))
			end):finally(function()
				-- upvalues: t (upval), Key (copy)
				t[Key] = nil
			end)
			
			return
		end
	end
	
	local function fetchBonusGamePassOwnershipForPromotionId(Key)
		-- upvalues: t1 (copy), BonusPromotionEligibilityModule (upval), Tbl (copy), Signal2_8 (copy), PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (ref), Signal2_1 (copy), sortRobuxPackagesInSections (copy), FFlagShopUseMockUserOwnsGamePassModule (upval), MockUserOwnsGamePassModule (upval), UserOwnsGamePassModule (upval), Signal8 (copy), writeOwnership (copy)
		if t1[Key] then return end
		Tbl[Key] = BonusPromotionEligibilityModule.Unknown
		Signal2_8(table.clone(Tbl))
		Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
		local Number: number? = tonumber(Key)
		
		if Number == nil then
			Tbl[Key] = BonusPromotionEligibilityModule.Ineligible
			Signal2_8(table.clone(Tbl))
			Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			
			return
		else
			t1[Key] = true;
			(if FFlagShopUseMockUserOwnsGamePassModule then MockUserOwnsGamePassModule else UserOwnsGamePassModule)(Number):andThen(function(Result)
				-- upvalues: Key (copy), BonusPromotionEligibilityModule (upval), Tbl (upval), Signal2_8 (upval), Signal8 (upval), writeOwnership (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval)
				Tbl[Key] = if Result then BonusPromotionEligibilityModule.Ineligible else BonusPromotionEligibilityModule.Eligible
				Signal2_8(table.clone(Tbl))
				
				if Signal8(false)[Key] == nil then
					writeOwnership(Key, Result)
				end
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			end):catch(function(Err)
				-- upvalues: Key (copy), BonusPromotionEligibilityModule (upval), Tbl (upval), Signal2_8 (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval)
				warn("[Shop] fetchBonusGamePassOwnershipForPromotion failed", Key, (tostring(Err)))
				Tbl[Key] = BonusPromotionEligibilityModule.Ineligible
				Signal2_8(table.clone(Tbl))
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			end):finally(function()
				-- upvalues: t1 (upval), Key (copy)
				t1[Key] = nil
			end)
		end
	end
	
	local function fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
		-- upvalues: FFlagEnableRobuxInExperienceShop (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), fetchBonusGamePassOwnershipForPromotionId (copy)
		if not FFlagEnableRobuxInExperienceShop then return end
		local FirstBonusRobuxPackage = PromoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(WithoutFeaturedPromotionResult)
		local BonusGamePassId = if FirstBonusRobuxPackage == nil then nil else PromoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(FirstBonusRobuxPackage)
		local T = if BonusGamePassId == nil then {} else { BonusGamePassId }
		for _, value in T do
			fetchBonusGamePassOwnershipForPromotionId(value)
		end
	end
	
	local _ = function(p1)
		-- upvalues: WithoutFeaturedPromotionResult (ref), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
		WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p1)
		Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
		fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
	end
	
	local _ = function(p1)
		-- upvalues: FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (copy), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (copy), Signal2_6 (copy)
		if FFlagEnableExperienceShopGlobalIconModule then
			local Metadata = p1.metadata
			Signal2_4(Metadata)
			local InExperienceGlobalIconEnabled = if Metadata == nil then nil else Metadata.inExperienceGlobalIconEnabled
			Signal2_5(if FFlagInExperienceShopExpectStringMetadataValuesModule then InExperienceGlobalIconEnabled == "true" else InExperienceGlobalIconEnabled == true)
			Signal2_6(Metadata ~= nil and Metadata.newOffers == true)
		end
	end
	
	local function buildProductInfoRequestsForHydration(WithoutFeaturedPromotionResult, FailedItems)
		-- upvalues: InExperienceShop (upval), FFlagEnableRobuxInExperienceShop (upval)
		local RefreshShopItemsModule = require(InExperienceShop.Api.refreshShopItems)
		local HydrateRobuxBonusItemsModule = require(InExperienceShop.Api.hydrateRobuxBonusItems)
		local RequestsFromSections = RefreshShopItemsModule.buildRequestsFromSections(WithoutFeaturedPromotionResult)
		
		if FFlagEnableRobuxInExperienceShop then
			HydrateRobuxBonusItemsModule.appendBonusItemRequests(RequestsFromSections, WithoutFeaturedPromotionResult)
		end
		RefreshShopItemsModule.appendFailedItemRequests(RequestsFromSections, FailedItems)
		
		return RequestsFromSections
	end
	
	local function applyStreamingProductInfoResult(p1, p2, List)
		-- upvalues: InExperienceShop (upval), FFlagEnableRobuxInExperienceShop (upval)
		local RefreshShopItemsModule = require(InExperienceShop.Api.refreshShopItems)
		local HydrateRobuxBonusItemsModule = require(InExperienceShop.Api.hydrateRobuxBonusItems)
		local MakeRequestKeyFunction = require(InExperienceShop.Api.shopItemMapping).makeRequestKey
		local RequestKey = MakeRequestKeyFunction(p2.request.id, p2.request.infoType)
		local List1 = {}
		local List2 = {}
		
		for _, value in List do
			if MakeRequestKeyFunction(value.id, value.infoType) == RequestKey then
				table.insert(List1, value)
			else
				table.insert(List2, value)
			end
		end
		local MergeProductInfoIntoSectionsResult = RefreshShopItemsModule.mergeProductInfoIntoSections(p1, { p2 })
		local InsertRecoveredItemsIntoSectionsResult, InsertRecoveredItemsIntoSectionsResult2 = RefreshShopItemsModule.insertRecoveredItemsIntoSections(if FFlagEnableRobuxInExperienceShop then HydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(MergeProductInfoIntoSectionsResult, { p2 }) else MergeProductInfoIntoSectionsResult, { p2 }, List1)
		
		for _, value1 in InsertRecoveredItemsIntoSectionsResult2 do
			table.insert(List2, value1)
		end
		return InsertRecoveredItemsIntoSectionsResult, List2
	end
	
	local function routeStreamMultiGetProductInfo(p3, OnResult)
		-- upvalues: FFlagShopUseMockDataModule (upval), FFlagShopUseMockMultiGetProductInfoModule (upval), MockMultiGetProductInfoModule (upval), StreamMultiGetProductInfoModule (upval)
		return if FFlagShopUseMockDataModule and FFlagShopUseMockMultiGetProductInfoModule then MockMultiGetProductInfoModule.streamMultiGetProductInfo(p3, { onResult = OnResult }, 0) else StreamMultiGetProductInfoModule(p3, { onResult = OnResult })
	end
	
	local function streamProductInfoIntoSections(WithoutFeaturedPromotionResult1, RequestsFromSections, FailedItems1, Callback: (any) -> ())
		-- upvalues: Flag3 (ref), WithoutFeaturedPromotionResult (ref), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), routeStreamMultiGetProductInfo (copy), applyStreamingProductInfoResult (copy), FailedItems (ref), LogCounterModule (upval), ProductInfoFailedItemsCounterModule (upval)
		if #RequestsFromSections ~= 0 then
			Flag3 = true
			local WithoutFeaturedPromotionResult2 = WithoutFeaturedPromotionResult1
			local FailedItems2 = FailedItems1
			local v1 = nil
			local Flag = false
			
			local function flushPendingSections()
				-- upvalues: Flag (ref), v1 (ref), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval)
				Flag = false
				
				if v1 ~= nil then
					WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(v1)
					Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
					fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
					v1 = nil
				end
			end
			
			local function _(p3)
				-- upvalues: v1 (ref), Flag (ref), flushPendingSections (copy)
				v1 = p3
				
				if not Flag then
					Flag = true
					task.delay(0.05, flushPendingSections)
					
					return
				end
			end
			
			routeStreamMultiGetProductInfo(RequestsFromSections, function(p3)
				-- upvalues: WithoutFeaturedPromotionResult2 (ref), FailedItems2 (ref), applyStreamingProductInfoResult (upval), v1 (ref), Flag (ref), flushPendingSections (copy)
				WithoutFeaturedPromotionResult2, FailedItems2 = applyStreamingProductInfoResult(WithoutFeaturedPromotionResult2, p3, FailedItems2)
				v1 = WithoutFeaturedPromotionResult2
				
				if not Flag then
					Flag = true
					task.delay(0.05, flushPendingSections)
					
					return
				end
			end):andThen(function(_)
				-- upvalues: Flag (ref), v1 (ref), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), WithoutFeaturedPromotionResult2 (ref), FailedItems (upval), FailedItems2 (ref), LogCounterModule (upval), ProductInfoFailedItemsCounterModule (upval), Flag3 (upval), Callback (copy)
				Flag = false
				
				if v1 ~= nil then
					WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(v1)
					Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
					fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
					v1 = nil
				end
				WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(WithoutFeaturedPromotionResult2)
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
				fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
				FailedItems = FailedItems2
				
				if #FailedItems2 > 0 then
					LogCounterModule(ProductInfoFailedItemsCounterModule, #FailedItems2)
				end
				Flag3 = false
				
				if Callback then
					Callback(FailedItems2)
				end
			end):catch(function(Err)
				-- upvalues: Flag (ref), v1 (ref), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), Flag3 (upval), Callback (copy), FailedItems2 (ref)
				warn("[Shop] streamProductInfoIntoSections failed", (tostring(Err)))
				Flag = false
				
				if v1 ~= nil then
					WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(v1)
					Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
					fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
					v1 = nil
				end
				Flag3 = false
				
				if Callback then
					Callback(FailedItems2)
				end
			end)
			
			return
		elseif Callback then
			Callback(FailedItems1)
		end
	end
	
	local function runShopFetch(Callback1, Callback, p3)
		-- upvalues: Flag1 (ref), Flag (ref), Signal2_2 (copy), Signal2_3 (copy), FFlagShopUseMockDataModule (upval), ErrorsModule (upval), Signal2 (copy), WithoutFeaturedPromotionResult (ref), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (copy), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (copy), Signal2_6 (copy), FailedItems (ref)
		if not Flag1 and not Flag then
			Flag = true
			Signal2_2(true)
			Signal2_3(nil);
			(if FFlagShopUseMockDataModule then Callback() else Callback1()):andThen(function(Result)
				-- upvalues: ErrorsModule (upval), p3 (copy), Signal2 (upval), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (upval), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (upval), Signal2_6 (upval), FailedItems (upval), Signal2_2 (upval), Flag (upval), Flag1 (upval)
				if type(Result) ~= "table" or (type(Result.categories) ~= "table" or type(Result.sections) ~= "table") then
					return ErrorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p3), Result)
				end
				Signal2(Result.categories)
				WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(Result.sections)
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
				fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
				
				if FFlagEnableExperienceShopGlobalIconModule then
					local Metadata = Result.metadata
					Signal2_4(Metadata)
					local InExperienceGlobalIconEnabled = if Metadata == nil then nil else Metadata.inExperienceGlobalIconEnabled
					Signal2_5(if FFlagInExperienceShopExpectStringMetadataValuesModule then InExperienceGlobalIconEnabled == "true" else InExperienceGlobalIconEnabled == true)
					Signal2_6(Metadata ~= nil and Metadata.newOffers == true)
				end
				FailedItems = Result.failedItems or {}
				Signal2_2(false)
				Flag = false
				Flag1 = true
			end):catch(function(Err)
				-- upvalues: Signal2_3 (upval), Signal2 (upval), Signal2_1 (upval), FailedItems (upval), Signal2_2 (upval), Flag (upval)
				Signal2_3(Err)
				Signal2({})
				Signal2_1({})
				FailedItems = {}
				Signal2_2(false)
				Flag = false
			end)
			
			return
		end
	end
	
	local function runPartialDisplayShopFetch(Callback1, Callback, p3)
		-- upvalues: Flag1 (ref), Flag (ref), Signal2_2 (copy), Signal2_3 (copy), FFlagShopUseMockDataModule (upval), ErrorsModule (upval), Signal2 (copy), WithoutFeaturedPromotionResult (ref), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (copy), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (copy), Signal2_6 (copy), FailedItems (ref), buildProductInfoRequestsForHydration (copy), streamProductInfoIntoSections (copy)
		if not Flag1 and not Flag then
			Flag = true
			Signal2_2(true)
			Signal2_3(nil);
			(if FFlagShopUseMockDataModule then Callback() else Callback1()):andThen(function(Result)
				-- upvalues: ErrorsModule (upval), p3 (copy), Signal2 (upval), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (upval), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (upval), Signal2_6 (upval), FailedItems (upval), Signal2_2 (upval), Flag (upval), Flag1 (upval), buildProductInfoRequestsForHydration (upval), streamProductInfoIntoSections (upval)
				if type(Result) ~= "table" or (type(Result.categories) ~= "table" or type(Result.sections) ~= "table") then
					return ErrorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p3), Result)
				end
				Signal2(Result.categories)
				WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(Result.sections)
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
				fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
				
				if FFlagEnableExperienceShopGlobalIconModule then
					local Metadata = Result.metadata
					Signal2_4(Metadata)
					local InExperienceGlobalIconEnabled = if Metadata == nil then nil else Metadata.inExperienceGlobalIconEnabled
					Signal2_5(if FFlagInExperienceShopExpectStringMetadataValuesModule then InExperienceGlobalIconEnabled == "true" else InExperienceGlobalIconEnabled == true)
					Signal2_6(Metadata ~= nil and Metadata.newOffers == true)
				end
				FailedItems = Result.failedItems or {}
				Signal2_2(false)
				Flag = false
				Flag1 = true
				local WithoutFeaturedPromotionResult1 = WithoutFeaturedPromotionResult
				streamProductInfoIntoSections(WithoutFeaturedPromotionResult1, buildProductInfoRequestsForHydration(WithoutFeaturedPromotionResult1, FailedItems), FailedItems, nil)
			end):catch(function(Err)
				-- upvalues: Signal2_3 (upval), Signal2 (upval), Signal2_1 (upval), FailedItems (upval), Signal2_2 (upval), Flag (upval)
				Signal2_3(Err)
				Signal2({})
				Signal2_1({})
				FailedItems = {}
				Signal2_2(false)
				Flag = false
			end)
			
			return
		end
	end
	
	local function fetchAllShopData()
		-- upvalues: FFlagEnablePartialDisplayInExperienceShopModule (upval), runPartialDisplayShopFetch (copy), FetchShopWidgetsOnlyModule (upval), MockFetchAllShopDataModule (upval), runShopFetch (copy), FetchAllShopDataModule (upval)
		if if typeof(FFlagEnablePartialDisplayInExperienceShopModule) == "function" then FFlagEnablePartialDisplayInExperienceShopModule() else FFlagEnablePartialDisplayInExperienceShopModule then
			runPartialDisplayShopFetch(FetchShopWidgetsOnlyModule, MockFetchAllShopDataModule.fetchShopWidgetsOnly, "fetchAllShopData")
			
			return
		else
			runShopFetch(FetchAllShopDataModule, MockFetchAllShopDataModule.fetchAllShopData, "fetchAllShopData")
		end
	end
	
	local function prefetchWidgetsOnly()
		-- upvalues: runShopFetch (copy), FetchShopWidgetsOnlyModule (upval), MockFetchAllShopDataModule (upval)
		runShopFetch(FetchShopWidgetsOnlyModule, MockFetchAllShopDataModule.fetchShopWidgetsOnly, "prefetchWidgetsOnly")
	end
	
	local function refreshShopItemInfo()
		-- upvalues: FFlagEnableShopProductInfoRefreshModule (upval), Flag1 (ref), Flag2 (ref), Flag3 (ref), InExperienceShop (upval), WithoutFeaturedPromotionResult (ref), Signal1 (copy), FFlagEnableRobuxInExperienceShop (upval), FailedItems (ref), FFlagEnablePartialDisplayInExperienceShopModule (upval), streamProductInfoIntoSections (copy), FFlagShopUseMockDataModule (upval), FFlagShopUseMockMultiGetProductInfoModule (upval), MockMultiGetProductInfoModule (upval), MultiGetProductInfoModule (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
		if not FFlagEnableShopProductInfoRefreshModule then return end
		if not Flag1 or Flag2 or Flag3 then return end
		local RefreshShopItemsModule = require(InExperienceShop.Api.refreshShopItems)
		local HydrateRobuxBonusItemsModule = require(InExperienceShop.Api.hydrateRobuxBonusItems)
		local WithoutFeaturedPromotionResult1 = if #WithoutFeaturedPromotionResult > 0 then WithoutFeaturedPromotionResult else Signal1(false)
		local RequestsFromSections = RefreshShopItemsModule.buildRequestsFromSections(WithoutFeaturedPromotionResult1)
		
		if FFlagEnableRobuxInExperienceShop then
			HydrateRobuxBonusItemsModule.appendBonusItemRequests(RequestsFromSections, WithoutFeaturedPromotionResult1)
		end
		local FailedItems1 = FailedItems
		RefreshShopItemsModule.appendFailedItemRequests(RequestsFromSections, FailedItems1)
		
		if #RequestsFromSections == 0 then return end
		Flag2 = true
		
		if if typeof(FFlagEnablePartialDisplayInExperienceShopModule) == "function" then FFlagEnablePartialDisplayInExperienceShopModule() else FFlagEnablePartialDisplayInExperienceShopModule then
			streamProductInfoIntoSections(WithoutFeaturedPromotionResult1, RequestsFromSections, FailedItems1, function()
				-- upvalues: Flag2 (upval)
				Flag2 = false
			end)
			
			return
		else
			(if FFlagShopUseMockDataModule and FFlagShopUseMockMultiGetProductInfoModule then MockMultiGetProductInfoModule.multiGetProductInfo(RequestsFromSections, 0) else MultiGetProductInfoModule(RequestsFromSections)):andThen(function(Result)
				-- upvalues: RefreshShopItemsModule (copy), WithoutFeaturedPromotionResult1 (copy), FFlagEnableRobuxInExperienceShop (upval), HydrateRobuxBonusItemsModule (copy), FailedItems1 (copy), FailedItems (upval), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), Flag2 (upval)
				local MergeProductInfoIntoSectionsResult = RefreshShopItemsModule.mergeProductInfoIntoSections(WithoutFeaturedPromotionResult1, Result)
				local InsertRecoveredItemsIntoSectionsResult, InsertRecoveredItemsIntoSectionsResult2 = RefreshShopItemsModule.insertRecoveredItemsIntoSections(if FFlagEnableRobuxInExperienceShop then HydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(MergeProductInfoIntoSectionsResult, Result) else MergeProductInfoIntoSectionsResult, Result, FailedItems1)
				FailedItems = InsertRecoveredItemsIntoSectionsResult2
				WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(InsertRecoveredItemsIntoSectionsResult)
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
				fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
				Flag2 = false
			end):catch(function(Err)
				-- upvalues: Flag2 (upval)
				warn("[Shop] refreshShopItemInfo failed", (tostring(Err)))
				Flag2 = false
			end)
		end
	end
	
	local function onShopOpened()
		-- upvalues: FFlagEnablePartialDisplayInExperienceShopModule (upval), runPartialDisplayShopFetch (copy), FetchShopWidgetsOnlyModule (upval), MockFetchAllShopDataModule (upval), runShopFetch (copy), FetchAllShopDataModule (upval), refreshShopItemInfo (copy)
		if if typeof(FFlagEnablePartialDisplayInExperienceShopModule) == "function" then FFlagEnablePartialDisplayInExperienceShopModule() else FFlagEnablePartialDisplayInExperienceShopModule then
			runPartialDisplayShopFetch(FetchShopWidgetsOnlyModule, MockFetchAllShopDataModule.fetchShopWidgetsOnly, "fetchAllShopData")
		else
			runShopFetch(FetchAllShopDataModule, MockFetchAllShopDataModule.fetchAllShopData, "fetchAllShopData")
		end
		refreshShopItemInfo()
	end
	
	local t2 = {}
	
	local function pollOwnershipUntilTrue(Callback, Number, FIntShopOwnershipFetchMaxAttemptsModule, ScaledPOLLBACKOFFMULTIPLIER)
		-- upvalues: PromiseModule (upval), pollOwnershipUntilTrue (copy), ConstantsModule (upval)
		return Callback(Number):andThen(function(Result)
			-- upvalues: FIntShopOwnershipFetchMaxAttemptsModule (copy), PromiseModule (upval), ScaledPOLLBACKOFFMULTIPLIER (copy), pollOwnershipUntilTrue (upval), Callback (copy), Number (copy), ConstantsModule (upval)
			return if Result then true else FIntShopOwnershipFetchMaxAttemptsModule > 1 and PromiseModule.delay(ScaledPOLLBACKOFFMULTIPLIER):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (upval), Callback (upval), Number (upval), FIntShopOwnershipFetchMaxAttemptsModule (upval), ScaledPOLLBACKOFFMULTIPLIER (upval), ConstantsModule (upval)
				return pollOwnershipUntilTrue(Callback, Number, FIntShopOwnershipFetchMaxAttemptsModule - 1, ScaledPOLLBACKOFFMULTIPLIER * ConstantsModule.POLL_BACKOFF_MULTIPLIER)
			end)
		end):catch(function(Err)
			-- upvalues: FIntShopOwnershipFetchMaxAttemptsModule (copy), Number (copy), PromiseModule (upval), ScaledPOLLBACKOFFMULTIPLIER (copy), pollOwnershipUntilTrue (upval), Callback (copy), ConstantsModule (upval)
			if FIntShopOwnershipFetchMaxAttemptsModule <= 1 then
				warn("[Shop] pollOwnershipUntilTrue exhausted with engine error", Number, (tostring(Err)))
				
				return nil
			else
				return PromiseModule.delay(ScaledPOLLBACKOFFMULTIPLIER):andThen(function()
					-- upvalues: pollOwnershipUntilTrue (upval), Callback (upval), Number (upval), FIntShopOwnershipFetchMaxAttemptsModule (upval), ScaledPOLLBACKOFFMULTIPLIER (upval), ConstantsModule (upval)
					return pollOwnershipUntilTrue(Callback, Number, FIntShopOwnershipFetchMaxAttemptsModule - 1, ScaledPOLLBACKOFFMULTIPLIER * ConstantsModule.POLL_BACKOFF_MULTIPLIER)
				end)
			end
		end)
	end
	
	local function pollGamePassOwnershipAfterPurchase(Key, p3, p4, p5)
		-- upvalues: t2 (copy), pollOwnershipUntilTrue (copy), ConstantsModule (upval), writeOwnership (copy), Players (upval), MarketplaceService (upval), PromiseModule (upval)
		if t2[Key] then return end
		local Number: number? = tonumber(Key)
		
		if Number ~= nil then
			t2[Key] = true
			PromiseModule.delay(ConstantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (upval), p4 (copy), Number (copy), p3 (copy), ConstantsModule (upval), writeOwnership (upval), Key (copy), p5 (copy), Players (upval), MarketplaceService (upval), t2 (upval)
				pollOwnershipUntilTrue(p4, Number, p3, ConstantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(Enabled)
					-- upvalues: writeOwnership (upval), Key (upval), p5 (upval), Players (upval), MarketplaceService (upval), Number (upval)
					if Enabled ~= true then return end
					writeOwnership(Key, Enabled)
					
					if p5 then
						local LocalPlayer = Players.LocalPlayer
						
						if LocalPlayer ~= nil then
							MarketplaceService:SignalPromptGamePassPurchaseFinished(LocalPlayer, Number, true)
						end
					end
				end):finally(function()
					-- upvalues: t2 (upval), Key (upval)
					t2[Key] = nil
				end)
			end)
			
			return
		end
	end
	
	MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(Player, GamePassId, WasPurchased)
		-- upvalues: Players (upval), FFlagShopUseMockUserOwnsGamePassModule (upval), MockUserOwnsGamePassModule (upval), UserOwnsGamePassModule (upval), FIntShopOwnershipFetchMaxAttemptsModule (upval), t2 (copy), pollOwnershipUntilTrue (copy), ConstantsModule (upval), writeOwnership (copy), MarketplaceService (upval), PromiseModule (upval)
		if not WasPurchased then return end
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer == nil or Player.UserId ~= LocalPlayer.UserId then return end
		local MockUserOwnsGamePassModule1 = if FFlagShopUseMockUserOwnsGamePassModule then MockUserOwnsGamePassModule else UserOwnsGamePassModule
		local Text = tostring(GamePassId)
		
		if t2[Text] then return end
		local Number: number? = tonumber(Text)
		
		if Number ~= nil then
			t2[Text] = true
			local v1 = nil
			PromiseModule.delay(ConstantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (upval), MockUserOwnsGamePassModule1 (copy), Number (copy), FIntShopOwnershipFetchMaxAttemptsModule (copy), ConstantsModule (upval), writeOwnership (upval), Text (copy), v1 (copy), Players (upval), MarketplaceService (upval), t2 (upval)
				pollOwnershipUntilTrue(MockUserOwnsGamePassModule1, Number, FIntShopOwnershipFetchMaxAttemptsModule, ConstantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(Enabled)
					-- upvalues: writeOwnership (upval), Text (upval), v1 (upval), Players (upval), MarketplaceService (upval), Number (upval)
					if Enabled ~= true then return end
					writeOwnership(Text, Enabled)
					
					if v1 then
						local LocalPlayer = Players.LocalPlayer
						
						if LocalPlayer ~= nil then
							MarketplaceService:SignalPromptGamePassPurchaseFinished(LocalPlayer, Number, true)
						end
					end
				end):finally(function()
					-- upvalues: t2 (upval), Text (upval)
					t2[Text] = nil
				end)
			end)
			
			return
		end
	end)
	
	return {
		getCategories = Signal,
		getSections = Signal1,
		getLoading = Signal3,
		getError = Signal4,
		getOwnership = Signal8,
		getBonusPromotionEligibility = Signal9,
		getItemsPerRow = Signal10,
		getMetadata = Signal5,
		getGlobalIconBackendEnabled = Signal6,
		getGlobalIconHasNewOffers = Signal7,
		onShopOpened = onShopOpened,
		fetchAllShopData = fetchAllShopData,
		prefetchWidgetsOnly = prefetchWidgetsOnly,
		refreshShopItemInfo = refreshShopItemInfo,
		fetchGamePassOwnership = fetchGamePassOwnership,
		pollGamePassOwnership = pollGamePassOwnershipAfterPurchase,
		setItemsPerRow = function(p3)
			-- upvalues: Signal2_9 (copy)
			Signal2_9(p3)
		end
	}
end