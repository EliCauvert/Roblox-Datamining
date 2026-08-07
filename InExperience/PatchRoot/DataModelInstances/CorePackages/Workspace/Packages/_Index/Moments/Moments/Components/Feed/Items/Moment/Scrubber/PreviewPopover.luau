local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local signalsReactModule = require(parent.SignalsReact)
local momentsCommonModule = require(parent.MomentsCommon)
local previewPopoverMathModule = require(script.Parent.previewPopoverMath)
local _ = require(script.Parent.Parent.Hooks.useMomentProgress)
local useVideoScrubPreviewModule = require(script.Parent.useVideoScrubPreview)
local momentContextModule = require(script.Parent.Parent.MomentContext)
local timeLabelModule = require(script.Parent.TimeLabel)
local videoPreviewModule = require(script.Parent.VideoPreview)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useScreenSize = momentsCommonModule.Hooks.useScreenSize
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useSignalState = signalsReactModule.useSignalState
local SCRUB_FADE_SECONDS = momentContextModule.SCRUB_FADE_SECONDS

return reactModule.memo(function(p0) --[[ line: 37 | named "PreviewPopover" ]]
	-- upvalues: useTokens (ref), momentContextModule (ref), useScreenSize (ref), useDeviceInsets (ref), reactUtilsModule (ref), useSignalState (ref), reactModule (ref), useVideoScrubPreviewModule (ref), SCRUB_FADE_SECONDS (ref), previewPopoverMathModule (ref), view (ref), videoPreviewModule (ref), timeLabelModule (ref)
	local createElement_1
	local var10 = useTokens()
	local var11 = momentContextModule.useMoment()
	local var12 = useScreenSize()
	local var13 = useDeviceInsets()
	local var14 = reactUtilsModule.createNextOrder()
	local controller = var11.controller
	local var15 = useSignalState(var11.store.getIsScrubbing)
	local var16 = useVideoScrubPreviewModule(reactModule.useMemo(function() --[[ line: 47 ]]
		-- upvalues: controller (ref)
		return if controller == nil then nil else controller.getVideoPreviewSource()
	end, { controller }), var15, var11.store.getScrubPosition)
	local var17, var18 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: var15 (ref), var18 (ref), SCRUB_FADE_SECONDS (copy)
		if var15 then
			var18(true)
			
			return
		end
		local var28 = false
		task.delay(SCRUB_FADE_SECONDS, function() --[[ line: 61 ]]
			-- upvalues: var28 (write), var18 (copy)
			if not var28 then
				var18(false)
			end
		end)
		
		return function() --[[ line: 66 ]]
			-- upvalues: var28 (write)
			var28 = true
		end
	end, { var15 })
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(nil)
	local var21, var22 = reactModule.useBinding({ position = 0, width = 0 })
	local var23, var24 = reactModule.useBinding(0)
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: var19 (ref), var22 (ref)
		local current = var19.current
		
		if current == nil then
			return
		end
		local function update() --[[ line: 86 ]]
			-- upvalues: var22 (copy), current (ref)
			var22({
				position = current.AbsolutePosition.X,
				width = current.AbsoluteSize.X
			})
		end
		
		var22({
			position = current.AbsolutePosition.X,
			width = current.AbsoluteSize.X
		})
		local var30 = current:GetPropertyChangedSignal("AbsolutePosition"):Connect(update)
		local var31 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function() --[[ line: 96 ]]
			-- upvalues: var30 (ref), var31 (ref)
			var30:Disconnect()
			var31:Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 104 ]]
		-- upvalues: var20 (ref), var24 (ref)
		local current = var20.current
		
		if current == nil then
			return
		end
		local function update() --[[ line: 110 ]]
			-- upvalues: var24 (copy), current (ref)
			var24(current.AbsoluteSize.X)
		end
		
		var24(current.AbsoluteSize.X)
		local var33 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function() --[[ line: 116 ]]
			-- upvalues: var33 (ref)
			var33:Disconnect()
		end
	end, { var17 })
	local size100 = var10.Size.Size_100
	local var25 = reactModule.joinBindings({ p0.progressRatio, var21, var23 }):map(function(p1) --[[ line: 124 ]]
		-- upvalues: previewPopoverMathModule (copy), var12 (ref), var13 (ref), size100 (ref), var10 (ref)
		local var34 = p1[2]
		
		return UDim2.new(0, previewPopoverMathModule.getCenterOffsetX({
			ratio = p1[1],
			containerPosition = var34.position,
			containerWidth = var34.width,
			popoverWidth = p1[3],
			screenWidth = var12.X,
			insetLeft = var13.left,
			insetRight = var13.right,
			margin = size100
		}), 0, -var10.Size.Size_600)
	end)
	local createElement = reactModule.createElement
	local t = { tag = "size-full", ref = var19 }
	local t_1 = {}
	
	if var17 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(view, {
			tag = "col align-x-center gap-medium anchor-bottom-center auto-xy",
			ref = var20,
			Position = var25
		}, {
			VideoPreview = if controller == nil or not controller.getHasVideoPreview() then nil else reactModule.createElement(videoPreviewModule, {
				preview = var16,
				animationRatio = var11.animationRatio,
				LayoutOrder = var14()
			}),
			TimeLabel = reactModule.createElement(timeLabelModule, {
				progress = p0.progress,
				animationRatio = var11.animationRatio,
				LayoutOrder = var14()
			})
		})
	else
		createElement_1 = nil
	end
	t_1.MovingContainer = createElement_1
	
	return createElement(view, t, t_1)
end)