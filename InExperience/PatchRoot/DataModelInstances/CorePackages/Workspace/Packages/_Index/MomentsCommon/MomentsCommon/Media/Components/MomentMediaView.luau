local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local _ = require(momentsCommon.Media.MediaTypes)
local useMomentMediaControllerModule = require(momentsCommon.Media.Components.useMomentMediaController)
local useHasPresentedFrameModule = require(momentsCommon.Media.useHasPresentedFrame)
local fFlagMomentsTextOverlayAfterVideoLoadedModule = require(momentsCommon.Flags.FFlagMomentsTextOverlayAfterVideoLoaded)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local useSignalState = signalsReactModule.useSignalState
local useSignalBinding = signalsReactModule.useSignalBinding
local frozen = table.freeze({})

return function(p0) --[[ line: 75 | named "MomentMediaView" ]]
	-- upvalues: useMomentMediaControllerModule (ref), reactModule (ref), signalsModule (ref), useSignalBinding (ref), useSignalState (ref), fFlagMomentsTextOverlayAfterVideoLoadedModule (ref), useHasPresentedFrameModule (ref), frozen (ref), view (ref), skeleton (ref), foundationModule (ref)
	local var9 = useMomentMediaControllerModule(p0.momentId)
	local getScaleType = p0.getScaleType or reactModule.useMemo(function() --[[ line: 82 ]]
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(Enum.ScaleType.Crop)
	end, {})
	local var11 = useSignalBinding(getScaleType)
	local var12 = reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: signalsModule (copy)
		local var25, var26 = signalsModule.createSignal(Vector2.zero)
		
		return { get = var25, set = var26 }
	end, {})
	local var13 = reactModule.useCallback(function(p1) --[[ line: 98 ]]
		-- upvalues: var12 (ref)
		var12.set(p1.AbsoluteSize)
	end, { var12 })
	local var14 = p0.suppressTapToToggle == true
	local var15 = reactModule.useCallback(function() --[[ line: 107 ]]
		-- upvalues: var9 (ref)
		if var9 ~= nil then
			var9.toggle()
		end
	end, { var9 })
	local var16 = reactModule.useMemo(function() --[[ line: 116 ]]
		-- upvalues: signalsModule (copy), var9 (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 117 ]]
			-- upvalues: var9 (copy)
			return if var9 == nil then "Idle" else var9.getState(p2).readiness
		end)
	end, { var9 })
	local var17 = useSignalState(var16)
	local isReady = var17 == "Ready"
	local var19 = nil
	
	if fFlagMomentsTextOverlayAfterVideoLoadedModule then
		local var20 = var9 ~= nil and var9.getHasVideoPreview()
		var19 = useSignalBinding(reactModule.useMemo(function() --[[ line: 129 ]]
			-- upvalues: signalsModule (copy), var20 (ref), var16 (ref)
			return signalsModule.createComputed(function(p3) --[[ line: 130 ]]
				-- upvalues: var20 (copy), var16 (copy)
				return not var20 or var16(p3) == "Ready"
			end)
		end, { var20, var16 }))
	end
	local var21 = if p0.holdPosterUntilPlaying then not useHasPresentedFrameModule(var9, p0.holdPosterUntilPlaying) else not isReady
	local var22 = useSignalState(reactModule.useMemo(function() --[[ line: 144 ]]
		-- upvalues: signalsModule (copy), var9 (ref), frozen (copy)
		return signalsModule.createComputed(function(p4) --[[ line: 145 ]]
			-- upvalues: var9 (copy), frozen (copy)
			return if var9 == nil then frozen else var9.getVisualLayers(p4)
		end)
	end, { var9 }))
	local cloned = table.clone(reactModule.useMemo(function() --[[ line: 157 ]]
		-- upvalues: var9 (ref), var22 (ref), var12 (ref), var11 (ref), getScaleType (ref), reactModule (copy), view (copy), fFlagMomentsTextOverlayAfterVideoLoadedModule (copy), var19 (write)
		local t = {}
		
		if var9 ~= nil then
			for i, v in var22 do
				local id = v.id
				t[`layer_{id}`] = reactModule.createElement(view, {
					tag = "size-full",
					Visible = if fFlagMomentsTextOverlayAfterVideoLoadedModule and string.sub(id, 1, 5) == "text:" then var19 else nil,
					ZIndex = v.zIndex + 2
				}, {
					Surface = v.render({
						getItemSize = var12.get,
						getPlaybackPosition = var9.getPosition,
						getResolution = function(p5) --[[ line: 165 ]]
							-- upvalues: var9 (copy)
							return var9.getState(p5).resolution
						end,
						setSurface = function(value) --[[ line: 168 ]]
							-- upvalues: var9 (copy), id (ref)
							var9.setSurface(id, value)
						end,
						scaleType = var11,
						getScaleType = getScaleType
					})
				})
			end
		end
		return t
	end, {
		var9, var22, var12, var11, getScaleType,
		if fFlagMomentsTextOverlayAfterVideoLoadedModule then var19 else nil
	}))
	
	if p0.showLoadingSkeleton == true and var17 ~= "Ready" then
		cloned.LoadingSkeleton = reactModule.createElement(view, { tag = "size-full", ZIndex = 100 }, {
			Shimmer = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
		})
	elseif p0.posterContent ~= nil then
		cloned.Poster = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.fromScale(1, 1),
			ScaleType = var11,
			ImageContent = p0.posterContent,
			Visible = var21
		}, {
			Corner = if p0.cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) })
		})
	end
	local var24 = var9 ~= nil and not var14
	
	return reactModule.createElement(view, {
		tag = p0.tag or "size-full clip",
		LayoutOrder = p0.LayoutOrder,
		onActivated = if var24 then var15 else nil,
		stateLayer = if var24 then {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		} else nil,
		onAbsoluteSizeChanged = var13
	}, cloned)
end