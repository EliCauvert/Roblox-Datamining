local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local colorMode = require(parent.Foundation).Enums.ColorMode
local marketplaceService = game:GetService("MarketplaceService")
local runService = game:GetService("RunService")
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
local pregameOverrideModule = require(script.Parent.Stores.PregameOverride)
local getJoiningPlaceModule = require(script.Parent.getJoiningPlace)
local createNetworkingModule = require(script.Parent.createNetworking)
local url = require(parent.Http).Url
local fFlagBuildExperienceLibrary = require(parent.SharedFlags).FFlagBuildExperienceLibrary
local var1 = if require(progressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService) then game:GetService("DeferredAssetManagerService") else nil
local var2 = roduxModule.Store.new(function(p1)
	return p1 or {}
end, {})

local function getIsLoadingAssets(value)
	-- upvalues: getDeferredAssetStoreModule (ref)
	local var3 = getDeferredAssetStoreModule(value)
	
	return if var3 then if var3.getDownloadStatus(value) ~= Enum.PrefetchDownloadStatus.InProgress then var3.getPregameLoadingScreenOnly(value) else true else false
end

local function onCancel()
	-- upvalues: var1 (ref)
	if var1 then
		var1:CancelPrefetch()
	end
end

local function PregameOverrideScreen(p1)
	-- upvalues: reactModule (ref), runService (ref), onCancel (ref)
	reactModule.useEffect(function()
		-- upvalues: runService (copy)
		runService:SetRobloxGuiFocused(true)
		
		return function()
			-- upvalues: runService (copy)
			runService:SetRobloxGuiFocused(false)
		end
	end, {})
	
	return p1.override.render({ displayOrder = 9999, onCancel = onCancel })
end

return reactModule.memo(function(_)
	-- upvalues: signalsReactModule (ref), getIsLoadingAssets (ref), getJoiningPlaceModule (ref), reactModule (ref), fFlagBuildExperienceLibrary (ref), pregameOverrideModule (ref), responsiveModule (ref), marketplaceService (ref), url (ref), createNetworkingModule (ref), cachedPolicyServiceModule (ref), PregameOverrideScreen (ref), roactRoduxModule (ref), var2 (ref), uiModeStyleProvider (ref), colorMode (ref), constants (ref), loadingScreenViewModule (ref), onCancel (ref)
	local var3 = signalsReactModule.useSignalState(getIsLoadingAssets)
	local var4 = if var3 then getJoiningPlaceModule.getJoiningPlaceId() else 0
	local var5 = if var3 then getJoiningPlaceModule.getJoiningUniverseId() else 0
	local var6 = nil
	local var7 = reactModule.useRef(nil)
	
	if fFlagBuildExperienceLibrary then
		var6 = signalsReactModule.useSignalState(pregameOverrideModule.getPregameOverride)
		
		if not var3 then
			var7.current = nil
		elseif var7.current == nil then
			var7.current = os.clock()
		end
		local var8 = reactModule.useRef(var3)
		reactModule.useEffect(function()
			-- upvalues: var8 (ref), var3 (ref), pregameOverrideModule (copy)
			if var8.current and not var3 then
				pregameOverrideModule.setPregameOverride(nil)
			end
			var8.current = var3
		end, { var3 })
	end
	local var9 = reactModule.useRef(nil)
	var9.current = responsiveModule.usePreferredInput()
	local var10, var11 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var11 (ref), marketplaceService (copy)
		if var4 <= 0 then
			var11(nil)
			
			return
		end
		local var12 = false
		task.spawn(function()
			-- upvalues: marketplaceService (copy), var4 (copy), var12 (write), var11 (copy)
			local ok, status = pcall(function()
				-- upvalues: marketplaceService (copy), var4 (copy)
				return marketplaceService:GetProductInfo(var4)
			end)
			
			if ok and status and not var12 then
				var11(status)
			end
		end)
		
		return function()
			-- upvalues: var12 (write)
			var12 = true
		end
	end, { var4 })
	local var12, var13 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref), var13 (ref), url (copy), createNetworkingModule (copy)
		if var4 <= 0 or var5 > 0 then
			var13(0)
			
			return
		end
		local var14 = false
		createNetworkingModule(string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, var4), "GET"):andThen(function(p1)
			-- upvalues: var14 (write), var13 (copy)
			if not var14 and p1 and (p1.responseBody and p1.responseBody.universeId) then
				var13(p1.responseBody.universeId)
			end
		end, function() end)
		
		return function()
			-- upvalues: var14 (write)
			var14 = true
		end
	end, { var4, var5 })
	local var14, var15 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: cachedPolicyServiceModule (copy), var15 (ref)
		local var16 = false
		task.spawn(function()
			-- upvalues: cachedPolicyServiceModule (copy), var16 (write), var15 (copy)
			local var17 = cachedPolicyServiceModule:IsSubjectToChinaPolicies()
			
			if not var16 then
				var15(var17 == true)
			end
		end)
		
		return function()
			-- upvalues: var16 (write)
			var16 = true
		end
	end, {})
	
	return if not (not var3 or var4 <= 0) then if fFlagBuildExperienceLibrary and var6 ~= nil and (var7.current ~= nil and pregameOverrideModule.claims(var6, var4, var7.current)) then reactModule.createElement(PregameOverrideScreen, { override = var6 }) else reactModule.createElement(roactRoduxModule.StoreProvider, { store = var2 }, {
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
				universeId = if var5 > 0 then var5 else var12,
				productInfo = var10,
				isSubjectToChinaPolicies = var14,
				preferredInputRef = var9,
				onCloseButtonActivated = onCancel,
				onGamepadCancel = onCancel
			})
		})
	}) else nil
end)