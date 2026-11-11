local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.UnifiedLogging)
local GetDisplayStoreFunction = require(Parent.Display).GetDisplayStore
local FeedScrollFunction = require(Parent.ScrollTelemetry).feedScroll
local SduiErrors = require(Parent.SduiCoreSystem).SduiErrors

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), SduiErrors (copy), GetDisplayStoreFunction (copy), FeedScrollFunction (copy)
	return (ReactModule.useCallback(function(Distance, ScrollDuration, StartPos)
		-- upvalues: p1 (copy), p2 (copy), p3 (copy), SduiErrors (upval), GetDisplayStoreFunction (upval), FeedScrollFunction (upval)
		if p1 and p1.current ~= nil and p2.current then
			local Current = p2.current
			local ScrollingDirection = p1.current.ScrollingDirection
			local X = 0
			
			if ScrollingDirection == Enum.ScrollingDirection.X then
				X = p1.current.AbsoluteSize.X
			elseif ScrollingDirection == Enum.ScrollingDirection.Y then
				X = p1.current.AbsoluteSize.Y
			else
				p3.dependencies.logger.reportError(SduiErrors.SduiErrorType.InvalidScrollDirection, {
					name = `{Current.collectionId}`,
					message = `Direction {ScrollingDirection.Name} is an unsupported option for feedScroll event`
				}, p3.appPage)
			end
			local ViewportSize = GetDisplayStoreFunction(false).getViewportSize(false)
			FeedScrollFunction(p3.dependencies.eventIngest, p3.appPage, ScrollingDirection, {
				gameSetTargetId = nil,
				distance = Distance,
				screenSizeX = ViewportSize.X,
				screenSizeY = ViewportSize.Y,
				scrollAreaSize = X,
				scrollDepth = if X > 0 then Distance / X else nil,
				startDepth = if X > 0 then StartPos / X else nil,
				startPos = StartPos,
				scrollDuration = ScrollDuration,
				sortPos = Current.collectionPosition,
				gameSetTypeId = tostring(Current.collectionId)
			})
		end
	end, { p3, p2, p1 }))
end