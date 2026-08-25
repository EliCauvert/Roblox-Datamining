local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local useSignalState = require(parent.SignalsReact).useSignalState
local momentContextModule = require(script.Parent.Parent.MomentContext)
local useMomentGesturesModule = require(script.Parent.useMomentGestures)
local useReactionCommitModule = require(script.Parent.useReactionCommit)

return reactModule.memo(function(p0)
	-- upvalues: momentContextModule (ref), useReactionCommitModule (ref), useSignalState (ref), reactModule (ref), useMomentGesturesModule (ref), view (ref)
	local var4 = momentContextModule.useMoment()
	local controller = var4.controller
	local store = var4.store
	local var5 = useReactionCommitModule()
	
	return reactModule.createElement(view, {
		tag = "size-full",
		Active = true,
		BackgroundTransparency = 1,
		ref = useMomentGesturesModule(not useSignalState(store.getIsModerated) and not useSignalState(store.getIsScrubbing), {
			onSingleTapConfirmed = reactModule.useCallback(function()
				-- upvalues: controller (ref)
				if controller ~= nil then
					controller.toggle()
				end
			end, { controller }),
			onDoubleTap = reactModule.useCallback(function(p1)
				-- upvalues: var5 (ref)
				var5("doubleTap", p1, nil)
			end, { var5 })
		}).ref,
		ZIndex = p0.ZIndex
	})
end)