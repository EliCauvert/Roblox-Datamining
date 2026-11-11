local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local _ = require(MomentsCommon.Media.MediaTypes)
local UseMomentMediaControllerModule = require(MomentsCommon.Media.Components.useMomentMediaController)
local UseHasPresentedFrameModule = require(MomentsCommon.Media.useHasPresentedFrame)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local Frozen = table.freeze({})

return function(Frame)
	-- upvalues: UseMomentMediaControllerModule (copy), ReactModule (copy), SignalsModule (copy), UseSignalBindingFunction (copy), UseSignalStateFunction (copy), UseHasPresentedFrameModule (copy), Frozen (copy), View (copy), Skeleton (copy), FoundationModule (copy)
	local UseMomentMediaControllerModuleResult = UseMomentMediaControllerModule(Frame.momentId)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		return (SignalsModule.createSignal(Enum.ScaleType.Crop))
	end, {})
	local GetScaleType = Frame.getScaleType or UseMemoResult
	local UseSignalBindingResult = UseSignalBindingFunction(GetScaleType)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(Vector2.zero)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseMemoResult1 (copy)
		UseMemoResult1.set(Frame.AbsoluteSize)
	end, { UseMemoResult1 })
	local IsSuppressTapToToggle = Frame.suppressTapToToggle == true
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseMomentMediaControllerModuleResult (copy)
		if UseMomentMediaControllerModuleResult ~= nil then
			UseMomentMediaControllerModuleResult.toggle()
		end
	end, { UseMomentMediaControllerModuleResult })
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMomentMediaControllerModuleResult (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: UseMomentMediaControllerModuleResult (upval)
			return if UseMomentMediaControllerModuleResult == nil then "Idle" else UseMomentMediaControllerModuleResult.getState(p1).readiness
		end)
	end, { UseMomentMediaControllerModuleResult })))
	local IsReady = UseSignalStateResult == "Ready"
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
		-- upvalues: UseMomentMediaControllerModuleResult (copy), UseSignalStateResult1 (copy), UseMemoResult1 (copy), UseSignalBindingResult (copy), GetScaleType (copy), ReactModule (upval), View (upval)
		local Elements = {}
		
		if UseMomentMediaControllerModuleResult ~= nil then
			for _, value in UseSignalStateResult1 do
				local Id = value.id
				Elements[`layer_{Id}`] = ReactModule.createElement(View, { tag = "size-full", ZIndex = value.zIndex + 2 }, {
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
						getScaleType = GetScaleType
					})
				})
			end
		end
		return Elements
	end, {
		UseMomentMediaControllerModuleResult,
		UseSignalStateResult1,
		UseMemoResult1,
		UseSignalBindingResult,
		GetScaleType
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
			Corner = if Frame.cornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Frame.cornerRadius) })
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