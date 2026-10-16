local ReactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)

return {
	getHeaderOverlapPadding = function(p1) --[[ Line: 19 ]]
		return p1:map(function(p2): UDim --[[ Line: 20 ]]
			return UDim.new(0, -p2)
		end)
	end,
	getHeaderVisibleHeight = function(Height, Value: number) --[[ Line: 27 ]]
		-- upvalues: ReactModule (copy)
		if type(Value) == "number" then
			local v1 = 1 - math.clamp(Value, 0, 1)
			
			return Height:map(function(p1) --[[ Line: 30 ]]
				-- upvalues: v1 (copy)
				return p1 * v1
			end)
		else
			return if Value == nil then Height else ReactModule.joinBindings({ height = Height, fade = Value }):map(function(p1) --[[ Line: 37 ]]
				return p1.height * (1 - math.clamp(p1.fade, 0, 1))
			end)
		end
	end,
	getContentTopPadding = function(Height, VisibleHeight, CanvasY) --[[ Line: 49 ]]
		-- upvalues: ReactModule (copy)
		return ReactModule.joinBindings({
			height = Height,
			visibleHeight = VisibleHeight,
			canvasY = CanvasY
		}):map(function(p1): number --[[ Line: 58 ]]
			return p1.height - math.min(p1.height - p1.visibleHeight, (math.max(p1.height - p1.canvasY, 0)))
		end)
	end,
	getHeaderInteractable = function(p1: number) --[[ Line: 66 ]]
		return if type(p1) == "number" then p1 < 1 else p1 == nil or p1:map(function(p2: number): boolean --[[ Line: 70 ]]
			return p2 < 1
		end)
	end
}