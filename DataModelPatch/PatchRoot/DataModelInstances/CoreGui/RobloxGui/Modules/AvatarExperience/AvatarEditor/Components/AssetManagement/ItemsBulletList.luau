local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local VerticalScrollViewWithMargin = UIBloxModule.App.Container.VerticalScrollViewWithMargin
local WithStyleFunction = UIBloxModule.Style.withStyle
local BulletListEntryModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.BulletListEntry)
local ItemsBulletList = RoactModule.PureComponent:extend("ItemsBulletList")
ItemsBulletList.validateProps = TModule.strictInterface({
	items = TModule.array(TModule.string),
	maxHeight = TModule.number,
	onScrollableUpdated = TModule.callback,
	forwardRef = TModule.table
})

function ItemsBulletList.init(p1)
	-- upvalues: RoactModule (copy)
	p1:setState({ canvasSizeY = 0 })
	p1.scrollViewRef = RoactModule.createRef()
	p1.topGradientVisibleBinding, p1.updateTopGradientVisibleBinding = RoactModule.createBinding(false)
	p1.bottomGradientVisibleBinding, p1.updateBottomGradientVisibleBinding = RoactModule.createBinding(false)
	
	function p1.checkIsScrollable()
		-- upvalues: p1 (copy)
		p1.props.onScrollableUpdated(p1.props.maxHeight < p1.state.canvasSizeY)
	end
	
	function p1.onContentSizeChanged(p2)
		-- upvalues: p1 (copy)
		if p1.state.canvasSizeY ~= p2.AbsoluteContentSize.Y then
			p1:setState({ canvasSizeY = p2.AbsoluteContentSize.Y })
		end
	end
	
	local ForwardRef = p1.props.forwardRef
	
	function p1.firstEntryPositionChanged(Frame)
		-- upvalues: ForwardRef (copy), p1 (copy)
		local Value = ForwardRef:getValue()
		
		if not Value then return end
		if Frame.AbsolutePosition.Y + 5 < Value.AbsolutePosition.Y then
			p1.updateTopGradientVisibleBinding(true)
			
			return
		else
			p1.updateTopGradientVisibleBinding(false)
		end
	end
	
	function p1.lastEntryPositionChanged(Frame: Frame)
		-- upvalues: ForwardRef (copy), p1 (copy)
		local Value = ForwardRef:getValue()
		
		if not Value then return end
		if Value.AbsolutePosition.Y + Value.AbsoluteSize.Y < Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y - 5 then
			p1.updateBottomGradientVisibleBinding(true)
			
			return
		else
			p1.updateBottomGradientVisibleBinding(false)
		end
	end
end

function ItemsBulletList.createBulletList(p1)
	-- upvalues: RoactModule (copy), BulletListEntryModule (copy)
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, 10),
			SortOrder = Enum.SortOrder.LayoutOrder,
			[RoactModule.Change.AbsoluteContentSize] = p1.onContentSizeChanged
		})
	}
	
	for LayoutOrder, item in p1.props.items do
		config[LayoutOrder] = RoactModule.createElement(BulletListEntryModule, {
			text = item,
			layoutOrder = LayoutOrder,
			positionChangedCallback = if LayoutOrder == 1 then p1.firstEntryPositionChanged elseif LayoutOrder == #p1.props.items then p1.lastEntryPositionChanged else nil
		})
	end
	return config
end

function ItemsBulletList.renderWithProviders(p2, p3)
	-- upvalues: RoactModule (copy), Focusable (copy), VerticalScrollViewWithMargin (copy)
	local Theme = p3.Theme
	
	return RoactModule.createElement(Focusable.Frame, {
		defaultChild = p2.scrollViewRef,
		restorePreviousChildFocus = true,
		Size = UDim2.new(1, 0, 0, (math.min(p2.state.canvasSizeY, p2.props.maxHeight))),
		BackgroundTransparency = 1,
		[RoactModule.Ref] = p2.props.forwardRef
	}, {
		TopGradient = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			Visible = p2.topGradientVisibleBinding,
			Size = UDim2.new(1, 0, 0, 30),
			Position = UDim2.fromScale(0, 0),
			BackgroundColor3 = Theme.BackgroundUIDefault.Color
		}, {
			UIGradient = RoactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		ScrollView = RoactModule.createElement(VerticalScrollViewWithMargin, {
			size = UDim2.fromScale(1, 1),
			canvasSizeY = UDim.new(0, p2.state.canvasSizeY),
			isGamepadFocusable = true,
			[RoactModule.Ref] = p2.scrollViewRef
		}, (p2:createBulletList())),
		BottomGradient = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			Visible = p2.bottomGradientVisibleBinding,
			Size = UDim2.new(1, 0, 0, 30),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = Theme.BackgroundUIDefault.Color
		}, {
			UIGradient = RoactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		})
	})
end

function ItemsBulletList.render(p2)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: p2 (copy)
		return p2:renderWithProviders(p3)
	end)
end

function ItemsBulletList.didMount(p2)
	p2.checkIsScrollable()
end

function ItemsBulletList.didUpdate(p2, p3, p4)
	local IsNotCanvasSizeYMatch = p2.state.canvasSizeY ~= p4.canvasSizeY
	
	if p2.props.maxHeight ~= p3.maxHeight or IsNotCanvasSizeYMatch then
		p2.checkIsScrollable()
	end
end

return RoactModule.forwardRef(function(p2, ForwardRef)
	-- upvalues: RoactModule (copy), ItemsBulletList (copy), CryoModule (copy)
	return RoactModule.createElement(ItemsBulletList, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)