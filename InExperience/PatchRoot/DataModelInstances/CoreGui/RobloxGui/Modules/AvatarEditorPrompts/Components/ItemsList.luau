local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local VerticalScrollViewWithMargin = UIBloxModule.App.Container.VerticalScrollViewWithMargin
local WithStyleFunction = UIBloxModule.Style.withStyle
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local ListSectionModule = require(script.ListSection)
local Parent = script.Parent.Parent
local GetAssetsDifferenceModule = require(Parent.GetAssetsDifference)
local AddAnalyticsInfoModule = require(Parent.Actions.AddAnalyticsInfo)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ItemsList = RoactModule.PureComponent:extend("ItemsList")
ItemsList.validateProps = TModule.strictInterface({
	humanoidDescription = TModule.optional(TModule.instanceOf("HumanoidDescription")),
	loadingFailed = TModule.boolean,
	retryLoadDescription = TModule.callback,
	itemListScrollableUpdated = TModule.optional(TModule.callback),
	addAnalyticsInfo = TModule.callback
})

function ItemsList.init(p1) --[[ Line: 42 ]]
	-- upvalues: RoactModule (copy), GetAssetsDifferenceModule (copy)
	p1:setState({
		canvasSizeY = 0,
		loading = true,
		addedAssetNames = nil,
		removedAssetNames = nil
	})
	p1.mounted = false
	p1.frameRef = RoactModule.createRef()
	p1.topGradientVisibleBinding, p1.updateTopGradientVisibleBinding = RoactModule.createBinding(false)
	p1.bottomGradientVisibleBinding, p1.updateBottomGradientVisibleBinding = RoactModule.createBinding(false)
	p1.addedSectionRef = RoactModule.createRef()
	p1.removedSectionRef = RoactModule.createRef()
	p1.noChangedAssetsRef = RoactModule.createRef()
	p1.lastWasScrollable = nil
	
	function p1.checkIsScrollable() --[[ Line: 61 ]]
		-- upvalues: p1 (copy)
		local Value = p1.frameRef:getValue()
		
		if not Value then return end
		if not p1.props.itemListScrollableUpdated then return end
		local IsCanvasSizeYAbove = p1.state.canvasSizeY > Value.AbsoluteSize.Y
		
		if IsCanvasSizeYAbove ~= p1.lastWasScrollable then
			p1.lastWasScrollable = IsCanvasSizeYAbove
			p1.props.itemListScrollableUpdated(IsCanvasSizeYAbove, Value.AbsoluteSize.Y)
		end
	end
	
	function p1.onContentSizeChanged(p2) --[[ Line: 79 ]]
		-- upvalues: p1 (copy)
		p1:setState({ canvasSizeY = p2.AbsoluteContentSize.Y })
	end
	
	function p1.firstEntryPositionChanged(Frame) --[[ Line: 85 ]]
		-- upvalues: p1 (copy)
		local Value = p1.frameRef:getValue()
		
		if not Value then return end
		if Frame.AbsolutePosition.Y < Value.AbsolutePosition.Y then
			p1.updateTopGradientVisibleBinding(true)
			
			return
		else
			p1.updateTopGradientVisibleBinding(false)
		end
	end
	
	function p1.lastEntryPositionChanged(Frame: Frame) --[[ Line: 98 ]]
		-- upvalues: p1 (copy)
		local Value = p1.frameRef:getValue()
		
		if not Value then return end
		if Value.AbsolutePosition.Y + Value.AbsoluteSize.Y < Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y then
			p1.updateBottomGradientVisibleBinding(true)
			
			return
		else
			p1.updateBottomGradientVisibleBinding(false)
		end
	end
	
	function p1.loadAssetNames() --[[ Line: 113 ]]
		-- upvalues: GetAssetsDifferenceModule (upval), p1 (copy)
		coroutine.wrap(function() --[[ Line: 114 ]]
			-- upvalues: GetAssetsDifferenceModule (upval), p1 (upval)
			GetAssetsDifferenceModule(p1.props.humanoidDescription):andThen(function(Result) --[[ Line: 115 ]]
				-- upvalues: p1 (upval)
				if p1.mounted then
					p1.props.addAnalyticsInfo(Result.addedAssetIds, Result.removedAssetIds)
					p1:setState({
						loading = false,
						addedAssetNames = Result.addedNames,
						removedAssetNames = Result.removedNames
					})
				end
			end, function(_) --[[ Line: 125 ]]
				-- upvalues: p1 (upval)
				if p1.mounted then
					p1:setState({ loading = false })
				end
			end)
		end)()
	end
	
	function p1.onRetryLoading() --[[ Line: 135 ]]
		-- upvalues: p1 (copy)
		p1:setState({ loading = true })
		
		if p1.props.humanoidDescription then
			p1.loadAssetNames()
			
			return
		else
			p1.props.retryLoadDescription()
		end
	end
end

function ItemsList.createEntriesList(p1) --[[ Line: 148 ]]
	-- upvalues: RobloxTranslatorModule (copy), RoactModule (copy), RoactGamepadModule (copy), ListSectionModule (copy)
	local List = {}
	
	if #p1.state.addedAssetNames > 0 then
		table.insert(List, RoactModule.createElement(RoactGamepadModule.Focusable[ListSectionModule], {
			headerText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.Adding"),
			items = p1.state.addedAssetNames,
			layoutOrder = 1,
			isFirstSection = true,
			isLastSection = #p1.state.removedAssetNames == 0,
			NextSelectionDown = p1.removedSectionRef,
			[RoactModule.Ref] = p1.addedSectionRef
		}))
		
		if #p1.state.removedAssetNames > 0 then
			table.insert(List, RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 20)
			}))
		end
	end
	if #p1.state.removedAssetNames > 0 then
		table.insert(List, RoactModule.createElement(RoactGamepadModule.Focusable[ListSectionModule], {
			headerText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.Removing"),
			items = p1.state.removedAssetNames,
			layoutOrder = 3,
			isFirstSection = #p1.state.addedAssetNames == 0,
			isLastSection = true,
			NextSelectionUp = p1.addedSectionRef,
			[RoactModule.Ref] = p1.removedSectionRef
		}))
	end
	if #p1.state.addedAssetNames == 0 and #p1.state.removedAssetNames == 0 then
		table.insert(List, RoactModule.createElement(RoactGamepadModule.Focusable[ListSectionModule], {
			headerText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.NoChangedAssets"),
			items = {},
			layoutOrder = 1,
			isFirstSection = true,
			isLastSection = true,
			[RoactModule.Ref] = p1.noChangedAssetsRef
		}))
	end
	return List
end

function ItemsList.renderItemsList(p1) --[[ Line: 217 ]]
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), RoactGamepadModule (copy), VerticalScrollViewWithMargin (copy)
	return WithStyleFunction(function(p2) --[[ Line: 218 ]]
		-- upvalues: p1 (copy), RoactModule (upval), RoactGamepadModule (upval), VerticalScrollViewWithMargin (upval)
		local Theme = p2.Theme
		local EntriesList = p1:createEntriesList()
		EntriesList.Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, 10),
			SortOrder = Enum.SortOrder.LayoutOrder,
			[RoactModule.Change.AbsoluteContentSize] = p1.onContentSizeChanged
		})
		
		return RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
			defaultChild = p1.addedSectionRef,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[RoactModule.Ref] = p1.frameRef
		}, {
			TopGradient = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				Visible = p1.topGradientVisibleBinding,
				Size = UDim2.new(1, 0, 0, 30),
				Position = UDim2.fromScale(0, 0),
				BackgroundColor3 = Color3.new(1, 1, 1)
			}, {
				UIGradient = RoactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Theme.BackgroundUIDefault.Color),
						ColorSequenceKeypoint.new(1, Theme.BackgroundUIDefault.Color)
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			}),
			ScrollView = RoactModule.createElement(VerticalScrollViewWithMargin, {
				size = UDim2.fromScale(1, 1),
				canvasSizeY = UDim.new(0, p1.state.canvasSizeY)
			}, EntriesList),
			BottomGradient = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				Visible = p1.bottomGradientVisibleBinding,
				Size = UDim2.new(1, 0, 0, 30),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = Color3.new(1, 1, 1)
			}, {
				UIGradient = RoactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Theme.BackgroundUIDefault.Color),
						ColorSequenceKeypoint.new(1, Theme.BackgroundUIDefault.Color)
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

function ItemsList:renderLoading() --[[ Line: 294 ]]
	-- upvalues: RoactModule (copy), Skeleton (copy)
	return RoactModule.createElement(Skeleton, {
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end

function ItemsList.renderFailed(p1) --[[ Line: 302 ]]
	-- upvalues: RoactModule (copy), EmptyState (copy), RobloxTranslatorModule (copy)
	return RoactModule.createElement(EmptyState, {
		text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"),
		size = UDim2.fromScale(1, 1),
		onActivated = p1.onRetryLoading
	})
end

function ItemsList.render(p1) --[[ Line: 310 ]]
	local NoLoadingFailed: boolean = p1.state.loading and not p1.props.loadingFailed
	
	return if NoLoadingFailed then p1:renderLoading() elseif p1.state.addedAssetNames then p1:renderItemsList() else p1:renderFailed()
end

function ItemsList.didMount(p1) --[[ Line: 322 ]]
	p1.mounted = true
	
	if p1.props.humanoidDescription then
		p1.loadAssetNames()
	end
	p1.checkIsScrollable()
end

function ItemsList.didUpdate(p1, p2, _) --[[ Line: 331 ]]
	-- upvalues: RoactModule (copy)
	p1.checkIsScrollable()
	
	if p2.humanoidDescription ~= p1.props.humanoidDescription then
		p1:setState({
			loading = true,
			addedAssetNames = RoactModule.None,
			removedAssetNames = RoactModule.None
		})
		p1.loadAssetNames()
	end
end

function ItemsList.willUnmount(p1) --[[ Line: 345 ]]
	p1.mounted = false
end

return RoactRoduxModule.connect(nil, function(Callback) --[[ Line: 349 | Named "mapDispatchToProps" ]]
	-- upvalues: AddAnalyticsInfoModule (copy)
	return {
		addAnalyticsInfo = function(p1) --[[ Line: 351 ]]
			-- upvalues: Callback (copy), AddAnalyticsInfoModule (upval)
			return Callback(AddAnalyticsInfoModule(p1))
		end
	}
end)(ItemsList)