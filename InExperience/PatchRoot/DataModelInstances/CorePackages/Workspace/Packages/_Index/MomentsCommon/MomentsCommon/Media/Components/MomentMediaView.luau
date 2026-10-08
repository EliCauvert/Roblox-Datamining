local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local _ = require(momentsCommon.Media.MediaTypes)
local mediaSurfaceContextModule = require(momentsCommon.Media.Components.MediaSurfaceContext)
local useMomentMediaControllerModule = require(momentsCommon.Media.Components.useMomentMediaController)
local useHasPresentedFrameModule = require(momentsCommon.Media.useHasPresentedFrame)
local getSmartFillScaleTypeModule = require(momentsCommon.Utils.getSmartFillScaleType)
local fFlagMomentsTextOverlayAfterVideoLoadedModule = require(momentsCommon.Flags.FFlagMomentsTextOverlayAfterVideoLoaded)
local fFlagMomentsSmartVideoFillModule = require(momentsCommon.Flags.FFlagMomentsSmartVideoFill)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local useSignalState = signalsReactModule.useSignalState
local useSignalBinding = signalsReactModule.useSignalBinding
local frozen = table.freeze({})

return function(p1)
	-- upvalues: useMomentMediaControllerModule (ref), reactModule (ref), signalsModule (ref), mediaSurfaceContextModule (ref), fFlagMomentsSmartVideoFillModule (ref), getSmartFillScaleTypeModule (ref), useSignalBinding (ref), useSignalState (ref), fFlagMomentsTextOverlayAfterVideoLoadedModule (ref), useHasPresentedFrameModule (ref), frozen (ref), view (ref), skeleton (ref), foundationModule (ref)
	local var1 = useMomentMediaControllerModule(p1.momentId)
	local getScaleType = p1.getScaleType or reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(Enum.ScaleType.Crop)
	end, {})
	local cornerRadius = reactModule.useContext(mediaSurfaceContextModule).cornerRadius
	local var2 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local var3, var4 = signalsModule.createSignal(Vector2.zero)
		
		return { get = var3, set = var4 }
	end, {})
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2.set(p2.AbsoluteSize)
	end, { var2 })
	
	if fFlagMomentsSmartVideoFillModule then
		local var4 = getScaleType
		getScaleType = reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var4 (ref), var1 (ref), getSmartFillScaleTypeModule (copy), var2 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var4 (copy), var1 (copy), getSmartFillScaleTypeModule (copy), var2 (copy)
				local var5 = var4(p2)
				
				return if var1 == nil then var5 else getSmartFillScaleTypeModule(var5, var2.get(p2), var1.getState(p2).resolution)
			end)
		end, { var4, var1 or false, var2 })
	end
	local var5 = useSignalBinding(getScaleType)
	local var6 = p1.suppressTapToToggle == true
	local var7 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		if var1 ~= nil then
			var1.toggle()
		end
	end, { var1 })
	local var8 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy)
			return if var1 == nil then "Idle" else var1.getState(p2).readiness
		end)
	end, { var1 })
	local var9 = useSignalState(var8)
	local isReady = var9 == "Ready"
	local var10 = nil
	
	if fFlagMomentsTextOverlayAfterVideoLoadedModule then
		local var11 = var1 ~= nil and var1.getHasVideoPreview()
		var10 = useSignalBinding(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var11 (ref), var8 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var11 (copy), var8 (copy)
				return not var11 or var8(p2) == "Ready"
			end)
		end, { var11, var8 }))
	end
	local var12 = if p1.holdPosterUntilPlaying then not useHasPresentedFrameModule(var1, p1.holdPosterUntilPlaying) else not isReady
	local var13 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref), frozen (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), frozen (copy)
			return if var1 == nil then frozen else var1.getVisualLayers(p2)
		end)
	end, { var1 }))
	local cloned = table.clone(reactModule.useMemo(function()
		-- upvalues: var1 (ref), var13 (ref), var2 (ref), var5 (ref), getScaleType (write), cornerRadius (ref), reactModule (copy), view (copy), fFlagMomentsTextOverlayAfterVideoLoadedModule (copy), var10 (write)
		local t = {}
		
		if var1 ~= nil then
			for i, v in var13 do
				local id = v.id
				t[`layer_{id}`] = reactModule.createElement(view, {
					tag = "size-full",
					Visible = if fFlagMomentsTextOverlayAfterVideoLoadedModule and string.sub(id, 1, 5) == "text:" then var10 else nil,
					ZIndex = v.zIndex + 2
				}, {
					Surface = v.render({
						getItemSize = var2.get,
						getPlaybackPosition = var1.getPosition,
						getResolution = function(p2)
							-- upvalues: var1 (copy)
							return var1.getState(p2).resolution
						end,
						setSurface = function(value)
							-- upvalues: var1 (copy), id (ref)
							var1.setSurface(id, value)
						end,
						scaleType = var5,
						getScaleType = getScaleType,
						cornerRadius = cornerRadius
					})
				})
			end
		end
		return t
	end, {
		var1, var13, var2, var5, getScaleType, cornerRadius or false,
		if fFlagMomentsTextOverlayAfterVideoLoadedModule then var10 else nil
	}))
	
	if p1.showLoadingSkeleton == true and var9 ~= "Ready" then
		cloned.LoadingSkeleton = reactModule.createElement(view, { tag = "size-full", ZIndex = 100 }, {
			Shimmer = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
		})
	elseif p1.posterContent ~= nil then
		cloned.Poster = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.fromScale(1, 1),
			ScaleType = var5,
			ImageContent = p1.posterContent,
			Visible = var12
		}, {
			Corner = if p1.cornerRadius ~= nil then if cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = cornerRadius }) else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) })
		})
	end
	local var14 = var1 ~= nil and not var6
	
	return reactModule.createElement(view, {
		tag = p1.tag or "size-full clip",
		LayoutOrder = p1.LayoutOrder,
		onActivated = if var14 then var7 else nil,
		stateLayer = if var14 then {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		} else nil,
		onAbsoluteSizeChanged = var3
	}, cloned)
end