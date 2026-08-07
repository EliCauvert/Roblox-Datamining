local starterGuiService = game:GetService("StarterGui")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local signalsModule = require(inExperienceShop.Parent.Signals)
local fFlagEnableExperienceShopGlobalIconModule = require(inExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule = require(inExperienceShop.Flags.FFlagExperienceShopGlobalIconSkipCoreGuiCheck)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local getShopGlobalIconStoreModule = require(inExperienceShop.Stores.GetShopGlobalIconStore)

return function() --[[ line: 20 | named "initShopGlobalIcon" ]]
	-- upvalues: fFlagEnableExperienceShopGlobalIconModule (ref), getShopGlobalIconStoreModule (ref), fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (ref), starterGuiService (ref), signalsModule (ref), getInExperienceShopStoreModule (ref)
	if fFlagEnableExperienceShopGlobalIconModule then
		local var7 = getShopGlobalIconStoreModule(false)
		local var8 = if fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then true else starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop)
		local var9 = false
		
		local function _() --[[ line: 37 | named "updateEnabled" ]]
			-- upvalues: var7 (ref), var8 (write), var9 (write)
			var7.setEnabled(var8 and var9)
		end
		
		local var10 = if fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then nil else starterGuiService.CoreGuiChangedSignal:Connect(function(p0, p1) --[[ line: 43 ]]
			-- upvalues: var8 (write), var7 (ref), var9 (write)
			if p0 == Enum.CoreGuiType.ExperienceShop or p0 == Enum.CoreGuiType.All then
				var8 = p1
				var7.setEnabled(var8 and var9)
			end
		end)
		local var11 = nil
		var11 = signalsModule.createEffect(function(p2) --[[ line: 53 ]]
			-- upvalues: getInExperienceShopStoreModule (copy), var9 (write), var7 (ref), var8 (write), var11 (write)
			local var12 = getInExperienceShopStoreModule(false)
			
			if var12.getLoading(p2) then return end
			if var12.getGlobalIconBackendEnabled(p2) then
				var9 = true
				var7.setEnabled(var8 and var9)
				var7.setStatusIndicatorEnabled(var12.getGlobalIconHasNewOffers(p2))
				task.defer(function() --[[ line: 64 ]]
					-- upvalues: var11 (copy)
					if var11 then
						var11()
						var11 = nil
					end
				end)
				
				return
			end
		end)
		
		return function() --[[ line: 72 ]]
			-- upvalues: fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (copy), var10 (ref), var11 (write)
			if not fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule and var10 then
				var10:Disconnect()
			end
			if var11 then
				var11()
				var11 = nil
			end
		end
	end
	return nil
end