local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local contentProviderService = game:GetService("ContentProvider")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local loadingState = require(profilePlatform.Common.Enums).LoadingState

return function(p0) --[[ line: 28 ]]
	-- upvalues: reactModule (ref), loadingState (ref), contentProviderService (ref), view (ref), skeleton (ref)
	local var4, var5 = reactModule.useState(loadingState.Loading)
	local var6, var7 = reactModule.useState(Vector2.new(0, 0))
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: p0 (ref), contentProviderService (copy), var5 (ref), loadingState (copy)
		if p0.Video == nil or p0.Video == "" then
			return
		end
		local var8 = contentProviderService:GetAssetFetchStatusChangedSignal(p0.Video):Connect(function(p1) --[[ line: 38 ]]
			-- upvalues: var5 (copy), loadingState (copy)
			if p1 == Enum.AssetFetchStatus.Failure then
				var5(loadingState.Failed)
			end
		end)
		
		return function() --[[ line: 44 ]]
			-- upvalues: var8 (ref), var5 (copy), loadingState (copy)
			var8:Disconnect()
			var5(loadingState.Loading)
		end
	end, { p0.Video })
	
	return if var4 == loadingState.Failed then p0.renderOnFailed() else reactModule.createElement(view, {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		isDisabled = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
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
			Size = UDim2.fromScale(1, 1),
			Video = p0.Video,
			Visible = var6.X > 0 and var6.Y > 0,
			[reactModule.Change.Resolution] = reactModule.useCallback(function(p2) --[[ line: 50 ]]
				-- upvalues: var7 (ref), p0 (ref)
				local resolution = p2.Resolution
				var7(resolution)
				
				if p0.onResolutionChanged then
					p0.onResolutionChanged(resolution)
				end
			end, { p0.onResolutionChanged, var7 }),
			[reactModule.Event.Loaded] = reactModule.useCallback(function(p3) --[[ line: 59 ]]
				-- upvalues: var4 (ref), loadingState (copy), var5 (ref), p0 (ref)
				if var4 == loadingState.Loading then
					var5(loadingState.Finished)
				end
				if p0.onLoaded then
					p0.onLoaded(p3)
				end
			end, { var4, p0.onLoaded })
		}, {
			Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil
		}),
		Shimmer = if var4 ~= loadingState.Finished then nil else reactModule.createElement(skeleton, { ZIndex = 2, Size = UDim2.fromScale(1, 1) })
	})
end