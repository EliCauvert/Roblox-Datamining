local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local useSignalState = require(parent.SignalsReact).useSignalState
local momentContextModule = require(script.Parent.Parent.MomentContext)
local useMomentGesturesModule = require(script.Parent.useMomentGestures)
local useReactionCommitModule = require(script.Parent.useReactionCommit)

return reactModule.memo(function(p1)
	-- upvalues: momentContextModule (ref), useReactionCommitModule (ref), useSignalState (ref), reactModule (ref), useMomentGesturesModule (ref), view (ref)
	local var1 = momentContextModule.useMoment()
	local controller = var1.controller
	local store = var1.store
	local var2 = useReactionCommitModule()
	
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
			onDoubleTap = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref)
				var2("doubleTap", p2, nil)
			end, { var2 })
		}).ref,
		ZIndex = p1.ZIndex
	})
end)