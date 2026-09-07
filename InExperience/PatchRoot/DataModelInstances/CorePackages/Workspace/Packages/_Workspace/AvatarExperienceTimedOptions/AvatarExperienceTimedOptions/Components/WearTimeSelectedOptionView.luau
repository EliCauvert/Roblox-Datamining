local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local popover = foundationModule.Popover
local view = foundationModule.View
local text = foundationModule.Text
local enums = foundationModule.Enums
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local numberLocalization = localizationModule.NumberLocalization
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local wearTimeListModule = require(script.Parent.WearTimeList)
local _ = require(script.Parent.useWearTimeSelectedOptionViewModel)
local useWearTimePopoverFocusNavigationBindingsModule = require(script.Parent.useWearTimePopoverFocusNavigationBindings)
local fFlagAXFixIaBTimedOptionsPopoverFocus = avatarExperienceFlagsModule.FFlagAXFixIaBTimedOptionsPopoverFocus

return function(p1)
	-- upvalues: reactModule (ref), useWearTimePopoverFocusNavigationBindingsModule (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), view (ref), foundationModule (ref), enums (ref), text (ref), numberLocalization (ref), popover (ref), popoverAlign (ref), popoverSide (ref), wearTimeListModule (ref)
	local tokens = p1.tokens
	local textButton = reactModule.createElement("TextButton", {
		Text = "",
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ref = p1.anchorRef,
		[reactModule.Event.Activated] = function()
			-- upvalues: p1 (ref)
			p1.setIsOpen(not p1.isOpen)
		end
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		TopRow = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy padding-top-xxsmall",
			LayoutOrder = 1
		}, {
			RobuxIcon = reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 1,
				name = enums.IconName.Robux,
				variant = enums.IconVariant.Filled,
				size = enums.IconSize.Small,
				style = tokens.Color.Content.Emphasis
			}),
			PriceLabel = reactModule.createElement(text, {
				tag = "auto-xy",
				LayoutOrder = 2,
				Text = numberLocalization.localize(p1.price, p1.localization:GetLocale()),
				textStyle = tokens.Color.Content.Emphasis,
				fontStyle = {
					Font = tokens.Typography.TitleSmall.Font,
					FontSize = tokens.FontSize.FontSize_400
				}
			}),
			ChevronIcon = if not p1.disableOptionSelection then reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 3,
				name = enums.IconName.ChevronLargeDown,
				variant = enums.IconVariant.Regular,
				size = enums.IconSize.Small,
				style = tokens.Color.Content.Emphasis
			}) else nil
		}),
		SubLabel = p1.subLabelText and reactModule.createElement(text, {
			tag = "auto-xy padding-top-xxsmall",
			LayoutOrder = 2,
			Text = p1.subLabelText,
			textStyle = tokens.Color.Content.Muted,
			fontStyle = {
				Font = tokens.Typography.CaptionMedium.Font,
				FontSize = tokens.FontSize.FontSize_300
			}
		})
	})
	
	return if p1.disableOptionSelection then textButton else reactModule.createElement(view, { tag = "auto-xy" }, {
		TriggerButton = textButton,
		Popover = reactModule.createElement(popover.Root, { isOpen = p1.isOpen }, {
			Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p1.anchorRef }),
			Content = reactModule.createElement(popover.Content, {
				hasArrow = false,
				align = popoverAlign.Start,
				side = popoverSide.Top,
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
					end, { p1.setIsOpen }), p1.isOpen, if fFlagAXFixIaBTimedOptionsPopoverFocus then p1.anchorRef else nil)
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