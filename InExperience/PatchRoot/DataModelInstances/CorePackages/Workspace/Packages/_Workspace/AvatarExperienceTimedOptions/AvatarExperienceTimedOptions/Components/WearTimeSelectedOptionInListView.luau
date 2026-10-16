local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Popover = FoundationModule.Popover
local View = FoundationModule.View
local Text = FoundationModule.Text
local Enums = FoundationModule.Enums
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local WearTimeListModule = require(script.Parent.WearTimeList)
local _ = require(script.Parent.useWearTimeSelectedOptionViewModel)
local UseWearTimePopoverFocusNavigationBindingsModule = require(script.Parent.useWearTimePopoverFocusNavigationBindings)

return function(p1) --[[ Line: 19 | Named "WearTimeSelectedOptionInListView" ]]
	-- upvalues: ReactModule (copy), UseWearTimePopoverFocusNavigationBindingsModule (copy), View (copy), Text (copy), FoundationModule (copy), Enums (copy), Popover (copy), PopoverAlign (copy), PopoverSide (copy), WearTimeListModule (copy)
	local Tokens = p1.tokens
	
	return ReactModule.createElement(View, { tag = "auto-xy" }, {
		TriggerButton = ReactModule.createElement("TextButton", {
			Text = "",
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BorderSizePixel = 0,
			Transparency = p1.tokens.Color.Shift.Shift_200.Transparency,
			BackgroundColor3 = p1.tokens.Color.Shift.Shift_200.Color3,
			ref = p1.anchorRef,
			[ReactModule.Event.Activated] = function() --[[ Line: 38 ]]
				-- upvalues: p1 (copy)
				p1.setIsOpen(not p1.isOpen)
			end
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Circle) }),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, Tokens.Padding.XXSmall)
			}),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Tokens.Padding.Medium),
				PaddingRight = UDim.new(0, Tokens.Padding.Medium),
				PaddingTop = UDim.new(0, Tokens.Padding.Small),
				PaddingBottom = UDim.new(0, Tokens.Padding.Small)
			}),
			TopRow = ReactModule.createElement(View, {
				tag = "row align-y-center gap-small auto-xy",
				LayoutOrder = 1
			}, {
				Duration = ReactModule.createElement(Text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = p1.listLabelText,
					textStyle = Tokens.Color.Content.Emphasis,
					fontStyle = {
						Font = Tokens.Typography.TitleSmall.Font,
						FontSize = Tokens.FontSize.FontSize_300
					}
				}),
				ChevronIcon = ReactModule.createElement(FoundationModule.Icon, {
					LayoutOrder = 3,
					name = Enums.IconName.ChevronLargeDown,
					variant = Enums.IconVariant.Regular,
					size = Enums.IconSize.Small
				})
			})
		}),
		Popover = ReactModule.createElement(Popover.Root, { isOpen = p1.isOpen }, {
			Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p1.anchorRef }),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = false,
				align = PopoverAlign.Start,
				side = PopoverSide.Bottom,
				onPressedOutside = function() --[[ Line: 93 ]]
					-- upvalues: p1 (copy)
					p1.setIsOpen(false)
				end
			}, {
				ContentWrapper = ReactModule.createElement(View, {
					tag = "auto-y",
					Size = UDim2.new(0, Tokens.Size.Size_2900 * 2, 0, 0),
					ref = UseWearTimePopoverFocusNavigationBindingsModule(ReactModule.useCallback(function() --[[ Line: 22 ]]
						-- upvalues: p1 (copy)
						p1.setIsOpen(false)
					end, { p1.setIsOpen }), p1.isOpen, p1.anchorRef)
				}, {
					WearTimeList = ReactModule.createElement(WearTimeListModule, {
						options = p1.updatedOptions,
						selectedIndex = p1.selectedIndex,
						onOptionActivated = p1.handleOptionActivated
					})
				})
			})
		})
	})
end