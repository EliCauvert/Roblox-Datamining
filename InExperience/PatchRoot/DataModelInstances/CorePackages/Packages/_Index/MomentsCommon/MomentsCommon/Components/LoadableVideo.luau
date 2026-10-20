local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ContentProvider = game:GetService("ContentProvider")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local LoadingStateModule = require(MomentsCommon.Enums.LoadingState)
local GetCropSizeModule = require(MomentsCommon.Utils.getCropSize)
local GetFitSizeModule = require(MomentsCommon.Utils.getFitSize)

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), LoadingStateModule (copy), ContentProvider (copy), View (copy), GetFitSizeModule (copy), GetCropSizeModule (copy), Skeleton (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(LoadingStateModule.Loading)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.new(0, 0))
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), ContentProvider (upval), UseStateResult2_1 (copy), LoadingStateModule (upval)
		if Frame.Video == nil or Frame.Video == "" then return end
		local Connection = ContentProvider:GetAssetFetchStatusChangedSignal(Frame.Video):Connect(function(AssetFetchStatus)
			-- upvalues: UseStateResult2_1 (upval), LoadingStateModule (upval)
			if AssetFetchStatus == Enum.AssetFetchStatus.Failure then
				UseStateResult2_1(LoadingStateModule.Failed)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy), UseStateResult2_1 (upval), LoadingStateModule (upval)
			Connection:Disconnect()
			UseStateResult2_1(LoadingStateModule.Loading)
		end
	end, { Frame.Video })
	local UseResult = ReactModule.useCallback(function(Frame1)
		-- upvalues: UseStateResult2 (copy), Frame (copy)
		UseStateResult2(Frame1.AbsoluteSize)
		
		if Frame.onAbsoluteSizeChanged then
			Frame.onAbsoluteSizeChanged(Frame1)
		end
	end, { Frame.onAbsoluteSizeChanged, UseStateResult2 })
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseStateResult2_2 (copy), Frame (copy)
		local Resolution = p1.Resolution
		UseStateResult2_2(Resolution)
		
		if Frame.onResolutionChanged then
			Frame.onResolutionChanged(Resolution)
		end
	end, { Frame.onResolutionChanged, UseStateResult2_2 })
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: UseStateResult1 (copy), LoadingStateModule (upval), UseStateResult2_1 (copy), Frame (copy)
		if UseStateResult1 == LoadingStateModule.Loading then
			UseStateResult2_1(LoadingStateModule.Finished)
		end
		Frame.onLoaded(p1)
	end, { UseStateResult1, Frame.onLoaded })
	
	return if UseStateResult1 == LoadingStateModule.Failed then Frame.renderOnFailed() else ReactModule.createElement(View, {
		isDisabled = true,
		AnchorPoint = Frame.AnchorPoint,
		BackgroundTransparency = Frame.BackgroundTransparency,
		ClipsDescendants = Frame.ClipsDescendants ~= false,
		onAbsoluteSizeChanged = UseResult,
		Position = Frame.Position,
		Size = Frame.Size,
		ZIndex = Frame.ZIndex
	}, {
		VideoFrame = ReactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Looped = Frame.Looped == nil or Frame.Looped,
			Playing = Frame.Playing,
			Position = UDim2.fromScale(0.5, 0.5),
			ref = Frame.videoRef,
			Size = if Frame.scaleType == Enum.ScaleType.Fit then GetFitSizeModule(UseStateResult, UseStateResult3) else GetCropSizeModule(UseStateResult, UseStateResult3),
			Video = Frame.Video,
			VideoContent = Frame.VideoContent,
			Visible = UseStateResult3.X > 0 and UseStateResult3.Y > 0,
			[ReactModule.Change.Resolution] = UseResult1,
			[ReactModule.Event.Loaded] = UseResult2
		}, {
			Corner = if Frame.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Frame.cornerRadius) }) else nil
		}),
		Shimmer = if UseStateResult1 == LoadingStateModule.Finished then nil else ReactModule.createElement(Skeleton, { ZIndex = 2, Size = UDim2.fromScale(1, 1) })
	})
end