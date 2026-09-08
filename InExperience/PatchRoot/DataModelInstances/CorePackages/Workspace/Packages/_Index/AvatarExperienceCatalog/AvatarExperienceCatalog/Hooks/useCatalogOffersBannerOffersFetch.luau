local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local useAvatarRoute = require(parent.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local fFlagAXCatalogOffersClearOnLogout = require(parent.AvatarExperienceFlags).FFlagAXCatalogOffersClearOnLogout
local AXCatalogOffersRefetchOnVisible = game:DefineFastFlag("AXCatalogOffersRefetchOnVisible", false)
local _ = require(avatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local getLocalUserIdModule = require(avatarExperienceCatalog.Utils.getLocalUserId)

return function(p1, p2)
	-- upvalues: fFlagAXCatalogOffersClearOnLogout (ref), reactModule (ref), getLocalUserIdModule (ref), playersService (ref), AXCatalogOffersRefetchOnVisible (ref), useAvatarRoute (ref)
	if fFlagAXCatalogOffersClearOnLogout then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), p2 (ref), getLocalUserIdModule (copy), playersService (copy)
			local var1 = if not (p1.getHasCompletedOffersFetch(false) or p1.getOffersFetchInProgress(false)) then p1.fetchOffers(p2) else nil
			local var2 = getLocalUserIdModule(playersService)
			
			local function handle()
				-- upvalues: getLocalUserIdModule (copy), playersService (copy), var2 (write), var1 (write), p1 (copy), p2 (copy)
				local var3 = getLocalUserIdModule(playersService)
				
				if var3 == var2 then return end
				var2 = var3
				
				if var1 then
					var1()
					var1 = nil
				end
				p1.setPayload(nil)
				p1.setDismissed(false)
				
				if var3 ~= nil and var3 ~= "-1" then
					var1 = p1.fetchOffers(p2)
				end
			end
			
			local var3 = nil
			
			local function _()
				-- upvalues: var3 (write), playersService (copy), handle (ref)
				if var3 then
					var3:Disconnect()
					var3 = nil
				end
				local localPlayer = playersService.LocalPlayer
				
				if localPlayer ~= nil then
					var3 = localPlayer:GetPropertyChangedSignal("UserId"):Connect(handle)
				end
			end
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer ~= nil then
				var3 = localPlayer:GetPropertyChangedSignal("UserId"):Connect(handle)
			end
			local var4 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
				-- upvalues: var3 (write), playersService (copy), handle (ref)
				if var3 then
					var3:Disconnect()
					var3 = nil
				end
				local localPlayer = playersService.LocalPlayer
				
				if localPlayer ~= nil then
					var3 = localPlayer:GetPropertyChangedSignal("UserId"):Connect(handle)
				end
				handle()
			end)
			
			return function()
				-- upvalues: var1 (write), var3 (write), var4 (ref)
				if var1 then
					var1()
					var1 = nil
				end
				if var3 then
					var3:Disconnect()
					var3 = nil
				end
				var4:Disconnect()
			end
		end, { p1, p2 })
	else
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), p2 (ref)
			return if p1.getHasCompletedOffersFetch(false) or p1.getOffersFetchInProgress(false) then function() end else p1.fetchOffers(p2)
		end, { p2, p1 })
	end
	if AXCatalogOffersRefetchOnVisible then
		local var1 = reactModule.useRef(true)
		local var2 = useAvatarRoute()
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), var1 (ref), p1 (ref), p2 (ref)
			local var3 = var2 ~= nil and var2.isVisible
			
			if var3 and not var1.current then
				p1.fetchOffers(p2)
			end
			var1.current = var3
		end, { p2, p1, var2 })
	end
end