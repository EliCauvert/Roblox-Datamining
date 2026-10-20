local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local FFlagAXCatalogOffersClearOnLogout = require(Parent.AvatarExperienceFlags).FFlagAXCatalogOffersClearOnLogout
local _ = require(AvatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local GetLocalUserIdModule = require(AvatarExperienceCatalog.Utils.getLocalUserId)

return function(p1, p2)
	-- upvalues: FFlagAXCatalogOffersClearOnLogout (copy), ReactModule (copy), GetLocalUserIdModule (copy), Players (copy)
	if FFlagAXCatalogOffersClearOnLogout then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), p2 (copy), GetLocalUserIdModule (upval), Players (upval)
			local Offers: (() -> ())? = if p1.getHasCompletedOffersFetch(false) or p1.getOffersFetchInProgress(false) then nil else p1.fetchOffers(p2)
			local LocalUserIdModule = GetLocalUserIdModule(Players)
			
			local function handle()
				-- upvalues: GetLocalUserIdModule (upval), Players (upval), LocalUserIdModule (ref), Offers (ref), p1 (upval), p2 (upval)
				local LocalUserIdModule1 = GetLocalUserIdModule(Players)
				
				if LocalUserIdModule1 == LocalUserIdModule then return end
				LocalUserIdModule = LocalUserIdModule1
				
				if Offers then
					Offers()
					Offers = nil
				end
				p1.setPayload(nil)
				p1.setDismissed(false)
				
				if LocalUserIdModule1 ~= nil and LocalUserIdModule1 ~= "-1" then
					Offers = p1.fetchOffers(p2)
				end
			end
			
			local Connection = nil
			
			local function _()
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
			local Connection1 = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
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
			
			return function()
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
		
		return
	else
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), p2 (copy)
			return if p1.getHasCompletedOffersFetch(false) or p1.getOffersFetchInProgress(false) then function() end else p1.fetchOffers(p2)
		end, { p2, p1 })
	end
end