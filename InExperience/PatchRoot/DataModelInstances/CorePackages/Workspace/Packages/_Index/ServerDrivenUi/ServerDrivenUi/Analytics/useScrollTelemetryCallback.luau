local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local _ = require(parent.UnifiedLogging)
local getDisplayStore = require(parent.Display).GetDisplayStore
local feedScroll = require(parent.ScrollTelemetry).feedScroll
local sduiErrors = require(parent.SduiCoreSystem).SduiErrors

return function(p0, p1, p2)
	-- upvalues: reactModule (ref), sduiErrors (ref), getDisplayStore (ref), feedScroll (ref)
	return reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: p0 (ref), p1 (ref), p2 (ref), sduiErrors (copy), getDisplayStore (copy), feedScroll (copy)
		if p0 and p0.current ~= nil and p1.current then
			local current = p1.current
			local scrollingDirection = p0.current.ScrollingDirection
			local var1 = 0
			
			if scrollingDirection == Enum.ScrollingDirection.X then
				var1 = p0.current.AbsoluteSize.X
			elseif scrollingDirection == Enum.ScrollingDirection.Y then
				var1 = p0.current.AbsoluteSize.Y
			else
				p2.dependencies.logger.reportError(sduiErrors.SduiErrorType.InvalidScrollDirection, {
					name = `{current.collectionId}`,
					message = `Direction {scrollingDirection.Name} is an unsupported option for feedScroll event`
				}, p2.appPage)
			end
			local viewportSize = getDisplayStore(false).getViewportSize(false)
			feedScroll(p2.dependencies.eventIngest, p2.appPage, scrollingDirection, {
				gameSetTargetId = nil,
				distance = p3,
				screenSizeX = viewportSize.X,
				screenSizeY = viewportSize.Y,
				scrollAreaSize = var1,
				scrollDepth = if var1 > 0 then p3 / var1 else nil,
				startDepth = if var1 > 0 then p5 / var1 else nil,
				startPos = p5,
				scrollDuration = p4,
				sortPos = current.collectionPosition,
				gameSetTypeId = tostring(current.collectionId)
			})
		end
	end, { p2, p1, p0 })
end