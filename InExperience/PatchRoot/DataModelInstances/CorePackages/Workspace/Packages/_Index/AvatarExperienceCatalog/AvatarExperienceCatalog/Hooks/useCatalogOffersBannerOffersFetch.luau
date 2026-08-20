local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local fFlagAXCatalogOffersClearOnLogout = require(parent.AvatarExperienceFlags).FFlagAXCatalogOffersClearOnLogout
local _ = require(avatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local getLocalUserIdModule = require(avatarExperienceCatalog.Utils.getLocalUserId)

return function(p0, p1) --[[ line: 51 | named "useCatalogOffersBannerOffersFetch" ]]
	-- upvalues: fFlagAXCatalogOffersClearOnLogout (ref), reactModule (ref), getLocalUserIdModule (ref), playersService (ref)
	if fFlagAXCatalogOffersClearOnLogout then
		reactModule.useEffect(function() --[[ line: 56 ]]
			-- upvalues: p0 (ref), p1 (ref), getLocalUserIdModule (copy), playersService (copy)
			local var4 = if not (p0.getHasCompletedOffersFetch(false) or p0.getOffersFetchInProgress(false)) then p0.fetchOffers(p1) else nil
			local var5 = getLocalUserIdModule(playersService)
			
			local function handle() --[[ line: 76 ]]
				-- upvalues: getLocalUserIdModule (copy), playersService (copy), var5 (write), var4 (write), p0 (copy), p1 (copy)
				local var9 = getLocalUserIdModule(playersService)
				
				if var9 == var5 then return end
				var5 = var9
				
				if var4 then
					var4()
					var4 = nil
				end
				p0.setPayload(nil)
				p0.setDismissed(false)
				
				if var9 ~= nil and var9 ~= "-1" then
					var4 = p0.fetchOffers(p1)
				end
			end
			
			local var7 = nil
			
			local function _() --[[ line: 98 | named "bindUserIdSignal" ]]
				-- upvalues: var7 (write), playersService (copy), handle (ref)
				if var7 then
					var7:Disconnect()
					var7 = nil
				end
				local localPlayer = playersService.LocalPlayer
				
				if localPlayer ~= nil then
					var7 = localPlayer:GetPropertyChangedSignal("UserId"):Connect(handle)
				end
			end
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer ~= nil then
				var7 = localPlayer:GetPropertyChangedSignal("UserId"):Connect(handle)
			end
			local var8 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ line: 111 ]]
				-- upvalues: var7 (write), playersService (copy), handle (ref)
				if var7 then
					var7:Disconnect()
					var7 = nil
				end
				local localPlayer = playersService.LocalPlayer
				
				if localPlayer ~= nil then
					var7 = localPlayer:GetPropertyChangedSignal("UserId"):Connect(handle)
				end
				handle()
			end)
			
			return function() --[[ line: 116 ]]
				-- upvalues: var4 (write), var7 (write), var8 (ref)
				if var4 then
					var4()
					var4 = nil
				end
				if var7 then
					var7:Disconnect()
					var7 = nil
				end
				var8:Disconnect()
			end
		end, { p0, p1 })
		
		return
	end
	reactModule.useEffect(function() --[[ line: 129 ]]
		-- upvalues: p0 (ref), p1 (ref)
		return if p0.getHasCompletedOffersFetch(false) or p0.getOffersFetchInProgress(false) then function() --[[ line: 134 ]] end else p0.fetchOffers(p1)
	end, { p1, p0 })
end