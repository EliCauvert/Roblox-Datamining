local reactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)

return {
	getHeaderOverlapPadding = function(p1)
		return p1:map(function(p2)
			return UDim.new(0, -p2)
		end)
	end,
	getHeaderVisibleHeight = function(p1, p2)
		-- upvalues: reactModule (ref)
		if type(p2) == "number" then
			local var1 = 1 - math.clamp(p2, 0, 1)
			
			return p1:map(function(p3)
				-- upvalues: var1 (ref)
				return p3 * var1
			end)
		end
		return if p2 == nil then p1 else reactModule.joinBindings({ height = p1, fade = p2 }):map(function(p3)
			return p3.height * (1 - math.clamp(p3.fade, 0, 1))
		end)
	end,
	getContentTopPadding = function(p1, p2, p3)
		-- upvalues: reactModule (ref)
		return reactModule.joinBindings({ height = p1, visibleHeight = p2, canvasY = p3 }):map(function(p4)
			return p4.height - math.min(p4.height - p4.visibleHeight, math.max(p4.height - p4.canvasY, 0))
		end)
	end,
	getHeaderInteractable = function(p1)
		return if type(p1) == "number" then p1 < 1 else p1 == nil or p1:map(function(p2)
			return p2 < 1
		end)
	end
}