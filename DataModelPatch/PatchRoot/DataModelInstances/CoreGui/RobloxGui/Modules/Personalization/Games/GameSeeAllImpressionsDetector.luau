local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local TopicContentsReducer = require(CorePackages.Workspace.Packages.TopicContentsRodux).TopicContentsReducer
local ScreenSizeImpressionsDetector = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector
local ImpressionsVisualizer = require(CorePackages.Workspace.Packages.Impressions).ImpressionsVisualizer

return function(p1)
	-- upvalues: ReactModule (copy), Signal (copy), ImpressionsVisualizer (copy), UseSelectorFunction (copy), TopicContentsReducer (copy), ScreenSizeImpressionsDetector (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(Signal.new())
	local UseResult = ReactModule.useCallback(function(Text): string
		-- upvalues: p1 (copy)
		return p1.gameSortId .. "_" .. Text
	end, { p1.gameSortId })
	local UseRefResult2 = nil
	UseRefResult2 = ReactModule.useRef(nil)
	
	if UseRefResult2.current == nil then
		UseRefResult2.current = ImpressionsVisualizer.new(p1.impressionsTag, UseResult)
	end
	assert(UseRefResult2.current)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: TopicContentsReducer (upval), p1 (copy)
		local PersonalizationEntry = p2.Personalization[TopicContentsReducer.key][p1.gameSortId]
		
		return PersonalizationEntry and PersonalizationEntry.updatedTimestamp or nil
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (ref), UseResult (copy), UseRefResult1 (copy)
		UseRefResult2.current:setCustomKeyMapper(UseResult)
		UseRefResult1.current:fire()
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy), UseSelectorResult (copy), UseRefResult2 (ref), UseRefResult1 (copy)
		local CurrentEntry = UseRefResult.current[p1.gameSortId] or {}
		
		if CurrentEntry.lastUpdatedTimestamp ~= nil and UseSelectorResult ~= CurrentEntry.lastUpdatedTimestamp then
			local ImpressionsSeen = CurrentEntry.impressionsSeen
			
			if ImpressionsSeen then
				local List = {}
				
				for i, value in pairs(ImpressionsSeen) do
					if value then
						table.insert(List, i)
					end
				end
				if #List > 0 then
					UseRefResult2.current:onClearImpressions(List)
				end
			end
			CurrentEntry.impressionsSeen = {}
		end
		CurrentEntry.lastUpdatedTimestamp = UseSelectorResult
		UseRefResult.current[p1.gameSortId] = CurrentEntry
		UseRefResult1.current:fire()
	end, { p1.gameSortId, UseSelectorResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), p1 (copy)
		UseRefResult1.current:fire()
		local ScrollViewPositionChangedSignalConnection = if p1.scrollViewPositionChangedSignal then p1.scrollViewPositionChangedSignal:connect(function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current:fire()
		end) else nil
		
		return function()
			-- upvalues: ScrollViewPositionChangedSignalConnection (ref)
			if ScrollViewPositionChangedSignalConnection ~= nil then
				ScrollViewPositionChangedSignalConnection:disconnect()
			end
		end
	end, { p1.scrollViewPositionChangedSignal })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (ref)
		return function()
			-- upvalues: UseRefResult2 (upval)
			UseRefResult2.current:destroy()
		end
	end, {})
	
	return ReactModule.createElement(ScreenSizeImpressionsDetector, {
		onRequestImpressionsSignal = UseRefResult1.current,
		parentRef = p1.parentRef,
		filterImpressionFunc = ReactModule.useCallback(function(p2): boolean
			-- upvalues: UseRefResult (copy), p1 (copy), UseSelectorResult (copy)
			if UseRefResult.current[p1.gameSortId] == nil then
				UseRefResult.current[p1.gameSortId] = {
					impressionsSeen = {},
					lastUpdatedTimestamp = UseSelectorResult
				}
			end
			local CurrentEntry = UseRefResult.current[p1.gameSortId]
			CurrentEntry.impressionsSeen = CurrentEntry.impressionsSeen or {}
			
			if CurrentEntry.impressionsSeen[p2] == nil then
				CurrentEntry.impressionsSeen[p2] = true
				
				return true
			else
				return false
			end
		end, { p1.gameSortId }),
		onImpressionsDetected = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), UseRefResult2 (ref)
			if p2 and #p2 ~= 0 then
				p1.sendGameImpressions(p2)
				UseRefResult2.current:onSendImpressions(p2)
				
				return
			end
		end, { p1.sendGameImpressions }),
		impressionsTag = p1.impressionsTag
	})
end