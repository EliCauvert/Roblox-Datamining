local CorePackages = game:GetService("CorePackages")
local SignalsModule = require(CorePackages.Packages.Signals)
local PromiseModule = require(CorePackages.Packages.Promise)
local _ = require(CorePackages.Packages.LuauPolyfill)
local Api = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Api

return function()
	-- upvalues: SignalsModule (copy), Api (copy), PromiseModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Idle, Idle2 = SignalsModule.createSignal("idle")
	
	return {
		getCanClaimFaeItem = Signal,
		getShowFaeUpsell = Signal1,
		getFetchStatus = Idle,
		fetch = function(p1)
			-- upvalues: Idle2 (copy), Api (upval), PromiseModule (upval), Signal2 (copy), Signal2_1 (copy)
			Idle2("pending")
			local FaeStatus, _ = Api.getFaeStatus(p1)
			
			return PromiseModule.resolve(FaeStatus):andThen(function(Result)
				-- upvalues: PromiseModule (upval), Signal2 (upval), Signal2_1 (upval), Idle2 (upval)
				if not Result then
					return PromiseModule.reject()
				end
				local IsGranted = false
				local IsGranted1 = false
				
				for _, feature in Result.features do
					if feature.featureName == "AllowFaeItemToBeClaimed" then
						IsGranted = feature.access == "Granted"
					elseif feature.featureName == "ShowFaeUpsellInMarketplace" then
						IsGranted1 = feature.access == "Granted"
					end
				end
				Signal2(IsGranted)
				Signal2_1(IsGranted1)
				Idle2("success")
				
				return PromiseModule.resolve()
			end):catch(function(Err)
				-- upvalues: Idle2 (upval), PromiseModule (upval)
				Idle2("idle")
				
				return PromiseModule.reject(Err)
			end)
		end,
		reset = function()
			-- upvalues: Signal2 (copy), Signal2_1 (copy), Idle2 (copy)
			Signal2(false)
			Signal2_1(false)
			Idle2("idle")
		end
	}
end