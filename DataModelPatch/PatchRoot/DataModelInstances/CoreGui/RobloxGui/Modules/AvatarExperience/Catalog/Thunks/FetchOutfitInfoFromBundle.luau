local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CryoModule = require(CorePackages.Packages.Cryo)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local PromiseModule = require(CorePackages.Packages.Promise)
local GetOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfit)
local FetchBundleAssetsDetailsModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchBundleAssetsDetails)
local FetchBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchBundleInfo)
local AXFixBundleOutfitFetchForShoes = game:DefineFastFlag("AXFixBundleOutfitFetchForShoes", false)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.FetchOutfitInfoFromBundleKey .. tostring(p1)
end

local _ = function(p1, p2): boolean
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), RetrievalStatusModule (copy)
	return PerformFetch.GetStatus(p1, CatalogConstantsModule.FetchBundleInfoKey .. tostring(p2)) == RetrievalStatusModule.Fetching
end

local _ = function(p1, p2): boolean
	-- upvalues: PerformFetch (copy), ConstantsModule (copy), RetrievalStatusModule (copy)
	return PerformFetch.GetStatus(p1, ConstantsModule.OutfitInfoKey .. tostring(p2)) == RetrievalStatusModule.Fetching
end

local _ = function(p1, p2): boolean
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), RetrievalStatusModule (copy)
	local BundleInfo = p1.AvatarExperience.Common.BundleInfos[p2]
	
	if BundleInfo and BundleInfo.receivedCatalogData or PerformFetch.GetStatus(p1, CatalogConstantsModule.FetchBundleInfoKey .. tostring(p2)) == RetrievalStatusModule.Fetching then
		return false
	else
		return true
	end
end

local function shouldFetchOutfitInfo(State, p1): boolean
	-- upvalues: AXFixBundleOutfitFetchForShoes (copy), UtilsModule (copy), PerformFetch (copy), ConstantsModule (copy), RetrievalStatusModule (copy)
	local BundleInfo = State.AvatarExperience.Common.BundleInfos[p1]
	
	if not BundleInfo or not BundleInfo.receivedCatalogData then
		return false
	elseif not AXFixBundleOutfitFetchForShoes and UtilsModule.isShoeBundle(BundleInfo) then
		return false
	else
		local UserOutfitIdFromBundle = UtilsModule.getUserOutfitIdFromBundle(BundleInfo)
		
		if State.AvatarExperience.AvatarEditor.OutfitInfos[UserOutfitIdFromBundle] or PerformFetch.GetStatus(State, ConstantsModule.OutfitInfoKey .. tostring(UserOutfitIdFromBundle)) == RetrievalStatusModule.Fetching then
			return false
		else
			return true
		end
	end
end

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), RetrievalStatusModule (copy), PromiseModule (copy), FetchBundleInfoModule (copy), AXFixBundleOutfitFetchForShoes (copy), UtilsModule (copy), CryoModule (copy), ConstantsModule (copy), GetOutfitModule (copy), FetchBundleAssetsDetailsModule (copy), shouldFetchOutfitInfo (copy)
	ArgCheckModule.isType(p1, "function", "FetchOutfitInfoFromBundle thunk expects networkImpl to be a function")
	ArgCheckModule.isType(p2, "string", "FetchOutfitInfoFromBundle thunk expects bundleId to be a string")
	
	return function(p3)
		-- upvalues: PerformFetch (upval), p2 (copy), CatalogConstantsModule (upval), RetrievalStatusModule (upval), PromiseModule (upval), FetchBundleInfoModule (upval), AXFixBundleOutfitFetchForShoes (upval), UtilsModule (upval), CryoModule (upval), ConstantsModule (upval), GetOutfitModule (upval), FetchBundleAssetsDetailsModule (upval), p1 (copy), shouldFetchOutfitInfo (upval)
		return if PerformFetch.GetStatus(p3:getState(), CatalogConstantsModule.FetchOutfitInfoFromBundleKey .. tostring(p2)) == RetrievalStatusModule.Fetching then PromiseModule.resolve() else PerformFetch.Single(CatalogConstantsModule.FetchOutfitInfoFromBundleKey .. tostring(p2), function(p4)
			-- upvalues: p2 (upval), PerformFetch (upval), CatalogConstantsModule (upval), RetrievalStatusModule (upval), FetchBundleInfoModule (upval), AXFixBundleOutfitFetchForShoes (upval), UtilsModule (upval), CryoModule (upval), ConstantsModule (upval), GetOutfitModule (upval), FetchBundleAssetsDetailsModule (upval), p1 (upval), shouldFetchOutfitInfo (upval), PromiseModule (upval)
			local State = p4:getState()
			local State1 = State
			local BundleInfo = State1.AvatarExperience.Common.BundleInfos[p2]
			local Flag = nil
			
			if BundleInfo and BundleInfo.receivedCatalogData or PerformFetch.GetStatus(State1, CatalogConstantsModule.FetchBundleInfoKey .. tostring(p2)) == RetrievalStatusModule.Fetching then
				Flag = false
			else
				Flag = true
			end
			if Flag then
				p4:dispatch(FetchBundleInfoModule(p2)):andThen(function(_)
					-- upvalues: State (ref), p4 (copy), AXFixBundleOutfitFetchForShoes (upval), p2 (upval), UtilsModule (upval), CryoModule (upval), PerformFetch (upval), ConstantsModule (upval), RetrievalStatusModule (upval), GetOutfitModule (upval), FetchBundleAssetsDetailsModule (upval), p1 (upval), shouldFetchOutfitInfo (upval), PromiseModule (upval)
					State = p4:getState()
					
					if AXFixBundleOutfitFetchForShoes then
						local BundleInfo = State.AvatarExperience.Common.BundleInfos[p2]
						local UserOutfitIdsFromBundle = UtilsModule.getUserOutfitIdsFromBundle(BundleInfo) or {}
						
						if CryoModule.isEmpty(UserOutfitIdsFromBundle) then
							local List = {}
							
							if BundleInfo.items then
								for _, item in BundleInfo.items do
									if item.type == ConstantsModule.ItemType.Asset then
										table.insert(List, (tonumber(item.id)))
									end
								end
							end
							p4:dispatch(FetchBundleAssetsDetailsModule(p1, p2, List))
						else
							for _, value in UserOutfitIdsFromBundle do
								if PerformFetch.GetStatus(State, ConstantsModule.OutfitInfoKey .. tostring(value)) ~= RetrievalStatusModule.Fetching then
									p4:dispatch(GetOutfitModule(value, nil, p2))
								end
							end
						end
					elseif shouldFetchOutfitInfo(State, p2) then
						for _, value1 in UtilsModule.getUserOutfitIdsFromBundle(State.AvatarExperience.Common.BundleInfos[p2]) do
							p4:dispatch(GetOutfitModule(value1, nil, p2))
						end
					else
						local BundleInfo = State.AvatarExperience.Common.BundleInfos[p2]
						
						if CryoModule.isEmpty((UtilsModule.getUserOutfitIdsFromBundle(BundleInfo))) then
							local List = {}
							
							if BundleInfo.items then
								for _, item1 in BundleInfo.items do
									table.insert(List, (tonumber(item1.id)))
								end
							end
							p4:dispatch(FetchBundleAssetsDetailsModule(p1, p2, List))
						end
					end
					return PromiseModule.resolve()
				end)
			elseif shouldFetchOutfitInfo(State, p2) then
				for _, value in UtilsModule.getUserOutfitIdsFromBundle(State.AvatarExperience.Common.BundleInfos[p2]) do
					p4:dispatch(GetOutfitModule(value, nil, p2))
				end
			end
			return PromiseModule.resolve()
		end)(p3)
	end
end