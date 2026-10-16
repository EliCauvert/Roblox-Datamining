local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Checkbox = FoundationModule.Checkbox
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(CoreScriptsPlayerFeedback.CaptureTypes)
local GetCaptureKeyModule = require(CoreScriptsPlayerFeedback.Utils.getCaptureKey)
local MemoResult = ReactModule.memo(function(Frame) --[[ Line: 28 ]]
	-- upvalues: ReactModule (copy), Checkbox (copy)
	local Capture = Frame.capture
	local IsCaptureTypeMatch = Capture.CaptureType == Enum.CaptureType.Video
	local IsIsDisabled = Frame.isDisabled == true
	
	return ReactModule.createElement("ImageButton", {
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Image = "",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Event.Activated] = ReactModule.useCallback(function() --[[ Line: 46 ]]
			-- upvalues: Frame (copy)
			Frame.onPreview()
		end, { Frame.onPreview })
	}, {
		DisabledOverlay = if IsIsDisabled then ReactModule.createElement("Frame", {
			BackgroundTransparency = 0.5,
			BorderSizePixel = 0,
			ZIndex = 3,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.fromScale(1, 1)
		}) else nil,
		Preview = if IsCaptureTypeMatch then nil else ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			ImageContent = Content.fromObject(Capture),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}),
		CheckboxOverlay = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}, {
			Checkbox = ReactModule.createElement(Checkbox, {
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				isChecked = Frame.isSelected,
				onActivated = ReactModule.useCallback(function() --[[ Line: 40 ]]
					-- upvalues: IsIsDisabled (copy), Frame (copy)
					if not IsIsDisabled then
						Frame.onToggle()
					end
				end, { IsIsDisabled, Frame.onToggle }),
				Position = UDim2.new(1, -4, 0, 4)
			})
		})
	})
end)

return (ReactModule.memo(function(p1) --[[ Line: 107 ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), GetCaptureKeyModule (copy), MemoResult (copy), View (copy), Text (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local Count = 0
	
	for _, selectedKey in p1.selectedKeys do
		if selectedKey then
			Count += 1
		end
	end
	local IsMaxSelectionsBelow = p1.maxSelections <= Count
	local UseLocalizationResult = UseLocalizationFunction({
		loading = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Loading",
		empty = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Empty",
		selectionHint = {
			"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Picker.NumSelected",
			count = tostring(Count),
			max = tostring(p1.maxSelections)
		}
	})
	local config = {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			PaddingBottom = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 2)
		}),
		UIGridLayout = ReactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.new(0, 4, 0, 4),
			CellSize = UDim2.new(0.3333333333333333, -3, 0, 100),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for LayoutOrder, capture in p1.captures do
		local CaptureKeyModule = GetCaptureKeyModule(capture)
		local IsSelectedKey = p1.selectedKeys[CaptureKeyModule] == true
		config[CaptureKeyModule] = ReactModule.createElement(MemoResult, {
			capture = capture,
			isSelected = IsSelectedKey,
			isDisabled = IsMaxSelectionsBelow and not IsSelectedKey,
			onToggle = function() --[[ Line: 153 ]]
				-- upvalues: p1 (copy), capture (copy)
				p1.onToggle(capture)
			end,
			onPreview = function() --[[ Line: 156 ]]
				-- upvalues: p1 (copy), capture (copy)
				p1.onPreview(capture)
			end,
			LayoutOrder = LayoutOrder
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		Size = UDim2.new(1, 0, 0, 360)
	}, {
		Hint = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-right content-muted",
			LayoutOrder = 1,
			Text = UseLocalizationResult.selectionHint
		}),
		Scroll = ReactModule.createElement(ScrollView, {
			tag = "fill size-full-0",
			LayoutOrder = 2,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = ScrollBarVisibility.Auto
			},
			onCanvasPositionChanged = function(ScrollFrame) --[[ Line: 180 ]]
				-- upvalues: p1 (copy)
				if not p1.hasMore or p1.isLoading then return end
				local Y = ScrollFrame.AbsoluteCanvasSize.Y
				local Y1 = ScrollFrame.AbsoluteWindowSize.Y
				
				if Y <= Y1 then return end
				if Y - Y1 - ScrollFrame.CanvasPosition.Y <= 20 then
					p1.onLoadMore()
				end
			end
		}, {
			Content = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -12, 0, 0)
			}, {
				Grid = if p1.isLoading and #p1.captures == 0 then ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-center content-muted",
					Text = UseLocalizationResult.loading
				}) elseif #p1.captures == 0 then ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-center content-muted",
					Text = UseLocalizationResult.empty
				}) else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, config)
			})
		})
	})
end))