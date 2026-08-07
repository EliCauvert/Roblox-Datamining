local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local view = foundationModule.View
local enums = foundationModule.Enums
local _ = require(parent.AvatarExperienceCommon)
local wearTimeOptionButtonModule = require(script.Parent.WearTimeOptionButton)
local AXTooltip = require(parent.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip

return function(p0) --[[ line: 27 | named "WearTimeOptionsCarousel" ]]
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), wearTimeOptionButtonModule (ref), view (ref), text (ref), foundationModule (ref), enums (ref), AXTooltip (ref)
	local var3 = useTokens()
	local var4 = useLocalization({
		wearTimeOptions = "Feature.Durables.ItemDetails.WearTimeOptions.Title",
		tooltipText = "Feature.Durables.FTUX.Tooltip"
	})
	local var5, var6 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: var6 (ref)
		local delayedThread = task.delay(5, function() --[[ line: 37 ]]
			-- upvalues: var6 (copy)
			var6(false)
		end)
		
		return function() --[[ line: 41 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, {})
	local var7, var8 = reactModule.useState(function() --[[ line: 46 ]]
		-- upvalues: p0 (ref)
		for i, v in p0.options do
			if v.selected then
				return i
			end
		end
		return 1
	end)
	local var9 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: p0 (ref), reactModule (copy), wearTimeOptionButtonModule (copy), var7 (ref), var8 (ref)
		local t = {}
		
		for i, v in p0.options do
			t[i] = reactModule.createElement(wearTimeOptionButtonModule, {
				option = { days = v.days, price = v.price, selected = i == var7 },
				onActivated = function() --[[ line: 66 ]]
					-- upvalues: var8 (copy), i (ref), p0 (copy)
					var8(i)
					
					if p0.onOptionActivated then
						p0.onOptionActivated(i)
					end
				end,
				LayoutOrder = i
			})
		end
		return t
	end, { p0.options, var7, p0.onOptionActivated })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-medium",
		LayoutOrder = p0.LayoutOrder
	}, {
		Heading = reactModule.createElement(view, {
			tag = "auto-xy row gap-xxsmall align-y-center",
			LayoutOrder = 1
		}, {
			HeadingText = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = var4.wearTimeOptions,
				textStyle = var3.Color.Content.Emphasis,
				fontStyle = {
					Font = var3.Typography.TitleLarge.Font,
					FontSize = var3.FontSize.FontSize_500
				},
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			InfoIconContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, {
				InfoIcon = reactModule.createElement(foundationModule.IconButton, {
					icon = enums.IconName.CircleI,
					size = enums.IconSize.Small,
					onActivated = function() --[[ line: 144 ]]
						-- upvalues: var6 (ref)
						var6(true)
					end
				}),
				Tooltip = reactModule.createElement(AXTooltip, {
					popoverSide = "Top",
					isOpen = var5,
					tooltipText = var4.tooltipText,
					maxWidth = var3.Size.Size_1200 * 3,
					onTooltipActivated = function() --[[ line: 153 ]]
						-- upvalues: var6 (ref)
						var6(false)
					end
				})
			})
		}),
		CarouselContainer = if p0.useWrapping then reactModule.createElement(view, {
			tag = "row wrap gap-medium align-y-center size-full-0 auto-y",
			LayoutOrder = 2,
			wrap = true
		}, var9) else reactModule.createElement(view, {
			tag = "size-full-0",
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var3.Size.Size_1200)
		}, {
			ScrollingFrame = reactModule.createElement("ScrollingFrame", {
				ScrollBarThickness = 0,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				Selectable = false,
				Size = UDim2.new(1, 0, 1, 0),
				CanvasSize = UDim2.new(0, 0, 0, var3.Size.Size_1200),
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ElasticBehavior = Enum.ElasticBehavior.Always
			}, reactModule.createElement(view, { tag = "row gap-medium align-y-center auto-xy" }, {
				Options = reactModule.createElement(reactModule.Fragment, nil, var9)
			}))
		})
	})
end