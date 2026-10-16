local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local fFlagMomentsComments = require(parent.SharedFlags).FFlagMomentsComments
local _ = require(script.Parent.Parent.createCommentsRecommendationSession)
local commentsSheetSnapPointsModule = require(script.Parent.CommentsSheetSnapPoints)
local _ = require(script.Parent.getCommentsVideoLift)
local _ = require(script.Parent.Parent.createCommentsAnalyticsSession)

return function()
	-- upvalues: signalsModule (ref), fFlagMomentsComments (ref), commentsSheetSnapPointsModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal(0)
	local var7, var8 = signalsModule.createSignal(true)
	local var9, var10 = signalsModule.createSignal(nil)
	local var11, var12 = signalsModule.createSignal(false)
	local var13 = nil
	local var14 = nil
	
	return {
		getIsOpen = var1,
		getFeedItemId = var3,
		getOpenSessionId = var5,
		getIsListScrollingEnabled = var7,
		getVideoLift = var9,
		getIsExpanded = var11,
		getRecommendationSession = function(p1, p2)
			-- upvalues: var3 (ref), var5 (ref), var13 (write)
			return if var3(false) == p1 and var5(false) == p2 then var13 else nil
		end,
		getAnalyticsSession = function(p1, p2)
			-- upvalues: var3 (ref), var5 (ref), var14 (write)
			return if var3(false) == p1 and var5(false) == p2 then var14 else nil
		end,
		open = function(p1, p2, p3)
			-- upvalues: fFlagMomentsComments (copy), var14 (write), var13 (write), var4 (ref), var6 (ref), var5 (ref), var8 (ref), var10 (ref), var12 (ref), var2 (ref)
			if fFlagMomentsComments then
				if var14 ~= nil then
					var14.finishView("replaced")
				end
				var14 = p3
				
				if var14 ~= nil then
					var14.open()
				end
			end
			if fFlagMomentsComments then
				if var13 ~= nil then
					var13.finishView()
				end
				var13 = p2
			end
			var4(p1)
			var6(var5(false) + 1)
			var8(true)
			var10(nil)
			var12(false)
			var2(true)
		end,
		close = function()
			-- upvalues: fFlagMomentsComments (copy), var14 (write), var13 (write), var12 (ref), var2 (ref)
			if fFlagMomentsComments and var14 ~= nil then
				var14.finishView("closed")
			end
			if fFlagMomentsComments and var13 ~= nil then
				var13.finishView()
			end
			var12(false)
			var2(false)
		end,
		reset = function()
			-- upvalues: fFlagMomentsComments (copy), var14 (write), var13 (write), var2 (ref), var4 (ref), var6 (ref), var5 (ref), var8 (ref), var10 (ref), var12 (ref)
			if fFlagMomentsComments and var14 ~= nil then
				var14.cancel()
				var14 = nil
			end
			if fFlagMomentsComments and var13 ~= nil then
				var13.cancel()
				var13 = nil
			end
			var2(false)
			var4(nil)
			var6(var5(false) + 1)
			var8(true)
			var10(nil)
			var12(false)
		end,
		setSnapPointIndex = function(value)
			-- upvalues: var8 (ref), commentsSheetSnapPointsModule (copy), var12 (ref)
			var8(value == #commentsSheetSnapPointsModule)
			var12(value == #commentsSheetSnapPointsModule)
		end,
		setVideoLift = var10
	}
end