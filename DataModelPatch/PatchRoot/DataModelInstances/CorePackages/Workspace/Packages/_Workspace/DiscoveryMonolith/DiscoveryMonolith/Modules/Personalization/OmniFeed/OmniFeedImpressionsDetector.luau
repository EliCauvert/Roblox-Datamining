local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local Signal = require(Parent.AppCommonLib).Signal
local ArgCheckModule = require(Parent.ArgCheck)
local UsePreviousFunction = require(Parent.RoactUtils).Hooks.usePrevious
local _ = require(Parent.DiscoveryTypes)
local ScreenSizeImpressionsDetector = require(Parent.Impressions).ScreenSizeImpressionsDetector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local FeedItemModelModule = require(DiscoveryMonolith.Modules.Personalization.OmniFeed.DataStore.FeedItemModel)

return function(p1)
	-- upvalues: ReactModule (copy), Signal (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), UsePreviousFunction (copy), FeedItemModelModule (copy), ScreenSizeImpressionsDetector (copy), ArgCheckModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(Signal.new())
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UsePreviousResult = UsePreviousFunction(p1.omniFeedItems)
	local EventContext = p1.eventContext
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult1 (copy)
		local OnItemsUpdatedSignalConnection = if p1.onItemsUpdatedSignal then p1.onItemsUpdatedSignal:connect(function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current:fire()
		end) else nil
		
		return function()
			-- upvalues: OnItemsUpdatedSignalConnection (ref)
			if OnItemsUpdatedSignalConnection ~= nil then
				OnItemsUpdatedSignalConnection:disconnect()
			end
		end
	end, { p1.onItemsUpdatedSignal })
	
	local function v16(p2)
		-- upvalues: p1 (copy), UseRoactServiceResult (copy), FeedItemModelModule (upval), EventContext (copy)
		local OmniFeedItems = p1.omniFeedItems
		
		if not UseRoactServiceResult then return end
		if not p2 or #p2 == 0 then return end
		local List = {}
		local List1 = {}
		local List2 = {}
		
		for i = 1, #p2 do
			local v1 = p2[i]
			local OmniFeedItem = OmniFeedItems[v1]
			local TreatmentType = OmniFeedItem and OmniFeedItem.treatmentType or ""
			local UniqueNameForAnalytics = FeedItemModelModule.getUniqueNameForAnalytics(OmniFeedItem)
			table.insert(List, v1)
			table.insert(List1, TreatmentType)
			table.insert(List2, UniqueNameForAnalytics)
		end
		UseRoactServiceResult:sendEventDeferred(EventContext, "feedImpressions", {
			feedItemPos = table.concat(List, ","),
			treatmentType = table.concat(List1, ","),
			feedItemNameId = table.concat(List2, ",")
		})
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UsePreviousResult (copy), p1 (copy), UseRefResult (copy), UseRefResult1 (copy)
		local Flag = false
		
		if UsePreviousResult == nil or p1.omniFeedItems == nil or #p1.omniFeedItems < #UsePreviousResult then
			Flag = true
		else
			local Count = 1
			while Count <= #UsePreviousResult do
				if UsePreviousResult[Count] == p1.omniFeedItems[Count] then
					Count += 1
					continue
				end
				Flag = true
				break
			end
		end
		if Flag then
			UseRefResult.current = {}
			UseRefResult1.current:fire()
		end
	end, { p1.omniFeedItems, UsePreviousResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), v16 (copy), UseStateResult2 (copy)
		if UseStateResult ~= nil then
			v16(UseStateResult)
			UseStateResult2(nil)
		end
	end, { UseStateResult })
	
	return ReactModule.createElement(ScreenSizeImpressionsDetector, {
		skipZeroSizes = true,
		onRequestImpressionsSignal = UseRefResult1.current,
		filterImpressionFunc = function(p3): boolean
			-- upvalues: UseRefResult (copy)
			if UseRefResult.current[p3] == nil then
				UseRefResult.current[p3] = true
				
				return true
			else
				return false
			end
		end,
		onImpressionsDetected = function(p3)
			-- upvalues: ArgCheckModule (upval), UseStateResult2 (copy)
			ArgCheckModule.assert(p3 ~= nil)
			ArgCheckModule.assert(#p3 ~= 0)
			UseStateResult2(p3)
		end,
		impressionsTag = p1.impressionsTag
	})
end