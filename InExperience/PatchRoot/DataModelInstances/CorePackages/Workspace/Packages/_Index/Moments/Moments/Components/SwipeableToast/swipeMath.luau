local ConstantsModule = require(script.Parent.Constants)
local SwipeMathModule = {
	createLayout = function(p1, Width, RestTop, CardHeight)
		-- upvalues: ConstantsModule (copy)
		local PULLCANVASRANGE = ConstantsModule.PULL_CANVAS_RANGE
		
		return {
			restTop = RestTop,
			restLeft = math.floor((p1 - Width) / 2),
			width = Width,
			cardHeight = CardHeight,
			rest = PULLCANVASRANGE,
			exit = PULLCANVASRANGE + RestTop + CardHeight + ConstantsModule.EXIT_MARGIN
		}
	end,
	offsetForCanvas = function(p1, p2)
		-- upvalues: ConstantsModule (copy)
		if p2.rest <= p1 then
			return p2.rest - p1
		else
			local PULLLIMIT = ConstantsModule.PULL_LIMIT
			
			return PULLLIMIT * (1 - 1 / (1 + ConstantsModule.PULL_RESISTANCE * (p2.rest - p1) / PULLLIMIT))
		end
	end,
	canvasForOffset = function(p1: number, p2)
		-- upvalues: ConstantsModule (copy)
		return if p1 <= 0 then p2.rest - p1 else p2.rest - p1 / (ConstantsModule.PULL_RESISTANCE * (1 - math.min(p1 / ConstantsModule.PULL_LIMIT, 0.999)))
	end,
	offsetSlope = function(p1, p2)
		-- upvalues: ConstantsModule (copy)
		if p2.rest <= p1 then
			return 1
		else
			local NewPULLRESISTANCE = 1 + ConstantsModule.PULL_RESISTANCE * (p2.rest - p1) / ConstantsModule.PULL_LIMIT
			
			return ConstantsModule.PULL_RESISTANCE / (NewPULLRESISTANCE * NewPULLRESISTANCE)
		end
	end
}

function SwipeMathModule.cardCanvasPosition(p1, p2, Layout)
	-- upvalues: SwipeMathModule (copy)
	local NewOffsetForCanvasResult = p1 + SwipeMathModule.offsetForCanvas(p1, Layout)
	
	if p2 then
		return Layout.restLeft, NewOffsetForCanvasResult + Layout.restTop
	else
		return 0, NewOffsetForCanvasResult
	end
end

function SwipeMathModule.resolveRelease(p1, p2, p3): string
	-- upvalues: ConstantsModule (copy)
	return if p1 + p2 * ConstantsModule.THROW_SENSITIVITY <= -p3 * ConstantsModule.DISMISS_FRACTION then "dismiss" else "rest"
end

function SwipeMathModule.isOffscreen(p1, Layout): boolean
	-- upvalues: SwipeMathModule (copy)
	return Layout.restTop + SwipeMathModule.offsetForCanvas(p1, Layout) + Layout.cardHeight <= 0
end

return SwipeMathModule