local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local fFlagMomentsComments = require(parent.SharedFlags).FFlagMomentsComments
local _ = require(script.Parent.Parent.createCommentsRecommendationSession)
local commentsSheetSnapPointsModule = require(script.Parent.CommentsSheetSnapPoints)
local _ = require(script.Parent.Parent.createCommentsAnalyticsSession)

return function()
	-- upvalues: signalsModule (ref), fFlagMomentsComments (ref), commentsSheetSnapPointsModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal(0)
	local var7, var8 = signalsModule.createSignal(true)
	local var9 = nil
	local var10 = nil
	
	return {
		getIsOpen = var1,
		getFeedItemId = var3,
		getOpenSessionId = var5,
		getIsListScrollingEnabled = var7,
		getRecommendationSession = function(p1, p2)
			-- upvalues: var3 (ref), var5 (ref), var9 (write)
			return if var3(false) == p1 and var5(false) == p2 then var9 else nil
		end,
		getAnalyticsSession = function(p1, p2)
			-- upvalues: var3 (ref), var5 (ref), var10 (write)
			return if var3(false) == p1 and var5(false) == p2 then var10 else nil
		end,
		open = function(p1, p2, p3)
			-- upvalues: fFlagMomentsComments (copy), var10 (write), var9 (write), var4 (ref), var6 (ref), var5 (ref), var8 (ref), var2 (ref)
			if fFlagMomentsComments then
				if var10 ~= nil then
					var10.finishView("replaced")
				end
				var10 = p3
				
				if var10 ~= nil then
					var10.open()
				end
			end
			if fFlagMomentsComments then
				if var9 ~= nil then
					var9.finishView()
				end
				var9 = p2
			end
			var4(p1)
			var6(var5(false) + 1)
			var8(true)
			var2(true)
		end,
		close = function()
			-- upvalues: fFlagMomentsComments (copy), var10 (write), var9 (write), var2 (ref)
			if fFlagMomentsComments and var10 ~= nil then
				var10.finishView("closed")
			end
			if fFlagMomentsComments and var9 ~= nil then
				var9.finishView()
			end
			var2(false)
		end,
		reset = function()
			-- upvalues: fFlagMomentsComments (copy), var10 (write), var9 (write), var2 (ref), var4 (ref), var6 (ref), var5 (ref), var8 (ref)
			if fFlagMomentsComments and var10 ~= nil then
				var10.cancel()
				var10 = nil
			end
			if fFlagMomentsComments and var9 ~= nil then
				var9.cancel()
				var9 = nil
			end
			var2(false)
			var4(nil)
			var6(var5(false) + 1)
			var8(true)
		end,
		setSnapPointIndex = function(value)
			-- upvalues: var8 (ref), commentsSheetSnapPointsModule (copy)
			var8(value == #commentsSheetSnapPointsModule)
		end
	}
end