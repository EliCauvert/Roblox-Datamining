local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local colorMode = require(parent.Foundation).Enums.ColorMode
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
local var1 = if engineFeatureEnableDeferredAssetManagerServiceModule then game:GetService("DeferredAssetManagerService") else nil
local var2 = roduxModule.Store.new(function(p1)
	return p1 or {}
end, {})

local function getIsLoadingAssets(value)
	-- upvalues: getDeferredAssetStoreModule (ref)
	local var3 = getDeferredAssetStoreModule(value)
	
	return if var3 then if var3.getDownloadStatus(value) ~= Enum.PrefetchDownloadStatus.InProgress then var3.getPregameLoadingScreenOnly(value) else true else false
end

local function _()
	-- upvalues: engineFeatureEnableDeferredAssetManagerServiceModule (ref), var1 (ref)
	return if engineFeatureEnableDeferredAssetManagerServiceModule and var1 then var1.JoiningPlaceId or 0 else 0
end

local _ = function()
	-- upvalues: engineFeatureEnableDeferredAssetManagerServiceModule (ref), var1 (ref)
	return if engineFeatureEnableDeferredAssetManagerServiceModule and var1 then var1.JoiningUniverseId or 0 else 0
end

local function onCancel()
	-- upvalues: var1 (ref)
	if var1 then
		var1:CancelPrefetch()
	end
end

return reactModule.memo(function(_)
	-- upvalues: signalsReactModule (ref), getIsLoadingAssets (ref), engineFeatureEnableDeferredAssetManagerServiceModule (ref), var1 (ref), reactModule (ref), responsiveModule (ref), marketplaceService (ref), url (ref), createNetworkingModule (ref), cachedPolicyServiceModule (ref), roactRoduxModule (ref), var2 (ref), uiModeStyleProvider (ref), colorMode (ref), constants (ref), loadingScreenViewModule (ref), onCancel (ref)
	local var3 = signalsReactModule.useSignalState(getIsLoadingAssets)
	local var4 = if not var3 then if engineFeatureEnableDeferredAssetManagerServiceModule and var1 then var1.JoiningPlaceId or 0 else 0 else 0
	local var5 = if not var3 then if engineFeatureEnableDeferredAssetManagerServiceModule and var1 then var1.JoiningUniverseId or 0 else 0 else 0
	local var6 = reactModule.useRef(nil)
	var6.current = responsiveModule.usePreferredInput()
	local var7, var8 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var8 (ref), marketplaceService (copy)
		if var4 <= 0 then
			var8(nil)
			
			return
		end
		local var9 = false
		task.spawn(function()
			-- upvalues: marketplaceService (copy), var4 (copy), var9 (write), var8 (copy)
			local ok, status = pcall(function()
				-- upvalues: marketplaceService (copy), var4 (copy)
				return marketplaceService:GetProductInfo(var4)
			end)
			
			if ok and status and not var9 then
				var8(status)
			end
		end)
		
		return function()
			-- upvalues: var9 (write)
			var9 = true
		end
	end, { var4 })
	local var9, var10 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref), var10 (ref), url (copy), createNetworkingModule (copy)
		if var4 <= 0 or var5 > 0 then
			var10(0)
			
			return
		end
		local var11 = false
		createNetworkingModule(string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, var4), "GET"):andThen(function(p1)
			-- upvalues: var11 (write), var10 (copy)
			if not var11 and p1 and (p1.responseBody and p1.responseBody.universeId) then
				var10(p1.responseBody.universeId)
			end
		end, function() end)
		
		return function()
			-- upvalues: var11 (write)
			var11 = true
		end
	end, { var4, var5 })
	local var11, var12 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: cachedPolicyServiceModule (copy), var12 (ref)
		local var13 = false
		task.spawn(function()
			-- upvalues: cachedPolicyServiceModule (copy), var13 (write), var12 (copy)
			local var14 = cachedPolicyServiceModule:IsSubjectToChinaPolicies()
			
			if not var13 then
				var12(var14 == true)
			end
		end)
		
		return function()
			-- upvalues: var13 (write)
			var13 = true
		end
	end, {})
	
	return if var3 and var4 > 0 then reactModule.createElement(roactRoduxModule.StoreProvider, { store = var2 }, {
		StyleProvider = reactModule.createElement(uiModeStyleProvider, {
			style = {
				themeName = colorMode.Dark,
				fontName = constants.FontName.Gotham
			}
		}, {
			LoadingScreen = reactModule.createElement(loadingScreenViewModule, {
				displayOrder = 9999,
				manageRobloxGuiFocus = true,
				placeId = var4,
				universeId = if var5 > 0 then var5 else var9,
				productInfo = var7,
				isSubjectToChinaPolicies = var11,
				preferredInputRef = var6,
				onCloseButtonActivated = onCancel,
				onGamepadCancel = onCancel
			})
		})
	}) else nil
end)