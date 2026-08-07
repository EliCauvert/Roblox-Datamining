local parent = script.Parent.Parent
local parent_1 = parent.Parent
local contentProviderService = game:GetService("ContentProvider")
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local getCropSizeModule = require(parent.Utils.getCropSize)
local getFitSizeModule = require(parent.Utils.getFitSize)
local loadingStateModule = require(parent.Enums.LoadingState)
local fFlagUseRbxStorageInCapturesCommonModule = require(parent.Flags.FFlagUseRbxStorageInCapturesCommon)

return function(p0) --[[ line: 36 ]]
	-- upvalues: reactModule (ref), loadingStateModule (ref), contentProviderService (ref), view (ref), getFitSizeModule (ref), getCropSizeModule (ref), fFlagUseRbxStorageInCapturesCommonModule (ref), skeleton (ref)
	local var7, var8 = reactModule.useState(Vector2.new(0, 0))
	local var9, var10 = reactModule.useState(loadingStateModule.Loading)
	local var11, var12 = reactModule.useState(Vector2.new(0, 0))
	reactModule.useEffect(function() --[[ line: 41 ]]
		-- upvalues: p0 (ref), contentProviderService (copy), var10 (ref), loadingStateModule (copy)
		if p0.Video == nil or p0.Video == "" then
			return
		end
		local var13 = contentProviderService:GetAssetFetchStatusChangedSignal(p0.Video):Connect(function(p1) --[[ line: 47 ]]
			-- upvalues: var10 (copy), loadingStateModule (copy)
			if p1 == Enum.AssetFetchStatus.Failure then
				var10(loadingStateModule.Failed)
			end
		end)
		
		return function() --[[ line: 53 ]]
			-- upvalues: var13 (ref), var10 (copy), loadingStateModule (copy)
			var13:Disconnect()
			var10(loadingStateModule.Loading)
		end
	end, { p0.Video })
	
	return if var9 == loadingStateModule.Failed then p0.renderOnFailed() else reactModule.createElement(view, {
		ClipsDescendants = true,
		isDisabled = true,
		AnchorPoint = p0.AnchorPoint,
		BackgroundTransparency = p0.BackgroundTransparency,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2) --[[ line: 59 ]]
			-- upvalues: var8 (ref)
			var8(p2.AbsoluteSize)
		end, { var8 }),
		Position = p0.Position,
		Size = p0.Size,
		ZIndex = p0.ZIndex
	}, {
		VideoFrame = reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Looped = p0.Looped ~= nil or p0.Looped,
			Playing = p0.Playing,
			Position = UDim2.fromScale(0.5, 0.5),
			ref = p0.videoRef,
			Size = if p0.scaleType == Enum.ScaleType.Fit then getFitSizeModule(var7, var11) elseif p0.scaleType == Enum.ScaleType.Crop then getCropSizeModule(var7, var11) else UDim2.fromScale(1, 1),
			Video = p0.Video,
			VideoContent = if fFlagUseRbxStorageInCapturesCommonModule then p0.VideoContent else nil,
			Visible = var11.X > 0 and var11.Y > 0,
			[reactModule.Change.Resolution] = reactModule.useCallback(function(p3) --[[ line: 63 ]]
				-- upvalues: var12 (ref), p0 (ref)
				local resolution = p3.Resolution
				var12(resolution)
				
				if p0.onResolutionChanged then
					p0.onResolutionChanged(resolution)
				end
			end, { p0.onResolutionChanged, var12 }),
			[reactModule.Event.Loaded] = reactModule.useCallback(function(p4) --[[ line: 72 ]]
				-- upvalues: var9 (ref), loadingStateModule (copy), var10 (ref), p0 (ref)
				if var9 == loadingStateModule.Loading then
					var10(loadingStateModule.Finished)
				end
				p0.onLoaded(p4)
			end, { var9, p0.onLoaded })
		}, {
			Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil
		}),
		Shimmer = if var9 ~= loadingStateModule.Finished then nil else reactModule.createElement(skeleton, { ZIndex = 2, Size = UDim2.fromScale(1, 1) })
	})
end