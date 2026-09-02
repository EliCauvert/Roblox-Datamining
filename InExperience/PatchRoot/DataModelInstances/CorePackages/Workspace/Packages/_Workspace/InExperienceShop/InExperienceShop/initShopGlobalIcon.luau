local starterGuiService = game:GetService("StarterGui")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local signalsModule = require(inExperienceShop.Parent.Signals)
local fFlagEnableExperienceShopGlobalIconModule = require(inExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule = require(inExperienceShop.Flags.FFlagExperienceShopGlobalIconSkipCoreGuiCheck)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local getShopGlobalIconStoreModule = require(inExperienceShop.Stores.GetShopGlobalIconStore)

return function()
	-- upvalues: fFlagEnableExperienceShopGlobalIconModule (ref), getShopGlobalIconStoreModule (ref), fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (ref), starterGuiService (ref), signalsModule (ref), getInExperienceShopStoreModule (ref)
	if fFlagEnableExperienceShopGlobalIconModule then
		local var1 = getShopGlobalIconStoreModule(false)
		local var2 = if fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then true else starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop)
		local var3 = false
		
		local function _()
			-- upvalues: var1 (ref), var2 (write), var3 (write)
			var1.setEnabled(var2 and var3)
		end
		
		local var4 = if fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then nil else starterGuiService.CoreGuiChangedSignal:Connect(function(p1, p2)
			-- upvalues: var2 (write), var1 (ref), var3 (write)
			if p1 == Enum.CoreGuiType.ExperienceShop or p1 == Enum.CoreGuiType.All then
				var2 = p2
				var1.setEnabled(var2 and var3)
			end
		end)
		local var5 = nil
		var5 = signalsModule.createEffect(function(p1)
			-- upvalues: getInExperienceShopStoreModule (copy), var3 (write), var1 (ref), var2 (write), var5 (write)
			local var6 = getInExperienceShopStoreModule(false)
			
			if var6.getLoading(p1) then return end
			if var6.getGlobalIconBackendEnabled(p1) then
				var3 = true
				var1.setEnabled(var2 and var3)
				var1.setStatusIndicatorEnabled(var6.getGlobalIconHasNewOffers(p1))
				task.defer(function()
					-- upvalues: var5 (copy)
					if var5 then
						var5()
						var5 = nil
					end
				end)
				
				return
			end
		end)
		
		return function()
			-- upvalues: fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (copy), var4 (ref), var5 (write)
			if not fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule and var4 then
				var4:Disconnect()
			end
			if var5 then
				var5()
				var5 = nil
			end
		end
	end
	return nil
end