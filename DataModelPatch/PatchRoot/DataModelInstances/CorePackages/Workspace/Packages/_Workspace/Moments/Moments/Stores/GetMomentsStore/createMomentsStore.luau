local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local HttpService = game:GetService("HttpService")
local FFlagEnableArgus = require(Parent.SharedFlags).FFlagEnableArgus
local GetFFlagMomentsPauseAudioThroughTeleportModule = require(Moments.Flags.GetFFlagMomentsPauseAudioThroughTeleport)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local CreateSignalFunction = require(Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy), HttpService (copy), GetFFlagMomentsPauseAudioThroughTeleportModule (copy), GetMomentsPreferencesStoreModule (copy), FFlagEnableArgus (copy)
	local Signal, Signal2 = CreateSignalFunction(HttpService:GenerateGUID(false))
	local WatchTab, WatchTab2 = CreateSignalFunction("watch_tab")
	local Signal1, Signal2_1 = CreateSignalFunction(os.clock())
	
	local function resetSession()
		-- upvalues: Signal2 (copy), HttpService (upval), Signal2_1 (copy), GetFFlagMomentsPauseAudioThroughTeleportModule (upval), GetMomentsPreferencesStoreModule (upval)
		Signal2(HttpService:GenerateGUID(false))
		Signal2_1(os.clock())
		
		if GetFFlagMomentsPauseAudioThroughTeleportModule() then
			GetMomentsPreferencesStoreModule(false).setTeleporting(false)
		end
	end
	
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(nil)
	
	return {
		getMomentsSessionId = Signal,
		getSessionSource = WatchTab,
		setSessionSource = WatchTab2,
		getSessionStartTime = Signal1,
		resetSession = resetSession,
		getHideDetails = Signal3,
		toggleFeedDetailVisibility = function()
			-- upvalues: FFlagEnableArgus (upval), Signal2_2 (copy), Signal3 (copy)
			if FFlagEnableArgus then
				Signal2_2(not Signal3(false))
			end
		end,
		getPendingDeletion = Signal4,
		requestDeletion = function(MomentId, FeedItemId, FeedSessionId)
			-- upvalues: FFlagEnableArgus (upval), Signal2_3 (copy)
			if FFlagEnableArgus then
				Signal2_3({
					momentId = MomentId,
					feedItemId = FeedItemId,
					feedSessionId = FeedSessionId
				})
			end
		end,
		clearPendingDeletion = function()
			-- upvalues: Signal2_3 (copy)
			Signal2_3(nil)
		end
	}
end