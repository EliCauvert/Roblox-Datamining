local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local _ = require(videoUtils.ViewportVideoAutoplayController)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local luaAppVideoAutoplayWinnerLineOffsetFromTopBarPx = game:DefineFastInt("LuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx", 240)

return function(p1)
	-- upvalues: useViewportBounds (ref), reactModule (ref), luaAppVideoAutoplayWinnerLineOffsetFromTopBarPx (ref), videoEndReason (ref)
	local var1 = useViewportBounds(p1.scrollingFrameRef)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), luaAppVideoAutoplayWinnerLineOffsetFromTopBarPx (copy), var1 (ref)
		local viewportAutoplayController = p1.viewportAutoplayController
		
		if viewportAutoplayController then
			viewportAutoplayController:setWinnerLineOffsetFromTopBarPx(luaAppVideoAutoplayWinnerLineOffsetFromTopBarPx)
			viewportAutoplayController:setFeedScopeRef(p1.scrollingFrameRef)
			viewportAutoplayController:setViewPortBounds(var1)
			
			return
		end
	end, {
		p1.viewportAutoplayController,
		p1.scrollingFrameRef,
		var1
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), videoEndReason (copy)
		local viewportAutoplayController = p1.viewportAutoplayController
		
		if viewportAutoplayController then
			return function()
				-- upvalues: viewportAutoplayController (ref), videoEndReason (copy)
				viewportAutoplayController:setFeedScopeRef({ current = nil })
				viewportAutoplayController:reset(videoEndReason.Unmounted)
			end
		end
	end, { p1.viewportAutoplayController })
	
	return nil
end