local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local _ = require(socialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local _ = require(socialUpsell.Enum.SocialUpsellType)
local _ = require(socialUpsell.Types)
local var1 = nil

local function createUpsellSignalStore()
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local t = {}
	
	local function _(p1)
		-- upvalues: t (ref), signalsModule (copy)
		local var2 = t[p1]
		
		if var2 == nil then
			local var3, var4 = signalsModule.createSignal(nil)
			var2 = { getBannerData = var3, setBannerData = var4 }
			t[p1] = var2
		end
		return var2
	end
	
	return {
		getUpsellBannerDataGetter = function(p1)
			-- upvalues: t (ref), signalsModule (copy)
			local var2 = t[p1]
			
			if var2 == nil then
				local var3, var4 = signalsModule.createSignal(nil)
				var2 = { getBannerData = var3, setBannerData = var4 }
				t[p1] = var2
			end
			return var2.getBannerData
		end,
		setUpsellBannerData = function(value, p1, p2)
			-- upvalues: t (ref), signalsModule (copy), cryoModule (copy)
			local var2 = t[value]
			
			if var2 == nil then
				local var3, var4 = signalsModule.createSignal(nil)
				var2 = { getBannerData = var3, setBannerData = var4 }
				t[value] = var2
			end
			var2.setBannerData(function(p3)
				-- upvalues: p2 (ref), cryoModule (copy), p1 (ref)
				local var5 = cryoModule.Dictionary.join(p3 or {}, {
					[p1] = if p2 ~= nil then cryoModule.None else { isVisible = true }
				})
				
				return if next(var5) == nil then nil else var5
			end)
		end
	}
end

return function()
	-- upvalues: var1 (write), signalsModule (ref), createUpsellSignalStore (ref)
	if var1 == nil then
		var1 = signalsModule.createComputed(createUpsellSignalStore)(false)
	end
	return var1
end