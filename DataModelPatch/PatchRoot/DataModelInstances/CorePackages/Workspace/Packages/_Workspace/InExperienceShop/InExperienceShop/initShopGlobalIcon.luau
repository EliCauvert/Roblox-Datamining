local StarterGui = game:GetService("StarterGui")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local SignalsModule = require(InExperienceShop.Parent.Signals)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule = require(InExperienceShop.Flags.FFlagExperienceShopGlobalIconSkipCoreGuiCheck)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local GetShopGlobalIconStoreModule = require(InExperienceShop.Stores.GetShopGlobalIconStore)

return function()
	-- upvalues: FFlagEnableExperienceShopGlobalIconModule (copy), GetShopGlobalIconStoreModule (copy), FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (copy), StarterGui (copy), SignalsModule (copy), GetInExperienceShopStoreModule (copy)
	if FFlagEnableExperienceShopGlobalIconModule then
		local ShopGlobalIconStoreModule = GetShopGlobalIconStoreModule(false)
		local CoreGuiEnabled = if FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then true else StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.All) or StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop)
		local Flag = false
		
		local function _()
			-- upvalues: ShopGlobalIconStoreModule (copy), CoreGuiEnabled (ref), Flag (ref)
			ShopGlobalIconStoreModule.setEnabled(CoreGuiEnabled and Flag)
		end
		
		local CoreGuiChangedSignalConnection = if FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then nil else StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, Enabled)
			-- upvalues: CoreGuiEnabled (ref), ShopGlobalIconStoreModule (copy), Flag (ref)
			if CoreGuiType == Enum.CoreGuiType.ExperienceShop or CoreGuiType == Enum.CoreGuiType.All then
				CoreGuiEnabled = Enabled
				ShopGlobalIconStoreModule.setEnabled(CoreGuiEnabled and Flag)
			end
		end)
		local Callback = nil
		Callback = SignalsModule.createEffect(function(p1)
			-- upvalues: GetInExperienceShopStoreModule (upval), Flag (ref), ShopGlobalIconStoreModule (copy), CoreGuiEnabled (ref), Callback (ref)
			local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
			
			if InExperienceShopStoreModule.getLoading(p1) then return end
			if InExperienceShopStoreModule.getGlobalIconBackendEnabled(p1) then
				Flag = true
				ShopGlobalIconStoreModule.setEnabled(CoreGuiEnabled and Flag)
				ShopGlobalIconStoreModule.setStatusIndicatorEnabled(InExperienceShopStoreModule.getGlobalIconHasNewOffers(p1))
				task.defer(function()
					-- upvalues: Callback (upval)
					if Callback then
						Callback()
						Callback = nil
					end
				end)
				
				return
			end
		end)
		
		return function()
			-- upvalues: FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (upval), CoreGuiChangedSignalConnection (copy), Callback (ref)
			if not FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule and CoreGuiChangedSignalConnection then
				CoreGuiChangedSignalConnection:Disconnect()
			end
			if Callback then
				Callback()
				Callback = nil
			end
		end
	else
		return nil
	end
end