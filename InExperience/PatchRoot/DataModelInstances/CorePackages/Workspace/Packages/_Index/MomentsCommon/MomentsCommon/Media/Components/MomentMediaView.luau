local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local _ = require(MomentsCommon.Media.MediaTypes)
local MediaSurfaceContextModule = require(MomentsCommon.Media.Components.MediaSurfaceContext)
local UseMomentMediaControllerModule = require(MomentsCommon.Media.Components.useMomentMediaController)
local UseHasPresentedFrameModule = require(MomentsCommon.Media.useHasPresentedFrame)
local GetSmartFillScaleTypeModule = require(MomentsCommon.Utils.getSmartFillScaleType)
local FFlagMomentsTextOverlayAfterVideoLoadedModule = require(MomentsCommon.Flags.FFlagMomentsTextOverlayAfterVideoLoaded)
local FFlagMomentsSmartVideoFillModule = require(MomentsCommon.Flags.FFlagMomentsSmartVideoFill)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local Frozen = table.freeze({})

return function(Frame)
	-- upvalues: UseMomentMediaControllerModule (copy), ReactModule (copy), SignalsModule (copy), MediaSurfaceContextModule (copy), FFlagMomentsSmartVideoFillModule (copy), GetSmartFillScaleTypeModule (copy), UseSignalBindingFunction (copy), UseSignalStateFunction (copy), FFlagMomentsTextOverlayAfterVideoLoadedModule (copy), UseHasPresentedFrameModule (copy), Frozen (copy), View (copy), Skeleton (copy), FoundationModule (copy)
	local UseMomentMediaControllerModuleResult = UseMomentMediaControllerModule(Frame.momentId)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		return (SignalsModule.createSignal(Enum.ScaleType.Crop))
	end, {})
	local GetScaleType = Frame.getScaleType or UseMemoResult
	local CornerRadius = ReactModule.useContext(MediaSurfaceContextModule).cornerRadius
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(Vector2.zero)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseMemoResult1 (copy)
		UseMemoResult1.set(Frame.AbsoluteSize)
	end, { UseMemoResult1 })
	
	if FFlagMomentsSmartVideoFillModule then
		local Callback = GetScaleType
		GetScaleType = ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), Callback (copy), UseMomentMediaControllerModuleResult (copy), GetSmartFillScaleTypeModule (upval), UseMemoResult1 (copy)
			return SignalsModule.createComputed(function(p1)
				-- upvalues: Callback (upval), UseMomentMediaControllerModuleResult (upval), GetSmartFillScaleTypeModule (upval), UseMemoResult1 (upval)
				local CallbackResult = Callback(p1)
				
				return if UseMomentMediaControllerModuleResult == nil then CallbackResult else GetSmartFillScaleTypeModule(CallbackResult, UseMemoResult1.get(p1), UseMomentMediaControllerModuleResult.getState(p1).resolution)
			end)
		end, {
			Callback,
			UseMomentMediaControllerModuleResult or false,
			UseMemoResult1
		})
	end
	local UseSignalBindingResult = UseSignalBindingFunction(GetScaleType)
	local IsSuppressTapToToggle = Frame.suppressTapToToggle == true
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseMomentMediaControllerModuleResult (copy)
		if UseMomentMediaControllerModuleResult ~= nil then
			UseMomentMediaControllerModuleResult.toggle()
		end
	end, { UseMomentMediaControllerModuleResult })
	local UseMemoResult11 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMomentMediaControllerModuleResult (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: UseMomentMediaControllerModuleResult (upval)
			return if UseMomentMediaControllerModuleResult == nil then "Idle" else UseMomentMediaControllerModuleResult.getState(p1).readiness
		end)
	end, { UseMomentMediaControllerModuleResult })
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult11)
	local IsReady = UseSignalStateResult == "Ready"
	local v1 = nil
	
	if FFlagMomentsTextOverlayAfterVideoLoadedModule then
		local HasVideoPreview = UseMomentMediaControllerModuleResult ~= nil and UseMomentMediaControllerModuleResult.getHasVideoPreview()
		v1 = UseSignalBindingFunction((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), HasVideoPreview (copy), UseMemoResult11 (copy)
			return SignalsModule.createComputed(function(p1): boolean
				-- upvalues: HasVideoPreview (upval), UseMemoResult11 (upval)
				return not HasVideoPreview or UseMemoResult11(p1) == "Ready"
			end)
		end, { HasVideoPreview, UseMemoResult11 })))
	end
	local UseHasPresentedFrameModuleResult = UseHasPresentedFrameModule(UseMomentMediaControllerModuleResult, Frame.holdPosterUntilPlaying)
	local NoUseHasPresentedFrameModuleResult: boolean = if Frame.holdPosterUntilPlaying then not UseHasPresentedFrameModuleResult else not IsReady
	local UseSignalStateResult1 = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMomentMediaControllerModuleResult (copy), Frozen (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: UseMomentMediaControllerModuleResult (upval), Frozen (upval)
			return if UseMomentMediaControllerModuleResult == nil then Frozen else UseMomentMediaControllerModuleResult.getVisualLayers(p1)
		end)
	end, { UseMomentMediaControllerModuleResult })))
	local Copy = table.clone((ReactModule.useMemo(function()
		-- upvalues: UseMomentMediaControllerModuleResult (copy), UseSignalStateResult1 (copy), UseMemoResult1 (copy), UseSignalBindingResult (copy), GetScaleType (ref), CornerRadius (copy), ReactModule (upval), View (upval), FFlagMomentsTextOverlayAfterVideoLoadedModule (upval), v1 (ref)
		local Elements = {}
		
		if UseMomentMediaControllerModuleResult ~= nil then
			for _, value in UseSignalStateResult1 do
				local Id: string = value.id
				Elements[`layer_{Id}`] = ReactModule.createElement(View, {
					tag = "size-full",
					Visible = if FFlagMomentsTextOverlayAfterVideoLoadedModule and string.sub(Id, 1, 5) == "text:" then v1 else nil,
					ZIndex = value.zIndex + 2
				}, {
					Surface = value.render({
						getItemSize = UseMemoResult1.get,
						getPlaybackPosition = UseMomentMediaControllerModuleResult.getPosition,
						getResolution = function(p1)
							-- upvalues: UseMomentMediaControllerModuleResult (upval)
							return UseMomentMediaControllerModuleResult.getState(p1).resolution
						end,
						setSurface = function(Id1)
							-- upvalues: UseMomentMediaControllerModuleResult (upval), Id (copy)
							UseMomentMediaControllerModuleResult.setSurface(Id, Id1)
						end,
						scaleType = UseSignalBindingResult,
						getScaleType = GetScaleType,
						cornerRadius = CornerRadius
					})
				})
			end
		end
		return Elements
	end, {
		UseMomentMediaControllerModuleResult, UseSignalStateResult1, UseMemoResult1,
		UseSignalBindingResult, GetScaleType, CornerRadius or false,
		if FFlagMomentsTextOverlayAfterVideoLoadedModule then v1 else nil
	})))
	
	if Frame.showLoadingSkeleton == true and UseSignalStateResult ~= "Ready" then
		Copy.LoadingSkeleton = ReactModule.createElement(View, { tag = "size-full", ZIndex = 100 }, {
			Shimmer = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1) })
		})
	elseif Frame.posterContent ~= nil then
		Copy.Poster = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.fromScale(1, 1),
			ScaleType = UseSignalBindingResult,
			ImageContent = Frame.posterContent,
			Visible = NoUseHasPresentedFrameModuleResult
		}, {
			Corner = if Frame.cornerRadius == nil then if CornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = CornerRadius }) else ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Frame.cornerRadius) })
		})
	end
	local NoIsSuppressTapToToggle: boolean = UseMomentMediaControllerModuleResult ~= nil and not IsSuppressTapToToggle
	
	return ReactModule.createElement(View, {
		tag = Frame.tag or "size-full clip",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = if NoIsSuppressTapToToggle then UseResult1 else nil,
		stateLayer = if NoIsSuppressTapToToggle then {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		} else nil,
		onAbsoluteSizeChanged = UseResult
	}, Copy)
end