local parent = script:FindFirstAncestor("AppBlox").Parent
local contentPositionModule = require(script.Parent.ContentPosition)
local validateDetailsPageComponentListModule = require(script.Parent.validateDetailsPageComponentList)
local getPlatformConfigModule = require(script.Parent.getPlatformConfig)
local detailsPageTitleContentModule = require(script.Parent.DetailsPageTitleContent)
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local fFlagLuaAppFixEdpRecommendedCarouselHoverZIndex = require(parent.SharedFlags).FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex
local detailsPageBody = roactModule.PureComponent:extend("DetailsPageBody")
detailsPageBody.validateProps = tModule.strictInterface({
	titleText = tModule.optional(tModule.string),
	subTitleText = tModule.optional(tModule.string),
	renderInfoContent = tModule.optional(tModule.callback),
	componentList = tModule.optional(validateDetailsPageComponentListModule),
	dualPanelBreakpoint = tModule.optional(tModule.number),
	sideMargin = tModule.optional(tModule.number),
	bodyClipsDescendants = tModule.optional(tModule.boolean),
	maxContentWidth = tModule.optional(tModule.number),
	showPageDetails = tModule.optional(tModule.boolean),
	deviceType = tModule.optional(tModule.string),
	bottomPadding = tModule.optional(tModule.number)
})
detailsPageBody.defaultProps = { bodyClipsDescendants = true, showPageDetails = false }

function detailsPageBody.init(p0)
	-- upvalues: roactModule (ref)
	p0.state = { containerWidth = nil }
	p0.containerFrameRef = roactModule.createRef()
	p0.mounted = false
	
	function p0.onContainerSizeChange(p1)
		-- upvalues: p0 (ref)
		if p0.mounted then
			p0:setState(function(p2, _)
				-- upvalues: p1 (ref)
				return if p2.containerWidth == p1.AbsoluteSize.x then nil else { containerWidth = p1.AbsoluteSize.x }
			end)
			
			return
		end
	end
end

function detailsPageBody.renderSinglePanel(p3)
	-- upvalues: roactModule (ref), fFlagLuaAppFixEdpRecommendedCarouselHoverZIndex (ref)
	local t = {
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 24)
		}),
		UISizeConstraint = if p3.props.maxContentWidth then roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p3.props.maxContentWidth, 1e999) }) else nil
	}
	
	for i, v in pairs(p3.props.componentList) do
		t[i .. "Container"] = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = v.portraitLayoutOrder,
			ZIndex = if fFlagLuaAppFixEdpRecommendedCarouselHoverZIndex then v.portraitZIndex else nil
		}, { [i] = v.renderComponent() })
	end
	return {
		Panel = roactModule.createElement("Frame", {
			ClipsDescendants = false,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, t)
	}
end

function detailsPageBody.renderDualPanel(p4)
	-- upvalues: roactModule (ref), contentPositionModule (ref)
	local var8 = if p4.state.containerWidth < 1920 then 48 else 96
	local t = {
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 24)
		})
	}
	local t_1 = {
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 24)
		})
	}
	
	for i, v in pairs(p4.props.componentList) do
		(if v.landscapePosition == contentPositionModule.Right then t_1 else t)[i .. "Container"] = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = v.landscapeLayoutOrder
		}, { [i] = v.renderComponent() })
	end
	return {
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, var8)
		}),
		LeftPanel = roactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0.5, -var8 / 2, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, t),
		RightPanel = roactModule.createElement("Frame", {
			ClipsDescendants = false,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0.5, -var8 / 2, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, t_1)
	}
end

function detailsPageBody.renderBodyContent(p5)
	return if not (not p5.state.containerWidth or not p5.props.componentList) then if p5.state.containerWidth < (p5.props.dualPanelBreakpoint or 1280) then p5:renderSinglePanel() else p5:renderDualPanel() else {}
end

function detailsPageBody.render(p6)
	-- upvalues: getPlatformConfigModule (ref), roactModule (ref), detailsPageTitleContentModule (ref)
	local var11 = if p6.props.sideMargin then p6.props.sideMargin else getPlatformConfigModule(p6.props.deviceType).sideMargin
	
	return roactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = p6.props.bodyClipsDescendants,
		AutomaticSize = Enum.AutomaticSize.Y,
		[roactModule.Ref] = p6.containerFrameRef,
		[roactModule.Change.AbsoluteSize] = p6.onContainerSizeChange
	}, {
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		}),
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var11),
			PaddingRight = UDim.new(0, var11)
		}),
		TitleInfo = p6.props.showPageDetails and roactModule.createElement(detailsPageTitleContentModule, {
			layoutOrder = 1,
			titleText = p6.props.titleText,
			subTitleText = p6.props.subTitleText,
			renderInfoContent = p6.props.renderInfoContent,
			verticalAlignment = Enum.VerticalAlignment.Top
		} or nil),
		Padding = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, if not p6.props.showPageDetails then 24 else var11)
		}),
		ContentFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, p6:renderBodyContent()),
		BottomPadding = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, p6.props.bottomPadding or 3 * var11)
		})
	})
end

function detailsPageBody.didMount(p7)
	p7.mounted = true
	
	if p7.containerFrameRef.current then
		p7.onContainerSizeChange(p7.containerFrameRef.current)
	end
end

function detailsPageBody.willUnmount(p8)
	p8.mounted = false
end

return detailsPageBody