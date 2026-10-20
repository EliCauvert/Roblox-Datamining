local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ContentProvider = game:GetService("ContentProvider")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local LoadingState = require(ProfilePlatform.Common.Enums).LoadingState

return function(p1)
	-- upvalues: ReactModule (copy), LoadingState (copy), ContentProvider (copy), View (copy), Skeleton (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(LoadingState.Loading)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ContentProvider (upval), UseStateResult2 (copy), LoadingState (upval)
		if p1.Video == nil or p1.Video == "" then return end
		local Connection = ContentProvider:GetAssetFetchStatusChangedSignal(p1.Video):Connect(function(AssetFetchStatus)
			-- upvalues: UseStateResult2 (upval), LoadingState (upval)
			if AssetFetchStatus == Enum.AssetFetchStatus.Failure then
				UseStateResult2(LoadingState.Failed)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy), UseStateResult2 (upval), LoadingState (upval)
			Connection:Disconnect()
			UseStateResult2(LoadingState.Loading)
		end
	end, { p1.Video })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy), p1 (copy)
		local Resolution = p2.Resolution
		UseStateResult2_1(Resolution)
		
		if p1.onResolutionChanged then
			p1.onResolutionChanged(Resolution)
		end
	end, { p1.onResolutionChanged, UseStateResult2_1 })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult (copy), LoadingState (upval), UseStateResult2 (copy), p1 (copy)
		if UseStateResult == LoadingState.Loading then
			UseStateResult2(LoadingState.Finished)
		end
		if p1.onLoaded then
			p1.onLoaded(p2)
		end
	end, { UseStateResult, p1.onLoaded })
	
	return if UseStateResult == LoadingState.Failed then p1.renderOnFailed() else ReactModule.createElement(View, {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		isDisabled = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.Position,
		Size = p1.Size,
		ZIndex = p1.ZIndex
	}, {
		VideoFrame = ReactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Looped = p1.Looped == nil or p1.Looped,
			Playing = p1.Playing,
			Position = UDim2.fromScale(0.5, 0.5),
			ref = p1.videoRef,
			Size = UDim2.fromScale(1, 1),
			Video = p1.Video,
			Visible = UseStateResult1.X > 0 and UseStateResult1.Y > 0,
			[ReactModule.Change.Resolution] = UseResult,
			[ReactModule.Event.Loaded] = UseResult1
		}, {
			Corner = if p1.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
		}),
		Shimmer = if UseStateResult == LoadingState.Finished then nil else ReactModule.createElement(Skeleton, { ZIndex = 2, Size = UDim2.fromScale(1, 1) })
	})
end