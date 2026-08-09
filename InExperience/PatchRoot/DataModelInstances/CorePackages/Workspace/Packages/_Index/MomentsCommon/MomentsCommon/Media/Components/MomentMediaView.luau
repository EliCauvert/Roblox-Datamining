local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local _ = require(momentsCommon.Media.MediaTypes)
local useMomentMediaControllerModule = require(momentsCommon.Media.Components.useMomentMediaController)
local useHasPresentedFrameModule = require(momentsCommon.Media.useHasPresentedFrame)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local useSignalState = signalsReactModule.useSignalState
local useSignalBinding = signalsReactModule.useSignalBinding
local frozen = table.freeze({})

return function(p0) --[[ line: 73 | named "MomentMediaView" ]]
	-- upvalues: useMomentMediaControllerModule (ref), reactModule (ref), signalsModule (ref), useSignalBinding (ref), useSignalState (ref), useHasPresentedFrameModule (ref), frozen (ref), view (ref), skeleton (ref), foundationModule (ref)
	local var8 = useMomentMediaControllerModule(p0.momentId)
	local var9 = useSignalBinding(p0.getScaleType or reactModule.useMemo(function() --[[ line: 80 ]]
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(Enum.ScaleType.Crop)
	end, {}))
	local var10 = reactModule.useMemo(function() --[[ line: 87 ]]
		-- upvalues: signalsModule (copy)
		local var19, var20 = signalsModule.createSignal(Vector2.zero)
		
		return { get = var19, set = var20 }
	end, {})
	local var11 = reactModule.useCallback(function(p1) --[[ line: 92 ]]
		-- upvalues: var10 (ref)
		var10.set(p1.AbsoluteSize)
	end, { var10 })
	local var12 = p0.suppressTapToToggle == true
	local var13 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var8 (ref)
		if var8 ~= nil then
			var8.toggle()
		end
	end, { var8 })
	local var14 = useSignalState(reactModule.useMemo(function() --[[ line: 110 ]]
		-- upvalues: signalsModule (copy), var8 (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 111 ]]
			-- upvalues: var8 (copy)
			return if var8 == nil then "Idle" else var8.getState(p2).readiness
		end)
	end, { var8 }))
	local var15 = if p0.holdPosterUntilPlaying then not useHasPresentedFrameModule(var8, p0.holdPosterUntilPlaying) else not (var14 == "Ready")
	local var16 = useSignalState(reactModule.useMemo(function() --[[ line: 128 ]]
		-- upvalues: signalsModule (copy), var8 (ref), frozen (copy)
		return signalsModule.createComputed(function(p3) --[[ line: 129 ]]
			-- upvalues: var8 (copy), frozen (copy)
			return if var8 == nil then frozen else var8.getVisualLayers(p3)
		end)
	end, { var8 }))
	local cloned = table.clone(reactModule.useMemo(function() --[[ line: 141 ]]
		-- upvalues: var8 (ref), var16 (ref), var10 (ref), var9 (ref), reactModule (copy), view (copy)
		local t = {}
		
		if var8 ~= nil then
			for i, v in var16 do
				local id = v.id
				t[`layer_{id}`] = reactModule.createElement(view, { tag = "size-full", ZIndex = v.zIndex + 2 }, {
					Surface = v.render({
						getItemSize = var10.get,
						getPlaybackPosition = var8.getPosition,
						getResolution = function(p4) --[[ line: 149 ]]
							-- upvalues: var8 (copy)
							return var8.getState(p4).resolution
						end,
						setSurface = function(value) --[[ line: 152 ]]
							-- upvalues: var8 (copy), id (ref)
							var8.setSurface(id, value)
						end,
						scaleType = var9
					})
				})
			end
		end
		return t
	end, { var8, var16, var10, var9 }))
	
	if p0.showLoadingSkeleton == true and var14 ~= "Ready" then
		cloned.LoadingSkeleton = reactModule.createElement(view, { tag = "size-full", ZIndex = 100 }, {
			Shimmer = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
		})
	elseif p0.posterContent ~= nil then
		cloned.Poster = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.fromScale(1, 1),
			ScaleType = var9,
			ImageContent = p0.posterContent,
			Visible = var15
		}, {
			Corner = if p0.cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) })
		})
	end
	local var18 = var8 ~= nil and not var12
	
	return reactModule.createElement(view, {
		tag = p0.tag or "size-full clip",
		LayoutOrder = p0.LayoutOrder,
		onActivated = if var18 then var13 else nil,
		stateLayer = if var18 then {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		} else nil,
		onAbsoluteSizeChanged = var11
	}, cloned)
end