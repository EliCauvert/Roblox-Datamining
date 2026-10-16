local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local UseAvatarRouteFunction = require(Parent.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXCatalogOffersClearOnLogout = AvatarExperienceFlagsModule.FFlagAXCatalogOffersClearOnLogout
local FFlagAXOfferBannerImpressionOnlyOnStartup = AvatarExperienceFlagsModule.FFlagAXOfferBannerImpressionOnlyOnStartup
local _ = require(AvatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local CatalogOffersBannerImpressionsStoreModule = require(AvatarExperienceCatalog.Stores.catalogOffersBannerImpressionsStore)
local GetLocalUserIdModule = require(AvatarExperienceCatalog.Utils.getLocalUserId)

return function(p1, p2) --[[ Line: 56 | Named "useCatalogOffersBannerOffersFetch" ]]
	-- upvalues: FFlagAXCatalogOffersClearOnLogout (copy), ReactModule (copy), GetLocalUserIdModule (copy), Players (copy), FFlagAXOfferBannerImpressionOnlyOnStartup (copy), CatalogOffersBannerImpressionsStoreModule (copy), UseAvatarRouteFunction (copy)
	if FFlagAXCatalogOffersClearOnLogout then
		ReactModule.useEffect(function() --[[ Line: 61 ]]
			-- upvalues: p1 (copy), p2 (copy), GetLocalUserIdModule (upval), Players (upval), FFlagAXOfferBannerImpressionOnlyOnStartup (upval), CatalogOffersBannerImpressionsStoreModule (upval)
			local Offers: (() -> ())? = if p1.getHasCompletedOffersFetch(false) or p1.getOffersFetchInProgress(false) then nil else p1.fetchOffers(p2)
			local LocalUserIdModule = GetLocalUserIdModule(Players)
			
			local function handle() --[[ Line: 81 ]]
				-- upvalues: GetLocalUserIdModule (upval), Players (upval), LocalUserIdModule (ref), Offers (ref), p1 (upval), FFlagAXOfferBannerImpressionOnlyOnStartup (upval), CatalogOffersBannerImpressionsStoreModule (upval), p2 (upval)
				local LocalUserIdModule1 = GetLocalUserIdModule(Players)
				
				if LocalUserIdModule1 == LocalUserIdModule then return end
				LocalUserIdModule = LocalUserIdModule1
				
				if Offers then
					Offers()
					Offers = nil
				end
				p1.setPayload(nil)
				p1.setDismissed(false)
				
				if FFlagAXOfferBannerImpressionOnlyOnStartup then
					CatalogOffersBannerImpressionsStoreModule.clearOfferIds()
				end
				if LocalUserIdModule1 ~= nil and LocalUserIdModule1 ~= "-1" then
					Offers = p1.fetchOffers(p2)
				end
			end
			
			local Connection = nil
			
			local function _() --[[ Line: 107 | Named "bindUserIdSignal" ]]
				-- upvalues: Connection (ref), Players (upval), handle (copy)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				local LocalPlayer = Players.LocalPlayer
				
				if LocalPlayer ~= nil then
					Connection = LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(handle)
				end
			end
			
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer ~= nil then
				Connection = LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(handle)
			end
			local Connection1 = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 120 ]]
				-- upvalues: Connection (ref), Players (upval), handle (copy)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				local LocalPlayer = Players.LocalPlayer
				
				if LocalPlayer ~= nil then
					Connection = LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(handle)
				end
				handle()
			end)
			
			return function() --[[ Line: 125 ]]
				-- upvalues: Offers (ref), Connection (ref), Connection1 (copy)
				if Offers then
					Offers()
					Offers = nil
				end
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				Connection1:Disconnect()
			end
		end, { p1, p2 })
	else
		ReactModule.useEffect(function() --[[ Line: 138 ]]
			-- upvalues: p1 (copy), p2 (copy)
			return if p1.getHasCompletedOffersFetch(false) or p1.getOffersFetchInProgress(false) then function() --[[ Line: 143 ]] end else p1.fetchOffers(p2)
		end, { p2, p1 })
	end
	local UseRefResult = ReactModule.useRef(true)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	ReactModule.useEffect(function() --[[ Line: 152 ]]
		-- upvalues: UseAvatarRouteResult (copy), UseRefResult (copy), p1 (copy), p2 (copy)
		local IsVisible = UseAvatarRouteResult ~= nil and UseAvatarRouteResult.isVisible
		
		if IsVisible and not UseRefResult.current then
			p1.fetchOffers(p2)
		end
		UseRefResult.current = IsVisible
	end, { p2, p1, UseAvatarRouteResult })
end