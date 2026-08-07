local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local _ = require(videoUtils.ViewportVideoAutoplayController)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local luaAppVideoAutoplayWinnerLineOffsetFromTopBarPx = game:DefineFastInt("LuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx", 240)

return function(p0) --[[ line: 20 | named "ViewportVideoAutoplaySync" ]]
	-- upvalues: useViewportBounds (ref), reactModule (ref), luaAppVideoAutoplayWinnerLineOffsetFromTopBarPx (ref), videoEndReason (ref)
	local var3 = useViewportBounds(p0.scrollingFrameRef)
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: p0 (ref), luaAppVideoAutoplayWinnerLineOffsetFromTopBarPx (copy), var3 (ref)
		local viewportAutoplayController = p0.viewportAutoplayController
		
		if viewportAutoplayController then
			viewportAutoplayController:setWinnerLineOffsetFromTopBarPx(luaAppVideoAutoplayWinnerLineOffsetFromTopBarPx)
			viewportAutoplayController:setFeedScopeRef(p0.scrollingFrameRef)
			viewportAutoplayController:setViewPortBounds(var3)
			
			return
		end
	end, {
		p0.viewportAutoplayController,
		p0.scrollingFrameRef,
		var3
	})
	reactModule.useEffect(function() --[[ line: 45 ]]
		-- upvalues: p0 (ref), videoEndReason (copy)
		local viewportAutoplayController = p0.viewportAutoplayController
		
		if viewportAutoplayController then
			return function() --[[ line: 51 ]]
				-- upvalues: viewportAutoplayController (ref), videoEndReason (copy)
				viewportAutoplayController:setFeedScopeRef({ current = nil })
				viewportAutoplayController:reset(videoEndReason.Unmounted)
			end
		end
	end, { p0.viewportAutoplayController })
	
	return nil
end