local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local momentsCommonModule = require(parent.MomentsCommon)
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appAppLifecycleObserverService = require(parent.RoactServiceTags).AppAppLifecycleObserverService
local useFeedOptional = require(moments.Components.Feed.FeedContext).useFeedOptional
local makeRecommendationAttributionModule = require(moments.Analytics.makeRecommendationAttribution)
local getCommentsSheetStoreModule = require(script.Parent.Sheet.getCommentsSheetStore)
local createCommentsRecommendationSessionModule = require(script.Parent.createCommentsRecommendationSession)
local createCommentsAnalyticsSessionModule = require(script.Parent.createCommentsAnalyticsSession)

return function(p1, p2)
	-- upvalues: useFeedOptional (ref), useRoactService (ref), appAppLifecycleObserverService (ref), getCommentsSheetStoreModule (ref), reactModule (ref), signalsModule (ref), makeRecommendationAttributionModule (ref), createCommentsRecommendationSessionModule (ref), momentsGetMomentsCommentsStoreModule (ref), momentsCommonModule (ref), createCommentsAnalyticsSessionModule (ref)
	local var1 = useFeedOptional()
	local var2 = useRoactService(appAppLifecycleObserverService)
	local var3 = getCommentsSheetStoreModule(false)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = var1 ~= nil and (var1.isActiveFeed and var1.isPlaybackActive)
	local var7 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local var8, var9 = signalsModule.createSignal(true)
		
		return { get = var8, set = var9 }
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var7 (ref)
		if var2 == nil then
			return
		end
		local onHideConnection = var2.OnHide:Connect(function()
			-- upvalues: var7 (copy)
			var7.set(false)
		end)
		local onUnhideConnection = var2.OnUnhide:Connect(function()
			-- upvalues: var7 (copy)
			var7.set(true)
		end)
		
		return function()
			-- upvalues: onHideConnection (ref), onUnhideConnection (ref)
			onHideConnection:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var2, var7 })
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var7 (ref), var3 (ref), var4 (ref), var5 (ref), var6 (ref)
		return signalsModule.createEffect(function(p3)
			-- upvalues: var7 (copy), var3 (copy), var4 (copy), var5 (copy), var6 (copy)
			local var8 = var7.get(p3)
			local isOpen = var3.getIsOpen(p3)
			local openSessionId = var3.getOpenSessionId(p3)
			local var9 = var3.getFeedItemId(false) or ""
			local current = var4.current
			local current_1 = var5.current
			local isOpen_1 = var6 and (var8 and isOpen)
			
			if current ~= nil then
				if isOpen_1 and var3.getRecommendationSession(var9, openSessionId) == current then
					current.startView()
				else
					current.finishView()
				end
			end
			if current_1 ~= nil then
				if isOpen_1 and var3.getAnalyticsSession(var9, openSessionId) == current_1 then
					current_1.startView()
					
					return
				elseif not var8 then
					current_1.finishView("app_hidden")
					
					return
				elseif not var6 then
					current_1.finishView("navigation_hidden")
				end
			end
		end)
	end, { var6, var3, var7 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref)
		return function()
			-- upvalues: var4 (copy), var5 (copy)
			if var4.current ~= nil then
				var4.current.finishView()
			end
			if var5.current ~= nil then
				var5.current.finishView("unmounted")
			end
		end
	end, {})
	
	return function()
		-- upvalues: p1 (ref), makeRecommendationAttributionModule (copy), var1 (ref), createCommentsRecommendationSessionModule (copy), p2 (ref), momentsGetMomentsCommentsStoreModule (copy), momentsCommonModule (copy), createCommentsAnalyticsSessionModule (copy), var4 (ref), var5 (ref), var3 (ref)
		local var8 = if p1 ~= nil then nil else p1.feedItemId
		
		if var8 == nil or var8 == "" then return end
		local var9 = nil
		local var10 = makeRecommendationAttributionModule(p1)
		
		if var1 ~= nil and var10 ~= nil then
			var9 = createCommentsRecommendationSessionModule(var1.logAction, var10, p2(false))
		end
		local var11 = momentsGetMomentsCommentsStoreModule(false)
		local ownerGeneration = var11.getOwnerGeneration(false)
		local var12 = createCommentsAnalyticsSessionModule(var8, if var1 ~= nil and (if var1.recommendationSource ~= momentsCommonModule.Analytics.RecommendationSource.Profile then var1.recommendationSource == momentsCommonModule.Analytics.RecommendationSource.MyMoments else true) then "profile" else "watch_tab", function()
			-- upvalues: var11 (ref), ownerGeneration (ref)
			return var11.getOwnerGeneration(false) == ownerGeneration
		end)
		var4.current = var9
		var5.current = var12
		var3.open(var8, var9, var12)
	end
end