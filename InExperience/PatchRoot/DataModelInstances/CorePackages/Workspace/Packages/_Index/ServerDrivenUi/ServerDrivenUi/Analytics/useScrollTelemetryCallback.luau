local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local _ = require(parent.UnifiedLogging)
local getDisplayStore = require(parent.Display).GetDisplayStore
local feedScroll = require(parent.ScrollTelemetry).feedScroll
local sduiErrors = require(parent.SduiCoreSystem).SduiErrors

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), sduiErrors (ref), getDisplayStore (ref), feedScroll (ref)
	return reactModule.useCallback(function(p4, p5, p6)
		-- upvalues: p1 (ref), p2 (ref), p3 (ref), sduiErrors (copy), getDisplayStore (copy), feedScroll (copy)
		if p1 and p1.current ~= nil and p2.current then
			local current = p2.current
			local scrollingDirection = p1.current.ScrollingDirection
			local var1 = 0
			
			if scrollingDirection == Enum.ScrollingDirection.X then
				var1 = p1.current.AbsoluteSize.X
			elseif scrollingDirection == Enum.ScrollingDirection.Y then
				var1 = p1.current.AbsoluteSize.Y
			else
				p3.dependencies.logger.reportError(sduiErrors.SduiErrorType.InvalidScrollDirection, {
					name = `{current.collectionId}`,
					message = `Direction {scrollingDirection.Name} is an unsupported option for feedScroll event`
				}, p3.appPage)
			end
			local viewportSize = getDisplayStore(false).getViewportSize(false)
			feedScroll(p3.dependencies.eventIngest, p3.appPage, scrollingDirection, {
				gameSetTargetId = nil,
				distance = p4,
				screenSizeX = viewportSize.X,
				screenSizeY = viewportSize.Y,
				scrollAreaSize = var1,
				scrollDepth = if var1 > 0 then p4 / var1 else nil,
				startDepth = if var1 > 0 then p6 / var1 else nil,
				startPos = p6,
				scrollDuration = p5,
				sortPos = current.collectionPosition,
				gameSetTypeId = tostring(current.collectionId)
			})
		end
	end, { p3, p2, p1 })
end