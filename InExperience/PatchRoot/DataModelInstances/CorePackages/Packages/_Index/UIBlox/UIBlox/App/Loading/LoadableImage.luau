local var0 = nil
pcall(function() --[[ line: 5 ]]
	-- upvalues: var0 (write)
	var0 = game:GetService("RbxAnalyticsService")
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

function loadableImage.init(p0) --[[ line: 114 ]]
	-- upvalues: roactModule (ref)
	p0.currentImageLoadIndex = 0
	p0:setState({ eagerRetrying = false })
	p0.imageRef = roactModule.createRef()
	p0._isMounted = false
end

function loadableImage.renderShimmer(p1, p2, p3, p4) --[[ line: 124 ]]
	-- upvalues: roactModule (ref), skeleton (ref), getClosestRadiusModule (ref)
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
			radius = getClosestRadiusModule(p4.Semantic.Radius, p1.props.cornerRadius)
		}),
		UISizeConstraint = p3,
		UICorner = roactModule.createElement("UICorner", { CornerRadius = p1.props.cornerRadius }) or nil
	})
end

function loadableImage.defaultRenderOnFail(p5, p6, p7) --[[ line: 146 ]]
	-- upvalues: imagesModule (ref), roactModule (ref), imageSetComponentModule (ref)
	local cornerRadius = p5.props.cornerRadius
	local imageunavailable = imagesModule["icons/status/imageunavailable"]
	local var13 = imageunavailable.ImageRectSize / imagesModule.ImagesResolutionScale
	
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p5.props.AnchorPoint,
		BackgroundColor3 = p6.PlaceHolder.Color,
		BackgroundTransparency = p6.PlaceHolder.Transparency,
		LayoutOrder = p5.props.LayoutOrder,
		Position = p5.props.Position,
		Size = p5.props.Size,
		ZIndex = p5.props.ZIndex
	}, {
		EmptyIcon = roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = imageunavailable,
			ImageColor3 = p6.UIDefault.Color,
			ImageTransparency = p6.UIDefault.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, var13.X, 0, var13.Y)
		}, {
			UICorner = cornerRadius ~= UDim.new(0, 0) and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
		}),
		UISizeConstraint = p7,
		UICorner = cornerRadius ~= UDim.new(0, 0) and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
	})
end

function loadableImage.isImageNonNil(p8) --[[ line: 182 ]]
	-- upvalues: roactModule (ref)
	return p8.props.Image ~= roactModule.None and p8.props.Image ~= nil
end

function loadableImage.getCurrentImageAssetFetchStatus(value, p9) --[[ line: 186 ]]
	local currentImageLoadIndex = p9[value:getAssetFetchStatusStateKey(value.currentImageLoadIndex)]
	
	if currentImageLoadIndex == nil then
		currentImageLoadIndex = Enum.AssetFetchStatus.None
	end
	return currentImageLoadIndex
end

function loadableImage.isLoadingComplete(p10, p11) --[[ line: 196 ]]
	local var14 = p10:getCurrentImageAssetFetchStatus(p11)
	
	return if var14 == Enum.AssetFetchStatus.None or var14 == Enum.AssetFetchStatus.Loading then false else (var14 == Enum.AssetFetchStatus.Failure or var14 == Enum.AssetFetchStatus.TimedOut) and p11.eagerRetrying
end

function loadableImage.render(p12) --[[ line: 209 ]]
	-- upvalues: debugPropsModule (ref), roactModule (ref), withStyleModule (ref), loadingStrategyModule (ref), imageSetComponentModule (ref)
	local anchorPoint = p12.props.AnchorPoint
	local layoutOrder = p12.props.LayoutOrder
	local size = p12.props.Size
	local position = p12.props.Position
	local backgroundColor3 = p12.props.BackgroundColor3
	local backgroundTransparency = p12.props.BackgroundTransparency
	local cornerRadius = p12.props.cornerRadius
	local scaleType = p12.props.ScaleType
	local zIndex = p12.props.ZIndex
	local image = p12.props.Image
	local imageTransparency = p12.props.ImageTransparency
	local imageRectOffset = p12.props.ImageRectOffset
	local imageRectSize = p12.props.ImageRectSize
	local imageColor3 = p12.props.ImageColor3
	local maxSize = p12.props.MaxSize
	local minSize = p12.props.MinSize
	local renderOnLoading = p12.props.renderOnLoading
	local renderOnFailed = p12.props.renderOnFailed
	local loadingImage = p12.props.loadingImage
	local loadingStrategy = p12.props.loadingStrategy
	local useShimmerAnimationWhileLoading = p12.props.useShimmerAnimationWhileLoading
	local showFailedStateWhenLoadingFailed = p12.props.showFailedStateWhenLoadingFailed
	local state = p12:isImageNonNil() and p12:isLoadingComplete(p12.state)
	local stateCurrentImageAssetFetchStatus = p12:getCurrentImageAssetFetchStatus(p12.state)
	local var17 = stateCurrentImageAssetFetchStatus ~= Enum.AssetFetchStatus.None
	local var18 = stateCurrentImageAssetFetchStatus == Enum.AssetFetchStatus.Failure
	local var19 = false
	
	if p12.props[debugPropsModule.forceLoading] then
		state = false
	end
	if p12.props[debugPropsModule.forceFailed] then
		var18 = true
	end
	if maxSize.X ~= 1e999 or maxSize.Y ~= 1e999 or (minSize.X ~= 0 or minSize.Y ~= 0) then
		var19 = true
	end
	local UISizeConstraint = var19 and roactModule.createElement("UISizeConstraint", { MaxSize = maxSize, MinSize = minSize })
	
	return withStyleModule(function(p13) --[[ line: 257 ]]
		-- upvalues: var18 (write), renderOnFailed (ref), showFailedStateWhenLoadingFailed (ref), p12 (ref), UISizeConstraint (ref), state (write), renderOnLoading (ref), loadingStrategy (ref), loadingStrategyModule (copy), useShimmerAnimationWhileLoading (ref), var17 (ref), roactModule (copy), imageSetComponentModule (copy), anchorPoint (ref), backgroundColor3 (ref), backgroundTransparency (ref), image (ref), loadingImage (ref), imageTransparency (ref), imageRectOffset (ref), imageRectSize (ref), imageColor3 (ref), layoutOrder (ref), position (ref), scaleType (ref), size (ref), zIndex (ref), cornerRadius (ref)
		local theme = p13.Theme
		local tokens = p13.Tokens
		
		if var18 and renderOnFailed then
			return renderOnFailed()
		elseif var18 and showFailedStateWhenLoadingFailed then
			return p12:defaultRenderOnFail(theme, UISizeConstraint)
		elseif not state and renderOnLoading and loadingStrategy ~= loadingStrategyModule.Default then
			return renderOnLoading()
		elseif not state and useShimmerAnimationWhileLoading and loadingStrategy ~= loadingStrategyModule.Default then
			return p12:renderShimmer(theme, UISizeConstraint, tokens)
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
			TileSize = p12.props.TileSize,
			Size = size,
			ZIndex = zIndex,
			[roactModule.Ref] = p12.imageRef
		}, {
			UISizeConstraint = UISizeConstraint,
			UICorner = cornerRadius ~= UDim.new(0, 0) and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil,
			OnLoading = if not (state or not renderOnLoading or loadingStrategy ~= loadingStrategyModule.Default) then renderOnLoading() else nil,
			Shimmer = if not (state or not useShimmerAnimationWhileLoading or (loadingStrategy ~= loadingStrategyModule.Default or not var17)) then p12:renderShimmer(theme, UISizeConstraint, tokens) else nil
		})
	end)
end

function loadableImage.maybeCallOnLoaded(p14, p15) --[[ line: 321 ]]
	if p14.props.onLoaded then
		if not p14:isLoadingComplete(p15) and p14:isLoadingComplete(p14.state) then
			p14.props.onLoaded()
		end
	end
end

function loadableImage.didUpdate(p16, p17, p18) --[[ line: 331 ]]
	if p17.Image ~= p16.props.Image then
		p16:loadImage()
	end
	p16:maybeCallOnLoaded(p18)
end

function loadableImage.didMount(p19) --[[ line: 338 ]]
	p19._isMounted = true
	p19:loadImage()
end

function loadableImage.willUnmount(p20) --[[ line: 346 ]]
	p20._isMounted = false
	p20:dropConnections()
end

function loadableImage.isTerminalStatus(_, b) --[[ line: 351 ]]
	return if b ~= Enum.AssetFetchStatus.Success then if b ~= Enum.AssetFetchStatus.Failure then b == Enum.AssetFetchStatus.TimedOut else true else true
end

function loadableImage.getImageUri(p21) --[[ line: 361 ]]
	return if p21.props.Image then if typeof(p21.props.Image) == "string" then p21.props.Image else p21.props.Image.Image else nil
end

function loadableImage.awaitImageLoaded(p22, p23, p24) --[[ line: 375 ]]
	if p22:isTerminalStatus(p24) then return end
	local imageUri = p22:getImageUri()
	
	local var23 = function(p25) --[[ line: 386 ]]
		-- upvalues: p22 (ref), p23 (ref), imageUri (ref)
		p22:updateAssetFetchStatusForImageLoadIndex(p25, p23, imageUri)
		p22:maybeReportCounter("Await", p25)
		
		if p22:isTerminalStatus(p25) and p22.awaitImageLoadedConnection then
			p22.awaitImageLoadedConnection:Disconnect()
			p22.awaitImageLoadedConnection = nil
		end
	end
	
	if imageUri ~= "" then
		p22.awaitImageLoadedConnection = p22.props.contentProvider:GetAssetFetchStatusChangedSignal(imageUri):Connect(var23)
		
		return
	end
	local success = Enum.AssetFetchStatus.Success
	p22:updateAssetFetchStatusForImageLoadIndex(success, p23, imageUri)
	p22:maybeReportCounter("Await", success)
	
	if p22:isTerminalStatus(success) and p22.awaitImageLoadedConnection then
		p22.awaitImageLoadedConnection:Disconnect()
		p22.awaitImageLoadedConnection = nil
	end
end

function loadableImage.maybeReportCounter(_, p26, p27) --[[ line: 404 ]]
	-- upvalues: var0 (write)
	pcall(function() --[[ line: 407 ]]
		-- upvalues: p26 (ref), p27 (ref), var0 (copy)
		var0:ReportCounter("UIBlox_LoadableImage_" .. p26 .. "_" .. tostring(p27))
	end)
end

function loadableImage.preloadImageWithRetryLogic(p28, p29) --[[ line: 419 ]]
	local imageUri = p28:getImageUri()
	local var25 = 0
	local none = Enum.AssetFetchStatus.None
	while true do
		if p28._isMounted then
			if var25 > 0 then
				task.wait(math.pow(2, var25 - 1) * 1.5)
			end
			p28.props.contentProvider:PreloadAsync({ imageUri }, function(_, p30) --[[ line: 434 ]]
				-- upvalues: p28 (ref), imageUri (ref), none (write), p29 (ref)
				if p28._isMounted and p28:getImageUri() == imageUri then
					p28:maybeReportCounter("PreloadAsync", p30)
					none = p30
					p28:updateAssetFetchStatusForImageLoadIndex(p30, p29, imageUri)
				end
			end)
			
			if p28._isMounted and p28:getImageUri() == imageUri then
				if none == Enum.AssetFetchStatus.Success then break end
				var25 += 1
				
				if none == Enum.AssetFetchStatus.Failure and var25 > 3 or none == Enum.AssetFetchStatus.TimedOut and var25 > 5 then break end
				p28:setState({ eagerRetrying = true })
			end
			return
		end
	end
	p28:setState({ eagerRetrying = false })
end

function loadableImage.getAssetFetchStatusStateKey(_, p31) --[[ line: 481 ]]
	return "assetFetchStatus_" .. tostring(p31)
end

function loadableImage.updateAssetFetchStatusForImageLoadIndex(value, p32, p33, _) --[[ line: 485 ]]
	value:setState({ [value:getAssetFetchStatusStateKey(p33)] = p32 })
end

function loadableImage.dropConnections(p34) --[[ line: 492 ]]
	if p34.listenForReloadsConnection then
		p34.listenForReloadsConnection:Disconnect()
		p34.listenForReloadsConnection = nil
	end
	if p34.awaitImageLoadedConnection then
		p34.awaitImageLoadedConnection:Disconnect()
		p34.awaitImageLoadedConnection = nil
	end
end

function loadableImage.loadImage(p35) --[[ line: 503 ]]
	-- upvalues: loadingStrategyModule (ref)
	local var26 = p35.currentImageLoadIndex + 1
	p35.currentImageLoadIndex = var26
	local imageUri = p35:getImageUri()
	local loadingStrategy = p35.props.loadingStrategy
	p35:dropConnections()
	
	if imageUri == nil then
		p35:updateAssetFetchStatusForImageLoadIndex(Enum.AssetFetchStatus.Success, var26, imageUri)
		p35:setState({ eagerRetrying = false })
		
		return
	end
	local var28 = p35.props.contentProvider:GetAssetFetchStatus(imageUri)
	p35:maybeReportCounter("InitialStatus", var28)
	p35:updateAssetFetchStatusForImageLoadIndex(var28, var26, imageUri)
	
	if p35.props.shouldHandleReloads then
		p35.listenForReloadsConnection = p35.props.contentProvider:GetAssetFetchStatusChangedSignal(imageUri):Connect(function(p36, _) --[[ line: 534 ]]
			-- upvalues: p35 (ref), var26 (ref), imageUri (ref)
			p35:maybeReportCounter("Reloads", p36)
			p35:updateAssetFetchStatusForImageLoadIndex(p36, var26, imageUri)
		end)
	end
	if loadingStrategy == loadingStrategyModule.Eager then
		task.spawn(function() --[[ line: 543 ]]
			-- upvalues: p35 (ref), var26 (ref)
			p35:preloadImageWithRetryLogic(var26)
		end)
		
		return
	elseif loadingStrategy == loadingStrategyModule.Default then
		p35:awaitImageLoaded(var26, var28)
	end
end

return function(p37) --[[ line: 551 ]]
	-- upvalues: roactModule (ref), contentProviderModule (ref), cryoModule (ref), loadableImage (ref)
	return roactModule.createElement(contentProviderModule.Consumer, {
		render = function(p38) --[[ line: 553 ]]
			-- upvalues: cryoModule (copy), p37 (ref), roactModule (copy), loadableImage (copy)
			return roactModule.createElement(loadableImage, cryoModule.Dictionary.join(p37, { contentProvider = p38 }))
		end
	})
end