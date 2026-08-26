local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local checkbox = foundationModule.Checkbox
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(coreScriptsPlayerFeedback.CaptureTypes)
local getCaptureKeyModule = require(coreScriptsPlayerFeedback.Utils.getCaptureKey)
local var1 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), checkbox (ref)
	local capture = p1.capture
	local var2 = p1.isDisabled == true
	
	return reactModule.createElement("ImageButton", {
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Image = "",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Event.Activated] = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.onPreview()
		end, { p1.onPreview })
	}, {
		DisabledOverlay = if var2 then reactModule.createElement("Frame", {
			BackgroundTransparency = 0.5,
			BorderSizePixel = 0,
			ZIndex = 3,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.fromScale(1, 1)
		}) else nil,
		Preview = if not (capture.CaptureType == Enum.CaptureType.Video) then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			ImageContent = Content.fromObject(capture),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}) else nil,
		CheckboxOverlay = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}, {
			Checkbox = reactModule.createElement(checkbox, {
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				isChecked = p1.isSelected,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var2 (ref), p1 (ref)
					if not var2 then
						p1.onToggle()
					end
				end, { var2, p1.onToggle }),
				Position = UDim2.new(1, -4, 0, 4)
			})
		})
	})
end)

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), getCaptureKeyModule (ref), var1 (ref), view (ref), text (ref), scrollView (ref), scrollBarVisibility (ref)
	local var2 = 0
	
	for i, v in p1.selectedKeys do
		if v then
			var2 += 1
		end
	end
	local var3 = p1.maxSelections <= var2
	local var4 = useLocalization({
		loading = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Loading",
		empty = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Empty",
		selectionHint = {
			"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Picker.NumSelected",
			count = tostring(var2),
			max = tostring(p1.maxSelections)
		}
	})
	local t = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			PaddingBottom = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 2)
		}),
		UIGridLayout = reactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.new(0, 4, 0, 4),
			CellSize = UDim2.new(0.333333333333, -3, 0, 100),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i_1, v_1 in p1.captures do
		local var5 = getCaptureKeyModule(v_1)
		local var6 = p1.selectedKeys[var5] == true
		t[var5] = reactModule.createElement(var1, {
			capture = v_1,
			isSelected = var6,
			isDisabled = var3 and not var6,
			onToggle = function()
				-- upvalues: p1 (ref), v_1 (ref)
				p1.onToggle(v_1)
			end,
			onPreview = function()
				-- upvalues: p1 (ref), v_1 (ref)
				p1.onPreview(v_1)
			end,
			LayoutOrder = i_1
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		Size = UDim2.new(1, 0, 0, 360)
	}, {
		Hint = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-right content-muted",
			LayoutOrder = 1,
			Text = var4.selectionHint
		}),
		Scroll = reactModule.createElement(scrollView, {
			tag = "fill size-full-0",
			LayoutOrder = 2,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = scrollBarVisibility.Auto
			},
			onCanvasPositionChanged = function(p2)
				-- upvalues: p1 (ref)
				if not p1.hasMore or p1.isLoading then return end
				local y = p2.AbsoluteCanvasSize.Y
				local y_1 = p2.AbsoluteWindowSize.Y
				
				if y <= y_1 then return end
				if y - y_1 - p2.CanvasPosition.Y <= 20 then
					p1.onLoadMore()
				end
			end
		}, {
			Content = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -12, 0, 0)
			}, {
				Grid = if p1.isLoading and #p1.captures == 0 then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-center content-muted",
					Text = var4.loading
				}) elseif #p1.captures == 0 then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-center content-muted",
					Text = var4.empty
				}) else reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, t)
			})
		})
	})
end)