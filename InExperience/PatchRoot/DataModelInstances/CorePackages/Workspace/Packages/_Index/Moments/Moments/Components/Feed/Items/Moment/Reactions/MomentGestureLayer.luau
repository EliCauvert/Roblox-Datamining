local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local UseMomentGesturesModule = require(script.Parent.useMomentGestures)
local UseReactionCommitModule = require(script.Parent.useReactionCommit)

return ReactModule.memo(function(p1) --[[ Line: 33 | Named "MomentGestureLayer" ]]
	-- upvalues: MomentContextModule (copy), UseReactionCommitModule (copy), UseSignalStateFunction (copy), ReactModule (copy), UseMomentGesturesModule (copy), View (copy)
	local UseMomentResult = MomentContextModule.useMoment()
	local Controller = UseMomentResult.controller
	local Store = UseMomentResult.store
	local UseReactionCommitModuleResult = UseReactionCommitModule()
	local UseSignalStateResult = UseSignalStateFunction(Store.getIsModerated)
	local UseSignalStateResult1 = UseSignalStateFunction(Store.getIsScrubbing)
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		Active = true,
		BackgroundTransparency = 1,
		ref = UseMomentGesturesModule(not UseSignalStateResult and not UseSignalStateResult1, {
			onSingleTapConfirmed = ReactModule.useCallback(function() --[[ Line: 49 ]]
				-- upvalues: Controller (copy)
				if Controller ~= nil then
					Controller.toggle()
				end
			end, { Controller }),
			onDoubleTap = ReactModule.useCallback(function(p2) --[[ Line: 55 ]]
				-- upvalues: UseReactionCommitModuleResult (copy)
				UseReactionCommitModuleResult("doubleTap", p2, nil)
			end, { UseReactionCommitModuleResult })
		}).ref,
		ZIndex = p1.ZIndex
	})
end)