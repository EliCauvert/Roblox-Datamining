local ContentProvider = game:GetService("ContentProvider")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local ShimmerAnimationModule = require(Modules.LuaApp.Components.ShimmerAnimation)
local ThemeContextDEPRECATEDModule = require(Modules.LuaApp.ThemeContext_DEPRECATED)
local Decal = Instance.new("Decal")
local t = {}
local LoadableImage = RoactModule.PureComponent:extend("LoadableImage")
LoadableImage.defaultProps = {
	useShimmerAnimationWhileLoading = false,
	ScaleType = Enum.ScaleType.Stretch
}

function LoadableImage.init(p1)
	-- upvalues: t (copy)
	p1.state = { loaded = t[p1.props.Image] }
	p1._isMounted = false
end

function LoadableImage.render(p1)
	-- upvalues: RoactModule (copy), ThemeContextDEPRECATEDModule (copy), ShimmerAnimationModule (copy)
	local Size = p1.props.Size
	local Position = p1.props.Position
	local BorderSizePixel = p1.props.BorderSizePixel
	local BackgroundColor3 = p1.props.BackgroundColor3
	local BackgroundTransparency = p1.props.BackgroundTransparency
	local ImageTransparency = p1.props.ImageTransparency
	local ScaleType = p1.props.ScaleType
	local ZIndex = p1.props.ZIndex
	local Image = p1.props.Image
	local LoadingImage = p1.props.loadingImage
	local UseShimmerAnimationWhileLoading = p1.props.useShimmerAnimationWhileLoading
	local Loaded = p1.state.loaded
	
	return if Loaded or not UseShimmerAnimationWhileLoading then RoactModule.createElement("ImageLabel", {
		Position = Position,
		BorderSizePixel = BorderSizePixel,
		BackgroundColor3 = BackgroundColor3,
		BackgroundTransparency = BackgroundTransparency,
		ImageTransparency = ImageTransparency,
		ScaleType = ScaleType,
		ZIndex = ZIndex,
		Size = Size,
		Image = Loaded and Image or LoadingImage
	}) else RoactModule.createElement(ThemeContextDEPRECATEDModule.Consumer, {
		render = function(p2)
			-- upvalues: RoactModule (upval), Position (copy), BorderSizePixel (copy), ZIndex (copy), Size (copy), ShimmerAnimationModule (upval)
			local ShimmerPanel = p2.ShimmerPanel
			
			return RoactModule.createElement("Frame", {
				Position = Position,
				BorderSizePixel = BorderSizePixel,
				BackgroundColor3 = ShimmerPanel.Color,
				BackgroundTransparency = ShimmerPanel.Transparency,
				ZIndex = ZIndex,
				Size = Size
			}, {
				Shimmer = RoactModule.createElement(ShimmerAnimationModule, { Size = UDim2.new(1, 0, 1, 0) })
			})
		end
	})
end

function LoadableImage:shouldLoadImage(Image): boolean
	-- upvalues: t (copy)
	return Image ~= nil and (Image ~= "" and not t[Image])
end

function LoadableImage.didUpdate(p1, p2)
	if p2.Image ~= p1.props.Image then
		p1:_loadImage()
	end
end

function LoadableImage.didMount(p1)
	p1._isMounted = true
	p1:_loadImage()
end

function LoadableImage.willUnmount(p1)
	p1._isMounted = false
end

function LoadableImage._loadImage(p1)
	-- upvalues: t (copy), Decal (copy), ContentProvider (copy)
	local Image = p1.props.Image
	
	if p1:shouldLoadImage(Image) then
		if p1.state.loaded then
			p1:setState({ loaded = false })
		end
		spawn(function()
			-- upvalues: Decal (upval), Image (copy), ContentProvider (upval), t (upval), p1 (copy)
			Decal.Texture = Image
			ContentProvider:PreloadAsync({ Decal })
			t[Image] = true
			
			if p1._isMounted then
				p1:setState({ loaded = true })
				
				if p1.props.onLoaded then
					p1.props.onLoaded()
				end
			end
		end)
		
		return
	elseif t[Image] and not p1.state.loaded then
		p1:setState({ loaded = true })
	end
end

function LoadableImage._mockPreloadDone(Key)
	-- upvalues: t (copy)
	t[Key] = true
end

function LoadableImage.isLoaded(None): boolean
	-- upvalues: RoactModule (copy), t (copy)
	return None ~= RoactModule.None and None ~= nil and None ~= "" and t[None] ~= nil
end

return LoadableImage