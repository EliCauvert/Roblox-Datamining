local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.FeedTypes)
local NavigationDestinationTypeModule = require(Moments.Enums.NavigationDestinationType)
local FFlagMomentsFixRecommendationImpressionLifecycleModule = require(Moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local FFlagMomentsNavigationEventModule = require(Moments.Flags.FFlagMomentsNavigationEvent)
local FFlagMomentsEndDwellWhenAppHiddenModule = require(Moments.Flags.FFlagMomentsEndDwellWhenAppHidden)
local HttpService = game:GetService("HttpService")

local function _(p1)
	local GetIsAwayFunction = p1.getIsAway
	
	return GetIsAwayFunction ~= nil and GetIsAwayFunction(false)
end

local _ = function()
	-- upvalues: HttpService (copy)
	return HttpService:GenerateGUID(false)
end

local _ = function(Current, LeftItemId, ToIndex)
	-- upvalues: NavigationDestinationTypeModule (copy)
	return if Current == nil or LeftItemId == nil or Current.leftItemId ~= LeftItemId or Current.toIndex ~= ToIndex then NavigationDestinationTypeModule.Unknown else Current.destination
end

return function(Pager, p1)
	-- upvalues: ReactModule (copy), FFlagMomentsEndDwellWhenAppHiddenModule (copy), FFlagMomentsNavigationEventModule (copy), NavigationDestinationTypeModule (copy), SignalsModule (copy), HttpService (copy), FFlagMomentsFixRecommendationImpressionLifecycleModule (copy), Moments (copy)
	local Active = p1.active
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(1)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(p1.telemetry)
	UseRefResult6.current = p1.telemetry
	local UseRefResult7 = ReactModule.useRef(p1.recommendationSource)
	UseRefResult7.current = p1.recommendationSource
	local UseRefResult8 = ReactModule.useRef(p1.getAttribution)
	UseRefResult8.current = p1.getAttribution
	local UseRefResult9 = ReactModule.useRef(p1.onItemBecameActive)
	UseRefResult9.current = p1.onItemBecameActive
	local UseRefResult10 = ReactModule.useRef(p1.onEndStateReached)
	UseRefResult10.current = p1.onEndStateReached
	local UseRefResult11 = ReactModule.useRef(p1.onViewEnded)
	UseRefResult11.current = p1.onViewEnded
	local UseRefResult12 = ReactModule.useRef(p1.inactiveDestination)
	UseRefResult12.current = p1.inactiveDestination
	local UseRefResult13 = ReactModule.useRef(Active)
	UseRefResult13.current = Active
	local UseRefResult14 = if FFlagMomentsEndDwellWhenAppHiddenModule then ReactModule.useRef({ visible = true, getIsAway = p1.getIsAway, pager = Pager }) else nil
	
	if FFlagMomentsEndDwellWhenAppHiddenModule then
		UseRefResult14.current.getIsAway = p1.getIsAway
		UseRefResult14.current.pager = Pager
		UseRefResult14.current.visible = p1.visible ~= false
	end
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult6 (copy), UseRefResult1 (copy), UseRefResult7 (copy), UseRefResult11 (copy), FFlagMomentsNavigationEventModule (upval), NavigationDestinationTypeModule (upval)
		local Current = UseRefResult.current
		
		if Current == nil then
			return nil
		end
		local Current1 = UseRefResult2.current
		
		if UseRefResult3.current ~= nil then
			Current1 += os.clock() - UseRefResult3.current
		end
		local Current2 = UseRefResult4.current
		UseRefResult.current = nil
		UseRefResult3.current = nil
		UseRefResult2.current = 0
		UseRefResult4.current = nil
		
		if Current1 <= 0 then
			return Current2
		end
		UseRefResult6.current.logView(Current, {
			durationSeconds = Current1,
			itemPosition = UseRefResult1.current,
			recommendationSource = UseRefResult7.current
		})
		local CurrentFunction: (any, any) -> () = UseRefResult11.current
		
		if FFlagMomentsNavigationEventModule and Current2 ~= nil and CurrentFunction ~= nil then
			CurrentFunction(Current, {
				viewId = Current2,
				durationSeconds = Current1,
				itemPosition = UseRefResult1.current,
				destination = p2 or NavigationDestinationTypeModule.Unknown
			})
		end
		return Current2
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), Pager (copy), FFlagMomentsNavigationEventModule (upval), UseRefResult (copy), UseRefResult5 (copy), NavigationDestinationTypeModule (upval), UseResult (copy), UseRefResult13 (copy), UseRefResult10 (copy), UseRefResult8 (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult4 (copy), HttpService (upval), UseRefResult3 (copy), FFlagMomentsEndDwellWhenAppHiddenModule (upval), UseRefResult14 (copy), UseRefResult9 (copy)
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: Pager (upval), FFlagMomentsNavigationEventModule (upval), UseRefResult (upval), UseRefResult5 (upval), NavigationDestinationTypeModule (upval), UseResult (upval), UseRefResult13 (upval), UseRefResult10 (upval), UseRefResult8 (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult4 (upval), HttpService (upval), UseRefResult3 (upval), FFlagMomentsEndDwellWhenAppHiddenModule (upval), UseRefResult14 (upval), UseRefResult9 (upval)
			local CurrentItem = Pager.getCurrentItem(p2)
			local Unknown = nil
			
			if FFlagMomentsNavigationEventModule then
				local Current = UseRefResult.current
				local Current1 = UseRefResult5.current
				local ItemId = if Current == nil then nil else Current.itemId
				local CurrentIndex = Pager.getCurrentIndex(false)
				Unknown = if Current1 == nil or ItemId == nil or Current1.leftItemId ~= ItemId or Current1.toIndex ~= CurrentIndex then NavigationDestinationTypeModule.Unknown else Current1.destination
				UseRefResult5.current = nil
			end
			UseResult(Unknown)
			
			if CurrentItem == nil then return end
			if (CurrentItem.kind == "endState" or CurrentItem.kind == "caughtUp") and (UseRefResult13.current and UseRefResult10.current) then
				UseRefResult10.current(Pager.getCurrentIndex(false))
			end
			local CurrentResult = UseRefResult8.current(CurrentItem)
			
			if CurrentResult == nil then return end
			UseRefResult.current = CurrentResult
			UseRefResult1.current = Pager.getCurrentIndex(false)
			UseRefResult2.current = 0
			UseRefResult4.current = if FFlagMomentsNavigationEventModule then HttpService:GenerateGUID(false) else nil
			UseRefResult3.current = if UseRefResult13.current then os.clock() else nil
			
			if FFlagMomentsEndDwellWhenAppHiddenModule then
				local GetIsAwayFunction = UseRefResult14.current.getIsAway
				
				if GetIsAwayFunction ~= nil and GetIsAwayFunction(false) then
					UseRefResult3.current = nil
					UseRefResult14.current.pendingBegin = CurrentItem
					
					return
				end
			end
			if UseRefResult13.current and UseRefResult9.current then
				UseRefResult9.current(CurrentItem)
			end
		end)
		
		return function()
			-- upvalues: Effect (copy), UseResult (upval)
			Effect()
			UseResult()
		end
	end, { Pager, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: Active (copy), FFlagMomentsFixRecommendationImpressionLifecycleModule (upval), UseRefResult (copy), Pager (copy), UseRefResult8 (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), FFlagMomentsEndDwellWhenAppHiddenModule (upval), UseRefResult14 (copy), UseRefResult4 (copy), FFlagMomentsNavigationEventModule (upval), HttpService (upval), UseResult (copy), UseRefResult12 (copy)
		if Active then
			if FFlagMomentsFixRecommendationImpressionLifecycleModule and UseRefResult.current == nil then
				local CurrentItem = Pager.getCurrentItem(false)
				
				if CurrentItem == nil then return end
				local CurrentResult = UseRefResult8.current(CurrentItem)
				
				if CurrentResult == nil then return end
				UseRefResult.current = CurrentResult
				UseRefResult1.current = Pager.getCurrentIndex(false)
				UseRefResult2.current = 0
				UseRefResult3.current = os.clock()
				
				if FFlagMomentsEndDwellWhenAppHiddenModule then
					local GetIsAwayFunction = UseRefResult14.current.getIsAway
					
					if GetIsAwayFunction ~= nil and GetIsAwayFunction(false) then
						UseRefResult3.current = nil
					end
				end
				UseRefResult4.current = if FFlagMomentsNavigationEventModule then HttpService:GenerateGUID(false) else nil
				
				return
			elseif UseRefResult.current ~= nil and UseRefResult3.current == nil then
				UseRefResult3.current = os.clock()
				
				if FFlagMomentsEndDwellWhenAppHiddenModule then
					local GetIsAwayFunction1 = UseRefResult14.current.getIsAway
					
					if GetIsAwayFunction1 ~= nil and GetIsAwayFunction1(false) then
						UseRefResult3.current = nil
						
						return
					end
				end
			end
		elseif FFlagMomentsFixRecommendationImpressionLifecycleModule then
			UseResult(UseRefResult12.current)
			
			return
		else
			if UseRefResult3.current ~= nil then
				UseRefResult2.current += os.clock() - UseRefResult3.current
				UseRefResult3.current = nil
			end
		end
	end, { Active, Pager, UseResult })
	
	if FFlagMomentsEndDwellWhenAppHiddenModule then
		local GetIsAway = p1.getIsAway
		ReactModule.useEffect(function()
			-- upvalues: GetIsAway (copy), UseRefResult14 (copy), UseRefResult13 (copy), UseRefResult9 (copy), UseRefResult (copy), UseRefResult3 (copy), UseRefResult8 (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult4 (copy), FFlagMomentsNavigationEventModule (upval), HttpService (upval), Moments (upval), UseResult (copy), NavigationDestinationTypeModule (upval)
			if GetIsAway == nil then return end
			local Current = UseRefResult14.current
			
			local function _(p2)
				-- upvalues: UseRefResult13 (upval), Current (copy), UseRefResult9 (upval)
				if UseRefResult13.current and Current.visible and UseRefResult9.current then
					UseRefResult9.current(p2)
				end
			end
			
			return require(Moments.Stores.GetAppAttentionStore.observeAway)(GetIsAway, {
				onLeave = function()
					-- upvalues: UseResult (upval), NavigationDestinationTypeModule (upval)
					UseResult(NavigationDestinationTypeModule.Exit)
				end,
				onReturn = function()
					-- upvalues: Current (copy), UseRefResult (upval), UseRefResult3 (upval), UseRefResult13 (upval), UseRefResult9 (upval), UseRefResult8 (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult4 (upval), FFlagMomentsNavigationEventModule (upval), HttpService (upval)
					local PendingBegin = Current.pendingBegin
					Current.pendingBegin = nil
					
					if UseRefResult.current == nil then
						local Pager = Current.pager
						local CurrentItem = Pager.getCurrentItem(false)
						
						if CurrentItem == nil then return end
						local CurrentResult = UseRefResult8.current(CurrentItem)
						
						if CurrentResult == nil then return end
						UseRefResult.current = CurrentResult
						UseRefResult1.current = Pager.getCurrentIndex(false)
						UseRefResult2.current = 0
						UseRefResult3.current = if UseRefResult13.current then os.clock() else nil
						UseRefResult4.current = if FFlagMomentsNavigationEventModule then HttpService:GenerateGUID(false) else nil
						
						if UseRefResult13.current and Current.visible and UseRefResult9.current then
							UseRefResult9.current(CurrentItem)
						end
						return
					else
						if UseRefResult3.current == nil and UseRefResult13.current then
							UseRefResult3.current = os.clock()
						end
						if PendingBegin ~= nil and UseRefResult13.current and Current.visible and UseRefResult9.current then
							UseRefResult9.current(PendingBegin)
						end
					end
				end
			})
		end, { GetIsAway })
	end
	return {
		flushView = UseResult,
		getViewId = function()
			-- upvalues: UseRefResult4 (copy)
			return UseRefResult4.current
		end,
		noteUserStep = function(p2, ToIndex)
			-- upvalues: UseRefResult5 (copy), UseRefResult (copy), NavigationDestinationTypeModule (upval)
			local ToIndexDelta = ToIndex - p2
			
			if ToIndexDelta == 1 or ToIndexDelta == -1 then
				local Current = UseRefResult.current
				UseRefResult5.current = {
					leftItemId = if Current == nil then nil else Current.itemId,
					toIndex = ToIndex,
					destination = if ToIndexDelta == 1 then NavigationDestinationTypeModule.NextMoment else NavigationDestinationTypeModule.PreviousMoment
				}
				
				return
			else
				UseRefResult5.current = nil
			end
		end
	}
end