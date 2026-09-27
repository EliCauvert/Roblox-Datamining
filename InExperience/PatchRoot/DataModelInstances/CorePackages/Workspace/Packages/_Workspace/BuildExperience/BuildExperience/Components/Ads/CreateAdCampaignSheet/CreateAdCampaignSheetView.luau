local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local inlineLayoutModule = require(parent.InlineLayout)
local button = foundationModule.Button
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local optionSelectorGroup = foundationModule.OptionSelectorGroup
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local inlineLayout = inlineLayoutModule.Components.InlineLayout
local linkElement = inlineLayoutModule.Components.InlineLayoutElements.LinkElement
local textElement = inlineLayoutModule.Components.InlineLayoutElements.TextElement
local createAdCampaignSheetConfigModule = require(script.Parent.CreateAdCampaignSheetConfig)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local optionSelectorGroupSize = foundationModule.Enums.OptionSelectorGroupSize
local useTokens = foundationModule.Hooks.useTokens
local list = { 1 }
local t = { name = "u", attributes = {} }

local function createLegalTextElement(p1, p2, p3)
	-- upvalues: textElement (ref)
	return textElement.new({ Text = p1, fontStyle = p2, textStyle = p3 })
end

local function createLegalElements(p1, p2, p3, p4, p5)
	-- upvalues: createAdCampaignSheetConfigModule (ref), createLegalTextElement (ref), linkElement (ref), textElement (ref), t (ref)
	local t_1 = {}
	local var1 = 1
	local list = {
		{
			startMarker = createAdCampaignSheetConfigModule.ADVERTISING_TERMS_START_MARKER,
			endMarker = createAdCampaignSheetConfigModule.ADVERTISING_TERMS_END_MARKER,
			onActivated = p4
		},
		{
			startMarker = createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_START_MARKER,
			endMarker = createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_END_MARKER,
			onActivated = p5
		}
	}
	while var1 <= #p1 do
		local var2 = nil
		local var3 = nil
		local var4 = nil
		
		for i, v in list do
			local matchIndex, matchIndex_1 = string.find(p1, v.startMarker, var1, true)
			
			if matchIndex ~= nil and (var3 == nil or matchIndex < var3) then
				var2 = v
				var3 = matchIndex
				var4 = matchIndex_1
			end
		end
		if var2 ~= nil and var3 ~= nil and var4 ~= nil then
			if var1 < var3 then
				table.insert(t_1, createLegalTextElement(string.sub(p1, var1, var3 - 1), p2, p3))
			end
			local matchIndex, matchIndex_1 = string.find(p1, var2.endMarker, var4 + 1, true)
			
			if matchIndex ~= nil and matchIndex_1 ~= nil then
				local substring = string.sub(p1, var4 + 1, matchIndex - 1)
				i = var2.onActivated
				table.insert(t_1, linkElement.new({
					textElement.new({
						Text = substring,
						EngineTags = { t },
						fontStyle = p2,
						textStyle = p3
					})
				}, {
					onActivated = function()
						-- upvalues: i (ref), substring (ref)
						i(substring)
					end
				}))
				var1 = matchIndex_1 + 1
				continue
			end
			table.insert(t_1, createLegalTextElement(string.sub(p1, var3), p2, p3))
			
			return t_1
		end
		table.insert(t_1, createLegalTextElement(string.sub(p1, var1), p2, p3))
		
		return t_1
	end
	return t_1
end

local function AdCampaignLegalText(p6)
	-- upvalues: useTokens (ref), createLegalElements (ref), reactModule (ref), view (ref), inlineLayout (ref)
	local var5 = useTokens()
	local bodyMedium = var5.Typography.BodyMedium
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = p6.LayoutOrder }, {
		Layout = reactModule.createElement(inlineLayout, {
			Elements = createLegalElements(p6.text, bodyMedium, var5.Color.Content.Default, p6.onAdvertisingTerms, p6.onAdvertisingStandards),
			VerticalPadding = UDim.new(0, bodyMedium.FontSize * (bodyMedium.LineHeight - 1) / 2)
		})
	})
end

local function createBenefitRows(p6)
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref)
	local t = {}
	
	for i, v in p6 do
		t[`Benefit{i}`] = reactModule.createElement(view, {
			tag = "row align-y-center gap-xxlarge size-full-0 auto-y padding-y-xsmall",
			LayoutOrder = i
		}, {
			Icon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				tag = "content-emphasis",
				name = v.icon,
				size = iconSize.Large
			}),
			Label = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = v.text
			})
		})
	end
	return t
end

local function CampaignPrice(p7)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), foundationModule (ref), iconSize (ref), text (ref)
	return if p7.option.originalPriceText == nil then reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-xxsmall auto-xy",
		testId = p7.testId
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			tag = "content-default",
			name = foundationModule.Enums.IconName.Robux,
			size = iconSize.Small,
			testId = `{p7.testId}-robux-icon`
		}),
		Amount = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-body-medium content-default",
			Text = p7.option.priceText
		})
	}) else reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-small auto-xy",
		testId = p7.testId
	}, {
		OriginalPrice = reactModule.createElement(view, { LayoutOrder = 1, tag = "auto-xy" }, {
			Content = reactModule.createElement(view, {
				ZIndex = 1,
				tag = "row align-y-center gap-xxsmall auto-xy"
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					tag = "content-default",
					name = foundationModule.Enums.IconName.Robux,
					size = iconSize.Small,
					testId = `{p7.testId}-robux-icon`
				}),
				Amount = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-medium content-default",
					Text = p7.option.originalPriceText
				})
			}),
			Strikethrough = reactModule.createElement(view, {
				ZIndex = 2,
				tag = "position-center-left anchor-center-left",
				testId = "two-options-ad-campaign-free-strikethrough",
				Size = UDim2.new(1, 0, 0, 1),
				backgroundStyle = useTokens().Color.Content.Default
			})
		}),
		Free = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-title-medium content-emphasis",
			Text = p7.option.priceText,
			testId = `{p7.testId}-free`
		})
	})
end

local function CampaignOptionItem(p7)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), optionSelectorGroup (ref), CampaignPrice (ref)
	local var5 = useTokens()
	local var6 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p7.optionRef, function()
		-- upvalues: var6 (ref)
		return var6.current
	end)
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p7.LayoutOrder
	}, {
		Selector = reactModule.createElement(optionSelectorGroup.Item, {
			value = p7.option.value,
			label = p7.option.title,
			metadata = p7.option.runDates,
			description = p7.option.description,
			isDisabled = p7.isInteractionDisabled,
			ref = var6
		}),
		Price = reactModule.createElement(view, {
			ZIndex = 2,
			tag = "anchor-top-right auto-xy",
			Position = UDim2.new(1, -var5.Padding.XLarge, 0, var5.Padding.XLarge)
		}, {
			Content = reactModule.createElement(CampaignPrice, { option = p7.option, testId = `{p7.testId}-price` })
		})
	})
end

return function(p7)
	-- upvalues: useTokens (ref), reactModule (ref), sheet (ref), list (ref), view (ref), iconButton (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref), icon (ref), iconSize (ref), text (ref), optionSelectorGroup (ref), optionSelectorGroupSize (ref), CampaignOptionItem (ref), createBenefitRows (ref), AdCampaignLegalText (ref), button (ref)
	local var5 = useTokens()
	local isTwoOptions = p7.variant == "twoOptions"
	local var6 = if isTwoOptions then "two-options-ad-campaign" else "create-ad-campaign"
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		isOpen = p7.isOpen,
		ref = if isTwoOptions then p7.sheetRootRef else nil,
		snapPoints = list,
		onClose = p7.onClose,
		testId = if isTwoOptions then "TwoOptionsAdCampaignSheet" else nil
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = false }, {
			HeaderRow = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = {
					["row align-y-center size-full-0 auto-y"] = true,
					["flex-between"] = not isTwoOptions or p7.showCloseButton,
					["align-x-right"] = isTwoOptions and not p7.showCloseButton
				}
			}, {
				Close = if isTwoOptions and not p7.showCloseButton then nil else reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					icon = foundationModule.Enums.IconName.X,
					size = inputSize.Large,
					variant = buttonVariant.Utility,
					isDisabled = p7.isCreatePending,
					onActivated = p7.onClose,
					testId = if isTwoOptions then `{var6}-close` else nil
				}),
				Balance = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small auto-xy padding-right-small"
				}, {
					Icon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = foundationModule.Enums.IconName.Robux,
						size = iconSize.Medium,
						tag = {
							["content-emphasis"] = p7.balanceState == "ready",
							["content-muted"] = p7.balanceState ~= "ready"
						}
					}),
					Amount = reactModule.createElement(text, {
						LayoutOrder = 2,
						Text = p7.balanceText,
						tag = {
							["auto-xy text-label-medium"] = true,
							["content-emphasis"] = p7.balanceState == "ready",
							["content-muted"] = p7.balanceState ~= "ready"
						}
					})
				})
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			Body = reactModule.createElement(view, {
				tag = {
					["col size-full-0 auto-y"] = true,
					["gap-large"] = not isTwoOptions,
					["gap-xlarge"] = isTwoOptions
				}
			}, {
				Introduction = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "col gap-xxsmall size-full-0 auto-y"
				}, {
					Title = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-emphasis",
						Text = p7.title
					}),
					Description = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-emphasis",
						Text = p7.description
					})
				}),
				Campaign = if isTwoOptions then reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "col gap-medium size-full-0 auto-y"
				}, {
					Title = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
						Text = p7.startCampaignTitle
					}),
					Options = reactModule.createElement(optionSelectorGroup.Root, {
						LayoutOrder = 2,
						testId = "two-options-ad-campaign-options",
						value = p7.selectedOption,
						onValueChanged = p7.onOptionChanged,
						size = optionSelectorGroupSize.Medium,
						Selectable = not p7.isCreatePending
					}, {
						Free = reactModule.createElement(CampaignOptionItem, {
							LayoutOrder = 1,
							testId = "two-options-ad-campaign-free-option",
							option = p7.freeOption,
							optionRef = p7.freeOptionRef,
							isInteractionDisabled = p7.isCreatePending
						}),
						Paid = reactModule.createElement(CampaignOptionItem, {
							LayoutOrder = 2,
							optionRef = nil,
							testId = "two-options-ad-campaign-paid-option",
							option = p7.paidOption,
							isInteractionDisabled = p7.isCreatePending
						})
					})
				}) else reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium bg-surface-0"
				}, {
					Name = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "fill auto-y text-label-large text-wrap text-align-x-left content-emphasis",
						Text = p7.campaignTitle
					}),
					Price = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-small auto-xy"
					}, {
						Estimated = reactModule.createElement(view, { LayoutOrder = 1, tag = "auto-xy" }, {
							Content = reactModule.createElement(view, {
								ZIndex = 1,
								tag = "row align-y-center gap-xxsmall auto-xy"
							}, {
								Icon = reactModule.createElement(icon, {
									LayoutOrder = 1,
									tag = "content-default",
									name = foundationModule.Enums.IconName.Robux,
									size = iconSize.Small
								}),
								Amount = reactModule.createElement(text, {
									LayoutOrder = 2,
									tag = "auto-xy text-body-large content-default",
									Text = p7.estimatedPriceText
								})
							}),
							Strikethrough = reactModule.createElement(view, {
								ZIndex = 2,
								tag = "position-center-left anchor-center-left",
								testId = "create-ad-campaign-strikethrough",
								Size = UDim2.new(1, 0, 0, var5.Stroke.Standard),
								backgroundStyle = var5.Color.Content.Default
							})
						}),
						Free = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "auto-xy text-title-large content-emphasis",
							Text = p7.freeText
						})
					})
				}),
				Disclaimer = if not isTwoOptions then reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = p7.earnedRobuxDisclaimer
				}) else nil,
				Included = if not isTwoOptions then reactModule.createElement(view, {
					LayoutOrder = 4,
					tag = "col gap-xxlarge size-full-0 auto-y padding-xlarge stroke-standard stroke-default radius-medium bg-surface-0"
				}, {
					Title = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
						Text = p7.includedTitle
					}),
					Benefits = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "col gap-xxlarge size-full-0 auto-y padding-bottom-small padding-left-medium"
					}, createBenefitRows(p7.benefits))
				}) else nil,
				Legal = reactModule.createElement(AdCampaignLegalText, {
					LayoutOrder = 5,
					text = p7.legalText,
					onAdvertisingTerms = p7.onAdvertisingTerms,
					onAdvertisingStandards = p7.onAdvertisingStandards
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			Footer = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
				Error = if p7.hasCreateError then reactModule.createElement(text, {
					LayoutOrder = 0,
					tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-left content-system-alert",
					Text = p7.createErrorText,
					testId = `{var6}-create-error`
				}) else nil,
				Create = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = p7.createText,
					size = inputSize.Medium,
					variant = buttonVariant.Emphasis,
					width = UDim.new(1, 0),
					isDisabled = if isTwoOptions then p7.isCreateDisabled else nil,
					isLoading = p7.isCreatePending,
					onActivated = p7.onCreate,
					testId = `{var6}-create-button`
				}),
				Moderation = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-y text-caption-small text-wrap text-align-x-left content-default",
					Text = p7.moderationNotice,
					Size = UDim2.new(1, 0, 0, math.ceil(var5.Typography.CaptionSmall.FontSize * var5.Typography.CaptionSmall.LineHeight * 2)),
					testId = `{var6}-moderation-notice`
				})
			})
		})
	})
end