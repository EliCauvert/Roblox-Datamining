local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local AvatarModule = require(Foundation.Components.Avatar)
local AvatarSizeModule = require(Foundation.Enums.AvatarSize)
local BreakpointModule = require(Foundation.Enums.Breakpoint)
local BreakpointConfigModule = require(Foundation.Utility.Responsive.BreakpointConfig)
local HeaderBarModule = require(Foundation.Components.HeaderBar)
local IconButtonModule = require(Foundation.Components.IconButton)
local _ = require(Foundation.Providers.Responsive.ResponsiveContext)
local ResponsiveProviderModule = require(Foundation.Providers.Responsive.ResponsiveProvider)
local SearchInputModule = require(Foundation.Components.SearchInput)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local UseResponsiveModule = require(Foundation.Providers.Responsive.useResponsive)
local LabeledCell = require(Foundation.Utility.Stories.Shared.StorySection).LabeledCell
local Icon = require(Parent.BuilderIcons).Icon
local Order = {
	BreakpointModule.XSmall, BreakpointModule.Small, BreakpointModule.Medium,
	BreakpointModule.Large, BreakpointModule.XLarge, BreakpointModule.XXLarge
}
local XSmall = BreakpointModule.XSmall
local Presets = {}
local t = {}

for i, value in {
	{
		preset = "XSmall (360px)",
		breakpoint = BreakpointModule.XSmall,
		width = BreakpointConfigModule.widths[BreakpointModule.XSmall]
	},
	{
		preset = "Small (600px)",
		breakpoint = BreakpointModule.Small,
		width = BreakpointConfigModule.widths[BreakpointModule.Small]
	},
	{
		preset = "Medium (1140px)",
		breakpoint = BreakpointModule.Medium,
		width = BreakpointConfigModule.widths[BreakpointModule.Medium]
	},
	{
		preset = "Large (1520px)",
		breakpoint = BreakpointModule.Large,
		width = BreakpointConfigModule.widths[BreakpointModule.Large]
	},
	{
		preset = "XLarge (1920px)",
		breakpoint = BreakpointModule.XLarge,
		width = BreakpointConfigModule.widths[BreakpointModule.XLarge]
	},
	{
		preset = "XXLarge (2560px)",
		width = 2560,
		breakpoint = BreakpointModule.XXLarge
	}
} do
	Presets[i] = value.preset
	t[value.preset] = value
end
local Actions = {
	{
		id = "search",
		icon = Icon.MagnifyingGlass,
		onActivated = function() --[[ Line: 168 ]] end
	},
	{
		id = "robux",
		icon = Icon.Robux,
		onActivated = function() --[[ Line: 173 ]] end
	},
	{
		id = "notifications",
		icon = Icon.Bell,
		onActivated = function() --[[ Line: 178 ]] end
	}
}

local function slotChip(Text, XOffset, LayoutOrder, IsIsSubject) --[[ Line: 198 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
	local RowAlignXCenterAlignYCenterPaddingSmallRadiusMediumBgActionEmphasis: string = if IsIsSubject then "row align-x-center align-y-center padding-small radius-medium bg-action-emphasis" else "row align-x-center align-y-center padding-small radius-medium bg-shift-200"
	
	return ReactModule.createElement(ViewModule, {
		tag = if XOffset then RowAlignXCenterAlignYCenterPaddingSmallRadiusMediumBgActionEmphasis else `auto-x {RowAlignXCenterAlignYCenterPaddingSmallRadiusMediumBgActionEmphasis}`,
		Size = if XOffset then UDim2.new(0, XOffset, 1, 0) else UDim2.fromScale(0, 1),
		LayoutOrder = LayoutOrder
	}, {
		Label = ReactModule.createElement(TextModule, {
			LayoutOrder = 1,
			Text = Text,
			tag = if IsIsSubject then "auto-xy text-caption-small content-inverse-emphasis" else "auto-xy text-caption-small content-muted"
		})
	})
end

local function slotPlaceholders(p1, p2, p3, p4, p5) --[[ Line: 216 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), slotChip (copy)
	local P9 = p5 or {}
	local ChildCount = P9.childCount or 1
	local IsIsSubject = P9.isSubject == true
	
	if ChildCount == 1 then
		local Demand = P9.demand or p2
		local IsFill = P9.fill == true
		
		return {
			Band = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = `{if IsIsSubject then "fill row align-y-center radius-medium stroke-system-emphasis" else "fill row align-y-center radius-medium stroke-default"} {p3}`,
				Size = if IsFill then UDim2.fromScale(1, 1) else UDim2.new(0, Demand, 1, 0)
			}, {
				Chip = slotChip(if IsFill then `{p1} 100%` elseif P9.showDemand then `{p1} {Demand}px` else p1, if IsFill or p4 then nil else Demand, 1, IsIsSubject)
			})
		}
	end
	local t = {}
	
	for i = 1, ChildCount do
		t[`Child{i}`] = slotChip(`Child {i}`, nil, i, IsIsSubject)
	end
	return t
end

local function leadingSlot(Leading) --[[ Line: 253 ]]
	-- upvalues: ReactModule (copy), HeaderBarModule (copy)
	return ReactModule.createElement(HeaderBarModule.Leading, nil, Leading)
end

local function contentSlot(Content) --[[ Line: 257 ]]
	-- upvalues: ReactModule (copy), HeaderBarModule (copy)
	return ReactModule.createElement(HeaderBarModule.Content, nil, Content)
end

local function trailingSlot(Elements) --[[ Line: 261 ]]
	-- upvalues: ReactModule (copy), HeaderBarModule (copy)
	return ReactModule.createElement(HeaderBarModule.Trailing, nil, Elements)
end

local function ForcedBreakpoint(p6) --[[ Line: 277 ]]
	-- upvalues: UseResponsiveModule (copy), ReactModule (copy), Order (copy), ResponsiveProviderModule (copy)
	local Config = UseResponsiveModule().config
	
	return ReactModule.createElement(ResponsiveProviderModule, {
		config = ReactModule.useMemo(function() --[[ Line: 283 ]]
			-- upvalues: Order (upval), p6 (copy), Config (copy)
			local Widths = {}
			local Flag = false
			
			for _, value in Order do
				if value == p6.breakpoint then
					Flag = true
				end
				Widths[value] = if Flag then 1e999 else -1
			end
			return {
				breakpoint = {
					order = Order,
					shortNames = Config.breakpoint.shortNames,
					widths = Widths
				},
				grid = Config.grid
			}
		end, { Config, p6.breakpoint })
	}, p6.children)
end

local function Shell(Frame) --[[ Line: 308 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), HeaderBarModule (copy), slotPlaceholders (copy), ForcedBreakpoint (copy), XSmall (copy)
	return ReactModule.createElement(ForcedBreakpoint, { breakpoint = Frame.breakpoint or XSmall }, (ReactModule.createElement(ViewModule, {
		tag = "col auto-y stroke-default bg-surface-100",
		Size = UDim2.fromOffset(Frame.width or 360, 0),
		LayoutOrder = Frame.LayoutOrder
	}, {
		HeaderBar = ReactModule.createElement(HeaderBarModule.Root, { LayoutOrder = 1, hasBackground = Frame.hasBackground }, {
			Leading = if Frame.hasPlaceholderSlots then ReactModule.createElement(HeaderBarModule.Leading, nil, (slotPlaceholders("Leading", 96, "align-x-left", true, nil))) else Frame.leading,
			Content = if Frame.hasPlaceholderSlots then ReactModule.createElement(HeaderBarModule.Content, nil, (slotPlaceholders("Content", 128, "align-x-center", false, nil))) else Frame.content,
			Trailing = if Frame.hasPlaceholderSlots then ReactModule.createElement(HeaderBarModule.Trailing, nil, (slotPlaceholders("Trailing", 96, "align-x-right", true, nil))) else Frame.trailing
		})
	})))
end

local function LabeledShell(Frame: Frame) --[[ Line: 331 ]]
	-- upvalues: ReactModule (copy), Shell (copy), LabeledCell (copy)
	local Element = ReactModule.createElement(Shell, {
		LayoutOrder = if Frame.label then 1 else Frame.LayoutOrder,
		width = Frame.width,
		breakpoint = Frame.breakpoint,
		hasBackground = Frame.hasBackground,
		hasPlaceholderSlots = Frame.hasPlaceholderSlots,
		leading = Frame.leading,
		content = Frame.content,
		trailing = Frame.trailing
	})
	
	return if Frame.label then ReactModule.createElement(LabeledCell, {
		LayoutOrder = Frame.LayoutOrder or 1,
		label = Frame.label
	}, { Shell = Element }) else Element
end

local Widths = { 360, 720 }
local _UDim = UDim.new(0, 176)
local _UDim1 = UDim.new(0, 320)
local _UDim2 = UDim.new(1, 0)

local function noop() --[[ Line: 380 ]] end

local function _(p7: number): boolean --[[ Line: 382 | Named "isCompact" ]]
	return p7 <= 360
end

local _ = function(p7) --[[ Line: 386 | Named "searchWidth" ]]
	-- upvalues: _UDim (copy), _UDim1 (copy)
	return if p7 then _UDim else _UDim1
end

local _ = function(LayoutOrder) --[[ Line: 390 | Named "pageTitle" ]]
	-- upvalues: ReactModule (copy), TextModule (copy)
	return ReactModule.createElement(TextModule, {
		Text = "Page Title",
		tag = "auto-xy text-heading-medium content-emphasis",
		LayoutOrder = LayoutOrder
	})
end

local _ = function(Icon, LayoutOrder) --[[ Line: 398 | Named "iconButton" ]]
	-- upvalues: ReactModule (copy), IconButtonModule (copy), noop (copy)
	return ReactModule.createElement(IconButtonModule, {
		icon = Icon,
		onActivated = noop,
		LayoutOrder = LayoutOrder
	})
end

local _ = function(LayoutOrder) --[[ Line: 406 | Named "accountAvatar" ]]
	-- upvalues: ReactModule (copy), AvatarModule (copy), AvatarSizeModule (copy)
	return ReactModule.createElement(AvatarModule, {
		userId = 24813339,
		size = AvatarSizeModule.Small,
		LayoutOrder = LayoutOrder
	})
end

local function SearchContent(p7) --[[ Line: 414 ]]
	-- upvalues: ReactModule (copy), contentSlot (copy), SearchInputModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
	
	return contentSlot({
		Search = ReactModule.createElement(SearchInputModule, {
			LayoutOrder = 1,
			text = UseBindingResult,
			onChanged = UseBindingResult2,
			width = p7.width
		})
	})
end

local _ = function(Width) --[[ Line: 427 | Named "searchContent" ]]
	-- upvalues: ReactModule (copy), SearchContent (copy)
	return ReactModule.createElement(SearchContent, { width = Width })
end

local function utilityTrailing(p7) --[[ Line: 431 ]]
	-- upvalues: trailingSlot (copy), ReactModule (copy), HeaderBarModule (copy), Actions (copy), IconButtonModule (copy), noop (copy), AvatarModule (copy), AvatarSizeModule (copy)
	if not p7 then
		return trailingSlot({
			Actions = ReactModule.createElement(HeaderBarModule.Actions, { actions = Actions })
		})
	end
	local Elements = {}
	
	for LayoutOrder, action in Actions do
		Elements[tostring(action.id)] = ReactModule.createElement(IconButtonModule, {
			icon = action.icon,
			onActivated = noop,
			LayoutOrder = LayoutOrder
		})
	end
	Elements.Account = ReactModule.createElement(AvatarModule, {
		userId = 24813339,
		size = AvatarSizeModule.Small,
		LayoutOrder = #Actions + 1
	})
	
	return trailingSlot(Elements)
end

local _ = function(p8) --[[ Line: 449 | Named "searchTrailing" ]]
	-- upvalues: trailingSlot (copy), Icon (copy), ReactModule (copy), IconButtonModule (copy), noop (copy), utilityTrailing (copy)
	return if p8 then trailingSlot({
		Filter = ReactModule.createElement(IconButtonModule, {
			LayoutOrder = 1,
			icon = Icon.ThreeSlidersHorizontal,
			onActivated = noop
		})
	}) else utilityTrailing(true)
end

local function CompositionShell(Frame) --[[ Line: 459 ]]
	-- upvalues: ReactModule (copy), LabeledShell (copy), BreakpointModule (copy)
	local IsWidthBelow = Frame.width <= 360
	
	return ReactModule.createElement(LabeledShell, {
		LayoutOrder = Frame.LayoutOrder,
		label = `{Frame.width}px`,
		width = Frame.width,
		breakpoint = if IsWidthBelow then BreakpointModule.XSmall else BreakpointModule.Small,
		leading = Frame.leading,
		content = Frame.content,
		trailing = Frame.trailing
	})
end

local function CompositionGroup(Frame) --[[ Line: 598 ]]
	-- upvalues: Widths (copy), ReactModule (copy), ViewModule (copy)
	local Elements = {}
	
	for LayoutOrder, width in Widths do
		Elements[`Width{width}`] = ReactModule.createElement(Frame.Cell, { LayoutOrder = LayoutOrder, width = width })
	end
	return ReactModule.createElement(ViewModule, {
		tag = "col align-x-left gap-medium auto-xy",
		LayoutOrder = Frame.LayoutOrder
	}, Elements)
end

return {
	MOBILE_PARENT_WIDTH = 360,
	OVERSIZED_DEMAND = 400,
	WIDTH_TIERS = {
		{ width = 360, label = `Mobile, parent width {360}px` },
		{ width = 720, label = `Desktop, parent width {720}px` }
	},
	HEIGHT_TIERS = {
		{
			label = "XSmall, Small",
			breakpoint = BreakpointModule.Small
		},
		{
			label = "Medium, Large",
			breakpoint = BreakpointModule.Large
		},
		{
			label = "XLarge, XXLarge",
			breakpoint = BreakpointModule.XXLarge
		}
	},
	VIEWPORT_ORDER = Presets,
	VIEWPORT_BY_PRESET = t,
	SLOT_CHILD_COUNTS = { 1, 2, 3 },
	LEADING_ACTIONS = {
		{
			id = "close",
			icon = Icon.X,
			onActivated = function() --[[ Line: 155 ]] end
		},
		{
			id = "back",
			icon = Icon.ChevronLargeLeft,
			onActivated = function() --[[ Line: 160 ]] end
		}
	},
	TRAILING_ACTIONS = Actions,
	takeActions = function(p8, p9: number) --[[ Line: 182 ]]
		return table.move(p8, 1, math.min(p9, #p8), 1, {})
	end,
	leadingPlaceholder = function(p8) --[[ Line: 265 ]]
		-- upvalues: leadingSlot (copy), slotPlaceholders (copy)
		return leadingSlot((slotPlaceholders("Leading", 96, "align-x-left", true, p8)))
	end,
	contentPlaceholder = function(p8) --[[ Line: 269 ]]
		-- upvalues: contentSlot (copy), slotPlaceholders (copy)
		return contentSlot((slotPlaceholders("Content", 128, "align-x-center", false, p8)))
	end,
	trailingPlaceholder = function(p8) --[[ Line: 273 ]]
		-- upvalues: trailingSlot (copy), slotPlaceholders (copy)
		return trailingSlot((slotPlaceholders("Trailing", 96, "align-x-right", true, p8)))
	end,
	LabeledShell = LabeledShell,
	Shell = Shell,
	SlotPattern = function(Frame) --[[ Line: 616 ]]
		-- upvalues: ReactModule (copy), ViewModule (copy), LabeledShell (copy), CompositionGroup (copy)
		return ReactModule.createElement(ViewModule, {
			tag = "col align-x-left gap-medium auto-xy",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Placeholder = ReactModule.createElement(LabeledShell, {
				LayoutOrder = 1,
				label = Frame.label,
				hasPlaceholderSlots = Frame.hasPlaceholderSlots,
				leading = Frame.leading,
				content = Frame.content,
				trailing = Frame.trailing
			}),
			Composition = if Frame.Cell then ReactModule.createElement(CompositionGroup, { LayoutOrder = 2, Cell = Frame.Cell }) else nil
		})
	end,
	tierCells = function(List) --[[ Line: 355 ]]
		-- upvalues: ReactModule (copy), LabeledShell (copy)
		local Elements = {}
		
		for LayoutOrder, value in List do
			Elements[value.label] = ReactModule.createElement(LabeledShell, {
				hasPlaceholderSlots = true,
				LayoutOrder = LayoutOrder,
				label = value.label,
				width = value.width,
				breakpoint = value.breakpoint
			})
		end
		return Elements
	end,
	CenteredDetailCell = function(Frame) --[[ Line: 570 ]]
		-- upvalues: ReactModule (copy), CompositionShell (copy), Icon (copy), IconButtonModule (copy), noop (copy), HeaderBarModule (copy), ViewModule (copy), TextModule (copy)
		return ReactModule.createElement(CompositionShell, {
			LayoutOrder = Frame.LayoutOrder,
			width = Frame.width,
			leading = ReactModule.createElement(HeaderBarModule.Leading, nil, {
				Close = ReactModule.createElement(IconButtonModule, { LayoutOrder = 1, icon = Icon.X, onActivated = noop }),
				Back = ReactModule.createElement(IconButtonModule, {
					LayoutOrder = 2,
					icon = Icon.ChevronLargeLeft,
					onActivated = noop
				})
			}),
			content = ReactModule.createElement(HeaderBarModule.Content, nil, {
				Stack = ReactModule.createElement(ViewModule, { tag = "col align-x-center auto-xy", LayoutOrder = 1 }, {
					Title = ReactModule.createElement(TextModule, {
						Text = "Title",
						tag = "auto-xy text-label-medium content-emphasis",
						LayoutOrder = 1
					}),
					Subtitle = ReactModule.createElement(TextModule, {
						Text = "Username: 13+",
						tag = "auto-xy text-caption-small content-muted",
						LayoutOrder = 2
					})
				})
			})
		})
	end,
	ContentAndTrailingCell = function(Frame) --[[ Line: 503 ]]
		-- upvalues: ReactModule (copy), CompositionShell (copy), _UDim (copy), _UDim1 (copy), SearchContent (copy), Icon (copy), IconButtonModule (copy), noop (copy), HeaderBarModule (copy), utilityTrailing (copy)
		local IsWidthBelow = Frame.width <= 360
		
		return ReactModule.createElement(CompositionShell, {
			LayoutOrder = Frame.LayoutOrder,
			width = Frame.width,
			content = ReactModule.createElement(SearchContent, { width = if IsWidthBelow then _UDim else _UDim1 }),
			trailing = if IsWidthBelow then ReactModule.createElement(HeaderBarModule.Trailing, nil, {
				Filter = ReactModule.createElement(IconButtonModule, {
					LayoutOrder = 1,
					icon = Icon.ThreeSlidersHorizontal,
					onActivated = noop
				})
			}) else utilityTrailing(true)
		})
	end,
	ContentFillCell = function(Frame) --[[ Line: 514 ]]
		-- upvalues: ReactModule (copy), CompositionShell (copy), TextModule (copy), HeaderBarModule (copy), _UDim2 (copy), SearchContent (copy)
		return ReactModule.createElement(CompositionShell, {
			LayoutOrder = Frame.LayoutOrder,
			width = Frame.width,
			leading = ReactModule.createElement(HeaderBarModule.Leading, nil, {
				Title = ReactModule.createElement(TextModule, {
					Text = "Page Title",
					tag = "auto-xy text-heading-medium content-emphasis",
					LayoutOrder = 1
				})
			}),
			content = ReactModule.createElement(SearchContent, { width = _UDim2 })
		})
	end,
	ContentFillWithTrailingCell = function(Frame) --[[ Line: 525 ]]
		-- upvalues: ReactModule (copy), CompositionShell (copy), TextModule (copy), HeaderBarModule (copy), _UDim2 (copy), SearchContent (copy), Icon (copy), IconButtonModule (copy), noop (copy)
		return ReactModule.createElement(CompositionShell, {
			LayoutOrder = Frame.LayoutOrder,
			width = Frame.width,
			leading = ReactModule.createElement(HeaderBarModule.Leading, nil, {
				Title = ReactModule.createElement(TextModule, {
					Text = "Page Title",
					tag = "auto-xy text-heading-medium content-emphasis",
					LayoutOrder = 1
				})
			}),
			content = ReactModule.createElement(SearchContent, { width = _UDim2 }),
			trailing = ReactModule.createElement(HeaderBarModule.Trailing, nil, {
				Filter = ReactModule.createElement(IconButtonModule, {
					LayoutOrder = 1,
					icon = Icon.ThreeSlidersHorizontal,
					onActivated = noop
				})
			})
		})
	end,
	CrowdedLeadingCell = function(Frame) --[[ Line: 539 ]]
		-- upvalues: ReactModule (copy), CompositionShell (copy), Icon (copy), IconButtonModule (copy), noop (copy), HeaderBarModule (copy), _UDim (copy), _UDim1 (copy), SearchContent (copy), AvatarModule (copy), AvatarSizeModule (copy)
		local IsWidthBelow = Frame.width <= 360
		
		return ReactModule.createElement(CompositionShell, {
			LayoutOrder = Frame.LayoutOrder,
			width = Frame.width,
			leading = ReactModule.createElement(HeaderBarModule.Leading, nil, {
				Menu = ReactModule.createElement(IconButtonModule, {
					LayoutOrder = 1,
					icon = Icon.ThreeBarsHorizontal,
					onActivated = noop
				}),
				Back = ReactModule.createElement(IconButtonModule, {
					LayoutOrder = 2,
					icon = Icon.ChevronLargeLeft,
					onActivated = noop
				})
			}),
			content = ReactModule.createElement(SearchContent, { width = if IsWidthBelow then _UDim else _UDim1 }),
			trailing = ReactModule.createElement(HeaderBarModule.Trailing, nil, {
				Account = ReactModule.createElement(AvatarModule, {
					userId = 24813339,
					LayoutOrder = 1,
					size = AvatarSizeModule.Small
				})
			})
		})
	end,
	CrowdedTrailingCell = function(Frame) --[[ Line: 554 ]]
		-- upvalues: ReactModule (copy), CompositionShell (copy), Icon (copy), IconButtonModule (copy), noop (copy), HeaderBarModule (copy), _UDim (copy), _UDim1 (copy), SearchContent (copy), AvatarModule (copy), AvatarSizeModule (copy)
		local IsWidthBelow = Frame.width <= 360
		
		return ReactModule.createElement(CompositionShell, {
			LayoutOrder = Frame.LayoutOrder,
			width = Frame.width,
			leading = ReactModule.createElement(HeaderBarModule.Leading, nil, {
				Menu = ReactModule.createElement(IconButtonModule, {
					LayoutOrder = 1,
					icon = Icon.ThreeBarsHorizontal,
					onActivated = noop
				})
			}),
			content = ReactModule.createElement(SearchContent, { width = if IsWidthBelow then _UDim else _UDim1 }),
			trailing = ReactModule.createElement(HeaderBarModule.Trailing, nil, {
				Currency = ReactModule.createElement(IconButtonModule, { LayoutOrder = 1, icon = Icon.Robux, onActivated = noop }),
				Notifications = ReactModule.createElement(IconButtonModule, { LayoutOrder = 2, icon = Icon.Bell, onActivated = noop }),
				Account = ReactModule.createElement(AvatarModule, {
					userId = 24813339,
					LayoutOrder = 3,
					size = AvatarSizeModule.Small
				})
			})
		})
	end,
	GlobalNavigationCell = function(Frame) --[[ Line: 474 ]]
		-- upvalues: ReactModule (copy), CompositionShell (copy), Icon (copy), IconButtonModule (copy), noop (copy), TextModule (copy), HeaderBarModule (copy), utilityTrailing (copy)
		local IsWidthBelow = Frame.width <= 360
		
		return ReactModule.createElement(CompositionShell, {
			LayoutOrder = Frame.LayoutOrder,
			width = Frame.width,
			leading = ReactModule.createElement(HeaderBarModule.Leading, nil, {
				Menu = if IsWidthBelow then ReactModule.createElement(IconButtonModule, {
					LayoutOrder = 1,
					icon = Icon.ThreeBarsHorizontal,
					onActivated = noop
				}) else nil,
				Title = ReactModule.createElement(TextModule, {
					Text = "Page Title",
					tag = "auto-xy text-heading-medium content-emphasis",
					LayoutOrder = 2
				})
			}),
			trailing = utilityTrailing(not IsWidthBelow)
		})
	end,
	SearchCell = function(Frame) --[[ Line: 488 ]]
		-- upvalues: ReactModule (copy), CompositionShell (copy), Icon (copy), IconButtonModule (copy), noop (copy), TextModule (copy), HeaderBarModule (copy), _UDim (copy), _UDim1 (copy), SearchContent (copy), utilityTrailing (copy)
		local IsWidthBelow = Frame.width <= 360
		
		return ReactModule.createElement(CompositionShell, {
			LayoutOrder = Frame.LayoutOrder,
			width = Frame.width,
			leading = ReactModule.createElement(HeaderBarModule.Leading, nil, {
				Back = if IsWidthBelow then ReactModule.createElement(IconButtonModule, {
					LayoutOrder = 1,
					icon = Icon.ChevronLargeLeft,
					onActivated = noop
				}) else nil,
				Title = if IsWidthBelow then nil else ReactModule.createElement(TextModule, {
					Text = "Page Title",
					tag = "auto-xy text-heading-medium content-emphasis",
					LayoutOrder = 2
				})
			}),
			content = ReactModule.createElement(SearchContent, { width = if IsWidthBelow then _UDim else _UDim1 }),
			trailing = if IsWidthBelow then ReactModule.createElement(HeaderBarModule.Trailing, nil, {
				Filter = ReactModule.createElement(IconButtonModule, {
					LayoutOrder = 1,
					icon = Icon.ThreeSlidersHorizontal,
					onActivated = noop
				})
			}) else utilityTrailing(true)
		})
	end
}