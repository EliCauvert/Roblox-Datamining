local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appAppLifecycleObserverService = require(parent.RoactServiceTags).AppAppLifecycleObserverService
local useFeedOptional = require(moments.Components.Feed.FeedContext).useFeedOptional
local makeRecommendationAttributionModule = require(moments.Analytics.makeRecommendationAttribution)
local getCommentsSheetStoreModule = require(script.Parent.Sheet.getCommentsSheetStore)
local createCommentsRecommendationSessionModule = require(script.Parent.createCommentsRecommendationSession)

return function(p1, p2)
	-- upvalues: useFeedOptional (ref), useRoactService (ref), appAppLifecycleObserverService (ref), getCommentsSheetStoreModule (ref), reactModule (ref), signalsModule (ref), makeRecommendationAttributionModule (ref), createCommentsRecommendationSessionModule (ref)
	local var1 = useFeedOptional()
	local var2 = useRoactService(appAppLifecycleObserverService)
	local var3 = getCommentsSheetStoreModule(false)
	local var4 = reactModule.useRef(nil)
	local var5 = var1 ~= nil and (var1.isActiveFeed and var1.isPlaybackActive)
	local var6 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local var7, var8 = signalsModule.createSignal(true)
		
		return { get = var7, set = var8 }
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var6 (ref)
		if var2 == nil then
			return
		end
		local onHideConnection = var2.OnHide:Connect(function()
			-- upvalues: var6 (copy)
			var6.set(false)
		end)
		local onUnhideConnection = var2.OnUnhide:Connect(function()
			-- upvalues: var6 (copy)
			var6.set(true)
		end)
		
		return function()
			-- upvalues: onHideConnection (ref), onUnhideConnection (ref)
			onHideConnection:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var2, var6 })
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var6 (ref), var3 (ref), var4 (ref), var5 (ref)
		local var7 = signalsModule.createEffect(function(p3)
			-- upvalues: var6 (copy), var3 (copy), var4 (copy), var5 (copy)
			local var8 = var6.get(p3)
			local isOpen = var3.getIsOpen(p3)
			local openSessionId = var3.getOpenSessionId(p3)
			local feedItemId = var3.getFeedItemId(false)
			local current = var4.current
			
			if current == nil then return end
			if var5 and var8 and (isOpen and var3.getRecommendationSession(feedItemId or "", openSessionId) == current) then
				current.startView()
				
				return
			end
			current.finishView()
		end)
		
		return function()
			-- upvalues: var7 (ref), var4 (copy)
			var7()
			
			if var4.current ~= nil then
				var4.current.finishView()
			end
		end
	end, { var5, var3, var6 })
	
	return function()
		-- upvalues: makeRecommendationAttributionModule (copy), p1 (ref), var1 (ref), createCommentsRecommendationSessionModule (copy), p2 (ref), var4 (ref), var3 (ref)
		local var7 = makeRecommendationAttributionModule(p1)
		
		if var7 == nil then return end
		local var8 = if var1 ~= nil then createCommentsRecommendationSessionModule(var1.logAction, var7, p2(false)) else nil
		var4.current = var8
		var3.open(var7.itemId, var8)
	end
end