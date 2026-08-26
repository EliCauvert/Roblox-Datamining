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

function itemsList.init(p1)
	-- upvalues: roactModule (ref), getAssetsDifferenceModule (ref)
	p1:setState({
		canvasSizeY = 0,
		loading = true,
		addedAssetNames = nil,
		removedAssetNames = nil
	})
	p1.mounted = false
	p1.frameRef = roactModule.createRef()
	local var1, var2 = roactModule.createBinding(false)
	p1.topGradientVisibleBinding = var1
	p1.updateTopGradientVisibleBinding = var2
	local var3, var4 = roactModule.createBinding(false)
	p1.bottomGradientVisibleBinding = var3
	p1.updateBottomGradientVisibleBinding = var4
	p1.addedSectionRef = roactModule.createRef()
	p1.removedSectionRef = roactModule.createRef()
	p1.noChangedAssetsRef = roactModule.createRef()
	p1.lastWasScrollable = nil
	
	function p0.checkIsScrollable()
		-- upvalues: p1 (ref)
		local value = p1.frameRef:getValue()
		
		if not value then return end
		if not p1.props.itemListScrollableUpdated then return end
		local var5 = value.AbsoluteSize.Y < p1.state.canvasSizeY
		
		if var5 ~= p1.lastWasScrollable then
			p1.lastWasScrollable = var5
			p1.props.itemListScrollableUpdated(var5, value.AbsoluteSize.Y)
		end
	end
	
	function p0.onContentSizeChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ canvasSizeY = p2.AbsoluteContentSize.Y })
	end
	
	function p0.firstEntryPositionChanged(p2)
		-- upvalues: p1 (ref)
		local value = p1.frameRef:getValue()
		
		if not value then return end
		if p2.AbsolutePosition.Y < value.AbsolutePosition.Y then
			p1.updateTopGradientVisibleBinding(true)
			
			return
		end
		p1.updateTopGradientVisibleBinding(false)
	end
	
	function p0.lastEntryPositionChanged(p2)
		-- upvalues: p1 (ref)
		local value = p1.frameRef:getValue()
		
		if not value then return end
		if value.AbsolutePosition.Y + value.AbsoluteSize.Y < p2.AbsolutePosition.Y + p2.AbsoluteSize.Y then
			p1.updateBottomGradientVisibleBinding(true)
			
			return
		end
		p1.updateBottomGradientVisibleBinding(false)
	end
	
	function p0.loadAssetNames()
		-- upvalues: getAssetsDifferenceModule (copy), p1 (ref)
		coroutine.wrap(function()
			-- upvalues: getAssetsDifferenceModule (copy), p1 (copy)
			getAssetsDifferenceModule(p1.props.humanoidDescription):andThen(function(p2)
				-- upvalues: p1 (copy)
				if p1.mounted then
					p1.props.addAnalyticsInfo(p2.addedAssetIds, p2.removedAssetIds)
					p1:setState({
						loading = false,
						addedAssetNames = p2.addedNames,
						removedAssetNames = p2.removedNames
					})
				end
			end, function(_)
				-- upvalues: p1 (copy)
				if p1.mounted then
					p1:setState({ loading = false })
				end
			end)
		end)()
	end
	
	function p0.onRetryLoading()
		-- upvalues: p1 (ref)
		p1:setState({ loading = true })
		
		if p1.props.humanoidDescription then
			p1.loadAssetNames()
			
			return
		end
		p1.props.retryLoadDescription()
	end
end

function itemsList.createEntriesList(p1)
	-- upvalues: robloxTranslatorModule (ref), roactModule (ref), roactGamepadModule (ref), listSectionModule (ref)
	local t = {}
	
	if #p1.state.addedAssetNames > 0 then
		table.insert(t, roactModule.createElement(roactGamepadModule.Focusable[listSectionModule], {
			headerText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.Adding"),
			items = p1.state.addedAssetNames,
			layoutOrder = 1,
			isFirstSection = true,
			isLastSection = #p1.state.removedAssetNames == 0,
			NextSelectionDown = p1.removedSectionRef,
			[roactModule.Ref] = p1.addedSectionRef
		}))
		
		if #p1.state.removedAssetNames > 0 then
			table.insert(t, roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 20)
			}))
		end
	end
	if #p1.state.removedAssetNames > 0 then
		table.insert(t, roactModule.createElement(roactGamepadModule.Focusable[listSectionModule], {
			headerText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.Removing"),
			items = p1.state.removedAssetNames,
			layoutOrder = 3,
			isFirstSection = #p1.state.addedAssetNames == 0,
			isLastSection = true,
			NextSelectionUp = p1.addedSectionRef,
			[roactModule.Ref] = p1.removedSectionRef
		}))
	end
	if #p1.state.addedAssetNames == 0 and #p1.state.removedAssetNames == 0 then
		table.insert(t, roactModule.createElement(roactGamepadModule.Focusable[listSectionModule], {
			headerText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.NoChangedAssets"),
			items = {},
			layoutOrder = 1,
			isFirstSection = true,
			isLastSection = true,
			[roactModule.Ref] = p1.noChangedAssetsRef
		}))
	end
	return t
end

function itemsList.renderItemsList(p1)
	-- upvalues: withStyle (ref), roactModule (ref), roactGamepadModule (ref), verticalScrollViewWithMargin (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), roactGamepadModule (copy), verticalScrollViewWithMargin (copy)
		local theme = p2.Theme
		local var1 = p1:createEntriesList()
		var1.Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, 10),
			SortOrder = Enum.SortOrder.LayoutOrder,
			[roactModule.Change.AbsoluteContentSize] = p1.onContentSizeChanged
		})
		
		return roactModule.createElement(roactGamepadModule.Focusable.Frame, {
			defaultChild = p1.addedSectionRef,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[roactModule.Ref] = p1.frameRef
		}, {
			TopGradient = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				Visible = p1.topGradientVisibleBinding,
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
				canvasSizeY = UDim.new(0, p1.state.canvasSizeY)
			}, var1),
			BottomGradient = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				Visible = p1.bottomGradientVisibleBinding,
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

function itemsList.renderFailed(p1)
	-- upvalues: roactModule (ref), emptyState (ref), robloxTranslatorModule (ref)
	return roactModule.createElement(emptyState, {
		text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"),
		size = UDim2.fromScale(1, 1),
		onActivated = p1.onRetryLoading
	})
end

function itemsList.render(p1)
	return if p1.state.loading and not p1.props.loadingFailed then p1:renderLoading() elseif p1.state.addedAssetNames then p1:renderItemsList() else p1:renderFailed()
end

function itemsList.didMount(p1)
	p1.mounted = true
	
	if p1.props.humanoidDescription then
		p1.loadAssetNames()
	end
	p1.checkIsScrollable()
end

function itemsList.didUpdate(p1, p2, _)
	-- upvalues: roactModule (ref)
	p1.checkIsScrollable()
	
	if p2.humanoidDescription ~= p1.props.humanoidDescription then
		p1:setState({
			loading = true,
			addedAssetNames = roactModule.None,
			removedAssetNames = roactModule.None
		})
		p1.loadAssetNames()
	end
end

function itemsList.willUnmount(p1)
	p1.mounted = false
end

return roactRoduxModule.connect(nil, function(p1)
	-- upvalues: addAnalyticsInfoModule (ref)
	return {
		addAnalyticsInfo = function(p2)
			-- upvalues: p1 (ref), addAnalyticsInfoModule (copy)
			return p1(addAnalyticsInfoModule(p2))
		end
	}
end)(itemsList)