local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local Parent = ProgressLoading.Parent
local ColorMode = require(Parent.Foundation).Enums.ColorMode
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local RoactRoduxModule = require(Parent.RoactRodux)
local Constants = require(Parent.UIBlox).App.Style.Constants
local UiModeStyleProvider = require(Parent.Style).UiModeStyleProvider
local ResponsiveModule = require(Parent.Responsive)
local CachedPolicyServiceModule = require(Parent.CachedPolicyService)
local LoadingScreenViewModule = require(script.Parent.LoadingScreenView)
local FFlagEnableTiltLoadingScreen = require(Parent.SharedFlags).FFlagEnableTiltLoadingScreen
local GetDeferredAssetStoreModule = require(script.Parent.Stores.GetDeferredAssetStore)
local PregameOverrideModule = require(script.Parent.Stores.PregameOverride)
local GetJoiningPlaceModule = require(script.Parent.getJoiningPlace)
local CreateNetworkingModule = require(script.Parent.createNetworking)
local Url = require(Parent.Http).Url
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local DeferredAssetManagerService = if require(ProgressLoading.Flags.EngineFeatureEnableDeferredAssetManagerService) then game:GetService("DeferredAssetManagerService") else nil
local NewResult = require(Parent.Rodux).Store.new(function(p1)
	return p1 or {}
end, {})

local function getIsLoadingAssets(p1)
	-- upvalues: GetDeferredAssetStoreModule (copy)
	local DeferredAssetStoreModule = GetDeferredAssetStoreModule(p1)
	
	return if DeferredAssetStoreModule then DeferredAssetStoreModule.getDownloadStatus(p1) == Enum.PrefetchDownloadStatus.InProgress or DeferredAssetStoreModule.getPregameLoadingScreenOnly(p1) else false
end

local function onCancel()
	-- upvalues: DeferredAssetManagerService (copy)
	if DeferredAssetManagerService then
		DeferredAssetManagerService:CancelPrefetch()
	end
end

local function PregameOverrideScreen(p1)
	-- upvalues: ReactModule (copy), RunService (copy), onCancel (copy)
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval)
		RunService:SetRobloxGuiFocused(true)
		
		return function()
			-- upvalues: RunService (upval)
			RunService:SetRobloxGuiFocused(false)
		end
	end, {})
	
	return p1.override.render({ displayOrder = 9999, onCancel = onCancel })
end

return ReactModule.memo(function(_)
	-- upvalues: SignalsReactModule (copy), getIsLoadingAssets (copy), GetJoiningPlaceModule (copy), ReactModule (copy), FFlagBuildExperienceLibrary (copy), PregameOverrideModule (copy), ResponsiveModule (copy), FFlagEnableTiltLoadingScreen (copy), MarketplaceService (copy), Url (copy), CreateNetworkingModule (copy), CachedPolicyServiceModule (copy), PregameOverrideScreen (copy), DeferredAssetManagerService (copy), onCancel (copy), RoactRoduxModule (copy), NewResult (copy), UiModeStyleProvider (copy), ColorMode (copy), Constants (copy), LoadingScreenViewModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(getIsLoadingAssets)
	local JoiningPlaceId = if UseSignalStateResult then GetJoiningPlaceModule.getJoiningPlaceId() else 0
	local JoiningUniverseId = if UseSignalStateResult then GetJoiningPlaceModule.getJoiningUniverseId() else 0
	local UseSignalStateResult1 = nil
	local UseRefResult = ReactModule.useRef(nil)
	
	if FFlagBuildExperienceLibrary then
		UseSignalStateResult1 = SignalsReactModule.useSignalState(PregameOverrideModule.getPregameOverride)
		
		if UseSignalStateResult then
			if UseRefResult.current == nil then
				UseRefResult.current = os.clock()
			end
		else
			UseRefResult.current = nil
		end
		local UseRefResult2 = ReactModule.useRef(UseSignalStateResult)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult2 (copy), UseSignalStateResult (copy), PregameOverrideModule (upval)
			if UseRefResult2.current and not UseSignalStateResult then
				PregameOverrideModule.setPregameOverride(nil)
			end
			UseRefResult2.current = UseSignalStateResult
		end, { UseSignalStateResult })
	end
	local UseRefResult1 = ReactModule.useRef(nil)
	UseRefResult1.current = ResponsiveModule.usePreferredInput()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableTiltLoadingScreen (upval), JoiningPlaceId (copy), UseStateResult2 (copy), MarketplaceService (upval)
		if FFlagEnableTiltLoadingScreen then return end
		if JoiningPlaceId <= 0 then
			UseStateResult2(nil)
			
			return
		end
		local Flag = false
		task.spawn(function()
			-- upvalues: MarketplaceService (upval), JoiningPlaceId (upval), Flag (ref), UseStateResult2 (upval)
			local Success, Result = pcall(function()
				-- upvalues: MarketplaceService (upval), JoiningPlaceId (upval)
				return MarketplaceService:GetProductInfo(JoiningPlaceId)
			end)
			
			if Success and Result and not Flag then
				UseStateResult2(Result)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { JoiningPlaceId })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableTiltLoadingScreen (upval), JoiningPlaceId (copy), JoiningUniverseId (copy), UseStateResult2_1 (copy), Url (upval), CreateNetworkingModule (upval)
		if FFlagEnableTiltLoadingScreen then return end
		if JoiningPlaceId <= 0 or JoiningUniverseId > 0 then
			UseStateResult2_1(0)
			
			return
		end
		local Flag = false
		CreateNetworkingModule(string.format("%suniverses/v1/places/%d/universe", Url.APIS_URL, JoiningPlaceId), "GET"):andThen(function(Result)
			-- upvalues: Flag (ref), UseStateResult2_1 (upval)
			if not Flag and Result and Result.responseBody and Result.responseBody.universeId then
				UseStateResult2_1(Result.responseBody.universeId)
			end
		end, function() end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { JoiningPlaceId, JoiningUniverseId })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableTiltLoadingScreen (upval), CachedPolicyServiceModule (upval), UseStateResult2_2 (copy)
		if FFlagEnableTiltLoadingScreen then return end
		local Flag = false
		task.spawn(function()
			-- upvalues: CachedPolicyServiceModule (upval), Flag (ref), UseStateResult2_2 (upval)
			local IsSubjectToChinaPolicies = CachedPolicyServiceModule:IsSubjectToChinaPolicies()
			
			if not Flag then
				UseStateResult2_2(IsSubjectToChinaPolicies == true)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {})
	
	return if UseSignalStateResult and JoiningPlaceId > 0 then if FFlagBuildExperienceLibrary and UseSignalStateResult1 ~= nil and UseRefResult.current ~= nil and PregameOverrideModule.claims(UseSignalStateResult1, JoiningPlaceId, UseRefResult.current) then ReactModule.createElement(PregameOverrideScreen, { override = UseSignalStateResult1 }) elseif FFlagEnableTiltLoadingScreen then ReactModule.createElement(require(script.Parent.TiltLoadingScreen.TiltLoadingScreenContainer), {
		key = tostring(JoiningPlaceId),
		placeId = JoiningPlaceId,
		deferredJoin = {
			displayOrder = 9999,
			universeId = JoiningUniverseId,
			assetService = DeferredAssetManagerService
		},
		onCancel = onCancel
	}) else ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = NewResult }, {
		StyleProvider = ReactModule.createElement(UiModeStyleProvider, {
			style = {
				themeName = ColorMode.Dark,
				fontName = Constants.FontName.Gotham
			}
		}, {
			LoadingScreen = ReactModule.createElement(LoadingScreenViewModule, {
				displayOrder = 9999,
				manageRobloxGuiFocus = true,
				placeId = JoiningPlaceId,
				universeId = if JoiningUniverseId > 0 then JoiningUniverseId else UseStateResult1,
				productInfo = UseStateResult,
				isSubjectToChinaPolicies = UseStateResult3,
				preferredInputRef = UseRefResult1,
				onCloseButtonActivated = onCancel,
				onGamepadCancel = onCancel
			})
		})
	}) else nil
end)