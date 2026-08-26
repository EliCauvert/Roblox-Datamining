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

return function(p1)
	-- upvalues: reactModule (ref), loadingStateModule (ref), contentProviderService (ref), view (ref), getFitSizeModule (ref), getCropSizeModule (ref), fFlagUseRbxStorageInCapturesCommonModule (ref), skeleton (ref)
	local var1, var2 = reactModule.useState(Vector2.new(0, 0))
	local var3, var4 = reactModule.useState(loadingStateModule.Loading)
	local var5, var6 = reactModule.useState(Vector2.new(0, 0))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), contentProviderService (copy), var4 (ref), loadingStateModule (copy)
		if p1.Video == nil or p1.Video == "" then
			return
		end
		local var7 = contentProviderService:GetAssetFetchStatusChangedSignal(p1.Video):Connect(function(p2)
			-- upvalues: var4 (copy), loadingStateModule (copy)
			if p2 == Enum.AssetFetchStatus.Failure then
				var4(loadingStateModule.Failed)
			end
		end)
		
		return function()
			-- upvalues: var7 (ref), var4 (copy), loadingStateModule (copy)
			var7:Disconnect()
			var4(loadingStateModule.Loading)
		end
	end, { p1.Video })
	
	return if var3 == loadingStateModule.Failed then p1.renderOnFailed() else reactModule.createElement(view, {
		ClipsDescendants = true,
		isDisabled = true,
		AnchorPoint = p1.AnchorPoint,
		BackgroundTransparency = p1.BackgroundTransparency,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref)
			var2(p2.AbsoluteSize)
		end, { var2 }),
		Position = p1.Position,
		Size = p1.Size,
		ZIndex = p1.ZIndex
	}, {
		VideoFrame = reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Looped = p1.Looped ~= nil or p1.Looped,
			Playing = p1.Playing,
			Position = UDim2.fromScale(0.5, 0.5),
			ref = p1.videoRef,
			Size = if p1.scaleType == Enum.ScaleType.Fit then getFitSizeModule(var1, var5) elseif p1.scaleType == Enum.ScaleType.Crop then getCropSizeModule(var1, var5) else UDim2.fromScale(1, 1),
			Video = p1.Video,
			VideoContent = if fFlagUseRbxStorageInCapturesCommonModule then p1.VideoContent else nil,
			Visible = var5.X > 0 and var5.Y > 0,
			[reactModule.Change.Resolution] = reactModule.useCallback(function(p2)
				-- upvalues: var6 (ref), p1 (ref)
				local resolution = p2.Resolution
				var6(resolution)
				
				if p1.onResolutionChanged then
					p1.onResolutionChanged(resolution)
				end
			end, { p1.onResolutionChanged, var6 }),
			[reactModule.Event.Loaded] = reactModule.useCallback(function(p2)
				-- upvalues: var3 (ref), loadingStateModule (copy), var4 (ref), p1 (ref)
				if var3 == loadingStateModule.Loading then
					var4(loadingStateModule.Finished)
				end
				p1.onLoaded(p2)
			end, { var3, p1.onLoaded })
		}, {
			Corner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
		}),
		Shimmer = if var3 ~= loadingStateModule.Finished then nil else reactModule.createElement(skeleton, { ZIndex = 2, Size = UDim2.fromScale(1, 1) })
	})
end