local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = game:GetService("RbxAnalyticsService")
end)
local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local core = parent_2.Core
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local cryoModule = require(parent_3.Cryo)
local skeleton = require(parent_3.Foundation).Skeleton
local debugPropsModule = require(parent.Enum.DebugProps)
local loadingStrategyModule = require(parent.Enum.LoadingStrategy)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local getClosestRadiusModule = require(parent_1.Loading.getClosestRadius)
local UIBloxConfigModule = require(parent_2.UIBloxConfig)
local imagesModule = require(parent_2.App.ImageSet.Images)
local imageSetComponentModule = require(parent_2.Core.ImageSet.ImageSetComponent)
local validateImageSetDataModule = require(core.ImageSet.Validator.validateImageSetData)
local contentProviderModule = require(parent_2.App.Context.ContentProvider)
local loadableImage = roactModule.PureComponent:extend("LoadableImage")
loadableImage.validateProps = tModule.strictInterface({
	AnchorPoint = tModule.optional(tModule.Vector2),
	BackgroundColor3 = tModule.optional(tModule.Color3),
	BackgroundTransparency = tModule.optional(tModule.number),
	cornerRadius = tModule.optional(tModule.UDim),
	Image = tModule.optional(tModule.union(tModule.string, validateImageSetDataModule)),
	ImageColor3 = tModule.optional(tModule.Color3),
	ImageTransparency = tModule.optional(tModule.number),
	ImageRectOffset = tModule.optional(tModule.union(tModule.Vector2, tModule.table)),
	ImageRectSize = tModule.optional(tModule.union(tModule.Vector2, tModule.table)),
	LayoutOrder = tModule.optional(tModule.integer),
	loadingImage = tModule.optional(tModule.union(tModule.string, tModule.table)),
	loadingStrategy = tModule.optional(loadingStrategyModule.isEnumValue),
	loadingTimeout = tModule.optional(tModule.numberPositive),
	renderOnLoading = tModule.optional(tModule.callback),
	renderOnFailed = tModule.optional(tModule.callback),
	MaxSize = tModule.optional(tModule.Vector2),
	MinSize = tModule.optional(tModule.Vector2),
	onLoaded = tModule.optional(tModule.callback),
	Position = tModule.optional(tModule.UDim2),
	ScaleType = tModule.optional(tModule.enum(Enum.ScaleType)),
	Size = tModule.UDim2,
	TileSize = tModule.optional(tModule.UDim2),
	useShimmerAnimationWhileLoading = tModule.optional(tModule.boolean),
	showFailedStateWhenLoadingFailed = tModule.optional(tModule.boolean),
	ZIndex = tModule.optional(tModule.integer),
	shouldHandleReloads = tModule.optional(tModule.boolean),
	contentProvider = tModule.union(tModule.instanceOf("ContentProvider"), tModule.table),
	[debugPropsModule.forceLoading] = tModule.optional(tModule.boolean),
	[debugPropsModule.forceFailed] = tModule.optional(tModule.boolean)
})
loadableImage.defaultProps = {
	BackgroundTransparency = 0,
	useShimmerAnimationWhileLoading = false,
	showFailedStateWhenLoadingFailed = false,
	loadingTimeout = 30,
	shouldHandleReloads = false,
	cornerRadius = UDim.new(0, 0),
	MaxSize = Vector2.new(1e999, 1e999),
	MinSize = Vector2.new(0, 0),
	loadingStrategy = loadingStrategyModule.Default
}

function loadableImage.init(p1)
	-- upvalues: roactModule (ref)
	p1.currentImageLoadIndex = 0
	p1:setState({ eagerRetrying = false })
	p1.imageRef = roactModule.createRef()
	p1._isMounted = false
end

function loadableImage.renderShimmer(p1, p2, p3, p4)
	-- upvalues: roactModule (ref), skeleton (ref), getClosestRadiusModule (ref), UIBloxConfigModule (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p1.props.AnchorPoint,
		BackgroundColor3 = p2.PlaceHolder.Color,
		BackgroundTransparency = p2.PlaceHolder.Transparency,
		LayoutOrder = p1.props.LayoutOrder,
		Position = p1.props.Position,
		Size = p1.props.Size,
		ZIndex = p1.props.ZIndex
	}, {
		Shimmer = roactModule.createElement(skeleton, {
			Size = UDim2.fromScale(1, 1),
			radius = getClosestRadiusModule(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then {
				None = p4.Radius.None,
				Small = p4.Radius.Small,
				Medium = p4.Radius.Medium,
				Large = p4.Size.Size_300,
				XLarge = p4.Radius.Large,
				Circle = p4.Radius.Circle
			} else p4.Semantic.Radius, p1.props.cornerRadius)
		}),
		UISizeConstraint = p3,
		UICorner = roactModule.createElement("UICorner", { CornerRadius = p1.props.cornerRadius }) or nil
	})
end

function loadableImage.defaultRenderOnFail(p1, p2, p3)
	-- upvalues: imagesModule (ref), roactModule (ref), imageSetComponentModule (ref)
	local cornerRadius = p1.props.cornerRadius
	local imageunavailable = imagesModule["icons/status/imageunavailable"]
	local var2 = imageunavailable.ImageRectSize / imagesModule.ImagesResolutionScale
	
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p1.props.AnchorPoint,
		BackgroundColor3 = p2.PlaceHolder.Color,
		BackgroundTransparency = p2.PlaceHolder.Transparency,
		LayoutOrder = p1.props.LayoutOrder,
		Position = p1.props.Position,
		Size = p1.props.Size,
		ZIndex = p1.props.ZIndex
	}, {
		EmptyIcon = roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = imageunavailable,
			ImageColor3 = p2.UIDefault.Color,
			ImageTransparency = p2.UIDefault.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, var2.X, 0, var2.Y)
		}, {
			UICorner = cornerRadius ~= UDim.new(0, 0) and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
		}),
		UISizeConstraint = p3,
		UICorner = cornerRadius ~= UDim.new(0, 0) and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
	})
end

function loadableImage.isImageNonNil(p1)
	-- upvalues: roactModule (ref)
	return p1.props.Image ~= roactModule.None and p1.props.Image ~= nil
end

function loadableImage.getCurrentImageAssetFetchStatus(value, p1)
	local currentImageLoadIndex = p1[value:getAssetFetchStatusStateKey(value.currentImageLoadIndex)]
	
	if currentImageLoadIndex == nil then
		currentImageLoadIndex = Enum.AssetFetchStatus.None
	end
	return currentImageLoadIndex
end

function loadableImage.isLoadingComplete(p1, p2)
	local var2 = p1:getCurrentImageAssetFetchStatus(p2)
	
	return if var2 == Enum.AssetFetchStatus.None or var2 == Enum.AssetFetchStatus.Loading then false else (var2 == Enum.AssetFetchStatus.Failure or var2 == Enum.AssetFetchStatus.TimedOut) and p2.eagerRetrying
end

function loadableImage.render(p1)
	-- upvalues: debugPropsModule (ref), roactModule (ref), withStyleModule (ref), loadingStrategyModule (ref), imageSetComponentModule (ref)
	local anchorPoint = p1.props.AnchorPoint
	local layoutOrder = p1.props.LayoutOrder
	local size = p1.props.Size
	local position = p1.props.Position
	local backgroundColor3 = p1.props.BackgroundColor3
	local backgroundTransparency = p1.props.BackgroundTransparency
	local cornerRadius = p1.props.cornerRadius
	local scaleType = p1.props.ScaleType
	local zIndex = p1.props.ZIndex
	local image = p1.props.Image
	local imageTransparency = p1.props.ImageTransparency
	local imageRectOffset = p1.props.ImageRectOffset
	local imageRectSize = p1.props.ImageRectSize
	local imageColor3 = p1.props.ImageColor3
	local maxSize = p1.props.MaxSize
	local minSize = p1.props.MinSize
	local renderOnLoading = p1.props.renderOnLoading
	local renderOnFailed = p1.props.renderOnFailed
	local loadingImage = p1.props.loadingImage
	local loadingStrategy = p1.props.loadingStrategy
	local useShimmerAnimationWhileLoading = p1.props.useShimmerAnimationWhileLoading
	local showFailedStateWhenLoadingFailed = p1.props.showFailedStateWhenLoadingFailed
	local state = p1:isImageNonNil() and p1:isLoadingComplete(p1.state)
	local stateCurrentImageAssetFetchStatus = p1:getCurrentImageAssetFetchStatus(p1.state)
	local var2 = stateCurrentImageAssetFetchStatus ~= Enum.AssetFetchStatus.None
	local var3 = stateCurrentImageAssetFetchStatus == Enum.AssetFetchStatus.Failure
	local var4 = false
	
	if p1.props[debugPropsModule.forceLoading] then
		state = false
	end
	if p1.props[debugPropsModule.forceFailed] then
		var3 = true
	end
	if maxSize.X ~= 1e999 or maxSize.Y ~= 1e999 or (minSize.X ~= 0 or minSize.Y ~= 0) then
		var4 = true
	end
	local UISizeConstraint = var4 and roactModule.createElement("UISizeConstraint", { MaxSize = maxSize, MinSize = minSize })
	
	return withStyleModule(function(p2)
		-- upvalues: var3 (write), renderOnFailed (ref), showFailedStateWhenLoadingFailed (ref), p1 (ref), UISizeConstraint (ref), state (write), renderOnLoading (ref), loadingStrategy (ref), loadingStrategyModule (copy), useShimmerAnimationWhileLoading (ref), var2 (ref), roactModule (copy), imageSetComponentModule (copy), anchorPoint (ref), backgroundColor3 (ref), backgroundTransparency (ref), image (ref), loadingImage (ref), imageTransparency (ref), imageRectOffset (ref), imageRectSize (ref), imageColor3 (ref), layoutOrder (ref), position (ref), scaleType (ref), size (ref), zIndex (ref), cornerRadius (ref)
		local theme = p2.Theme
		local tokens = p2.Tokens
		
		if var3 and renderOnFailed then
			return renderOnFailed()
		elseif var3 and showFailedStateWhenLoadingFailed then
			return p1:defaultRenderOnFail(theme, UISizeConstraint)
		elseif not state and renderOnLoading and loadingStrategy ~= loadingStrategyModule.Default then
			return renderOnLoading()
		elseif not state and useShimmerAnimationWhileLoading and loadingStrategy ~= loadingStrategyModule.Default then
			return p1:renderShimmer(theme, UISizeConstraint, tokens)
		end
		local state_1 = state or loadingStrategy == loadingStrategyModule.Default
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			AnchorPoint = anchorPoint,
			BackgroundColor3 = backgroundColor3 or theme.PlaceHolder.Color,
			BackgroundTransparency = backgroundTransparency or theme.PlaceHolder.Transparency,
			BorderSizePixel = 0,
			Image = if state_1 then image else loadingImage,
			ImageTransparency = imageTransparency,
			ImageRectOffset = imageRectOffset,
			ImageRectSize = imageRectSize,
			ImageColor3 = if state_1 then imageColor3 else nil,
			LayoutOrder = layoutOrder,
			Position = position,
			ScaleType = scaleType,
			TileSize = p1.props.TileSize,
			Size = size,
			ZIndex = zIndex,
			[roactModule.Ref] = p1.imageRef
		}, {
			UISizeConstraint = UISizeConstraint,
			UICorner = cornerRadius ~= UDim.new(0, 0) and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil,
			OnLoading = if not (state or not renderOnLoading or loadingStrategy ~= loadingStrategyModule.Default) then renderOnLoading() else nil,
			Shimmer = if not (state or not useShimmerAnimationWhileLoading or (loadingStrategy ~= loadingStrategyModule.Default or not var2)) then p1:renderShimmer(theme, UISizeConstraint, tokens) else nil
		})
	end)
end

function loadableImage.maybeCallOnLoaded(p1, p2)
	if p1.props.onLoaded then
		if not p1:isLoadingComplete(p2) and p1:isLoadingComplete(p1.state) then
			p1.props.onLoaded()
		end
	end
end

function loadableImage.didUpdate(p1, p2, p3)
	if p2.Image ~= p1.props.Image then
		p1:loadImage()
	end
	p1:maybeCallOnLoaded(p3)
end

function loadableImage.didMount(p1)
	p1._isMounted = true
	p1:loadImage()
end

function loadableImage.willUnmount(p1)
	p1._isMounted = false
	p1:dropConnections()
end

function loadableImage.isTerminalStatus(_, b)
	return if b ~= Enum.AssetFetchStatus.Success then if b ~= Enum.AssetFetchStatus.Failure then b == Enum.AssetFetchStatus.TimedOut else true else true
end

function loadableImage.getImageUri(p1)
	return if p1.props.Image then if typeof(p1.props.Image) == "string" then p1.props.Image else p1.props.Image.Image else nil
end

function loadableImage.awaitImageLoaded(p1, p2, p3)
	if p1:isTerminalStatus(p3) then return end
	local imageUri = p1:getImageUri()
	
	local var2 = function(p4)
		-- upvalues: p1 (ref), p2 (ref), imageUri (ref)
		p1:updateAssetFetchStatusForImageLoadIndex(p4, p2, imageUri)
		p1:maybeReportCounter("Await", p4)
		
		if p1:isTerminalStatus(p4) and p1.awaitImageLoadedConnection then
			p1.awaitImageLoadedConnection:Disconnect()
			p1.awaitImageLoadedConnection = nil
		end
	end
	
	if imageUri ~= "" then
		p1.awaitImageLoadedConnection = p1.props.contentProvider:GetAssetFetchStatusChangedSignal(imageUri):Connect(var2)
		
		return
	end
	local success = Enum.AssetFetchStatus.Success
	p1:updateAssetFetchStatusForImageLoadIndex(success, p2, imageUri)
	p1:maybeReportCounter("Await", success)
	
	if p1:isTerminalStatus(success) and p1.awaitImageLoadedConnection then
		p1.awaitImageLoadedConnection:Disconnect()
		p1.awaitImageLoadedConnection = nil
	end
end

function loadableImage.maybeReportCounter(_, p1, p2)
	-- upvalues: var1 (write)
	pcall(function()
		-- upvalues: p1 (ref), p2 (ref), var1 (copy)
		var1:ReportCounter("UIBlox_LoadableImage_" .. p26 .. "_" .. tostring(p2))
	end)
end

function loadableImage.preloadImageWithRetryLogic(p1, p2)
	local imageUri = p1:getImageUri()
	local var2 = 0
	local none = Enum.AssetFetchStatus.None
	while true do
		if p1._isMounted then
			if var2 > 0 then
				task.wait(math.pow(2, var2 - 1) * 1.5)
			end
			p1.props.contentProvider:PreloadAsync({ imageUri }, function(_, p3)
				-- upvalues: p1 (ref), imageUri (ref), none (write), p2 (ref)
				if p1._isMounted and p1:getImageUri() == imageUri then
					p1:maybeReportCounter("PreloadAsync", p3)
					none = p3
					p1:updateAssetFetchStatusForImageLoadIndex(p3, p2, imageUri)
				end
			end)
			
			if p1._isMounted and p1:getImageUri() == imageUri then
				if none == Enum.AssetFetchStatus.Success then break end
				var2 += 1
				
				if none == Enum.AssetFetchStatus.Failure and var2 > 3 or none == Enum.AssetFetchStatus.TimedOut and var2 > 5 then break end
				p1:setState({ eagerRetrying = true })
			end
			return
		end
	end
	p1:setState({ eagerRetrying = false })
end

function loadableImage.getAssetFetchStatusStateKey(_, p3)
	return "assetFetchStatus_" .. tostring(p3)
end

function loadableImage.updateAssetFetchStatusForImageLoadIndex(value, p3, p4, _)
	value:setState({ [value:getAssetFetchStatusStateKey(p4)] = p3 })
end

function loadableImage.dropConnections(p3)
	if p3.listenForReloadsConnection then
		p3.listenForReloadsConnection:Disconnect()
		p3.listenForReloadsConnection = nil
	end
	if p3.awaitImageLoadedConnection then
		p3.awaitImageLoadedConnection:Disconnect()
		p3.awaitImageLoadedConnection = nil
	end
end

function loadableImage.loadImage(p3)
	-- upvalues: loadingStrategyModule (ref)
	local var3 = p3.currentImageLoadIndex + 1
	p3.currentImageLoadIndex = var3
	local imageUri = p3:getImageUri()
	local loadingStrategy = p3.props.loadingStrategy
	p3:dropConnections()
	
	if imageUri == nil then
		p3:updateAssetFetchStatusForImageLoadIndex(Enum.AssetFetchStatus.Success, var3, imageUri)
		p3:setState({ eagerRetrying = false })
		
		return
	end
	local var4 = p3.props.contentProvider:GetAssetFetchStatus(imageUri)
	p3:maybeReportCounter("InitialStatus", var4)
	p3:updateAssetFetchStatusForImageLoadIndex(var4, var3, imageUri)
	
	if p3.props.shouldHandleReloads then
		p3.listenForReloadsConnection = p3.props.contentProvider:GetAssetFetchStatusChangedSignal(imageUri):Connect(function(p4, _)
			-- upvalues: p3 (ref), var3 (ref), imageUri (ref)
			p3:maybeReportCounter("Reloads", p4)
			p3:updateAssetFetchStatusForImageLoadIndex(p4, var3, imageUri)
		end)
	end
	if loadingStrategy == loadingStrategyModule.Eager then
		task.spawn(function()
			-- upvalues: p3 (ref), var3 (ref)
			p3:preloadImageWithRetryLogic(var3)
		end)
		
		return
	elseif loadingStrategy == loadingStrategyModule.Default then
		p3:awaitImageLoaded(var3, var4)
	end
end

return function(p3)
	-- upvalues: roactModule (ref), contentProviderModule (ref), cryoModule (ref), loadableImage (ref)
	return roactModule.createElement(contentProviderModule.Consumer, {
		render = function(p4)
			-- upvalues: cryoModule (copy), p3 (ref), roactModule (copy), loadableImage (copy)
			return roactModule.createElement(loadableImage, cryoModule.Dictionary.join(p3, { contentProvider = p4 }))
		end
	})
end