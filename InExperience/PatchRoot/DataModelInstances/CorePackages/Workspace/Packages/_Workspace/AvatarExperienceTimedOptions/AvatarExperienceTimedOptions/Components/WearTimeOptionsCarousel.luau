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

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), wearTimeOptionButtonModule (ref), view (ref), text (ref), foundationModule (ref), enums (ref), AXTooltip (ref)
	local var1 = useTokens()
	local var2 = useLocalization({
		wearTimeOptions = "Feature.Durables.ItemDetails.WearTimeOptions.Title",
		tooltipText = "Feature.Durables.FTUX.Tooltip"
	})
	local var3, var4 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		local delayedThread = task.delay(5, function()
			-- upvalues: var4 (copy)
			var4(false)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, {})
	local var5, var6 = reactModule.useState(function()
		-- upvalues: p1 (ref)
		for i, v in p1.options do
			if v.selected then
				return i
			end
		end
		return 1
	end)
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), wearTimeOptionButtonModule (copy), var5 (ref), var6 (ref)
		local t = {}
		
		for i, v in p1.options do
			t[i] = reactModule.createElement(wearTimeOptionButtonModule, {
				option = { days = v.days, price = v.price, selected = i == var5 },
				onActivated = function()
					-- upvalues: var6 (copy), i (ref), p1 (copy)
					var6(i)
					
					if p1.onOptionActivated then
						p1.onOptionActivated(i)
					end
				end,
				LayoutOrder = i
			})
		end
		return t
	end, { p1.options, var5, p1.onOptionActivated })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-medium",
		LayoutOrder = p1.LayoutOrder
	}, {
		Heading = reactModule.createElement(view, {
			tag = "auto-xy row gap-xxsmall align-y-center",
			LayoutOrder = 1
		}, {
			HeadingText = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = var2.wearTimeOptions,
				textStyle = var1.Color.Content.Emphasis,
				fontStyle = {
					Font = var1.Typography.TitleLarge.Font,
					FontSize = var1.FontSize.FontSize_500
				},
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			InfoIconContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, {
				InfoIcon = reactModule.createElement(foundationModule.IconButton, {
					icon = enums.IconName.CircleI,
					size = enums.IconSize.Small,
					onActivated = function()
						-- upvalues: var4 (ref)
						var4(true)
					end
				}),
				Tooltip = reactModule.createElement(AXTooltip, {
					popoverSide = "Top",
					isOpen = var3,
					tooltipText = var2.tooltipText,
					maxWidth = var1.Size.Size_1200 * 3,
					onTooltipActivated = function()
						-- upvalues: var4 (ref)
						var4(false)
					end
				})
			})
		}),
		CarouselContainer = if p1.useWrapping then reactModule.createElement(view, {
			tag = "row wrap gap-medium align-y-center size-full-0 auto-y",
			LayoutOrder = 2,
			wrap = true
		}, var7) else reactModule.createElement(view, {
			tag = "size-full-0",
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var1.Size.Size_1200)
		}, {
			ScrollingFrame = reactModule.createElement("ScrollingFrame", {
				ScrollBarThickness = 0,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				Selectable = false,
				Size = UDim2.new(1, 0, 1, 0),
				CanvasSize = UDim2.new(0, 0, 0, var1.Size.Size_1200),
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ElasticBehavior = Enum.ElasticBehavior.Always
			}, reactModule.createElement(view, { tag = "row gap-medium align-y-center auto-xy" }, {
				Options = reactModule.createElement(reactModule.Fragment, nil, var7)
			}))
		})
	})
end