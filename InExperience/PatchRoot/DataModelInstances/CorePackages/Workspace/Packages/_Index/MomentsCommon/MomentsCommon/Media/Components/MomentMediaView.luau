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

return function(p1)
	-- upvalues: useMomentMediaControllerModule (ref), reactModule (ref), signalsModule (ref), useSignalBinding (ref), useSignalState (ref), fFlagMomentsTextOverlayAfterVideoLoadedModule (ref), useHasPresentedFrameModule (ref), frozen (ref), view (ref), skeleton (ref), foundationModule (ref)
	local var1 = useMomentMediaControllerModule(p1.momentId)
	local getScaleType = p1.getScaleType or reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(Enum.ScaleType.Crop)
	end, {})
	local var2 = useSignalBinding(getScaleType)
	local var3 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local var4, var5 = signalsModule.createSignal(Vector2.zero)
		
		return { get = var4, set = var5 }
	end, {})
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3.set(p2.AbsoluteSize)
	end, { var3 })
	local var5 = p1.suppressTapToToggle == true
	local var6 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		if var1 ~= nil then
			var1.toggle()
		end
	end, { var1 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy)
			return if var1 == nil then "Idle" else var1.getState(p2).readiness
		end)
	end, { var1 })
	local var8 = useSignalState(var7)
	local isReady = var8 == "Ready"
	local var9 = nil
	
	if fFlagMomentsTextOverlayAfterVideoLoadedModule then
		local var10 = var1 ~= nil and var1.getHasVideoPreview()
		var9 = useSignalBinding(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var10 (ref), var7 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var10 (copy), var7 (copy)
				return not var10 or var7(p2) == "Ready"
			end)
		end, { var10, var7 }))
	end
	local var11 = if p1.holdPosterUntilPlaying then not useHasPresentedFrameModule(var1, p1.holdPosterUntilPlaying) else not isReady
	local var12 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref), frozen (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), frozen (copy)
			return if var1 == nil then frozen else var1.getVisualLayers(p2)
		end)
	end, { var1 }))
	local cloned = table.clone(reactModule.useMemo(function()
		-- upvalues: var1 (ref), var12 (ref), var3 (ref), var2 (ref), getScaleType (ref), reactModule (copy), view (copy), fFlagMomentsTextOverlayAfterVideoLoadedModule (copy), var9 (write)
		local t = {}
		
		if var1 ~= nil then
			for i, v in var12 do
				local id = v.id
				t[`layer_{id}`] = reactModule.createElement(view, {
					tag = "size-full",
					Visible = if fFlagMomentsTextOverlayAfterVideoLoadedModule and string.sub(id, 1, 5) == "text:" then var9 else nil,
					ZIndex = v.zIndex + 2
				}, {
					Surface = v.render({
						getItemSize = var3.get,
						getPlaybackPosition = var1.getPosition,
						getResolution = function(p2)
							-- upvalues: var1 (copy)
							return var1.getState(p2).resolution
						end,
						setSurface = function(value)
							-- upvalues: var1 (copy), id (ref)
							var1.setSurface(id, value)
						end,
						scaleType = var2,
						getScaleType = getScaleType
					})
				})
			end
		end
		return t
	end, {
		var1, var12, var3, var2, getScaleType,
		if fFlagMomentsTextOverlayAfterVideoLoadedModule then var9 else nil
	}))
	
	if p1.showLoadingSkeleton == true and var8 ~= "Ready" then
		cloned.LoadingSkeleton = reactModule.createElement(view, { tag = "size-full", ZIndex = 100 }, {
			Shimmer = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
		})
	elseif p1.posterContent ~= nil then
		cloned.Poster = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.fromScale(1, 1),
			ScaleType = var2,
			ImageContent = p1.posterContent,
			Visible = var11
		}, {
			Corner = if p1.cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) })
		})
	end
	local var13 = var1 ~= nil and not var5
	
	return reactModule.createElement(view, {
		tag = p1.tag or "size-full clip",
		LayoutOrder = p1.LayoutOrder,
		onActivated = if var13 then var6 else nil,
		stateLayer = if var13 then {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		} else nil,
		onAbsoluteSizeChanged = var4
	}, cloned)
end