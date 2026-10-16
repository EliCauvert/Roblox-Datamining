local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local View = FoundationModule.View
local Enums = FoundationModule.Enums
local _ = require(Parent.AvatarExperienceCommon)
local WearTimeOptionButtonModule = require(script.Parent.WearTimeOptionButton)
local AXTooltip = require(Parent.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip

return function(Frame) --[[ Line: 27 | Named "WearTimeOptionsCarousel" ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), WearTimeOptionButtonModule (copy), View (copy), Text (copy), FoundationModule (copy), Enums (copy), AXTooltip (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		wearTimeOptions = "Feature.Durables.ItemDetails.WearTimeOptions.Title",
		tooltipText = "Feature.Durables.FTUX.Tooltip"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 36 ]]
		-- upvalues: UseStateResult2 (copy)
		local DelayedThread = task.delay(5, function() --[[ Line: 37 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		
		return function() --[[ Line: 41 ]]
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, {})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function() --[[ Line: 46 ]]
		-- upvalues: Frame (copy)
		for i, option in Frame.options do
			if option.selected then
				return i
			end
		end
		return 1
	end)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 57 ]]
		-- upvalues: Frame (copy), ReactModule (upval), WearTimeOptionButtonModule (upval), UseStateResult1 (copy), UseStateResult2_1 (copy)
		local Elements = {}
		
		for LayoutOrder, option in Frame.options do
			Elements[LayoutOrder] = ReactModule.createElement(WearTimeOptionButtonModule, {
				option = {
					days = option.days,
					price = option.price,
					selected = LayoutOrder == UseStateResult1
				},
				onActivated = function() --[[ Line: 66 ]]
					-- upvalues: UseStateResult2_1 (upval), LayoutOrder (copy), Frame (upval)
					UseStateResult2_1(LayoutOrder)
					
					if Frame.onOptionActivated then
						Frame.onOptionActivated(LayoutOrder)
					end
				end,
				LayoutOrder = LayoutOrder
			})
		end
		return Elements
	end, { Frame.options, UseStateResult1, Frame.onOptionActivated })
	local Element = ReactModule.createElement(View, { tag = "row gap-medium align-y-center auto-xy" }, {
		Options = ReactModule.createElement(ReactModule.Fragment, nil, UseMemoResult)
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-medium",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Heading = ReactModule.createElement(View, {
			tag = "auto-xy row gap-xxsmall align-y-center",
			LayoutOrder = 1
		}, {
			HeadingText = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = UseLocalizationResult.wearTimeOptions,
				textStyle = UseTokensResult.Color.Content.Emphasis,
				fontStyle = {
					Font = UseTokensResult.Typography.TitleLarge.Font,
					FontSize = UseTokensResult.FontSize.FontSize_500
				},
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			InfoIconContainer = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, {
				InfoIcon = ReactModule.createElement(FoundationModule.IconButton, {
					icon = Enums.IconName.CircleI,
					size = Enums.IconSize.Small,
					onActivated = function() --[[ Line: 144 ]]
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(true)
					end
				}),
				Tooltip = ReactModule.createElement(AXTooltip, {
					popoverSide = "Top",
					isOpen = UseStateResult,
					tooltipText = UseLocalizationResult.tooltipText,
					maxWidth = UseTokensResult.Size.Size_1200 * 3,
					onTooltipActivated = function() --[[ Line: 153 ]]
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(false)
					end
				})
			})
		}),
		CarouselContainer = if Frame.useWrapping then ReactModule.createElement(View, {
			tag = "row wrap gap-medium align-y-center size-full-0 auto-y",
			LayoutOrder = 2,
			wrap = true
		}, UseMemoResult) else ReactModule.createElement(View, {
			tag = "size-full-0",
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1200)
		}, {
			ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
				ScrollBarThickness = 0,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				Selectable = false,
				Size = UDim2.new(1, 0, 1, 0),
				CanvasSize = UDim2.new(0, 0, 0, UseTokensResult.Size.Size_1200),
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ElasticBehavior = Enum.ElasticBehavior.Always
			}, Element)
		})
	})
end