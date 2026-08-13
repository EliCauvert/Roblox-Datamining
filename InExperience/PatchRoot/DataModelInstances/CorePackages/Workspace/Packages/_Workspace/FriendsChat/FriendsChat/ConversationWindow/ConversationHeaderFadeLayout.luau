local reactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)

return {
	getHeaderOverlapPadding = function(p0) --[[ line: 19 ]]
		return p0:map(function(p1) --[[ line: 20 ]]
			return UDim.new(0, -p1)
		end)
	end,
	getHeaderVisibleHeight = function(p2, p3) --[[ line: 27 ]]
		-- upvalues: reactModule (ref)
		if type(p3) == "number" then
			local var1 = 1 - math.clamp(p3, 0, 1)
			
			return p2:map(function(p4) --[[ line: 30 ]]
				-- upvalues: var1 (ref)
				return p4 * var1
			end)
		end
		return if p3 == nil then p2 else reactModule.joinBindings({ height = p2, fade = p3 }):map(function(p5) --[[ line: 37 ]]
			return p5.height * (1 - math.clamp(p5.fade, 0, 1))
		end)
	end,
	getContentTopPadding = function(p6, p7, p8) --[[ line: 49 ]]
		-- upvalues: reactModule (ref)
		return reactModule.joinBindings({ height = p6, visibleHeight = p7, canvasY = p8 }):map(function(p9) --[[ line: 58 ]]
			return p9.height - math.min(p9.height - p9.visibleHeight, math.max(p9.height - p9.canvasY, 0))
		end)
	end,
	getHeaderInteractable = function(p10) --[[ line: 66 ]]
		return if type(p10) == "number" then p10 < 1 else p10 == nil or p10:map(function(p11) --[[ line: 70 ]]
			return p11 < 1
		end)
	end
}