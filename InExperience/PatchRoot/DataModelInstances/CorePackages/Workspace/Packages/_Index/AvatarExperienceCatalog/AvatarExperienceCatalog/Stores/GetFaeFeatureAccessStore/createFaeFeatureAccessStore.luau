local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local getFaeStatus = require(avatarExperienceCatalog.Api.GetFaeStatus.getFaeStatus).getFaeStatus

return function()
	-- upvalues: signalsModule (ref), getFaeStatus (ref), promiseModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(false)
	local idle, idle_1 = signalsModule.createSignal("idle")
	
	return {
		getCanClaimFaeItem = var1,
		getShowFaeUpsell = var3,
		getFetchStatus = idle,
		fetch = function(p1)
			-- upvalues: idle_1 (ref), getFaeStatus (copy), promiseModule (copy), var2 (ref), var4 (ref)
			idle_1("pending")
			local var5, _ = getFaeStatus(p1)
			
			return promiseModule.resolve(var5):andThen(function(p2)
				-- upvalues: promiseModule (copy), var2 (copy), var4 (copy), idle_1 (copy)
				if not p2 then
					return promiseModule.reject()
				end
				local var6 = false
				local isGranted = false
				
				for i, v in p2.features do
					if v.featureName == "AllowFaeItemToBeClaimed" then
						local _ = v.access == "Granted"
					elseif v.featureName == "ShowFaeUpsellInMarketplace" then
						isGranted = v.access == "Granted"
					end
				end
				var2(var6)
				var4(isGranted)
				idle_1("success")
				
				return promiseModule.resolve()
			end):catch(function(p3)
				-- upvalues: idle_1 (copy), promiseModule (copy)
				idle_1("idle")
				
				return promiseModule.reject(p3)
			end)
		end,
		reset = function()
			-- upvalues: var2 (ref), var4 (ref), idle_1 (ref)
			var2(false)
			var4(false)
			idle_1("idle")
		end
	}
end