local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local MomentsCommonModule = require(Parent.MomentsCommon)
local PreviewPopoverMathModule = require(script.Parent.previewPopoverMath)
local _ = require(script.Parent.Parent.Hooks.useMomentProgress)
local UseVideoScrubPreviewModule = require(script.Parent.useVideoScrubPreview)
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local TimeLabelModule = require(script.Parent.TimeLabel)
local VideoPreviewModule = require(script.Parent.VideoPreview)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScreenSizeFunction = MomentsCommonModule.Hooks.useScreenSize
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local SCRUBFADESECONDS = MomentContextModule.SCRUB_FADE_SECONDS

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), MomentContextModule (copy), UseScreenSizeFunction (copy), UseDeviceInsetsFunction (copy), ReactUtilsModule (copy), UseSignalStateFunction (copy), ReactModule (copy), UseVideoScrubPreviewModule (copy), SCRUBFADESECONDS (copy), PreviewPopoverMathModule (copy), View (copy), VideoPreviewModule (copy), TimeLabelModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMomentResult = MomentContextModule.useMoment()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local NextOrder = ReactUtilsModule.createNextOrder()
	local Controller = UseMomentResult.controller
	local UseSignalStateResult = UseSignalStateFunction(UseMomentResult.store.getIsScrubbing)
	local UseVideoScrubPreviewModuleResult = UseVideoScrubPreviewModule(ReactModule.useMemo(function()
		-- upvalues: Controller (copy)
		return if Controller == nil then nil else Controller.getVideoPreviewSource()
	end, { Controller }), UseSignalStateResult, UseMomentResult.store.getScrubPosition)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseStateResult2 (copy), SCRUBFADESECONDS (upval)
		if UseSignalStateResult then
			UseStateResult2(true)
			
			return
		end
		local Flag = false
		task.delay(SCRUBFADESECONDS, function()
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if not Flag then
				UseStateResult2(false)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { UseSignalStateResult })
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding({ position = 0, width = 0 })
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseBindingResult2 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local function update()
			-- upvalues: UseBindingResult2 (upval), Current (copy)
			UseBindingResult2({
				position = Current.AbsolutePosition.X,
				width = Current.AbsoluteSize.X
			})
		end
		
		UseBindingResult2({
			position = Current.AbsolutePosition.X,
			width = Current.AbsoluteSize.X
		})
		local Connection = Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(update)
		local Connection1 = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseBindingResult2_1 (copy)
		local Current = UseRefResult1.current
		
		if Current == nil then return end
		local function update()
			-- upvalues: UseBindingResult2_1 (upval), Current (copy)
			UseBindingResult2_1(Current.AbsoluteSize.X)
		end
		
		UseBindingResult2_1(Current.AbsoluteSize.X)
		local Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseStateResult })
	local Size100 = UseTokensResult.Size.Size_100
	local MapResult = ReactModule.joinBindings({ p1.progressRatio, UseBindingResult, UseBindingResult1 }):map(function(Entry): UDim2
		-- upvalues: PreviewPopoverMathModule (upval), UseScreenSizeResult (copy), UseDeviceInsetsResult (copy), Size100 (copy), UseTokensResult (copy)
		local Entry1 = Entry[2]
		
		return UDim2.new(0, PreviewPopoverMathModule.getCenterOffsetX({
			ratio = Entry[1],
			containerPosition = Entry1.position,
			containerWidth = Entry1.width,
			popoverWidth = Entry[3],
			screenWidth = UseScreenSizeResult.X,
			insetLeft = UseDeviceInsetsResult.left,
			insetRight = UseDeviceInsetsResult.right,
			margin = Size100
		}), 0, -UseTokensResult.Size.Size_600)
	end)
	
	return ReactModule.createElement(View, { tag = "size-full", ref = UseRefResult }, {
		MovingContainer = if UseStateResult then ReactModule.createElement(View, {
			tag = "col align-x-center gap-medium anchor-bottom-center auto-xy",
			ref = UseRefResult1,
			Position = MapResult
		}, {
			VideoPreview = if Controller == nil or not Controller.getHasVideoPreview() then nil else ReactModule.createElement(VideoPreviewModule, {
				preview = UseVideoScrubPreviewModuleResult,
				animationRatio = UseMomentResult.animationRatio,
				LayoutOrder = NextOrder()
			}),
			TimeLabel = ReactModule.createElement(TimeLabelModule, {
				progress = p1.progress,
				animationRatio = UseMomentResult.animationRatio,
				LayoutOrder = NextOrder()
			})
		}) else nil
	})
end)