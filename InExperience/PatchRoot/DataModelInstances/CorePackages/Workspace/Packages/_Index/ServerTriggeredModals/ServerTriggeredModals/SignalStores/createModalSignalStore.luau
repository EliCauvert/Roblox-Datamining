local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.ServerDrivenUi)
local _ = require(serverTriggeredModals.EntryPoint)

return function()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	local function getOrCreateEntry(p1)
		-- upvalues: t (ref), signalsModule (copy)
		local var1 = t[p1]
		
		if var1 == nil then
			local var2, var3 = signalsModule.createSignal(nil)
			local var4, var5 = signalsModule.createSignal(false)
			local var6, var7 = signalsModule.createSignal(false)
			var1 = {
				metadata = { get = var2, set = var3 },
				hasShown = { get = var4, set = var5 },
				primaryHandlerClaimed = { get = var6, set = var7 }
			}
			t[p1] = var1
		end
		return var1
	end
	
	return {
		getMetadataGetter = function(p1)
			-- upvalues: getOrCreateEntry (ref)
			return getOrCreateEntry(p1).metadata.get
		end,
		setMetadata = function(value, p1)
			-- upvalues: getOrCreateEntry (ref)
			getOrCreateEntry(value).metadata.set(p1)
		end,
		getHasShownGetter = function(p1)
			-- upvalues: getOrCreateEntry (ref)
			return getOrCreateEntry(p1).hasShown.get
		end,
		setHasShown = function(value, p1)
			-- upvalues: getOrCreateEntry (ref)
			getOrCreateEntry(value).hasShown.set(p1)
		end,
		getPrimaryHandlerClaimedGetter = function(p1)
			-- upvalues: getOrCreateEntry (ref)
			return getOrCreateEntry(p1).primaryHandlerClaimed.get
		end,
		tryClaimPrimaryHandler = function(p1)
			-- upvalues: getOrCreateEntry (ref)
			local var1 = getOrCreateEntry(p1)
			
			if var1.primaryHandlerClaimed.get() then
				return false
			end
			var1.primaryHandlerClaimed.set(true)
			
			return true
		end,
		releasePrimaryHandler = function(p1)
			-- upvalues: getOrCreateEntry (ref)
			getOrCreateEntry(p1).primaryHandlerClaimed.set(false)
		end
	}
end