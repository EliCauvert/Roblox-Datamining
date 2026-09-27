local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local fFlagMomentsComments = require(parent.SharedFlags).FFlagMomentsComments
local _ = require(script.Parent.Parent.createCommentsRecommendationSession)

return function()
	-- upvalues: signalsModule (ref), fFlagMomentsComments (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal(0)
	local var7 = nil
	
	return {
		getIsOpen = var1,
		getFeedItemId = var3,
		getOpenSessionId = var5,
		getRecommendationSession = function(p1, p2)
			-- upvalues: var3 (ref), var5 (ref), var7 (write)
			return if var3(false) == p1 and var5(false) == p2 then var7 else nil
		end,
		open = function(p1, p2)
			-- upvalues: fFlagMomentsComments (copy), var7 (write), var4 (ref), var6 (ref), var5 (ref), var2 (ref)
			if fFlagMomentsComments then
				if var7 ~= nil then
					var7.finishView()
				end
				var7 = p2
			end
			var4(p1)
			var6(var5(false) + 1)
			var2(true)
		end,
		close = function()
			-- upvalues: fFlagMomentsComments (copy), var7 (write), var2 (ref)
			if fFlagMomentsComments and var7 ~= nil then
				var7.finishView()
			end
			var2(false)
		end,
		reset = function()
			-- upvalues: fFlagMomentsComments (copy), var7 (write), var2 (ref), var4 (ref), var6 (ref), var5 (ref)
			if fFlagMomentsComments and var7 ~= nil then
				var7.cancel()
				var7 = nil
			end
			var2(false)
			var4(nil)
			var6(var5(false) + 1)
		end
	}
end