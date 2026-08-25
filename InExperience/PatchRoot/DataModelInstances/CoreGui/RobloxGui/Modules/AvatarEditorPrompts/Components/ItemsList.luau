local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local skeleton = require(corePackagesService.Packages.Foundation).Skeleton
local verticalScrollViewWithMargin = UIBloxModule.App.Container.VerticalScrollViewWithMargin
local withStyle = UIBloxModule.Style.withStyle
local emptyState = UIBloxModule.App.Indicator.EmptyState
local listSectionModule = require(script.ListSection)
local parent = script.Parent.Parent
local getAssetsDifferenceModule = require(parent.GetAssetsDifference)
local addAnalyticsInfoModule = require(parent.Actions.AddAnalyticsInfo)
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local itemsList = roactModule.PureComponent:extend("ItemsList")
itemsList.validateProps = tModule.strictInterface({
	humanoidDescription = tModule.optional(tModule.instanceOf("HumanoidDescription")),
	loadingFailed = tModule.boolean,
	retryLoadDescription = tModule.callback,
	itemListScrollableUpdated = tModule.optional(tModule.callback),
	addAnalyticsInfo = tModule.callback
})

function itemsList.init(p0)
	-- upvalues: roactModule (ref), getAssetsDifferenceModule (ref)
	p0:setState({
		canvasSizeY = 0,
		loading = true,
		addedAssetNames = nil,
		removedAssetNames = nil
	})
	p0.mounted = false
	p0.frameRef = roactModule.createRef()
	local var12, var13 = roactModule.createBinding(false)
	p0.topGradientVisibleBinding = var12
	p0.updateTopGradientVisibleBinding = var13
	local var14, var15 = roactModule.createBinding(false)
	p0.bottomGradientVisibleBinding = var14
	p0.updateBottomGradientVisibleBinding = var15
	p0.addedSectionRef = roactModule.createRef()
	p0.removedSectionRef = roactModule.createRef()
	p0.noChangedAssetsRef = roactModule.createRef()
	p0.lastWasScrollable = nil
	
	function p0.checkIsScrollable()
		-- upvalues: p0 (ref)
		local value = p0.frameRef:getValue()
		
		if not value then return end
		if not p0.props.itemListScrollableUpdated then return end
		local var17 = value.AbsoluteSize.Y < p0.state.canvasSizeY
		
		if var17 ~= p0.lastWasScrollable then
			p0.lastWasScrollable = var17
			p0.props.itemListScrollableUpdated(var17, value.AbsoluteSize.Y)
		end
	end
	
	function p0.onContentSizeChanged(p1)
		-- upvalues: p0 (ref)
		p0:setState({ canvasSizeY = p1.AbsoluteContentSize.Y })
	end
	
	function p0.firstEntryPositionChanged(p2)
		-- upvalues: p0 (ref)
		local value = p0.frameRef:getValue()
		
		if not value then return end
		if p2.AbsolutePosition.Y < value.AbsolutePosition.Y then
			p0.updateTopGradientVisibleBinding(true)
			
			return
		end
		p0.updateTopGradientVisibleBinding(false)
	end
	
	function p0.lastEntryPositionChanged(p3)
		-- upvalues: p0 (ref)
		local value = p0.frameRef:getValue()
		
		if not value then return end
		if value.AbsolutePosition.Y + value.AbsoluteSize.Y < p3.AbsolutePosition.Y + p3.AbsoluteSize.Y then
			p0.updateBottomGradientVisibleBinding(true)
			
			return
		end
		p0.updateBottomGradientVisibleBinding(false)
	end
	
	function p0.loadAssetNames()
		-- upvalues: getAssetsDifferenceModule (copy), p0 (ref)
		coroutine.wrap(function()
			-- upvalues: getAssetsDifferenceModule (copy), p0 (copy)
			getAssetsDifferenceModule(p0.props.humanoidDescription):andThen(function(p4)
				-- upvalues: p0 (copy)
				if p0.mounted then
					p0.props.addAnalyticsInfo(p4.addedAssetIds, p4.removedAssetIds)
					p0:setState({
						loading = false,
						addedAssetNames = p4.addedNames,
						removedAssetNames = p4.removedNames
					})
				end
			end, function(_)
				-- upvalues: p0 (copy)
				if p0.mounted then
					p0:setState({ loading = false })
				end
			end)
		end)()
	end
	
	function p0.onRetryLoading()
		-- upvalues: p0 (ref)
		p0:setState({ loading = true })
		
		if p0.props.humanoidDescription then
			p0.loadAssetNames()
			
			return
		end
		p0.props.retryLoadDescription()
	end
end

function itemsList.createEntriesList(p5)
	-- upvalues: robloxTranslatorModule (ref), roactModule (ref), roactGamepadModule (ref), listSectionModule (ref)
	local t = {}
	
	if #p5.state.addedAssetNames > 0 then
		table.insert(t, roactModule.createElement(roactGamepadModule.Focusable[listSectionModule], {
			headerText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.Adding"),
			items = p5.state.addedAssetNames,
			layoutOrder = 1,
			isFirstSection = true,
			isLastSection = #p5.state.removedAssetNames == 0,
			NextSelectionDown = p5.removedSectionRef,
			[roactModule.Ref] = p5.addedSectionRef
		}))
		
		if #p5.state.removedAssetNames > 0 then
			table.insert(t, roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 20)
			}))
		end
	end
	if #p5.state.removedAssetNames > 0 then
		table.insert(t, roactModule.createElement(roactGamepadModule.Focusable[listSectionModule], {
			headerText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.Removing"),
			items = p5.state.removedAssetNames,
			layoutOrder = 3,
			isFirstSection = #p5.state.addedAssetNames == 0,
			isLastSection = true,
			NextSelectionUp = p5.addedSectionRef,
			[roactModule.Ref] = p5.removedSectionRef
		}))
	end
	if #p5.state.addedAssetNames == 0 and #p5.state.removedAssetNames == 0 then
		table.insert(t, roactModule.createElement(roactGamepadModule.Focusable[listSectionModule], {
			headerText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.NoChangedAssets"),
			items = {},
			layoutOrder = 1,
			isFirstSection = true,
			isLastSection = true,
			[roactModule.Ref] = p5.noChangedAssetsRef
		}))
	end
	return t
end

function itemsList.renderItemsList(p6)
	-- upvalues: withStyle (ref), roactModule (ref), roactGamepadModule (ref), verticalScrollViewWithMargin (ref)
	return withStyle(function(p7)
		-- upvalues: p6 (ref), roactModule (copy), roactGamepadModule (copy), verticalScrollViewWithMargin (copy)
		local theme = p7.Theme
		local var21 = p6:createEntriesList()
		var21.Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, 10),
			SortOrder = Enum.SortOrder.LayoutOrder,
			[roactModule.Change.AbsoluteContentSize] = p6.onContentSizeChanged
		})
		
		return roactModule.createElement(roactGamepadModule.Focusable.Frame, {
			defaultChild = p6.addedSectionRef,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[roactModule.Ref] = p6.frameRef
		}, {
			TopGradient = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				Visible = p6.topGradientVisibleBinding,
				Size = UDim2.new(1, 0, 0, 30),
				Position = UDim2.fromScale(0, 0),
				BackgroundColor3 = Color3.new(1, 1, 1)
			}, {
				UIGradient = roactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, theme.BackgroundUIDefault.Color),
						ColorSequenceKeypoint.new(1, theme.BackgroundUIDefault.Color)
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			}),
			ScrollView = roactModule.createElement(verticalScrollViewWithMargin, {
				size = UDim2.fromScale(1, 1),
				canvasSizeY = UDim.new(0, p6.state.canvasSizeY)
			}, var21),
			BottomGradient = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				Visible = p6.bottomGradientVisibleBinding,
				Size = UDim2.new(1, 0, 0, 30),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = Color3.new(1, 1, 1)
			}, {
				UIGradient = roactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, theme.BackgroundUIDefault.Color),
						ColorSequenceKeypoint.new(1, theme.BackgroundUIDefault.Color)
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(1, 0)
					})
				})
			})
		})
	end)
end

function itemsList.renderLoading(_)
	-- upvalues: roactModule (ref), skeleton (ref)
	return roactModule.createElement(skeleton, {
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end

function itemsList.renderFailed(p8)
	-- upvalues: roactModule (ref), emptyState (ref), robloxTranslatorModule (ref)
	return roactModule.createElement(emptyState, {
		text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"),
		size = UDim2.fromScale(1, 1),
		onActivated = p8.onRetryLoading
	})
end

function itemsList.render(p9)
	return if p9.state.loading and not p9.props.loadingFailed then p9:renderLoading() elseif p9.state.addedAssetNames then p9:renderItemsList() else p9:renderFailed()
end

function itemsList.didMount(p10)
	p10.mounted = true
	
	if p10.props.humanoidDescription then
		p10.loadAssetNames()
	end
	p10.checkIsScrollable()
end

function itemsList.didUpdate(p11, p12, _)
	-- upvalues: roactModule (ref)
	p11.checkIsScrollable()
	
	if p12.humanoidDescription ~= p11.props.humanoidDescription then
		p11:setState({
			loading = true,
			addedAssetNames = roactModule.None,
			removedAssetNames = roactModule.None
		})
		p11.loadAssetNames()
	end
end

function itemsList.willUnmount(p13)
	p13.mounted = false
end

return roactRoduxModule.connect(nil, function(p14)
	-- upvalues: addAnalyticsInfoModule (ref)
	return {
		addAnalyticsInfo = function(p15)
			-- upvalues: p14 (ref), addAnalyticsInfoModule (copy)
			return p14(addAnalyticsInfoModule(p15))
		end
	}
end)(itemsList)