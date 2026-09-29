local parent = script:FindFirstAncestor("GamePlayButton").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local popForcePickerModelModule = require(script.Parent.PopForcePickerModel)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local popover = foundationModule.Popover
local iconName = foundationModule.Enums.IconName
local t = { Transparency = 0, Color3 = Color3.fromRGB(66, 49, 17) }
local t_1 = { Transparency = 0, Color3 = Color3.fromRGB(255, 222, 128) }
local color = Color3.fromRGB(255, 205, 77)

local function PickerRow(p1)
	-- upvalues: reactModule (ref), view (ref), t (ref), color (ref), icon (ref), iconName (ref), t_1 (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-small radius-small",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId,
		onActivated = p1.onActivated,
		selection = { Selectable = true },
		backgroundStyle = if p1.selected then t else p1.tokens.Color.Surface.Surface_100,
		stroke = {
			Color = if p1.selected then color else p1.tokens.Color.Stroke.Default.Color3,
			Transparency = if p1.selected then 0 else 1,
			Thickness = p1.tokens.Stroke.Standard
		}
	}, {
		Choice = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.Check,
			size = p1.tokens.Size.Size_400,
			style = if p1.selected then t_1 else { Transparency = 1 },
			testId = p1.testId .. "-check"
		}),
		Location = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col fill gap-xxsmall size-0-0 auto-y"
		}, {
			Name = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-label-medium text-wrap",
				Text = p1.name,
				textStyle = if p1.selected then t_1 else p1.tokens.Color.Content.Emphasis
			}),
			Detail = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap content-muted",
				Text = p1.detail
			})
		}),
		Ping = if p1.ping then reactModule.createElement(text, {
			LayoutOrder = 3,
			tag = "auto-xy text-label-small",
			Text = p1.ping,
			textStyle = p1.pingStyle
		}) else nil
	})
end

return reactModule.memo(function(p1)
	-- upvalues: popForcePickerModelModule (ref), reactModule (ref), PickerRow (ref), view (ref), t (ref), color (ref), text (ref), t_1 (ref), icon (ref), iconName (ref), popover (ref), foundationModule (ref)
	local tokens = p1.tokens
	local var1 = p1.forcedPop ~= ""
	local displayCode = popForcePickerModelModule.getDisplayCode(p1.forcedPop)
	local t_2 = {
		Auto = reactModule.createElement(PickerRow, {
			LayoutOrder = 0,
			name = "Automatic matchmaking",
			detail = "Let Roblox choose a server",
			testId = "pop-picker-auto",
			selected = not var1,
			tokens = tokens,
			onActivated = function()
				-- upvalues: p1 (ref)
				p1.onSelect("")
			end
		})
	}
	
	for i, v in p1.rows do
		t_2[v.popCode] = reactModule.createElement(PickerRow, {
			LayoutOrder = i,
			name = popForcePickerModelModule.getLocationName(v.popCode),
			detail = popForcePickerModelModule.getDisplayCode(v.popCode),
			ping = popForcePickerModelModule.formatPing(v.rttMs),
			pingStyle = if v.rttMs == nil then tokens.Color.Content.Muted elseif v.rttMs < 80 then tokens.Color.System.Success elseif v.rttMs < 160 then tokens.Color.System.Warning else tokens.Color.System.Alert,
			selected = v.popCode == p1.forcedPop,
			tokens = tokens,
			testId = "pop-picker-row-" .. v.popCode,
			onActivated = function()
				-- upvalues: p1 (ref), v (ref)
				p1.onSelect(v.popCode)
			end
		})
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		Trigger = reactModule.createElement(view, {
			testId = "pop-force-picker",
			tag = "row align-y-center gap-xsmall auto-xy padding-small radius-small",
			LayoutOrder = p1.LayoutOrder,
			ref = p1.anchorRef,
			onActivated = p1.onToggleMenu,
			selection = { Selectable = true },
			backgroundStyle = if var1 then t else tokens.Color.Surface.Surface_200,
			stroke = {
				Color = if var1 then color else tokens.Color.Stroke.Default.Color3,
				Transparency = if var1 then 0 else tokens.Color.Stroke.Default.Transparency,
				Thickness = tokens.Stroke.Standard
			}
		}, {
			Label = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-small",
				Text = if var1 then displayCode elseif p1.compact then "Auto" else "Server: Auto",
				textStyle = if var1 then t_1 else tokens.Color.Content.Emphasis
			}),
			Chevron = reactModule.createElement(icon, {
				LayoutOrder = 2,
				name = iconName.ChevronSmallDown,
				size = tokens.Size.Size_400,
				style = if var1 then t_1 else tokens.Color.Content.Emphasis
			})
		}),
		Menu = if p1.isOpen then reactModule.createElement(popover.Root, { isOpen = true }, {
			Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p1.anchorRef }),
			Content = reactModule.createElement(popover.Content, {
				hasArrow = false,
				side = {
					position = foundationModule.Enums.PopoverSide.Bottom,
					offset = tokens.Padding.Small
				},
				align = foundationModule.Enums.PopoverAlign.End,
				onPressedOutside = p1.onClose,
				backgroundStyle = tokens.Color.Surface.Surface_200,
				radius = foundationModule.Enums.Radius.Medium,
				ref = p1.focusRef
			}, {
				MenuScroll = reactModule.createElement(foundationModule.ScrollView, {
					testId = "pop-picker-menu",
					Size = UDim2.fromOffset(p1.menuSize.X, p1.menuSize.Y),
					onAbsoluteCanvasSizeChanged = p1.onCanvasSizeChanged,
					scroll = {
						CanvasSize = UDim2.fromOffset(0, 0),
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						ScrollingDirection = Enum.ScrollingDirection.Y
					}
				}, {
					Panel = reactModule.createElement(view, { tag = "col gap-small size-full-0 auto-y padding-medium" }, {
						Title = reactModule.createElement(text, {
							LayoutOrder = 1,
							Text = "Choose your server location",
							tag = "size-full-0 auto-y text-label-large text-wrap content-emphasis"
						}),
						Subtitle = reactModule.createElement(text, {
							LayoutOrder = 2,
							Text = "Server ping \194\183 lowest first",
							tag = "size-full-0 auto-y text-body-small text-wrap content-muted"
						}),
						Rows = reactModule.createElement(view, {
							LayoutOrder = 3,
							tag = "col gap-small size-full-0 auto-y",
							padding = UDim.new(0, tokens.Stroke.Standard)
						}, t_2),
						More = if p1.hasMore then reactModule.createElement(foundationModule.Button, {
							LayoutOrder = 4,
							testId = "pop-picker-show-all",
							text = if p1.showAll then "Show closest five" else "Show all locations",
							variant = foundationModule.Enums.ButtonVariant.Utility,
							size = foundationModule.Enums.InputSize.Small,
							onActivated = p1.onToggleShowAll
						}) else nil,
						Empty = if #p1.rows == 0 then reactModule.createElement(text, {
							LayoutOrder = 5,
							Text = "No server ping samples yet. Reopen to refresh.",
							tag = "size-full-0 auto-y text-body-small text-wrap content-muted"
						}) else nil,
						Error = if p1.errorText then reactModule.createElement(text, {
							LayoutOrder = 6,
							tag = "size-full-0 auto-y text-body-small text-wrap content-alert",
							Text = p1.errorText
						}) else nil,
						Hint = reactModule.createElement(text, {
							LayoutOrder = 7,
							Text = "Applies to all experiences until you choose Auto or restart Roblox.",
							tag = "size-full-0 auto-y text-body-small text-wrap content-muted"
						})
					})
				})
			})
		}) else nil
	})
end)