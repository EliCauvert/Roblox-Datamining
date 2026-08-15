local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local marketplaceService = game:GetService("MarketplaceService")
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local roduxModule = require(parent.Rodux)
local roactRoduxModule = require(parent.RoactRodux)
local constants = require(parent.UIBlox).App.Style.Constants
local uiModeStyleProvider = require(parent.Style).UiModeStyleProvider
local responsiveModule = require(parent.Responsive)
local cachedPolicyServiceModule = require(parent.CachedPolicyService)
local loadingScreenViewModule = require(script.Parent.LoadingScreenView)
local getDeferredAssetStoreModule = require(script.Parent.Stores.GetDeferredAssetStore)
local createNetworkingModule = require(script.Parent.createNetworking)
local url = require(parent.Http).Url
local engineFeatureEnableDeferredAssetManagerServiceModule = require(progressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService)
local var12 = if engineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil
local var13 = roduxModule.Store.new(function(p0) --[[ line: 36 ]]
	return p0 or {}
end, {})

local function getIsLoadingAssets(value) --[[ line: 43 ]]
	-- upvalues: getDeferredAssetStoreModule (ref)
	local var16 = getDeferredAssetStoreModule(value)
	
	return if var16 then if var16.getDownloadStatus(value) ~= Enum.PrefetchDownloadStatus.InProgress then var16.getPregameLoadingScreenOnly(value) else true else false
end

local function _() --[[ line: 56 | named "getJoiningPlaceId" ]]
	-- upvalues: engineFeatureEnableDeferredAssetManagerServiceModule (ref), var12 (ref)
	return if engineFeatureEnableDeferredAssetManagerServiceModule and var12 then var12.JoiningPlaceId or 0 else 0
end

local _ = function() --[[ line: 63 | named "getJoiningUniverseId" ]]
	-- upvalues: engineFeatureEnableDeferredAssetManagerServiceModule (ref), var12 (ref)
	return if engineFeatureEnableDeferredAssetManagerServiceModule and var12 then var12.JoiningUniverseId or 0 else 0
end

local function onCancel() --[[ line: 70 ]]
	-- upvalues: var12 (ref)
	if var12 then
		var12:CancelPrefetch()
	end
end

return reactModule.memo(function(_) --[[ line: 76 | named "PreGameLoadingScreen" ]]
	-- upvalues: signalsReactModule (ref), getIsLoadingAssets (ref), engineFeatureEnableDeferredAssetManagerServiceModule (ref), var12 (ref), reactModule (ref), responsiveModule (ref), marketplaceService (ref), url (ref), createNetworkingModule (ref), cachedPolicyServiceModule (ref), roactRoduxModule (ref), var13 (ref), uiModeStyleProvider (ref), constants (ref), loadingScreenViewModule (ref), onCancel (ref)
	local var17 = signalsReactModule.useSignalState(getIsLoadingAssets)
	local var18 = if not var17 then if engineFeatureEnableDeferredAssetManagerServiceModule and var12 then var12.JoiningPlaceId or 0 else 0 else 0
	local var19 = if not var17 then if engineFeatureEnableDeferredAssetManagerServiceModule and var12 then var12.JoiningUniverseId or 0 else 0 else 0
	local var20 = reactModule.useRef(nil)
	var20.current = responsiveModule.usePreferredInput()
	local var21, var22 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: var18 (ref), var22 (ref), marketplaceService (copy)
		if var18 <= 0 then
			var22(nil)
			
			return
		end
		local var27 = false
		task.spawn(function() --[[ line: 92 ]]
			-- upvalues: marketplaceService (copy), var18 (copy), var27 (write), var22 (copy)
			local ok, status = pcall(function() --[[ line: 93 ]]
				-- upvalues: marketplaceService (copy), var18 (copy)
				return marketplaceService:GetProductInfo(var18)
			end)
			
			if ok and status and not var27 then
				var22(status)
			end
		end)
		
		return function() --[[ line: 100 ]]
			-- upvalues: var27 (write)
			var27 = true
		end
	end, { var18 })
	local var23, var24 = reactModule.useState(0)
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: var18 (ref), var19 (ref), var24 (ref), url (copy), createNetworkingModule (copy)
		if var18 <= 0 or var19 > 0 then
			var24(0)
			
			return
		end
		local var28 = false
		createNetworkingModule(string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, var18), "GET"):andThen(function(p1) --[[ line: 114 ]]
			-- upvalues: var28 (write), var24 (copy)
			if not var28 and p1 and (p1.responseBody and p1.responseBody.universeId) then
				var24(p1.responseBody.universeId)
			end
		end, function() --[[ line: 118 ]] end)
		
		return function() --[[ line: 119 ]]
			-- upvalues: var28 (write)
			var28 = true
		end
	end, { var18, var19 })
	local var25, var26 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 126 ]]
		-- upvalues: cachedPolicyServiceModule (copy), var26 (ref)
		local var29 = false
		task.spawn(function() --[[ line: 128 ]]
			-- upvalues: cachedPolicyServiceModule (copy), var29 (write), var26 (copy)
			local var30 = cachedPolicyServiceModule:IsSubjectToChinaPolicies()
			
			if not var29 then
				var26(var30 == true)
			end
		end)
		
		return function() --[[ line: 134 ]]
			-- upvalues: var29 (write)
			var29 = true
		end
	end, {})
	
	return if var17 and var18 > 0 then reactModule.createElement(roactRoduxModule.StoreProvider, { store = var13 }, {
		StyleProvider = reactModule.createElement(uiModeStyleProvider, {
			style = {
				themeName = constants.ThemeName.Dark,
				fontName = constants.FontName.Gotham
			}
		}, {
			LoadingScreen = reactModule.createElement(loadingScreenViewModule, {
				displayOrder = 9999,
				manageRobloxGuiFocus = true,
				placeId = var18,
				universeId = if var19 > 0 then var19 else var23,
				productInfo = var21,
				isSubjectToChinaPolicies = var25,
				preferredInputRef = var20,
				onCloseButtonActivated = onCancel,
				onGamepadCancel = onCancel
			})
		})
	}) else nil
end)