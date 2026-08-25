local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.ServerDrivenUi)
local _ = require(serverTriggeredModals.EntryPoint)

return function()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	local function getOrCreateEntry(p0)
		-- upvalues: t (ref), signalsModule (copy)
		local var4 = t[p0]
		
		if var4 == nil then
			local var5, var6 = signalsModule.createSignal(nil)
			local var7, var8 = signalsModule.createSignal(false)
			local var9, var10 = signalsModule.createSignal(false)
			var4 = {
				metadata = { get = var5, set = var6 },
				hasShown = { get = var7, set = var8 },
				primaryHandlerClaimed = { get = var9, set = var10 }
			}
			t[p0] = var4
		end
		return var4
	end
	
	return {
		getMetadataGetter = function(p1)
			-- upvalues: getOrCreateEntry (ref)
			return getOrCreateEntry(p1).metadata.get
		end,
		setMetadata = function(value, p2)
			-- upvalues: getOrCreateEntry (ref)
			getOrCreateEntry(value).metadata.set(p2)
		end,
		getHasShownGetter = function(p3)
			-- upvalues: getOrCreateEntry (ref)
			return getOrCreateEntry(p3).hasShown.get
		end,
		setHasShown = function(value, p4)
			-- upvalues: getOrCreateEntry (ref)
			getOrCreateEntry(value).hasShown.set(p4)
		end,
		getPrimaryHandlerClaimedGetter = function(p5)
			-- upvalues: getOrCreateEntry (ref)
			return getOrCreateEntry(p5).primaryHandlerClaimed.get
		end,
		tryClaimPrimaryHandler = function(p6)
			-- upvalues: getOrCreateEntry (ref)
			local var11 = getOrCreateEntry(p6)
			
			if var11.primaryHandlerClaimed.get() then
				return false
			end
			var11.primaryHandlerClaimed.set(true)
			
			return true
		end,
		releasePrimaryHandler = function(p7)
			-- upvalues: getOrCreateEntry (ref)
			getOrCreateEntry(p7).primaryHandlerClaimed.set(false)
		end
	}
end