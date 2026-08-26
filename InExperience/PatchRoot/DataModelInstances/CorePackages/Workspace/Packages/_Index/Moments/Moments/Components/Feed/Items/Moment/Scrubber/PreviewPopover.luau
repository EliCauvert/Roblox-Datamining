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

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), momentContextModule (ref), useScreenSize (ref), useDeviceInsets (ref), reactUtilsModule (ref), useSignalState (ref), reactModule (ref), useVideoScrubPreviewModule (ref), SCRUB_FADE_SECONDS (ref), previewPopoverMathModule (ref), view (ref), videoPreviewModule (ref), timeLabelModule (ref)
	local createElement_1
	local var1 = useTokens()
	local var2 = momentContextModule.useMoment()
	local var3 = useScreenSize()
	local var4 = useDeviceInsets()
	local var5 = reactUtilsModule.createNextOrder()
	local controller = var2.controller
	local var6 = useSignalState(var2.store.getIsScrubbing)
	local var7 = useVideoScrubPreviewModule(reactModule.useMemo(function()
		-- upvalues: controller (ref)
		return if controller == nil then nil else controller.getVideoPreviewSource()
	end, { controller }), var6, var2.store.getScrubPosition)
	local var8, var9 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var9 (ref), SCRUB_FADE_SECONDS (copy)
		if var6 then
			var9(true)
			
			return
		end
		local var10 = false
		task.delay(SCRUB_FADE_SECONDS, function()
			-- upvalues: var10 (write), var9 (copy)
			if not var10 then
				var9(false)
			end
		end)
		
		return function()
			-- upvalues: var10 (write)
			var10 = true
		end
	end, { var6 })
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12, var13 = reactModule.useBinding({ position = 0, width = 0 })
	local var14, var15 = reactModule.useBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var13 (ref)
		local current = var10.current
		
		if current == nil then
			return
		end
		local function update()
			-- upvalues: var13 (copy), current (ref)
			var13({
				position = current.AbsolutePosition.X,
				width = current.AbsoluteSize.X
			})
		end
		
		var13({
			position = current.AbsolutePosition.X,
			width = current.AbsoluteSize.X
		})
		local var16 = current:GetPropertyChangedSignal("AbsolutePosition"):Connect(update)
		local var17 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function()
			-- upvalues: var16 (ref), var17 (ref)
			var16:Disconnect()
			var17:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var15 (ref)
		local current = var11.current
		
		if current == nil then
			return
		end
		local function update()
			-- upvalues: var15 (copy), current (ref)
			var15(current.AbsoluteSize.X)
		end
		
		var15(current.AbsoluteSize.X)
		local var16 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function()
			-- upvalues: var16 (ref)
			var16:Disconnect()
		end
	end, { var8 })
	local size100 = var1.Size.Size_100
	local var16 = reactModule.joinBindings({ p1.progressRatio, var12, var14 }):map(function(p2)
		-- upvalues: previewPopoverMathModule (copy), var3 (ref), var4 (ref), size100 (ref), var1 (ref)
		local var17 = p2[2]
		
		return UDim2.new(0, previewPopoverMathModule.getCenterOffsetX({
			ratio = p2[1],
			containerPosition = var17.position,
			containerWidth = var17.width,
			popoverWidth = p2[3],
			screenWidth = var3.X,
			insetLeft = var4.left,
			insetRight = var4.right,
			margin = size100
		}), 0, -var1.Size.Size_600)
	end)
	local createElement = reactModule.createElement
	local t = { tag = "size-full", ref = var10 }
	local t_1 = {}
	
	if var8 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(view, {
			tag = "col align-x-center gap-medium anchor-bottom-center auto-xy",
			ref = var11,
			Position = var16
		}, {
			VideoPreview = if controller == nil or not controller.getHasVideoPreview() then nil else reactModule.createElement(videoPreviewModule, {
				preview = var7,
				animationRatio = var2.animationRatio,
				LayoutOrder = var5()
			}),
			TimeLabel = reactModule.createElement(timeLabelModule, {
				progress = p1.progress,
				animationRatio = var2.animationRatio,
				LayoutOrder = var5()
			})
		})
	else
		createElement_1 = nil
	end
	t_1.MovingContainer = createElement_1
	
	return createElement(view, t, t_1)
end)