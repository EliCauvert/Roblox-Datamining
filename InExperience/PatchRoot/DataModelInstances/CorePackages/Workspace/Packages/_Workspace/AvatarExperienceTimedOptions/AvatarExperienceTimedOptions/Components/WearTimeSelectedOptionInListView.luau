local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local popover = foundationModule.Popover
local view = foundationModule.View
local text = foundationModule.Text
local enums = foundationModule.Enums
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local fFlagAXFixIaBTimedOptionsPopoverFocus = require(parent.AvatarExperienceFlags).FFlagAXFixIaBTimedOptionsPopoverFocus
local wearTimeListModule = require(script.Parent.WearTimeList)
local _ = require(script.Parent.useWearTimeSelectedOptionViewModel)
local useWearTimePopoverFocusNavigationBindingsModule = require(script.Parent.useWearTimePopoverFocusNavigationBindings)

return function(p0)
	-- upvalues: reactModule (ref), useWearTimePopoverFocusNavigationBindingsModule (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), view (ref), text (ref), foundationModule (ref), enums (ref), popover (ref), popoverAlign (ref), popoverSide (ref), wearTimeListModule (ref)
	local tokens = p0.tokens
	
	return reactModule.createElement(view, { tag = "auto-xy" }, {
		TriggerButton = reactModule.createElement("TextButton", {
			Text = "",
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BorderSizePixel = 0,
			Transparency = p0.tokens.Color.Shift.Shift_200.Transparency,
			BackgroundColor3 = p0.tokens.Color.Shift.Shift_200.Color3,
			ref = p0.anchorRef,
			[reactModule.Event.Activated] = function()
				-- upvalues: p0 (ref)
				p0.setIsOpen(not p0.isOpen)
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
					Text = p0.listLabelText,
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
		Popover = reactModule.createElement(popover.Root, { isOpen = p0.isOpen }, {
			Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p0.anchorRef }),
			Content = reactModule.createElement(popover.Content, {
				hasArrow = false,
				align = popoverAlign.Start,
				side = popoverSide.Bottom,
				onPressedOutside = function()
					-- upvalues: p0 (ref)
					p0.setIsOpen(false)
				end
			}, {
				ContentWrapper = reactModule.createElement(view, {
					tag = "auto-y",
					Size = UDim2.new(0, tokens.Size.Size_2900 * 2, 0, 0),
					ref = useWearTimePopoverFocusNavigationBindingsModule(reactModule.useCallback(function()
						-- upvalues: p0 (ref)
						p0.setIsOpen(false)
					end, { p0.setIsOpen }), p0.isOpen, if fFlagAXFixIaBTimedOptionsPopoverFocus then p0.anchorRef else nil)
				}, {
					WearTimeList = reactModule.createElement(wearTimeListModule, {
						options = p0.updatedOptions,
						selectedIndex = p0.selectedIndex,
						onOptionActivated = p0.handleOptionActivated
					})
				})
			})
		})
	})
end