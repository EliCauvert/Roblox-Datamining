local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.ServerDrivenUi)
local _ = require(ServerTriggeredModals.EntryPoint)

return function() --[[ Line: 42 ]]
	-- upvalues: SignalsModule (copy)
	local t = {}
	
	local function getOrCreateEntry(Key) --[[ Line: 45 ]]
		-- upvalues: t (copy), SignalsModule (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			local Signal1, Signal2_1 = SignalsModule.createSignal(false)
			local Signal3, Signal2_2 = SignalsModule.createSignal(false)
			Entry = {
				metadata = { get = Signal, set = Signal2 },
				hasShown = { get = Signal1, set = Signal2_1 },
				primaryHandlerClaimed = { get = Signal3, set = Signal2_2 }
			}
			t[Key] = Entry
		end
		return Entry
	end
	
	return {
		getMetadataGetter = function(p1) --[[ Line: 70 ]]
			-- upvalues: getOrCreateEntry (copy)
			return getOrCreateEntry(p1).metadata.get
		end,
		setMetadata = function(p1, p2) --[[ Line: 74 ]]
			-- upvalues: getOrCreateEntry (copy)
			getOrCreateEntry(p1).metadata.set(p2)
		end,
		getHasShownGetter = function(p1) --[[ Line: 78 ]]
			-- upvalues: getOrCreateEntry (copy)
			return getOrCreateEntry(p1).hasShown.get
		end,
		setHasShown = function(p1, p2) --[[ Line: 82 ]]
			-- upvalues: getOrCreateEntry (copy)
			getOrCreateEntry(p1).hasShown.set(p2)
		end,
		getPrimaryHandlerClaimedGetter = function(p1) --[[ Line: 86 ]]
			-- upvalues: getOrCreateEntry (copy)
			return getOrCreateEntry(p1).primaryHandlerClaimed.get
		end,
		tryClaimPrimaryHandler = function(p1): boolean --[[ Line: 90 ]]
			-- upvalues: getOrCreateEntry (copy)
			local OrCreateEntry = getOrCreateEntry(p1)
			
			if OrCreateEntry.primaryHandlerClaimed.get() then
				return false
			else
				OrCreateEntry.primaryHandlerClaimed.set(true)
				
				return true
			end
		end,
		releasePrimaryHandler = function(p1) --[[ Line: 99 ]]
			-- upvalues: getOrCreateEntry (copy)
			getOrCreateEntry(p1).primaryHandlerClaimed.set(false)
		end
	}
end