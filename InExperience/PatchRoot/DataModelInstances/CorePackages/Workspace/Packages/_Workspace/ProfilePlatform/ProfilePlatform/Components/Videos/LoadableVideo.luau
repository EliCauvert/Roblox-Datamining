local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local contentProviderService = game:GetService("ContentProvider")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local loadingState = require(profilePlatform.Common.Enums).LoadingState

return function(p1)
	-- upvalues: reactModule (ref), loadingState (ref), contentProviderService (ref), view (ref), skeleton (ref)
	local var1, var2 = reactModule.useState(loadingState.Loading)
	local var3, var4 = reactModule.useState(Vector2.new(0, 0))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), contentProviderService (copy), var2 (ref), loadingState (copy)
		if p1.Video == nil or p1.Video == "" then
			return
		end
		local var5 = contentProviderService:GetAssetFetchStatusChangedSignal(p1.Video):Connect(function(p2)
			-- upvalues: var2 (copy), loadingState (copy)
			if p2 == Enum.AssetFetchStatus.Failure then
				var2(loadingState.Failed)
			end
		end)
		
		return function()
			-- upvalues: var5 (ref), var2 (copy), loadingState (copy)
			var5:Disconnect()
			var2(loadingState.Loading)
		end
	end, { p1.Video })
	
	return if var1 == loadingState.Failed then p1.renderOnFailed() else reactModule.createElement(view, {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		isDisabled = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
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
			Size = UDim2.fromScale(1, 1),
			Video = p1.Video,
			Visible = var3.X > 0 and var3.Y > 0,
			[reactModule.Change.Resolution] = reactModule.useCallback(function(p2)
				-- upvalues: var4 (ref), p1 (ref)
				local resolution = p2.Resolution
				var4(resolution)
				
				if p1.onResolutionChanged then
					p1.onResolutionChanged(resolution)
				end
			end, { p1.onResolutionChanged, var4 }),
			[reactModule.Event.Loaded] = reactModule.useCallback(function(p2)
				-- upvalues: var1 (ref), loadingState (copy), var2 (ref), p1 (ref)
				if var1 == loadingState.Loading then
					var2(loadingState.Finished)
				end
				if p1.onLoaded then
					p1.onLoaded(p2)
				end
			end, { var1, p1.onLoaded })
		}, {
			Corner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
		}),
		Shimmer = if var1 ~= loadingState.Finished then nil else reactModule.createElement(skeleton, { ZIndex = 2, Size = UDim2.fromScale(1, 1) })
	})
end