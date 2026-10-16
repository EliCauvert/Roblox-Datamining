local Parent = script:FindFirstAncestor("Moments").Parent
local SignalsModule = require(Parent.Signals)
local FFlagMomentsComments = require(Parent.SharedFlags).FFlagMomentsComments
local _ = require(script.Parent.Parent.createCommentsRecommendationSession)
local CommentsSheetSnapPointsModule = require(script.Parent.CommentsSheetSnapPoints)
local _ = require(script.Parent.getCommentsVideoLift)
local _ = require(script.Parent.Parent.createCommentsAnalyticsSession)

return function() --[[ Line: 43 | Named "createCommentsSheetStore" ]]
	-- upvalues: SignalsModule (copy), FFlagMomentsComments (copy), CommentsSheetSnapPointsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(0)
	local Signal4, Signal2_3 = SignalsModule.createSignal(true)
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	local Signal6, Signal2_5 = SignalsModule.createSignal(false)
	local v1 = nil
	local v2 = nil
	
	return {
		getIsOpen = Signal,
		getFeedItemId = Signal1,
		getOpenSessionId = Signal3,
		getIsListScrollingEnabled = Signal4,
		getVideoLift = Signal5,
		getIsExpanded = Signal6,
		getRecommendationSession = function(p1, p2) --[[ Line: 125 ]]
			-- upvalues: Signal1 (copy), Signal3 (copy), v1 (ref)
			return if Signal1(false) == p1 and Signal3(false) == p2 then v1 else nil
		end,
		getAnalyticsSession = function(p1, p2) --[[ Line: 131 ]]
			-- upvalues: Signal1 (copy), Signal3 (copy), v2 (ref)
			return if Signal1(false) == p1 and Signal3(false) == p2 then v2 else nil
		end,
		open = function(p1, p2, p3) --[[ Line: 56 ]]
			-- upvalues: FFlagMomentsComments (upval), v2 (ref), v1 (ref), Signal2_1 (copy), Signal2_2 (copy), Signal3 (copy), Signal2_3 (copy), Signal2_4 (copy), Signal2_5 (copy), Signal2 (copy)
			if FFlagMomentsComments then
				if v2 ~= nil then
					v2.finishView("replaced")
				end
				v2 = p3
				
				if v2 ~= nil then
					v2.open()
				end
			end
			if FFlagMomentsComments then
				if v1 ~= nil then
					v1.finishView()
				end
				v1 = p2
			end
			Signal2_1(p1)
			Signal2_2(Signal3(false) + 1)
			Signal2_3(true)
			Signal2_4(nil)
			Signal2_5(false)
			Signal2(true)
		end,
		close = function(p1) --[[ Line: 84 ]]
			-- upvalues: FFlagMomentsComments (upval), v2 (ref), v1 (ref), Signal2_5 (copy), Signal2 (copy)
			if FFlagMomentsComments and v2 ~= nil then
				v2.finishView(p1 or "closed")
			end
			if FFlagMomentsComments and v1 ~= nil then
				v1.finishView()
			end
			Signal2_5(false)
			Signal2(false)
		end,
		reset = function() --[[ Line: 96 ]]
			-- upvalues: FFlagMomentsComments (upval), v2 (ref), v1 (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), Signal3 (copy), Signal2_3 (copy), Signal2_4 (copy), Signal2_5 (copy)
			if FFlagMomentsComments and v2 ~= nil then
				v2.cancel()
				v2 = nil
			end
			if FFlagMomentsComments and v1 ~= nil then
				v1.cancel()
				v1 = nil
			end
			Signal2(false)
			Signal2_1(nil)
			Signal2_2(Signal3(false) + 1)
			Signal2_3(true)
			Signal2_4(nil)
			Signal2_5(false)
		end,
		setSnapPointIndex = function(Count) --[[ Line: 113 ]]
			-- upvalues: Signal2_3 (copy), CommentsSheetSnapPointsModule (upval), Signal2_5 (copy)
			Signal2_3(Count == #CommentsSheetSnapPointsModule)
			Signal2_5(Count == #CommentsSheetSnapPointsModule)
		end,
		setVideoLift = Signal2_4
	}
end