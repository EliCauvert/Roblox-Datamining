local Parent = script:FindFirstAncestor("AppBlox").Parent
local ContentPositionModule = require(script.Parent.ContentPosition)
local GetPlatformConfigModule = require(script.Parent.getPlatformConfig)
local DetailsPageTitleContentModule = require(script.Parent.DetailsPageTitleContent)
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex = require(Parent.SharedFlags).FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex
local DetailsPageBody = RoactModule.PureComponent:extend("DetailsPageBody")
DetailsPageBody.validateProps = TModule.strictInterface({
	titleText = TModule.optional(TModule.string),
	subTitleText = TModule.optional(TModule.string),
	renderInfoContent = TModule.optional(TModule.callback),
	componentList = TModule.optional((require(script.Parent.validateDetailsPageComponentList))),
	dualPanelBreakpoint = TModule.optional(TModule.number),
	sideMargin = TModule.optional(TModule.number),
	bodyClipsDescendants = TModule.optional(TModule.boolean),
	maxContentWidth = TModule.optional(TModule.number),
	showPageDetails = TModule.optional(TModule.boolean),
	deviceType = TModule.optional(TModule.string),
	bottomPadding = TModule.optional(TModule.number)
})
DetailsPageBody.defaultProps = { bodyClipsDescendants = true, showPageDetails = false }

function DetailsPageBody.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { containerWidth = nil }
	p1.containerFrameRef = RoactModule.createRef()
	p1.mounted = false
	
	function p1.onContainerSizeChange(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.mounted then
			p1:setState(function(p2, _)
				-- upvalues: Frame (copy)
				return if p2.containerWidth == Frame.AbsoluteSize.x then nil else { containerWidth = Frame.AbsoluteSize.x }
			end)
			
			return
		end
	end
end

function DetailsPageBody.renderSinglePanel(p1)
	-- upvalues: RoactModule (copy), FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex (copy)
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 24)
		}),
		UISizeConstraint = if p1.props.maxContentWidth then RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.props.maxContentWidth, 1e999) }) else nil
	}
	
	for i, value in pairs(p1.props.componentList) do
		config[i .. "Container"] = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = value.portraitLayoutOrder,
			ZIndex = if FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex then value.portraitZIndex else nil
		}, { [i] = value.renderComponent() })
	end
	return {
		Panel = RoactModule.createElement("Frame", {
			ClipsDescendants = false,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, config)
	}
end

function DetailsPageBody.renderDualPanel(p2)
	-- upvalues: RoactModule (copy), ContentPositionModule (copy)
	local Offset: number = if p2.state.containerWidth < 1920 then 48 else 96
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 24)
		})
	}
	local config1 = {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 24)
		})
	}
	
	for i, value in pairs(p2.props.componentList) do
		(if value.landscapePosition == ContentPositionModule.Right then config1 else config)[i .. "Container"] = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = value.landscapeLayoutOrder
		}, { [i] = value.renderComponent() })
	end
	return {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, Offset)
		}),
		LeftPanel = RoactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0.5, -Offset / 2, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, config),
		RightPanel = RoactModule.createElement("Frame", {
			ClipsDescendants = false,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0.5, -Offset / 2, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, config1)
	}
end

function DetailsPageBody.renderBodyContent(p3)
	local DualPanelBreakpoint = p3.props.dualPanelBreakpoint or 1280
	
	return if p3.state.containerWidth and p3.props.componentList then if p3.state.containerWidth < DualPanelBreakpoint then p3:renderSinglePanel() else p3:renderDualPanel() else {}
end

function DetailsPageBody.render(p3)
	-- upvalues: GetPlatformConfigModule (copy), RoactModule (copy), DetailsPageTitleContentModule (copy)
	local PlatformConfigModule = GetPlatformConfigModule(p3.props.deviceType)
	local SideMargin = if p3.props.sideMargin then p3.props.sideMargin else PlatformConfigModule.sideMargin
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = p3.props.bodyClipsDescendants,
		AutomaticSize = Enum.AutomaticSize.Y,
		[RoactModule.Ref] = p3.containerFrameRef,
		[RoactModule.Change.AbsoluteSize] = p3.onContainerSizeChange
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		}),
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SideMargin),
			PaddingRight = UDim.new(0, SideMargin)
		}),
		TitleInfo = p3.props.showPageDetails and RoactModule.createElement(DetailsPageTitleContentModule, {
			layoutOrder = 1,
			titleText = p3.props.titleText,
			subTitleText = p3.props.subTitleText,
			renderInfoContent = p3.props.renderInfoContent,
			verticalAlignment = Enum.VerticalAlignment.Top
		} or nil),
		Padding = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, if p3.props.showPageDetails then SideMargin else 24)
		}),
		ContentFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, p3:renderBodyContent()),
		BottomPadding = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, p3.props.bottomPadding or 3 * SideMargin)
		})
	})
end

function DetailsPageBody.didMount(p3)
	p3.mounted = true
	
	if p3.containerFrameRef.current then
		p3.onContainerSizeChange(p3.containerFrameRef.current)
	end
end

function DetailsPageBody.willUnmount(p3)
	p3.mounted = false
end

return DetailsPageBody