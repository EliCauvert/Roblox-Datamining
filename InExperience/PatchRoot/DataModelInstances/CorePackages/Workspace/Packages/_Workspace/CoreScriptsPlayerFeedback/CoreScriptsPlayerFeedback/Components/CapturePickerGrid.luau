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
local var4 = reactModule.memo(function(p0) --[[ line: 28 ]]
	-- upvalues: reactModule (ref), checkbox (ref)
	local capture = p0.capture
	local var5 = p0.isDisabled == true
	
	return reactModule.createElement("ImageButton", {
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Image = "",
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Event.Activated] = reactModule.useCallback(function() --[[ line: 46 ]]
			-- upvalues: p0 (ref)
			p0.onPreview()
		end, { p0.onPreview })
	}, {
		DisabledOverlay = if var5 then reactModule.createElement("Frame", {
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
				isChecked = p0.isSelected,
				onActivated = reactModule.useCallback(function() --[[ line: 40 ]]
					-- upvalues: var5 (ref), p0 (ref)
					if not var5 then
						p0.onToggle()
					end
				end, { var5, p0.onToggle }),
				Position = UDim2.new(1, -4, 0, 4)
			})
		})
	})
end)

return reactModule.memo(function(p1) --[[ line: 107 ]]
	-- upvalues: useLocalization (ref), reactModule (ref), getCaptureKeyModule (ref), var4 (ref), view (ref), text (ref), scrollView (ref), scrollBarVisibility (ref)
	local var6 = 0
	
	for i, v in p1.selectedKeys do
		if v then
			var6 += 1
		end
	end
	local var7 = p1.maxSelections <= var6
	local var8 = useLocalization({
		loading = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Loading",
		empty = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Empty",
		selectionHint = {
			"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Picker.NumSelected",
			count = tostring(var6),
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
		local var10 = getCaptureKeyModule(v_1)
		local var11 = p1.selectedKeys[var10] == true
		t[var10] = reactModule.createElement(var4, {
			capture = v_1,
			isSelected = var11,
			isDisabled = var7 and not var11,
			onToggle = function() --[[ line: 153 ]]
				-- upvalues: p1 (ref), v_1 (ref)
				p1.onToggle(v_1)
			end,
			onPreview = function() --[[ line: 156 ]]
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
			Text = var8.selectionHint
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
			onCanvasPositionChanged = function(p2) --[[ line: 180 ]]
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
					Text = var8.loading
				}) elseif #p1.captures == 0 then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-center content-muted",
					Text = var8.empty
				}) else reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, t)
			})
		})
	})
end)