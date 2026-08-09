local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpService = game:GetService("HttpService")
local signalsModule = require(parent.Signals)
local fFlagEnableArgus = require(parent.SharedFlags).FFlagEnableArgus
local getFFlagMomentsPauseAudioThroughTeleportModule = require(moments.Flags.GetFFlagMomentsPauseAudioThroughTeleport)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local createSignal = signalsModule.createSignal

return function() --[[ line: 57 | named "createMomentsStore" ]]
	-- upvalues: createSignal (ref), httpService (ref), getFFlagMomentsPauseAudioThroughTeleportModule (ref), getMomentsPreferencesStoreModule (ref), fFlagEnableArgus (ref)
	local var5, var6 = createSignal(httpService:GenerateGUID(false))
	local var7, var8 = createSignal("watch_tab")
	local var9, var10 = createSignal(os.clock())
	
	local function resetSession() --[[ line: 62 ]]
		-- upvalues: var6 (ref), httpService (copy), var10 (ref), getFFlagMomentsPauseAudioThroughTeleportModule (copy), getMomentsPreferencesStoreModule (copy)
		var6(httpService:GenerateGUID(false))
		var10(os.clock())
		
		if getFFlagMomentsPauseAudioThroughTeleportModule() then
			getMomentsPreferencesStoreModule(false).setTeleporting(false)
		end
	end
	
	local var12, var13 = createSignal(false)
	local var14, var15 = createSignal(nil)
	
	return {
		getMomentsSessionId = var5,
		getSessionSource = var7,
		setSessionSource = var8,
		getSessionStartTime = var9,
		resetSession = resetSession,
		getHideDetails = var12,
		toggleFeedDetailVisibility = function() --[[ line: 80 ]]
			-- upvalues: fFlagEnableArgus (copy), var13 (ref), var12 (ref)
			if fFlagEnableArgus then
				var13(not var12(false))
			end
		end,
		getPendingDeletion = var14,
		requestDeletion = function(p0) --[[ line: 86 ]]
			-- upvalues: fFlagEnableArgus (copy), var15 (ref)
			if fFlagEnableArgus then
				var15(p0)
			end
		end,
		clearPendingDeletion = function() --[[ line: 92 ]]
			-- upvalues: var15 (ref)
			var15(nil)
		end
	}
end