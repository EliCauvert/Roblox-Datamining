local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local PopForcePickerModelModule = require(script.Parent.PopForcePickerModel)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Popover = FoundationModule.Popover
local IconName = FoundationModule.Enums.IconName
local config = { Transparency = 0, Color3 = Color3.fromRGB(66, 49, 17) }
local config1 = { Transparency = 0, Color3 = Color3.fromRGB(255, 222, 128) }
local _Color3 = Color3.fromRGB(255, 205, 77)

local function PickerRow(Frame) --[[ Line: 50 ]]
	-- upvalues: ReactModule (copy), View (copy), config (copy), _Color3 (copy), Icon (copy), IconName (copy), config1 (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-small radius-small",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId,
		onActivated = Frame.onActivated,
		selection = { Selectable = true },
		backgroundStyle = if Frame.selected then config else Frame.tokens.Color.Surface.Surface_100,
		stroke = {
			Color = if Frame.selected then _Color3 else Frame.tokens.Color.Stroke.Default.Color3,
			Transparency = if Frame.selected then 0 else 1,
			Thickness = Frame.tokens.Stroke.Standard
		}
	}, {
		Choice = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = IconName.Check,
			size = Frame.tokens.Size.Size_400,
			style = if Frame.selected then config1 else { Transparency = 1 },
			testId = Frame.testId .. "-check"
		}),
		Location = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col fill gap-xxsmall size-0-0 auto-y"
		}, {
			Name = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-label-medium text-wrap",
				Text = Frame.name,
				textStyle = if Frame.selected then config1 else Frame.tokens.Color.Content.Emphasis
			}),
			Detail = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap content-muted",
				Text = Frame.detail
			})
		}),
		Ping = if Frame.ping then ReactModule.createElement(Text, {
			LayoutOrder = 3,
			tag = "auto-xy text-label-small",
			Text = Frame.ping,
			textStyle = Frame.pingStyle
		}) else nil
	})
end

return ReactModule.memo(function(Frame) --[[ Line: 98 | Named "PopForcePickerView" ]]
	-- upvalues: PopForcePickerModelModule (copy), ReactModule (copy), PickerRow (copy), View (copy), config (copy), _Color3 (copy), Text (copy), config1 (copy), Icon (copy), IconName (copy), Popover (copy), FoundationModule (copy)
	local Tokens = Frame.tokens
	local IsNotForcedPopMatch = Frame.forcedPop ~= ""
	local DisplayCode = PopForcePickerModelModule.getDisplayCode(Frame.forcedPop)
	local config2 = {
		Auto = ReactModule.createElement(PickerRow, {
			LayoutOrder = 0,
			name = "Automatic matchmaking",
			detail = "Let Roblox choose a server",
			testId = "pop-picker-auto",
			selected = not IsNotForcedPopMatch,
			tokens = Tokens,
			onActivated = function() --[[ Line: 110 ]]
				-- upvalues: Frame (copy)
				Frame.onSelect("")
			end
		})
	}
	
	for LayoutOrder, row in Frame.rows do
		config2[row.popCode] = ReactModule.createElement(PickerRow, {
			LayoutOrder = LayoutOrder,
			name = PopForcePickerModelModule.getLocationName(row.popCode),
			detail = PopForcePickerModelModule.getDisplayCode(row.popCode),
			ping = PopForcePickerModelModule.formatPing(row.rttMs),
			pingStyle = if row.rttMs == nil then Tokens.Color.Content.Muted elseif row.rttMs < 80 then Tokens.Color.System.Success elseif row.rttMs < 160 then Tokens.Color.System.Warning else Tokens.Color.System.Alert,
			selected = row.popCode == Frame.forcedPop,
			tokens = Tokens,
			testId = "pop-picker-row-" .. row.popCode,
			onActivated = function() --[[ Line: 130 ]]
				-- upvalues: Frame (copy), row (copy)
				Frame.onSelect(row.popCode)
			end
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Trigger = ReactModule.createElement(View, {
			testId = "pop-force-picker",
			tag = "row align-y-center gap-xsmall auto-xy padding-small radius-small",
			LayoutOrder = Frame.LayoutOrder,
			ref = Frame.anchorRef,
			onActivated = Frame.onToggleMenu,
			selection = { Selectable = true },
			backgroundStyle = if IsNotForcedPopMatch then config else Tokens.Color.Surface.Surface_200,
			stroke = {
				Color = if IsNotForcedPopMatch then _Color3 else Tokens.Color.Stroke.Default.Color3,
				Transparency = if IsNotForcedPopMatch then 0 else Tokens.Color.Stroke.Default.Transparency,
				Thickness = Tokens.Stroke.Standard
			}
		}, {
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-small",
				Text = if IsNotForcedPopMatch then DisplayCode elseif Frame.compact then "Auto" else "Server: Auto",
				textStyle = if IsNotForcedPopMatch then config1 else Tokens.Color.Content.Emphasis
			}),
			Chevron = ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = IconName.ChevronSmallDown,
				size = Tokens.Size.Size_400,
				style = if IsNotForcedPopMatch then config1 else Tokens.Color.Content.Emphasis
			})
		}),
		Menu = if Frame.isOpen then ReactModule.createElement(Popover.Root, { isOpen = true }, {
			Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = Frame.anchorRef }),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = false,
				side = {
					position = FoundationModule.Enums.PopoverSide.Bottom,
					offset = Tokens.Padding.Small
				},
				align = FoundationModule.Enums.PopoverAlign.End,
				onPressedOutside = Frame.onClose,
				backgroundStyle = Tokens.Color.Surface.Surface_200,
				radius = FoundationModule.Enums.Radius.Medium,
				ref = Frame.focusRef
			}, {
				MenuScroll = ReactModule.createElement(FoundationModule.ScrollView, {
					testId = "pop-picker-menu",
					Size = UDim2.fromOffset(Frame.menuSize.X, Frame.menuSize.Y),
					onAbsoluteCanvasSizeChanged = Frame.onCanvasSizeChanged,
					scroll = {
						CanvasSize = UDim2.fromOffset(0, 0),
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						ScrollingDirection = Enum.ScrollingDirection.Y
					}
				}, {
					Panel = ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y padding-medium" }, {
						Title = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							Text = "Choose your server location",
							tag = "size-full-0 auto-y text-label-large text-wrap content-emphasis"
						}),
						Subtitle = ReactModule.createElement(Text, {
							LayoutOrder = 2,
							Text = "Server ping · lowest first",
							tag = "size-full-0 auto-y text-body-small text-wrap content-muted"
						}),
						Rows = ReactModule.createElement(View, {
							LayoutOrder = 3,
							tag = "col gap-small size-full-0 auto-y",
							padding = UDim.new(0, Tokens.Stroke.Standard)
						}, config2),
						More = if Frame.hasMore then ReactModule.createElement(FoundationModule.Button, {
							LayoutOrder = 4,
							testId = "pop-picker-show-all",
							text = if Frame.showAll then "Show closest five" else "Show all locations",
							variant = FoundationModule.Enums.ButtonVariant.Utility,
							size = FoundationModule.Enums.InputSize.Small,
							onActivated = Frame.onToggleShowAll
						}) else nil,
						Empty = if #Frame.rows == 0 then ReactModule.createElement(Text, {
							LayoutOrder = 5,
							Text = "No server ping samples yet. Reopen to refresh.",
							tag = "size-full-0 auto-y text-body-small text-wrap content-muted"
						}) else nil,
						Error = if Frame.errorText then ReactModule.createElement(Text, {
							LayoutOrder = 6,
							tag = "size-full-0 auto-y text-body-small text-wrap content-alert",
							Text = Frame.errorText
						}) else nil,
						Hint = ReactModule.createElement(Text, {
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