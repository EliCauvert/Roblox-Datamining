local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), Sheet (copy), Text (copy), View (copy)
	local TestId = p1.testId or "ChatTextAttachmentPreviewSheet"
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement(Sheet.Root, {
		onClose = p1.onClose,
		snapPoints = { 1 },
		testId = TestId
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = if p1.title == nil then nil else ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p1.title,
				testId = `{TestId}.Title`
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			BodyViewport = ReactModule.createElement(View, {
				LayoutOrder = 1,
				Size = UseBindingResult:map(function(Value: number): UDim2
					return UDim2.new(1, 0, 0, (math.ceil(Value)))
				end)
			}, {
				BodyLayout = ReactModule.createElement(View, { Size = UDim2.new(1, 0, 0, 100000) }, {
					Body = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y padding-bottom-large text-body-medium text-wrap text-align-x-left content-default",
						onAbsoluteSizeChanged = function(Frame)
							-- upvalues: UseBindingResult2 (copy)
							UseBindingResult2(Frame.AbsoluteSize.Y)
						end,
						Text = p1.text,
						testId = `{TestId}.Body`
					})
				})
			})
		})
	})
end