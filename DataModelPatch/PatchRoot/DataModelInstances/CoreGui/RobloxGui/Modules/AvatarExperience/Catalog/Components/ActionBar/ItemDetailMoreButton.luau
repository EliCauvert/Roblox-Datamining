local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local _UDim2 = UDim2.new(0, 44, 0, 44)
local IconsMenuMoreOn = Images["icons/menu/more_on"]
local IconsMenuMoreOff = Images["icons/menu/more_off"]
local _UDim2_1 = UDim2.new(0, 37, 0, 37)
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
local _Rect = Rect.new(8, 8, 9, 9)
local ItemDetailMoreButton = RoactModule.PureComponent:extend("ItemDetailMoreButton")
local Interactable = UIBloxModule.Core.Control.Interactable
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
ItemDetailMoreButton.validateProps = TModule.strictInterface({
	NextSelectionRight = TModule.table,
	NextSelectionDown = TModule.optional(TModule.table),
	onActivated = TModule.callback,
	isSelected = TModule.optional(TModule.boolean),
	forwardRef = TModule.table,
	LayoutOrder = if FFlagAXMISEnableMultiShopping then TModule.optional(TModule.number) else nil
})

function ItemDetailMoreButton.init(p1)
	-- upvalues: RoactModule (copy)
	p1.isMounted = false
	p1.state = { isButtonPressed = false }
	
	function p1.onInputBegan()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ isButtonPressed = true })
			
			return
		end
	end
	
	function p1.onInputEnded()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ isButtonPressed = false })
			
			return
		end
	end
	
	p1.moreButtonRef = RoactModule.createRef()
end

function ItemDetailMoreButton.renderWithStyle(p1, p2, Callback)
	-- upvalues: IconsMenuMoreOn (copy), IconsMenuMoreOff (copy), RoactModule (copy), Focusable (copy), Interactable (copy), _UDim2 (copy), ComponentAssetsCircle17 (copy), _Rect (copy), FFlagAXMISEnableMultiShopping (copy), CursorKind (copy), ImageSetLabel (copy), _UDim2_1 (copy)
	local Theme = p2.Theme
	local IsSelected = p1.props.isSelected
	
	return RoactModule.createElement(Focusable[Interactable], {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = _UDim2,
		Image = ComponentAssetsCircle17,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = _Rect,
		ImageTransparency = if p1.state.isButtonPressed then Theme.Overlay.Transparency else Theme.BackgroundDefault.Transparency,
		ImageColor3 = Theme.BackgroundDefault.Color,
		LayoutOrder = if FFlagAXMISEnableMultiShopping then p1.props.LayoutOrder else 1,
		ClipsDescendants = false,
		[RoactModule.Event.Activated] = p1.props.onActivated,
		[RoactModule.Event.InputBegan] = p1.onInputBegan,
		[RoactModule.Event.InputEnded] = p1.onInputEnded,
		[RoactModule.Ref] = p1.moreButtonRef,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = p1.props.forwardRef,
		SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
	}, {
		Icon = RoactModule.createElement(ImageSetLabel, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = _UDim2_1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = if IsSelected then IconsMenuMoreOn else IconsMenuMoreOff,
			ImageTransparency = Theme.IconEmphasis.Transparency,
			ImageColor3 = Theme.IconEmphasis.Color
		})
	})
end

function ItemDetailMoreButton.didMount(p1)
	p1.isMounted = true
end

function ItemDetailMoreButton.willUnmount(p1)
	p1.isMounted = false
end

function ItemDetailMoreButton.render(p1)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithSelectionCursorProviderFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithStyle(p2, p3)
		end)
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), ItemDetailMoreButton (copy), CryoModule (copy)
	return RoactModule.createElement(ItemDetailMoreButton, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)