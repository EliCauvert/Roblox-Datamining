local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local avatarModule = require(foundation.Components.Avatar)
local avatarSizeModule = require(foundation.Enums.AvatarSize)
local breakpointModule = require(foundation.Enums.Breakpoint)
local breakpointConfigModule = require(foundation.Utility.Responsive.BreakpointConfig)
local headerBarModule = require(foundation.Components.HeaderBar)
local iconButtonModule = require(foundation.Components.IconButton)
local _ = require(foundation.Providers.Responsive.ResponsiveContext)
local responsiveProviderModule = require(foundation.Providers.Responsive.ResponsiveProvider)
local searchInputModule = require(foundation.Components.SearchInput)
local storySectionModule = require(foundation.Utility.Stories.Shared.StorySection)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local useResponsiveModule = require(foundation.Providers.Responsive.useResponsive)
local labeledCell = storySectionModule.LabeledCell
local icon = builderIconsModule.Icon
local list = {
	breakpointModule.XSmall, breakpointModule.Small, breakpointModule.Medium,
	breakpointModule.Large, breakpointModule.XLarge, breakpointModule.XXLarge
}
local xSmall = breakpointModule.XSmall
local list_1 = {
	{
		preset = "XSmall (360px)",
		breakpoint = breakpointModule.XSmall,
		width = breakpointConfigModule.widths[breakpointModule.XSmall]
	},
	{
		preset = "Small (600px)",
		breakpoint = breakpointModule.Small,
		width = breakpointConfigModule.widths[breakpointModule.Small]
	},
	{
		preset = "Medium (1140px)",
		breakpoint = breakpointModule.Medium,
		width = breakpointConfigModule.widths[breakpointModule.Medium]
	},
	{
		preset = "Large (1520px)",
		breakpoint = breakpointModule.Large,
		width = breakpointConfigModule.widths[breakpointModule.Large]
	},
	{
		preset = "XLarge (1920px)",
		breakpoint = breakpointModule.XLarge,
		width = breakpointConfigModule.widths[breakpointModule.XLarge]
	},
	{
		preset = "XXLarge (2560px)",
		width = 2560,
		breakpoint = breakpointModule.XXLarge
	}
}
local t = {}
local t_1 = {}

for i, v in list_1 do
	t[i] = v.preset
	t_1[v.preset] = v
end
local list_2 = {
	{ width = 360, label = `Mobile, parent width {360}px` },
	{ width = 720, label = `Desktop, parent width {720}px` }
}
local list_3 = {
	{
		label = "XSmall, Small",
		breakpoint = breakpointModule.Small
	},
	{
		label = "Medium, Large",
		breakpoint = breakpointModule.Large
	},
	{
		label = "XLarge, XXLarge",
		breakpoint = breakpointModule.XXLarge
	}
}
local list_4 = { 1, 2, 3 }
local list_5 = {
	{
		id = "close",
		icon = icon.X,
		onActivated = function() end
	},
	{
		id = "back",
		icon = icon.ChevronLargeLeft,
		onActivated = function() end
	}
}
local list_6 = {
	{
		id = "search",
		icon = icon.MagnifyingGlass,
		onActivated = function() end
	},
	{
		id = "robux",
		icon = icon.Robux,
		onActivated = function() end
	},
	{
		id = "notifications",
		icon = icon.Bell,
		onActivated = function() end
	}
}

local function takeActions(p1, p2)
	return table.move(p1, 1, math.min(p2, #p1), 1, {})
end

local function slotChip(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
	local var1 = if p4 then "row align-x-center align-y-center padding-small radius-medium bg-action-emphasis" else "row align-x-center align-y-center padding-small radius-medium bg-shift-200"
	
	return reactModule.createElement(viewModule, {
		tag = if p2 then var1 else `auto-x {var1}`,
		Size = if p2 then UDim2.new(0, p2, 1, 0) else UDim2.fromScale(0, 1),
		LayoutOrder = p3
	}, {
		Label = reactModule.createElement(textModule, {
			LayoutOrder = 1,
			Text = p1,
			tag = if p4 then "auto-xy text-caption-small content-inverse-emphasis" else "auto-xy text-caption-small content-muted"
		})
	})
end

local function slotPlaceholders(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), viewModule (ref), slotChip (ref)
	p5 = p5 or {}
	local childCount = p5.childCount or 1
	local var1 = p5.isSubject == true
	
	if childCount == 1 then
		local demand = p5.demand or p2
		local var2 = p5.fill == true
		
		return {
			Band = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = `{if var1 then "fill row align-y-center radius-medium stroke-system-emphasis" else "fill row align-y-center radius-medium stroke-default"} {p3}`,
				Size = if var2 then UDim2.fromScale(1, 1) else UDim2.new(0, demand, 1, 0)
			}, {
				Chip = slotChip(if var2 then `{p1} 100%` elseif p5.showDemand then `{p1} {demand}px` else p1, if var2 or p4 then nil else demand, 1, var1)
			})
		}
	end
	local t = {}
	
	for i = 1, childCount do
		t[`Child{i}`] = slotChip(`Child {i}`, nil, i, var1)
	end
	return t
end

local function leadingSlot(p6)
	-- upvalues: reactModule (ref), headerBarModule (ref)
	return reactModule.createElement(headerBarModule.Leading, nil, p6)
end

local function contentSlot(p6)
	-- upvalues: reactModule (ref), headerBarModule (ref)
	return reactModule.createElement(headerBarModule.Content, nil, p6)
end

local function trailingSlot(p6)
	-- upvalues: reactModule (ref), headerBarModule (ref)
	return reactModule.createElement(headerBarModule.Trailing, nil, p6)
end

local function leadingPlaceholder(p6)
	-- upvalues: leadingSlot (ref), slotPlaceholders (ref)
	return leadingSlot(slotPlaceholders("Leading", 96, "align-x-left", true, p6))
end

local function contentPlaceholder(p6)
	-- upvalues: contentSlot (ref), slotPlaceholders (ref)
	return contentSlot(slotPlaceholders("Content", 128, "align-x-center", false, p6))
end

local function trailingPlaceholder(p6)
	-- upvalues: trailingSlot (ref), slotPlaceholders (ref)
	return trailingSlot(slotPlaceholders("Trailing", 96, "align-x-right", true, p6))
end

local function ForcedBreakpoint(p6)
	-- upvalues: useResponsiveModule (ref), reactModule (ref), list (ref), responsiveProviderModule (ref)
	local config = useResponsiveModule().config
	
	return reactModule.createElement(responsiveProviderModule, {
		config = reactModule.useMemo(function()
			-- upvalues: list (copy), p6 (ref), config (ref)
			local t = {}
			local var3 = false
			
			for i, v in list do
				if v == p6.breakpoint then
					var3 = true
				end
				t[v] = if var3 then 1e999 else -1
			end
			return {
				breakpoint = {
					order = list,
					shortNames = config.breakpoint.shortNames,
					widths = t
				},
				grid = config.grid
			}
		end, { config, p6.breakpoint })
	}, p6.children)
end

local function Shell(p7)
	-- upvalues: reactModule (ref), viewModule (ref), headerBarModule (ref), slotPlaceholders (ref), ForcedBreakpoint (ref), xSmall (ref)
	return reactModule.createElement(ForcedBreakpoint, { breakpoint = p7.breakpoint or xSmall }, reactModule.createElement(viewModule, {
		tag = "col auto-y stroke-default bg-surface-100",
		Size = UDim2.fromOffset(p7.width or 360, 0),
		LayoutOrder = p7.LayoutOrder
	}, {
		HeaderBar = reactModule.createElement(headerBarModule.Root, { LayoutOrder = 1, hasBackground = p7.hasBackground }, {
			Leading = if p7.hasPlaceholderSlots then reactModule.createElement(headerBarModule.Leading, nil, slotPlaceholders("Leading", 96, "align-x-left", true, nil)) else p7.leading,
			Content = if p7.hasPlaceholderSlots then reactModule.createElement(headerBarModule.Content, nil, slotPlaceholders("Content", 128, "align-x-center", false, nil)) else p7.content,
			Trailing = if p7.hasPlaceholderSlots then reactModule.createElement(headerBarModule.Trailing, nil, slotPlaceholders("Trailing", 96, "align-x-right", true, nil)) else p7.trailing
		})
	}))
end

local function LabeledShell(p7)
	-- upvalues: reactModule (ref), Shell (ref), labeledCell (ref)
	local var3 = reactModule.createElement(Shell, {
		LayoutOrder = if p7.label then 1 else p7.LayoutOrder,
		width = p7.width,
		breakpoint = p7.breakpoint,
		hasBackground = p7.hasBackground,
		hasPlaceholderSlots = p7.hasPlaceholderSlots,
		leading = p7.leading,
		content = p7.content,
		trailing = p7.trailing
	})
	
	return if p7.label then reactModule.createElement(labeledCell, { LayoutOrder = p7.LayoutOrder or 1, label = p7.label }, { Shell = var3 }) else var3
end

local function tierCells(p7)
	-- upvalues: reactModule (ref), LabeledShell (ref)
	local t = {}
	
	for i, v in p7 do
		t[v.label] = reactModule.createElement(LabeledShell, {
			hasPlaceholderSlots = true,
			LayoutOrder = i,
			label = v.label,
			width = v.width,
			breakpoint = v.breakpoint
		})
	end
	return t
end

local list_7 = { 360, 720 }
local uDim = UDim.new(0, 176)
local uDim_1 = UDim.new(0, 320)
local uDim_2 = UDim.new(1, 0)

local function noop() end

local function _(p8)
	return p8 <= 360
end

local _ = function(p8)
	-- upvalues: uDim (ref), uDim_1 (ref)
	return if p8 then uDim else uDim_1
end

local _ = function(p8)
	-- upvalues: reactModule (ref), textModule (ref)
	return reactModule.createElement(textModule, {
		Text = "Page Title",
		tag = "auto-xy text-heading-medium content-emphasis",
		LayoutOrder = p8
	})
end

local _ = function(p8, p9)
	-- upvalues: reactModule (ref), iconButtonModule (ref), noop (ref)
	return reactModule.createElement(iconButtonModule, { icon = p8, onActivated = noop, LayoutOrder = p9 })
end

local _ = function(p8)
	-- upvalues: reactModule (ref), avatarModule (ref), avatarSizeModule (ref)
	return reactModule.createElement(avatarModule, {
		userId = 24813339,
		size = avatarSizeModule.Small,
		LayoutOrder = p8
	})
end

local function SearchContent(p8)
	-- upvalues: reactModule (ref), contentSlot (ref), searchInputModule (ref)
	local var3, var4 = reactModule.useBinding("")
	
	return contentSlot({
		Search = reactModule.createElement(searchInputModule, {
			LayoutOrder = 1,
			text = var3,
			onChanged = var4,
			width = p8.width
		})
	})
end

local _ = function(p8)
	-- upvalues: reactModule (ref), SearchContent (ref)
	return reactModule.createElement(SearchContent, { width = p8 })
end

local function utilityTrailing(p8)
	-- upvalues: trailingSlot (ref), reactModule (ref), headerBarModule (ref), list_6 (ref), iconButtonModule (ref), noop (ref), avatarModule (ref), avatarSizeModule (ref)
	if not p8 then
		return trailingSlot({
			Actions = reactModule.createElement(headerBarModule.Actions, { actions = list_6 })
		})
	end
	local t = {}
	
	for i, v in list_6 do
		t[tostring(v.id)] = reactModule.createElement(iconButtonModule, { icon = v.icon, onActivated = noop, LayoutOrder = i })
	end
	t.Account = reactModule.createElement(avatarModule, {
		userId = 24813339,
		size = avatarSizeModule.Small,
		LayoutOrder = #list_6 + 1
	})
	
	return trailingSlot(t)
end

local _ = function(p9)
	-- upvalues: trailingSlot (ref), icon (ref), reactModule (ref), iconButtonModule (ref), noop (ref), utilityTrailing (ref)
	return if p9 then trailingSlot({
		Filter = reactModule.createElement(iconButtonModule, {
			LayoutOrder = 1,
			icon = icon.ThreeSlidersHorizontal,
			onActivated = noop
		})
	}) else utilityTrailing(true)
end

local function CompositionShell(p9)
	-- upvalues: reactModule (ref), LabeledShell (ref), breakpointModule (ref)
	return reactModule.createElement(LabeledShell, {
		LayoutOrder = p9.LayoutOrder,
		label = `{p9.width}px`,
		width = p9.width,
		breakpoint = if p9.width <= 360 then breakpointModule.XSmall else breakpointModule.Small,
		leading = p9.leading,
		content = p9.content,
		trailing = p9.trailing
	})
end

local function CompositionGroup(p9)
	-- upvalues: list_7 (ref), reactModule (ref), viewModule (ref)
	local t = {}
	
	for i, v in list_7 do
		t[`Width{v}`] = reactModule.createElement(p9.Cell, { LayoutOrder = i, width = v })
	end
	return reactModule.createElement(viewModule, {
		tag = "col align-x-left gap-medium auto-xy",
		LayoutOrder = p9.LayoutOrder
	}, t)
end

return {
	MOBILE_PARENT_WIDTH = 360,
	OVERSIZED_DEMAND = 400,
	WIDTH_TIERS = list_2,
	HEIGHT_TIERS = list_3,
	VIEWPORT_ORDER = t,
	VIEWPORT_BY_PRESET = t_1,
	SLOT_CHILD_COUNTS = list_4,
	LEADING_ACTIONS = list_5,
	TRAILING_ACTIONS = list_6,
	takeActions = takeActions,
	leadingPlaceholder = leadingPlaceholder,
	contentPlaceholder = contentPlaceholder,
	trailingPlaceholder = trailingPlaceholder,
	LabeledShell = LabeledShell,
	Shell = Shell,
	SlotPattern = function(p10)
		-- upvalues: reactModule (ref), viewModule (ref), LabeledShell (ref), CompositionGroup (ref)
		return reactModule.createElement(viewModule, {
			tag = "col align-x-left gap-medium auto-xy",
			LayoutOrder = p10.LayoutOrder
		}, {
			Placeholder = reactModule.createElement(LabeledShell, {
				LayoutOrder = 1,
				label = p10.label,
				hasPlaceholderSlots = p10.hasPlaceholderSlots,
				leading = p10.leading,
				content = p10.content,
				trailing = p10.trailing
			}),
			Composition = if p10.Cell then reactModule.createElement(CompositionGroup, { LayoutOrder = 2, Cell = p10.Cell }) else nil
		})
	end,
	tierCells = tierCells,
	CenteredDetailCell = function(p10)
		-- upvalues: reactModule (ref), CompositionShell (ref), icon (ref), iconButtonModule (ref), noop (ref), headerBarModule (ref), viewModule (ref), textModule (ref)
		return reactModule.createElement(CompositionShell, {
			LayoutOrder = p10.LayoutOrder,
			width = p10.width,
			leading = reactModule.createElement(headerBarModule.Leading, nil, {
				Close = reactModule.createElement(iconButtonModule, { LayoutOrder = 1, icon = icon.X, onActivated = noop }),
				Back = reactModule.createElement(iconButtonModule, {
					LayoutOrder = 2,
					icon = icon.ChevronLargeLeft,
					onActivated = noop
				})
			}),
			content = reactModule.createElement(headerBarModule.Content, nil, {
				Stack = reactModule.createElement(viewModule, { tag = "col align-x-center auto-xy", LayoutOrder = 1 }, {
					Title = reactModule.createElement(textModule, {
						Text = "Title",
						tag = "auto-xy text-label-medium content-emphasis",
						LayoutOrder = 1
					}),
					Subtitle = reactModule.createElement(textModule, {
						Text = "Username: 13+",
						tag = "auto-xy text-caption-small content-muted",
						LayoutOrder = 2
					})
				})
			})
		})
	end,
	ContentAndTrailingCell = function(p10)
		-- upvalues: reactModule (ref), CompositionShell (ref), uDim (ref), uDim_1 (ref), SearchContent (ref), icon (ref), iconButtonModule (ref), noop (ref), headerBarModule (ref), utilityTrailing (ref)
		local var3 = p10.width <= 360
		
		return reactModule.createElement(CompositionShell, {
			LayoutOrder = p10.LayoutOrder,
			width = p10.width,
			content = reactModule.createElement(SearchContent, { width = if var3 then uDim else uDim_1 }),
			trailing = if var3 then reactModule.createElement(headerBarModule.Trailing, nil, {
				Filter = reactModule.createElement(iconButtonModule, {
					LayoutOrder = 1,
					icon = icon.ThreeSlidersHorizontal,
					onActivated = noop
				})
			}) else utilityTrailing(true)
		})
	end,
	ContentFillCell = function(p10)
		-- upvalues: reactModule (ref), CompositionShell (ref), textModule (ref), headerBarModule (ref), uDim_2 (ref), SearchContent (ref)
		return reactModule.createElement(CompositionShell, {
			LayoutOrder = p10.LayoutOrder,
			width = p10.width,
			leading = reactModule.createElement(headerBarModule.Leading, nil, {
				Title = reactModule.createElement(textModule, {
					Text = "Page Title",
					tag = "auto-xy text-heading-medium content-emphasis",
					LayoutOrder = 1
				})
			}),
			content = reactModule.createElement(SearchContent, { width = uDim_2 })
		})
	end,
	ContentFillWithTrailingCell = function(p10)
		-- upvalues: reactModule (ref), CompositionShell (ref), textModule (ref), headerBarModule (ref), uDim_2 (ref), SearchContent (ref), icon (ref), iconButtonModule (ref), noop (ref)
		return reactModule.createElement(CompositionShell, {
			LayoutOrder = p10.LayoutOrder,
			width = p10.width,
			leading = reactModule.createElement(headerBarModule.Leading, nil, {
				Title = reactModule.createElement(textModule, {
					Text = "Page Title",
					tag = "auto-xy text-heading-medium content-emphasis",
					LayoutOrder = 1
				})
			}),
			content = reactModule.createElement(SearchContent, { width = uDim_2 }),
			trailing = reactModule.createElement(headerBarModule.Trailing, nil, {
				Filter = reactModule.createElement(iconButtonModule, {
					LayoutOrder = 1,
					icon = icon.ThreeSlidersHorizontal,
					onActivated = noop
				})
			})
		})
	end,
	CrowdedLeadingCell = function(p10)
		-- upvalues: reactModule (ref), CompositionShell (ref), icon (ref), iconButtonModule (ref), noop (ref), headerBarModule (ref), uDim (ref), uDim_1 (ref), SearchContent (ref), avatarModule (ref), avatarSizeModule (ref)
		return reactModule.createElement(CompositionShell, {
			LayoutOrder = p10.LayoutOrder,
			width = p10.width,
			leading = reactModule.createElement(headerBarModule.Leading, nil, {
				Menu = reactModule.createElement(iconButtonModule, {
					LayoutOrder = 1,
					icon = icon.ThreeBarsHorizontal,
					onActivated = noop
				}),
				Back = reactModule.createElement(iconButtonModule, {
					LayoutOrder = 2,
					icon = icon.ChevronLargeLeft,
					onActivated = noop
				})
			}),
			content = reactModule.createElement(SearchContent, { width = if p10.width <= 360 then uDim else uDim_1 }),
			trailing = reactModule.createElement(headerBarModule.Trailing, nil, {
				Account = reactModule.createElement(avatarModule, {
					userId = 24813339,
					LayoutOrder = 1,
					size = avatarSizeModule.Small
				})
			})
		})
	end,
	CrowdedTrailingCell = function(p10)
		-- upvalues: reactModule (ref), CompositionShell (ref), icon (ref), iconButtonModule (ref), noop (ref), headerBarModule (ref), uDim (ref), uDim_1 (ref), SearchContent (ref), avatarModule (ref), avatarSizeModule (ref)
		return reactModule.createElement(CompositionShell, {
			LayoutOrder = p10.LayoutOrder,
			width = p10.width,
			leading = reactModule.createElement(headerBarModule.Leading, nil, {
				Menu = reactModule.createElement(iconButtonModule, {
					LayoutOrder = 1,
					icon = icon.ThreeBarsHorizontal,
					onActivated = noop
				})
			}),
			content = reactModule.createElement(SearchContent, { width = if p10.width <= 360 then uDim else uDim_1 }),
			trailing = reactModule.createElement(headerBarModule.Trailing, nil, {
				Currency = reactModule.createElement(iconButtonModule, { LayoutOrder = 1, icon = icon.Robux, onActivated = noop }),
				Notifications = reactModule.createElement(iconButtonModule, { LayoutOrder = 2, icon = icon.Bell, onActivated = noop }),
				Account = reactModule.createElement(avatarModule, {
					userId = 24813339,
					LayoutOrder = 3,
					size = avatarSizeModule.Small
				})
			})
		})
	end,
	GlobalNavigationCell = function(p10)
		-- upvalues: reactModule (ref), CompositionShell (ref), icon (ref), iconButtonModule (ref), noop (ref), textModule (ref), headerBarModule (ref), utilityTrailing (ref)
		local var3 = p10.width <= 360
		
		return reactModule.createElement(CompositionShell, {
			LayoutOrder = p10.LayoutOrder,
			width = p10.width,
			leading = reactModule.createElement(headerBarModule.Leading, nil, {
				Menu = if var3 then reactModule.createElement(iconButtonModule, {
					LayoutOrder = 1,
					icon = icon.ThreeBarsHorizontal,
					onActivated = noop
				}) else nil,
				Title = reactModule.createElement(textModule, {
					Text = "Page Title",
					tag = "auto-xy text-heading-medium content-emphasis",
					LayoutOrder = 2
				})
			}),
			trailing = utilityTrailing(not var3)
		})
	end,
	SearchCell = function(p10)
		-- upvalues: reactModule (ref), CompositionShell (ref), icon (ref), iconButtonModule (ref), noop (ref), textModule (ref), headerBarModule (ref), uDim (ref), uDim_1 (ref), SearchContent (ref), utilityTrailing (ref)
		local var3 = p10.width <= 360
		
		return reactModule.createElement(CompositionShell, {
			LayoutOrder = p10.LayoutOrder,
			width = p10.width,
			leading = reactModule.createElement(headerBarModule.Leading, nil, {
				Back = if var3 then reactModule.createElement(iconButtonModule, {
					LayoutOrder = 1,
					icon = icon.ChevronLargeLeft,
					onActivated = noop
				}) else nil,
				Title = if var3 then nil else reactModule.createElement(textModule, {
					Text = "Page Title",
					tag = "auto-xy text-heading-medium content-emphasis",
					LayoutOrder = 2
				})
			}),
			content = reactModule.createElement(SearchContent, { width = if var3 then uDim else uDim_1 }),
			trailing = if var3 then reactModule.createElement(headerBarModule.Trailing, nil, {
				Filter = reactModule.createElement(iconButtonModule, {
					LayoutOrder = 1,
					icon = icon.ThreeSlidersHorizontal,
					onActivated = noop
				})
			}) else utilityTrailing(true)
		})
	end
}