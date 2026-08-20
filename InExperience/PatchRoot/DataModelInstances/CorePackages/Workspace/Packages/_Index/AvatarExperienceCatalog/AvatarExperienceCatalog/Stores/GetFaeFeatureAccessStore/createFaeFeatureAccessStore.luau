local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local getFaeStatus = require(avatarExperienceCatalog.Api.GetFaeStatus.getFaeStatus).getFaeStatus

return function() --[[ line: 22 | named "createFaeFeatureAccessStore" ]]
	-- upvalues: signalsModule (ref), getFaeStatus (ref), promiseModule (ref)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(false)
	local idle, idle_1 = signalsModule.createSignal("idle")
	
	return {
		getCanClaimFaeItem = var3,
		getShowFaeUpsell = var5,
		getFetchStatus = idle,
		fetch = function(p0) --[[ line: 28 ]]
			-- upvalues: idle_1 (ref), getFaeStatus (copy), promiseModule (copy), var4 (ref), var6 (ref)
			idle_1("pending")
			local var9, _ = getFaeStatus(p0)
			
			return promiseModule.resolve(var9):andThen(function(p2) --[[ line: 32 ]]
				-- upvalues: promiseModule (copy), var4 (copy), var6 (copy), idle_1 (copy)
				if not p2 then
					return promiseModule.reject()
				end
				local var10 = false
				local isGranted = false
				
				for i, v in p2.features do
					if v.featureName == "AllowFaeItemToBeClaimed" then
						local _ = v.access == "Granted"
					elseif v.featureName == "ShowFaeUpsellInMarketplace" then
						isGranted = v.access == "Granted"
					end
				end
				var4(var10)
				var6(isGranted)
				idle_1("success")
				
				return promiseModule.resolve()
			end):catch(function(p1) --[[ line: 49 ]]
				-- upvalues: idle_1 (copy), promiseModule (copy)
				idle_1("idle")
				
				return promiseModule.reject(p1)
			end)
		end,
		reset = function() --[[ line: 55 ]]
			-- upvalues: var4 (ref), var6 (ref), idle_1 (ref)
			var4(false)
			var6(false)
			idle_1("idle")
		end
	}
end