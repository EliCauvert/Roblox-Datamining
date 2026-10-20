local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Popover = FoundationModule.Popover
local View = FoundationModule.View
local Text = FoundationModule.Text
local Enums = FoundationModule.Enums
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local NumberLocalization = require(Parent.Localization).NumberLocalization
local WearTimeListModule = require(script.Parent.WearTimeList)
local _ = require(script.Parent.useWearTimeSelectedOptionViewModel)
local UseWearTimePopoverFocusNavigationBindingsModule = require(script.Parent.useWearTimePopoverFocusNavigationBindings)

return function(p1)
	-- upvalues: ReactModule (copy), UseWearTimePopoverFocusNavigationBindingsModule (copy), View (copy), FoundationModule (copy), Enums (copy), Text (copy), NumberLocalization (copy), Popover (copy), PopoverAlign (copy), PopoverSide (copy), WearTimeListModule (copy)
	local Tokens = p1.tokens
	local UseWearTimePopoverFocusNavigationBindingsModuleResult = UseWearTimePopoverFocusNavigationBindingsModule(ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.setIsOpen(false)
	end, { p1.setIsOpen }), p1.isOpen, p1.anchorRef)
	local TextButton = ReactModule.createElement("TextButton", {
		Text = "",
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ref = p1.anchorRef,
		[ReactModule.Event.Activated] = function()
			-- upvalues: p1 (copy)
			p1.setIsOpen(not p1.isOpen)
		end
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		TopRow = ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall auto-xy padding-top-xxsmall",
			LayoutOrder = 1
		}, {
			RobuxIcon = ReactModule.createElement(FoundationModule.Icon, {
				LayoutOrder = 1,
				name = Enums.IconName.Robux,
				variant = Enums.IconVariant.Filled,
				size = Enums.IconSize.Small,
				style = Tokens.Color.Content.Emphasis
			}),
			PriceLabel = ReactModule.createElement(Text, {
				tag = "auto-xy",
				LayoutOrder = 2,
				Text = NumberLocalization.localize(p1.price, p1.localization:GetLocale()),
				textStyle = Tokens.Color.Content.Emphasis,
				fontStyle = {
					Font = Tokens.Typography.TitleSmall.Font,
					FontSize = Tokens.FontSize.FontSize_400
				}
			}),
			ChevronIcon = if p1.disableOptionSelection then nil else ReactModule.createElement(FoundationModule.Icon, {
				LayoutOrder = 3,
				name = Enums.IconName.ChevronLargeDown,
				variant = Enums.IconVariant.Regular,
				size = Enums.IconSize.Small,
				style = Tokens.Color.Content.Emphasis
			})
		}),
		SubLabel = p1.subLabelText and ReactModule.createElement(Text, {
			tag = "auto-xy padding-top-xxsmall",
			LayoutOrder = 2,
			Text = p1.subLabelText,
			textStyle = Tokens.Color.Content.Muted,
			fontStyle = {
				Font = Tokens.Typography.CaptionMedium.Font,
				FontSize = Tokens.FontSize.FontSize_300
			}
		})
	})
	
	return if p1.disableOptionSelection then TextButton else ReactModule.createElement(View, { tag = "auto-xy" }, {
		TriggerButton = TextButton,
		Popover = ReactModule.createElement(Popover.Root, { isOpen = p1.isOpen }, {
			Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p1.anchorRef }),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = false,
				align = PopoverAlign.Start,
				side = PopoverSide.Top,
				onPressedOutside = function()
					-- upvalues: p1 (copy)
					p1.setIsOpen(false)
				end
			}, {
				ContentWrapper = ReactModule.createElement(View, {
					tag = "auto-y",
					Size = UDim2.new(0, Tokens.Size.Size_2900 * 2, 0, 0),
					ref = UseWearTimePopoverFocusNavigationBindingsModuleResult
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