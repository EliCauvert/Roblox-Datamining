local RbxAnalyticsService = nil
pcall(function() --[[ Line: 5 ]]
	-- upvalues: RbxAnalyticsService (ref)
	RbxAnalyticsService = game:GetService("RbxAnalyticsService")
end)
local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local CryoModule = require(Parent3.Cryo)
local Skeleton = require(Parent3.Foundation).Skeleton
local DebugPropsModule = require(Parent.Enum.DebugProps)
local LoadingStrategyModule = require(Parent.Enum.LoadingStrategy)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local GetClosestRadiusModule = require(Parent1.Loading.getClosestRadius)
local ImagesModule = require(Parent2.App.ImageSet.Images)
local ImageSetComponentModule = require(Parent2.Core.ImageSet.ImageSetComponent)
local ContentProviderModule = require(Parent2.App.Context.ContentProvider)
local LoadableImage = RoactModule.PureComponent:extend("LoadableImage")
LoadableImage.validateProps = TModule.strictInterface({
	AnchorPoint = TModule.optional(TModule.Vector2),
	BackgroundColor3 = TModule.optional(TModule.Color3),
	BackgroundTransparency = TModule.optional(TModule.number),
	cornerRadius = TModule.optional(TModule.UDim),
	Image = TModule.optional(TModule.union(TModule.string, (require(Parent2.Core.ImageSet.Validator.validateImageSetData)))),
	ImageColor3 = TModule.optional(TModule.Color3),
	ImageTransparency = TModule.optional(TModule.number),
	ImageRectOffset = TModule.optional(TModule.union(TModule.Vector2, TModule.table)),
	ImageRectSize = TModule.optional(TModule.union(TModule.Vector2, TModule.table)),
	LayoutOrder = TModule.optional(TModule.integer),
	loadingImage = TModule.optional(TModule.union(TModule.string, TModule.table)),
	loadingStrategy = TModule.optional(LoadingStrategyModule.isEnumValue),
	loadingTimeout = TModule.optional(TModule.numberPositive),
	renderOnLoading = TModule.optional(TModule.callback),
	renderOnFailed = TModule.optional(TModule.callback),
	MaxSize = TModule.optional(TModule.Vector2),
	MinSize = TModule.optional(TModule.Vector2),
	onLoaded = TModule.optional(TModule.callback),
	Position = TModule.optional(TModule.UDim2),
	ScaleType = TModule.optional(TModule.enum(Enum.ScaleType)),
	Size = TModule.UDim2,
	TileSize = TModule.optional(TModule.UDim2),
	useShimmerAnimationWhileLoading = TModule.optional(TModule.boolean),
	showFailedStateWhenLoadingFailed = TModule.optional(TModule.boolean),
	ZIndex = TModule.optional(TModule.integer),
	shouldHandleReloads = TModule.optional(TModule.boolean),
	contentProvider = TModule.union(TModule.instanceOf("ContentProvider"), TModule.table),
	[DebugPropsModule.forceLoading] = TModule.optional(TModule.boolean),
	[DebugPropsModule.forceFailed] = TModule.optional(TModule.boolean)
})
LoadableImage.defaultProps = {
	BackgroundTransparency = 0,
	useShimmerAnimationWhileLoading = false,
	showFailedStateWhenLoadingFailed = false,
	loadingTimeout = 30,
	shouldHandleReloads = false,
	cornerRadius = UDim.new(0, 0),
	MaxSize = Vector2.new(1e999, 1e999),
	MinSize = Vector2.new(0, 0),
	loadingStrategy = LoadingStrategyModule.Default
}

function LoadableImage.init(p1) --[[ Line: 114 ]]
	-- upvalues: RoactModule (copy)
	p1.currentImageLoadIndex = 0
	p1:setState({ eagerRetrying = false })
	p1.imageRef = RoactModule.createRef()
	p1._isMounted = false
end

function LoadableImage.renderShimmer(p1, Theme, UISizeConstraint, Tokens) --[[ Line: 124 ]]
	-- upvalues: RoactModule (copy), Skeleton (copy), GetClosestRadiusModule (copy)
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p1.props.AnchorPoint,
		BackgroundColor3 = Theme.PlaceHolder.Color,
		BackgroundTransparency = Theme.PlaceHolder.Transparency,
		LayoutOrder = p1.props.LayoutOrder,
		Position = p1.props.Position,
		Size = p1.props.Size,
		ZIndex = p1.props.ZIndex
	}, {
		Shimmer = RoactModule.createElement(Skeleton, {
			Size = UDim2.fromScale(1, 1),
			radius = GetClosestRadiusModule({
				None = Tokens.Radius.None,
				Small = Tokens.Radius.Small,
				Medium = Tokens.Radius.Medium,
				Large = Tokens.Size.Size_300,
				XLarge = Tokens.Radius.Large,
				Circle = Tokens.Radius.Circle
			}, p1.props.cornerRadius)
		}),
		UISizeConstraint = UISizeConstraint,
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = p1.props.cornerRadius }) or nil
	})
end

function LoadableImage.defaultRenderOnFail(p1, Theme, UISizeConstraint) --[[ Line: 153 ]]
	-- upvalues: ImagesModule (copy), RoactModule (copy), ImageSetComponentModule (copy)
	local CornerRadius = p1.props.cornerRadius
	local IconsStatusImageunavailable = ImagesModule["icons/status/imageunavailable"]
	local ImageRectSizeRatio = IconsStatusImageunavailable.ImageRectSize / ImagesModule.ImagesResolutionScale
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p1.props.AnchorPoint,
		BackgroundColor3 = Theme.PlaceHolder.Color,
		BackgroundTransparency = Theme.PlaceHolder.Transparency,
		LayoutOrder = p1.props.LayoutOrder,
		Position = p1.props.Position,
		Size = p1.props.Size,
		ZIndex = p1.props.ZIndex
	}, {
		EmptyIcon = RoactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = IconsStatusImageunavailable,
			ImageColor3 = Theme.UIDefault.Color,
			ImageTransparency = Theme.UIDefault.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y)
		}, {
			UICorner = if CornerRadius == UDim.new(0, 0) then nil else RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }) or nil
		}),
		UISizeConstraint = UISizeConstraint,
		UICorner = if CornerRadius == UDim.new(0, 0) then nil else RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }) or nil
	})
end

function LoadableImage.isImageNonNil(p1): boolean --[[ Line: 189 ]]
	-- upvalues: RoactModule (copy)
	return p1.props.Image ~= RoactModule.None and p1.props.Image ~= nil
end

function LoadableImage.getCurrentImageAssetFetchStatus(p1, State) --[[ Line: 193 ]]
	local StateEntry = State[p1:getAssetFetchStatusStateKey(p1.currentImageLoadIndex)]
	
	if StateEntry == nil then
		StateEntry = Enum.AssetFetchStatus.None
	end
	return StateEntry
end

function LoadableImage.isLoadingComplete(p1, State): boolean --[[ Line: 203 ]]
	local CurrentImageAssetFetchStatus = p1:getCurrentImageAssetFetchStatus(State)
	
	return CurrentImageAssetFetchStatus ~= Enum.AssetFetchStatus.None and CurrentImageAssetFetchStatus ~= Enum.AssetFetchStatus.Loading and (CurrentImageAssetFetchStatus ~= Enum.AssetFetchStatus.Failure and CurrentImageAssetFetchStatus ~= Enum.AssetFetchStatus.TimedOut or not State.eagerRetrying)
end

function LoadableImage.render(p1) --[[ Line: 216 ]]
	-- upvalues: DebugPropsModule (copy), RoactModule (copy), WithStyleModule (copy), LoadingStrategyModule (copy), ImageSetComponentModule (copy)
	local AnchorPoint = p1.props.AnchorPoint
	local LayoutOrder = p1.props.LayoutOrder
	local Size = p1.props.Size
	local Position = p1.props.Position
	local BackgroundColor3 = p1.props.BackgroundColor3
	local BackgroundTransparency = p1.props.BackgroundTransparency
	local CornerRadius = p1.props.cornerRadius
	local ScaleType = p1.props.ScaleType
	local ZIndex = p1.props.ZIndex
	local Image = p1.props.Image
	local ImageTransparency = p1.props.ImageTransparency
	local ImageRectOffset = p1.props.ImageRectOffset
	local ImageRectSize = p1.props.ImageRectSize
	local ImageColor3 = p1.props.ImageColor3
	local MaxSize = p1.props.MaxSize
	local MinSize = p1.props.MinSize
	local RenderOnLoadingFunction = p1.props.renderOnLoading
	local RenderOnFailedFunction = p1.props.renderOnFailed
	local LoadingImage = p1.props.loadingImage
	local LoadingStrategy = p1.props.loadingStrategy
	local UseShimmerAnimationWhileLoading = p1.props.useShimmerAnimationWhileLoading
	local ShowFailedStateWhenLoadingFailed = p1.props.showFailedStateWhenLoadingFailed
	local IsLoadingComplete = p1:isImageNonNil() and p1:isLoadingComplete(p1.state)
	local CurrentImageAssetFetchStatus = p1:getCurrentImageAssetFetchStatus(p1.state)
	local IsNotCurrentImageAssetFetchStatusMatch = CurrentImageAssetFetchStatus ~= Enum.AssetFetchStatus.None
	local IsCurrentImageAssetFetchStatusMatch = CurrentImageAssetFetchStatus == Enum.AssetFetchStatus.Failure
	local Flag = false
	
	if p1.props[DebugPropsModule.forceLoading] then
		IsLoadingComplete = false
	end
	if p1.props[DebugPropsModule.forceFailed] then
		IsCurrentImageAssetFetchStatusMatch = true
	end
	if MaxSize.X ~= 1e999 or MaxSize.Y ~= 1e999 or MinSize.X ~= 0 or MinSize.Y ~= 0 then
		Flag = true
	end
	local UISizeConstraint = Flag and RoactModule.createElement("UISizeConstraint", { MaxSize = MaxSize, MinSize = MinSize })
	
	return WithStyleModule(function(p2) --[[ Line: 264 ]]
		-- upvalues: IsCurrentImageAssetFetchStatusMatch (ref), RenderOnFailedFunction (copy), ShowFailedStateWhenLoadingFailed (copy), p1 (copy), UISizeConstraint (copy), IsLoadingComplete (ref), RenderOnLoadingFunction (copy), LoadingStrategy (copy), LoadingStrategyModule (upval), UseShimmerAnimationWhileLoading (copy), IsNotCurrentImageAssetFetchStatusMatch (copy), RoactModule (upval), ImageSetComponentModule (upval), AnchorPoint (copy), BackgroundColor3 (copy), BackgroundTransparency (copy), Image (copy), LoadingImage (copy), ImageTransparency (copy), ImageRectOffset (copy), ImageRectSize (copy), ImageColor3 (copy), LayoutOrder (copy), Position (copy), ScaleType (copy), Size (copy), ZIndex (copy), CornerRadius (copy)
		local Theme = p2.Theme
		local Tokens = p2.Tokens
		
		if IsCurrentImageAssetFetchStatusMatch and RenderOnFailedFunction then
			return RenderOnFailedFunction()
		elseif IsCurrentImageAssetFetchStatusMatch and ShowFailedStateWhenLoadingFailed then
			return p1:defaultRenderOnFail(Theme, UISizeConstraint)
		elseif not IsLoadingComplete and RenderOnLoadingFunction and LoadingStrategy ~= LoadingStrategyModule.Default then
			return RenderOnLoadingFunction()
		elseif IsLoadingComplete or not UseShimmerAnimationWhileLoading or LoadingStrategy == LoadingStrategyModule.Default then
			local IsLoadingComplete1 = IsLoadingComplete or LoadingStrategy == LoadingStrategyModule.Default
			
			return RoactModule.createElement(ImageSetComponentModule.Label, {
				AnchorPoint = AnchorPoint,
				BackgroundColor3 = BackgroundColor3 or Theme.PlaceHolder.Color,
				BackgroundTransparency = BackgroundTransparency or Theme.PlaceHolder.Transparency,
				BorderSizePixel = 0,
				Image = IsLoadingComplete1 and Image or LoadingImage,
				ImageTransparency = ImageTransparency,
				ImageRectOffset = ImageRectOffset,
				ImageRectSize = ImageRectSize,
				ImageColor3 = IsLoadingComplete1 and ImageColor3 or nil,
				LayoutOrder = LayoutOrder,
				Position = Position,
				ScaleType = ScaleType,
				TileSize = p1.props.TileSize,
				Size = Size,
				ZIndex = ZIndex,
				[RoactModule.Ref] = p1.imageRef
			}, {
				UISizeConstraint = UISizeConstraint,
				UICorner = if CornerRadius == UDim.new(0, 0) then nil else RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }) or nil,
				OnLoading = if IsLoadingComplete or not RenderOnLoadingFunction or LoadingStrategy ~= LoadingStrategyModule.Default then nil else RenderOnLoadingFunction(),
				Shimmer = if IsLoadingComplete or not UseShimmerAnimationWhileLoading or LoadingStrategy ~= LoadingStrategyModule.Default or not IsNotCurrentImageAssetFetchStatusMatch then nil else p1:renderShimmer(Theme, UISizeConstraint, Tokens)
			})
		else
			return p1:renderShimmer(Theme, UISizeConstraint, Tokens)
		end
	end)
end

function LoadableImage.maybeCallOnLoaded(p1, p2) --[[ Line: 328 ]]
	if p1.props.onLoaded then
		local IsLoadingComplete = p1:isLoadingComplete(p1.state)
		
		if not p1:isLoadingComplete(p2) and IsLoadingComplete then
			p1.props.onLoaded()
		end
	end
end

function LoadableImage.didUpdate(p1, p2, p3) --[[ Line: 338 ]]
	if p2.Image ~= p1.props.Image then
		p1:loadImage()
	end
	p1:maybeCallOnLoaded(p3)
end

function LoadableImage.didMount(p1) --[[ Line: 345 ]]
	p1._isMounted = true
	p1:loadImage()
end

function LoadableImage.willUnmount(p1) --[[ Line: 353 ]]
	p1._isMounted = false
	p1:dropConnections()
end

function LoadableImage:isTerminalStatus(AssetFetchStatus): boolean --[[ Line: 358 ]]
	return AssetFetchStatus == Enum.AssetFetchStatus.Success or (AssetFetchStatus == Enum.AssetFetchStatus.Failure or AssetFetchStatus == Enum.AssetFetchStatus.TimedOut)
end

function LoadableImage.getImageUri(p1) --[[ Line: 368 ]]
	return if p1.props.Image then if typeof(p1.props.Image) == "string" then p1.props.Image else p1.props.Image.Image else nil
end

function LoadableImage.awaitImageLoaded(p1, NewCurrentImageLoadIndex, AssetFetchStatus) --[[ Line: 382 ]]
	if p1:isTerminalStatus(AssetFetchStatus) then return end
	local ImageUri = p1:getImageUri()
	
	local function Callback(AssetFetchStatus) --[[ Line: 393 ]]
		-- upvalues: p1 (copy), NewCurrentImageLoadIndex (copy), ImageUri (copy)
		p1:updateAssetFetchStatusForImageLoadIndex(AssetFetchStatus, NewCurrentImageLoadIndex, ImageUri)
		p1:maybeReportCounter("Await", AssetFetchStatus)
		
		if p1:isTerminalStatus(AssetFetchStatus) and p1.awaitImageLoadedConnection then
			p1.awaitImageLoadedConnection:Disconnect()
			p1.awaitImageLoadedConnection = nil
		end
	end
	
	if ImageUri ~= "" then
		p1.awaitImageLoadedConnection = p1.props.contentProvider:GetAssetFetchStatusChangedSignal(ImageUri):Connect(Callback)
		
		return
	end
	local Success = Enum.AssetFetchStatus.Success
	p1:updateAssetFetchStatusForImageLoadIndex(Success, NewCurrentImageLoadIndex, ImageUri)
	p1:maybeReportCounter("Await", Success)
	
	if p1:isTerminalStatus(Success) and p1.awaitImageLoadedConnection then
		p1.awaitImageLoadedConnection:Disconnect()
		p1.awaitImageLoadedConnection = nil
	end
end

function LoadableImage:maybeReportCounter(p1, AssetFetchStatus) --[[ Line: 411 ]]
	-- upvalues: RbxAnalyticsService (ref)
	pcall(function() --[[ Line: 414 ]]
		-- upvalues: p1 (copy), AssetFetchStatus (copy), RbxAnalyticsService (upval)
		RbxAnalyticsService:ReportCounter("UIBlox_LoadableImage_" .. p1 .. "_" .. tostring(AssetFetchStatus))
	end)
end

function LoadableImage.preloadImageWithRetryLogic(p1, NewCurrentImageLoadIndex) --[[ Line: 426 ]]
	local ImageUri = p1:getImageUri()
	local Count = 0
	local None = Enum.AssetFetchStatus.None
	while true do
		if not p1._isMounted then break end
		if Count > 0 then
			task.wait(math.pow(2, Count - 1) * 1.5)
		end
		p1.props.contentProvider:PreloadAsync({ ImageUri }, function(_, p2) --[[ Line: 441 ]]
			-- upvalues: p1 (copy), ImageUri (copy), None (ref), NewCurrentImageLoadIndex (copy)
			local ImageUri1 = p1:getImageUri()
			
			if p1._isMounted and ImageUri1 == ImageUri then
				p1:maybeReportCounter("PreloadAsync", p2)
				None = p2
				p1:updateAssetFetchStatusForImageLoadIndex(p2, NewCurrentImageLoadIndex, ImageUri)
			end
		end)
		local ImageUri1 = p1:getImageUri()
		
		if not p1._isMounted or ImageUri1 ~= ImageUri then break end
		if None ~= Enum.AssetFetchStatus.Success then
			Count += 1
			
			if (None ~= Enum.AssetFetchStatus.Failure or Count <= 3) and (None ~= Enum.AssetFetchStatus.TimedOut or Count <= 5) then
				p1:setState({ eagerRetrying = true })
				continue
			end
		end
		p1:setState({ eagerRetrying = false })
		break
	end
end

function LoadableImage:getAssetFetchStatusStateKey(CurrentImageLoadIndex): string --[[ Line: 488 ]]
	return "assetFetchStatus_" .. tostring(CurrentImageLoadIndex)
end

function LoadableImage.updateAssetFetchStatusForImageLoadIndex(p2, Success, NewCurrentImageLoadIndex, _) --[[ Line: 492 ]]
	p2:setState({
		[p2:getAssetFetchStatusStateKey(NewCurrentImageLoadIndex)] = Success
	})
end

function LoadableImage.dropConnections(p2) --[[ Line: 499 ]]
	if p2.listenForReloadsConnection then
		p2.listenForReloadsConnection:Disconnect()
		p2.listenForReloadsConnection = nil
	end
	if p2.awaitImageLoadedConnection then
		p2.awaitImageLoadedConnection:Disconnect()
		p2.awaitImageLoadedConnection = nil
	end
end

function LoadableImage.loadImage(p2) --[[ Line: 510 ]]
	-- upvalues: LoadingStrategyModule (copy)
	local NewCurrentImageLoadIndex = p2.currentImageLoadIndex + 1
	p2.currentImageLoadIndex = NewCurrentImageLoadIndex
	local ImageUri = p2:getImageUri()
	local LoadingStrategy = p2.props.loadingStrategy
	p2:dropConnections()
	
	if ImageUri == nil then
		p2:updateAssetFetchStatusForImageLoadIndex(Enum.AssetFetchStatus.Success, NewCurrentImageLoadIndex, ImageUri)
		p2:setState({ eagerRetrying = false })
		
		return
	end
	local AssetFetchStatus = p2.props.contentProvider:GetAssetFetchStatus(ImageUri)
	p2:maybeReportCounter("InitialStatus", AssetFetchStatus)
	p2:updateAssetFetchStatusForImageLoadIndex(AssetFetchStatus, NewCurrentImageLoadIndex, ImageUri)
	
	if p2.props.shouldHandleReloads then
		p2.listenForReloadsConnection = p2.props.contentProvider:GetAssetFetchStatusChangedSignal(ImageUri):Connect(function(p3, _) --[[ Line: 541 ]]
			-- upvalues: p2 (copy), NewCurrentImageLoadIndex (copy), ImageUri (copy)
			p2:maybeReportCounter("Reloads", p3)
			p2:updateAssetFetchStatusForImageLoadIndex(p3, NewCurrentImageLoadIndex, ImageUri)
		end)
	end
	if LoadingStrategy == LoadingStrategyModule.Eager then
		task.spawn(function() --[[ Line: 550 ]]
			-- upvalues: p2 (copy), NewCurrentImageLoadIndex (copy)
			p2:preloadImageWithRetryLogic(NewCurrentImageLoadIndex)
		end)
		
		return
	end
	if LoadingStrategy == LoadingStrategyModule.Default then
		p2:awaitImageLoaded(NewCurrentImageLoadIndex, AssetFetchStatus)
	end
end

return function(p2) --[[ Line: 558 ]]
	-- upvalues: RoactModule (copy), ContentProviderModule (copy), CryoModule (copy), LoadableImage (copy)
	return RoactModule.createElement(ContentProviderModule.Consumer, {
		render = function(ContentProvider) --[[ Line: 560 ]]
			-- upvalues: CryoModule (upval), p2 (copy), RoactModule (upval), LoadableImage (upval)
			return RoactModule.createElement(LoadableImage, (CryoModule.Dictionary.join(p2, { contentProvider = ContentProvider })))
		end
	})
end