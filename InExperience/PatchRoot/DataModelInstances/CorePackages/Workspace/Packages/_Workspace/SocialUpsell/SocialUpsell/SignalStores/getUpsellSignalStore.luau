local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local _ = require(socialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local _ = require(socialUpsell.Enum.SocialUpsellType)
local _ = require(socialUpsell.Types)
local var3 = nil

local function createUpsellSignalStore() --[[ line: 37 ]]
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local t = {}
	
	local function _(p0) --[[ line: 40 | named "getOrCreateUpsellBannerDataStore" ]]
		-- upvalues: t (ref), signalsModule (copy)
		local var6 = t[p0]
		
		if var6 == nil then
			local var7, var8 = signalsModule.createSignal(nil)
			var6 = { getBannerData = var7, setBannerData = var8 }
			t[p0] = var6
		end
		return var6
	end
	
	return {
		getUpsellBannerDataGetter = function(p1) --[[ line: 53 ]]
			-- upvalues: t (ref), signalsModule (copy)
			local var9 = t[p1]
			
			if var9 == nil then
				local var10, var11 = signalsModule.createSignal(nil)
				var9 = { getBannerData = var10, setBannerData = var11 }
				t[p1] = var9
			end
			return var9.getBannerData
		end,
		setUpsellBannerData = function(value, p2, p3) --[[ line: 57 ]]
			-- upvalues: t (ref), signalsModule (copy), cryoModule (copy)
			local var12 = t[value]
			
			if var12 == nil then
				local var13, var14 = signalsModule.createSignal(nil)
				var12 = { getBannerData = var13, setBannerData = var14 }
				t[value] = var12
			end
			var12.setBannerData(function(p4) --[[ line: 62 ]]
				-- upvalues: p3 (ref), cryoModule (copy), p2 (ref)
				local var15 = cryoModule.Dictionary.join(p4 or {}, {
					[p2] = if p3 ~= nil then cryoModule.None else { isVisible = true }
				})
				
				return if next(var15) == nil then nil else var15
			end)
		end
	}
end

return function() --[[ line: 75 ]]
	-- upvalues: var3 (write), signalsModule (ref), createUpsellSignalStore (ref)
	if var3 == nil then
		var3 = signalsModule.createComputed(createUpsellSignalStore)(false)
	end
	return var3
end