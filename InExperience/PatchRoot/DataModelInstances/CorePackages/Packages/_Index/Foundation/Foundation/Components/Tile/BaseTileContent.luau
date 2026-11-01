local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local PaddingModule = require(Foundation.Components.Padding)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local _UDim2 = UDim2.fromScale(1, 0)

local function _(LayoutOrder, p1)
	-- upvalues: ReactModule (copy), _UDim2 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = LayoutOrder,
		Size = _UDim2
	}, p1)
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), _UDim2 (copy), GetTestIdTagModule (copy), PaddingModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local HasContentAction = Frame.contentAction ~= nil
	local Small = UseTokensModuleResult.Gap.Small
	local _UDim = UDim.new(0, if Frame.isContained then UseTokensModuleResult.Padding.Medium else UseTokensModuleResult.Padding.Small)
	local _UDim1 = if Frame.isContained then _UDim else nil
	local Size1200 = UseTokensModuleResult.Size.Size_1200
	
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = Frame.LayoutOrder,
		Size = _UDim2,
		[ReactModule.Change.AbsoluteSize] = Frame.onAbsoluteSizeChanged,
		[ReactModule.Tag] = GetTestIdTagModule(`{Frame.testId}--content`)
	}, {
		Padding = ReactModule.createElement(PaddingModule, {
			value = {
				top = _UDim,
				bottom = _UDim1,
				left = _UDim1,
				right = _UDim1
			}
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Header = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = _UDim2
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, Small),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			Text = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = if HasContentAction then UDim2.new(1, -(Size1200 + Small), 0, 0) else _UDim2
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Title = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = _UDim2
				}, Frame.title),
				Metadata = if Frame.metadata == nil then nil else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = _UDim2
				}, Frame.metadata)
			}),
			ContentAction = if HasContentAction then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.fromOffset(Size1200, UseTokensModuleResult.Size.Size_800),
				[ReactModule.Tag] = GetTestIdTagModule(`{Frame.testId}--content-action`)
			}, { Content = Frame.contentAction }) else nil
		}),
		Footer = if Frame.footer == nil then nil else ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = _UDim2,
			[ReactModule.Tag] = GetTestIdTagModule(`{Frame.testId}--footer`)
		}, {
			Padding = ReactModule.createElement(PaddingModule, { value = { top = UDim.new(0, Small) } }),
			Content = Frame.footer
		})
	})
end)