local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpService = game:GetService("HttpService")
local signalsModule = require(parent.Signals)
local fFlagEnableArgus = require(parent.SharedFlags).FFlagEnableArgus
local getFFlagMomentsPauseAudioThroughTeleportModule = require(moments.Flags.GetFFlagMomentsPauseAudioThroughTeleport)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local createSignal = signalsModule.createSignal

return function()
	-- upvalues: createSignal (ref), httpService (ref), getFFlagMomentsPauseAudioThroughTeleportModule (ref), getMomentsPreferencesStoreModule (ref), fFlagEnableArgus (ref)
	local var1, var2 = createSignal(httpService:GenerateGUID(false))
	local var3, var4 = createSignal("watch_tab")
	local var5, var6 = createSignal(os.clock())
	
	local function resetSession()
		-- upvalues: var2 (ref), httpService (copy), var6 (ref), getFFlagMomentsPauseAudioThroughTeleportModule (copy), getMomentsPreferencesStoreModule (copy)
		var2(httpService:GenerateGUID(false))
		var6(os.clock())
		
		if getFFlagMomentsPauseAudioThroughTeleportModule() then
			getMomentsPreferencesStoreModule(false).setTeleporting(false)
		end
	end
	
	local var7, var8 = createSignal(false)
	local var9, var10 = createSignal(nil)
	
	return {
		getMomentsSessionId = var1,
		getSessionSource = var3,
		setSessionSource = var4,
		getSessionStartTime = var5,
		resetSession = resetSession,
		getHideDetails = var7,
		toggleFeedDetailVisibility = function()
			-- upvalues: fFlagEnableArgus (copy), var8 (ref), var7 (ref)
			if fFlagEnableArgus then
				var8(not var7(false))
			end
		end,
		getPendingDeletion = var9,
		requestDeletion = function(p1, p2, p3)
			-- upvalues: fFlagEnableArgus (copy), var10 (ref)
			if fFlagEnableArgus then
				var10({ momentId = p1, feedItemId = p2, feedSessionId = p3 })
			end
		end,
		clearPendingDeletion = function()
			-- upvalues: var10 (ref)
			var10(nil)
		end
	}
end