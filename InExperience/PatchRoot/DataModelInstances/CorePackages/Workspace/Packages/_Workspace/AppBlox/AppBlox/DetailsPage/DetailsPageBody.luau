local parent = script:FindFirstAncestor("AppBlox").Parent
local contentPositionModule = require(script.Parent.ContentPosition)
local validateDetailsPageComponentListModule = require(script.Parent.validateDetailsPageComponentList)
local getPlatformConfigModule = require(script.Parent.getPlatformConfig)
local detailsPageTitleContentModule = require(script.Parent.DetailsPageTitleContent)
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
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

function detailsPageBody.init(p1)
	-- upvalues: roactModule (ref)
	p1.state = { containerWidth = nil }
	p1.containerFrameRef = roactModule.createRef()
	p1.mounted = false
	
	function p0.onContainerSizeChange(p2)
		-- upvalues: p1 (ref)
		if p1.mounted then
			p1:setState(function(p3, _)
				-- upvalues: p2 (ref)
				return if p3.containerWidth == p2.AbsoluteSize.x then nil else { containerWidth = p2.AbsoluteSize.x }
			end)
			
			return
		end
	end
end

function detailsPageBody.renderSinglePanel(p1)
	-- upvalues: roactModule (ref)
	local t = {
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 24)
		}),
		UISizeConstraint = if p1.props.maxContentWidth then roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.props.maxContentWidth, 1e999) }) else nil
	}
	
	for i, v in pairs(p1.props.componentList) do
		t[i .. "Container"] = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = v.portraitLayoutOrder,
			ZIndex = v.portraitZIndex
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

function detailsPageBody.renderDualPanel(p2)
	-- upvalues: roactModule (ref), contentPositionModule (ref)
	local var1 = if p2.state.containerWidth < 1920 then 48 else 96
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
	
	for i, v in pairs(p2.props.componentList) do
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
			Padding = UDim.new(0, var1)
		}),
		LeftPanel = roactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0.5, -var1 / 2, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, t),
		RightPanel = roactModule.createElement("Frame", {
			ClipsDescendants = false,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0.5, -var1 / 2, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, t_1)
	}
end

function detailsPageBody.renderBodyContent(p3)
	return if not (not p3.state.containerWidth or not p3.props.componentList) then if p3.state.containerWidth < (p3.props.dualPanelBreakpoint or 1280) then p3:renderSinglePanel() else p3:renderDualPanel() else {}
end

function detailsPageBody.render(p3)
	-- upvalues: getPlatformConfigModule (ref), roactModule (ref), detailsPageTitleContentModule (ref)
	local var2 = if p3.props.sideMargin then p3.props.sideMargin else getPlatformConfigModule(p3.props.deviceType).sideMargin
	
	return roactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = p3.props.bodyClipsDescendants,
		AutomaticSize = Enum.AutomaticSize.Y,
		[roactModule.Ref] = p3.containerFrameRef,
		[roactModule.Change.AbsoluteSize] = p3.onContainerSizeChange
	}, {
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		}),
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var2),
			PaddingRight = UDim.new(0, var2)
		}),
		TitleInfo = p3.props.showPageDetails and roactModule.createElement(detailsPageTitleContentModule, {
			layoutOrder = 1,
			titleText = p3.props.titleText,
			subTitleText = p3.props.subTitleText,
			renderInfoContent = p3.props.renderInfoContent,
			verticalAlignment = Enum.VerticalAlignment.Top
		} or nil),
		Padding = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, if not p3.props.showPageDetails then 24 else var2)
		}),
		ContentFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, p3:renderBodyContent()),
		BottomPadding = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, p3.props.bottomPadding or 3 * var2)
		})
	})
end

function detailsPageBody.didMount(p3)
	p3.mounted = true
	
	if p3.containerFrameRef.current then
		p3.onContainerSizeChange(p3.containerFrameRef.current)
	end
end

function detailsPageBody.willUnmount(p3)
	p3.mounted = false
end

return detailsPageBody