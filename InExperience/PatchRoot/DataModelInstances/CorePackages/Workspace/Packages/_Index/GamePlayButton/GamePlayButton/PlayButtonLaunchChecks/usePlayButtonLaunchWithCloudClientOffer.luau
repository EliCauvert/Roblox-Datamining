local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(GamePlayButton.PlayButtonTypes)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UnlockPlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.unlockPlayIntent
local _ = require(Parent.PlayabilityRodux)
local CloudClientOfferModule = require(Parent.CloudClientOffer)
local GetFFlagLuaAppEnableVirtualEventPlaceIdFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId

return function(UniverseId, p1, p2, p3, PageName, Callback)
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), UseDispatchFunction (copy), ReactModule (copy), CloudClientOfferModule (copy), GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (copy), UnlockPlayIntentFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), CloudClientOfferModule (upval)
		return function()
			-- upvalues: UseRefResult (upval), CloudClientOfferModule (upval)
			local Current = UseRefResult.current
			
			if Current ~= nil then
				CloudClientOfferModule.GetCloudClientOfferStore(false).cancel(Current)
			end
		end
	end, {})
	
	return ReactModule.useCallback(function(p4, p5, p6)
		-- upvalues: GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (upval), p1 (copy), p2 (copy), Callback (copy), CloudClientOfferModule (upval), UseRefResult (copy), UseDispatchResult (copy), UnlockPlayIntentFunction (upval), UseRoactServiceResult (copy), UniverseId (copy), p3 (copy), PageName (copy)
		local FFlagLuaAppEnableVirtualEventPlaceId = GetFFlagLuaAppEnableVirtualEventPlaceIdFunction()
		
		if not (if FFlagLuaAppEnableVirtualEventPlaceId then p1 ~= nil and p2 ~= nil else p2 ~= nil) or p6 ~= nil and p6.hasShownUpsell == true then
			Callback(p4, p5, p6)
			
			return
		end
		local CloudClientOfferStore = CloudClientOfferModule.GetCloudClientOfferStore(false)
		local RequestResult = CloudClientOfferStore.request(tostring(if FFlagLuaAppEnableVirtualEventPlaceId then p1 else p2), function(p7)
			-- upvalues: UseRefResult (upval), Callback (upval), p4 (copy), p5 (copy)
			UseRefResult.current = nil
			
			if p7.kind == "Stream" then
				Callback(p4, p5, {
					cloudClientReservation = {
						reservationToken = p7.offer.reservationToken,
						offerKind = p7.offer.kind
					}
				})
				
				return
			end
			if p7.kind == "Local" then
				Callback(p4, p5)
			end
		end, function(p7)
			-- upvalues: UseRefResult (upval), UseDispatchResult (upval), CloudClientOfferModule (upval), CloudClientOfferStore (copy), UnlockPlayIntentFunction (upval), UseRoactServiceResult (upval), UniverseId (upval), p3 (upval), PageName (upval)
			UseRefResult.current = nil
			UseDispatchResult(CloudClientOfferModule.OpenCloudClientOfferSheet(CloudClientOfferStore, p7))
			UnlockPlayIntentFunction(UseRoactServiceResult, {
				universeId = UniverseId,
				upsellName = p7.kind,
				playabilityStatus = p3 and p3.playabilityStatus or nil,
				pageName = PageName
			})
		end)
		
		if RequestResult ~= nil then
			UseRefResult.current = RequestResult
		end
	end, {
		UniverseId, p1, p2, p3, PageName, Callback, UseDispatchResult,
		UseRoactServiceResult
	})
end