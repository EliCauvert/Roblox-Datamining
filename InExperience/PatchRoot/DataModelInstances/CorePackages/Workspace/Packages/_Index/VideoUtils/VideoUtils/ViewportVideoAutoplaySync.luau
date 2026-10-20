local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ReactModule = require(Parent.React)
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds
local _ = require(VideoUtils.ViewportVideoAutoplayController)
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local LuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx = game:DefineFastInt("LuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx", 240)

return function(p1)
	-- upvalues: UseViewportBoundsFunction (copy), ReactModule (copy), LuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), VideoEndReason (copy)
	local UseViewportBoundsResult = UseViewportBoundsFunction(p1.scrollingFrameRef)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), LuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx (upval), UseViewportBoundsResult (copy)
		local ViewportAutoplayController = p1.viewportAutoplayController
		
		if ViewportAutoplayController then
			ViewportAutoplayController:setWinnerLineOffsetFromTopBarPx(LuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx)
			ViewportAutoplayController:setFeedScopeRef(p1.scrollingFrameRef)
			ViewportAutoplayController:setViewPortBounds(UseViewportBoundsResult)
			
			return
		end
	end, {
		p1.viewportAutoplayController,
		p1.scrollingFrameRef,
		UseViewportBoundsResult
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), VideoEndReason (upval)
		local ViewportAutoplayController = p1.viewportAutoplayController
		
		if not ViewportAutoplayController then return end
		return function()
			-- upvalues: ViewportAutoplayController (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), VideoEndReason (upval)
			ViewportAutoplayController:setFeedScopeRef({ current = nil })
			
			if FFlagLuaAppOneByTwoHoverIdleAutoplay then
				ViewportAutoplayController:clearUserIntentCandidate()
			end
			ViewportAutoplayController:reset(VideoEndReason.Unmounted)
		end
	end, { p1.viewportAutoplayController })
	
	return nil
end