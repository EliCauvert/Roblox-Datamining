local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local HttpService = game:GetService("HttpService")
local FFlagEnableArgus = require(Parent.SharedFlags).FFlagEnableArgus
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local CreateSignalFunction = require(Parent.Signals).createSignal

return function() --[[ Line: 62 | Named "createMomentsStore" ]]
	-- upvalues: CreateSignalFunction (copy), HttpService (copy), GetMomentsPreferencesStoreModule (copy), FFlagEnableArgus (copy)
	local Signal, Signal2 = CreateSignalFunction(HttpService:GenerateGUID(false))
	local WatchTab, WatchTab2 = CreateSignalFunction("watch_tab")
	local Signal1, Signal2_1 = CreateSignalFunction(os.clock())
	
	local function resetSession() --[[ Line: 67 ]]
		-- upvalues: Signal2 (copy), HttpService (upval), Signal2_1 (copy), GetMomentsPreferencesStoreModule (upval)
		Signal2(HttpService:GenerateGUID(false))
		Signal2_1(os.clock())
		GetMomentsPreferencesStoreModule(false).setTeleporting(false)
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
		toggleFeedDetailVisibility = function() --[[ Line: 79 ]]
			-- upvalues: FFlagEnableArgus (upval), Signal2_2 (copy), Signal3 (copy)
			if FFlagEnableArgus then
				Signal2_2(not Signal3(false))
			end
		end,
		getPendingDeletion = Signal4,
		requestDeletion = function(MomentId, FeedItemId, FeedSessionId) --[[ Line: 85 ]]
			-- upvalues: FFlagEnableArgus (upval), Signal2_3 (copy)
			if FFlagEnableArgus then
				Signal2_3({
					momentId = MomentId,
					feedItemId = FeedItemId,
					feedSessionId = FeedSessionId
				})
			end
		end,
		clearPendingDeletion = function() --[[ Line: 91 ]]
			-- upvalues: Signal2_3 (copy)
			Signal2_3(nil)
		end
	}
end