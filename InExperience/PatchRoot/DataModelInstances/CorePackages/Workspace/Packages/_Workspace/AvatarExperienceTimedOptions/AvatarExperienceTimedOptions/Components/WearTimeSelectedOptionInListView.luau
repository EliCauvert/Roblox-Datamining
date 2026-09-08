local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local popover = foundationModule.Popover
local view = foundationModule.View
local text = foundationModule.Text
local enums = foundationModule.Enums
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local wearTimeListModule = require(script.Parent.WearTimeList)
local _ = require(script.Parent.useWearTimeSelectedOptionViewModel)
local useWearTimePopoverFocusNavigationBindingsModule = require(script.Parent.useWearTimePopoverFocusNavigationBindings)

return function(p1)
	-- upvalues: reactModule (ref), useWearTimePopoverFocusNavigationBindingsModule (ref), view (ref), text (ref), foundationModule (ref), enums (ref), popover (ref), popoverAlign (ref), popoverSide (ref), wearTimeListModule (ref)
	local tokens = p1.tokens
	
	return reactModule.createElement(view, { tag = "auto-xy" }, {
		TriggerButton = reactModule.createElement("TextButton", {
			Text = "",
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BorderSizePixel = 0,
			Transparency = p1.tokens.Color.Shift.Shift_200.Transparency,
			BackgroundColor3 = p1.tokens.Color.Shift.Shift_200.Color3,
			ref = p1.anchorRef,
			[reactModule.Event.Activated] = function()
				-- upvalues: p1 (ref)
				p1.setIsOpen(not p1.isOpen)
			end
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, tokens.Radius.Circle) }),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, tokens.Padding.XXSmall)
			}),
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, tokens.Padding.Medium),
				PaddingRight = UDim.new(0, tokens.Padding.Medium),
				PaddingTop = UDim.new(0, tokens.Padding.Small),
				PaddingBottom = UDim.new(0, tokens.Padding.Small)
			}),
			TopRow = reactModule.createElement(view, {
				tag = "row align-y-center gap-small auto-xy",
				LayoutOrder = 1
			}, {
				Duration = reactModule.createElement(text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = p1.listLabelText,
					textStyle = tokens.Color.Content.Emphasis,
					fontStyle = {
						Font = tokens.Typography.TitleSmall.Font,
						FontSize = tokens.FontSize.FontSize_300
					}
				}),
				ChevronIcon = reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 3,
					name = enums.IconName.ChevronLargeDown,
					variant = enums.IconVariant.Regular,
					size = enums.IconSize.Small
				})
			})
		}),
		Popover = reactModule.createElement(popover.Root, { isOpen = p1.isOpen }, {
			Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p1.anchorRef }),
			Content = reactModule.createElement(popover.Content, {
				hasArrow = false,
				align = popoverAlign.Start,
				side = popoverSide.Bottom,
				onPressedOutside = function()
					-- upvalues: p1 (ref)
					p1.setIsOpen(false)
				end
			}, {
				ContentWrapper = reactModule.createElement(view, {
					tag = "auto-y",
					Size = UDim2.new(0, tokens.Size.Size_2900 * 2, 0, 0),
					ref = useWearTimePopoverFocusNavigationBindingsModule(reactModule.useCallback(function()
						-- upvalues: p1 (ref)
						p1.setIsOpen(false)
					end, { p1.setIsOpen }), p1.isOpen, p1.anchorRef)
				}, {
					WearTimeList = reactModule.createElement(wearTimeListModule, {
						options = p1.updatedOptions,
						selectedIndex = p1.selectedIndex,
						onOptionActivated = p1.handleOptionActivated
					})
				})
			})
		})
	})
end