local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local InlineLayoutModule = require(Parent.InlineLayout)
local Button = FoundationModule.Button
local Chip = FoundationModule.Chip
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local OptionSelectorGroup = FoundationModule.OptionSelectorGroup
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local InlineLayout = InlineLayoutModule.Components.InlineLayout
local LinkElement = InlineLayoutModule.Components.InlineLayoutElements.LinkElement
local TextElement = InlineLayoutModule.Components.InlineLayoutElements.TextElement
local CreateAdCampaignSheetConfigModule = require(script.Parent.CreateAdCampaignSheetConfig)
local FFlagBuildAdsUiPolishModule = require(BuildExperience.Flags.FFlagBuildAdsUiPolish)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local OptionSelectorGroupSize = FoundationModule.Enums.OptionSelectorGroupSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SnapPoints = { 1 }
local config = { name = "u", attributes = {} }

local function createLegalTextElement(Segment, FontStyle, TextStyle) --[[ Line: 102 ]]
	-- upvalues: TextElement (copy)
	return TextElement.new({
		Text = Segment,
		fontStyle = FontStyle,
		textStyle = TextStyle
	})
end

local function createLegalElements(Text: string, FontStyle, TextStyle, OnActivated, OnActivated1) --[[ Line: 111 ]]
	-- upvalues: CreateAdCampaignSheetConfigModule (copy), createLegalTextElement (copy), LinkElement (copy), TextElement (copy), config (copy)
	local List = {}
	local Init = 1
	local list = {
		{
			startMarker = CreateAdCampaignSheetConfigModule.ADVERTISING_TERMS_START_MARKER,
			endMarker = CreateAdCampaignSheetConfigModule.ADVERTISING_TERMS_END_MARKER,
			onActivated = OnActivated
		},
		{
			startMarker = CreateAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_START_MARKER,
			endMarker = CreateAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_END_MARKER,
			onActivated = OnActivated1
		}
	}
	local StartIndex = nil
	while Init <= #Text do
		local v1 = nil
		StartIndex = nil
		local v2: number? = nil
		
		for _, value in list do
			local StartIndex1, EndIndex = string.find(Text, value.startMarker, Init, true)
			
			if StartIndex1 ~= nil and (StartIndex == nil or StartIndex1 < StartIndex) then
				v1 = value
				StartIndex = StartIndex1
				v2 = EndIndex
			end
		end
		if v1 == nil or StartIndex == nil or v2 == nil then
			table.insert(List, createLegalTextElement(string.sub(Text, Init), FontStyle, TextStyle))
			
			return List
		end
		if Init < StartIndex then
			table.insert(List, createLegalTextElement(string.sub(Text, Init, StartIndex - 1), FontStyle, TextStyle))
		end
		local StartIndex2, EndIndex1 = string.find(Text, v1.endMarker, v2 + 1, true)
		
		if StartIndex2 == nil or EndIndex1 == nil then
			table.insert(List, createLegalTextElement(string.sub(Text, StartIndex), FontStyle, TextStyle))
			
			return List
		end
		local Segment = string.sub(Text, v2 + 1, StartIndex2 - 1)
		local OnActivatedFunction = v1.onActivated
		table.insert(List, LinkElement.new({
			TextElement.new({
				Text = Segment,
				EngineTags = { config },
				fontStyle = FontStyle,
				textStyle = TextStyle
			})
		}, {
			onActivated = function() --[[ Line: 175 ]]
				-- upvalues: OnActivatedFunction (copy), Segment (copy)
				OnActivatedFunction(Segment)
			end
		}))
		Init = EndIndex1 + 1
	end
	return List
end

local function AdCampaignLegalText(Frame) --[[ Line: 186 ]]
	-- upvalues: UseTokensFunction (copy), createLegalElements (copy), ReactModule (copy), View (copy), InlineLayout (copy)
	local UseTokensResult = UseTokensFunction()
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Layout = ReactModule.createElement(InlineLayout, {
			Elements = createLegalElements(Frame.text, BodyMedium, UseTokensResult.Color.Content.Default, Frame.onAdvertisingTerms, Frame.onAdvertisingStandards),
			VerticalPadding = UDim.new(0, BodyMedium.FontSize * (BodyMedium.LineHeight - 1) / 2)
		})
	})
end

local function createBenefitRows(Benefits) --[[ Line: 213 ]]
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy)
	local Elements = {}
	
	for LayoutOrder, benefit in Benefits do
		Elements[`Benefit{LayoutOrder}`] = ReactModule.createElement(View, {
			tag = "row align-y-center gap-xxlarge size-full-0 auto-y padding-y-xsmall",
			LayoutOrder = LayoutOrder
		}, {
			Icon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				tag = "content-emphasis",
				name = benefit.icon,
				size = IconSize.Large
			}),
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = benefit.text
			})
		})
	end
	return Elements
end

local function CampaignPrice(p1) --[[ Line: 236 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), FoundationModule (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if p1.option.originalPriceText == nil then ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-xxsmall auto-xy",
		testId = p1.testId
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			tag = "content-default",
			name = FoundationModule.Enums.IconName.Robux,
			size = IconSize.Small,
			testId = `{p1.testId}-robux-icon`
		}),
		Amount = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-body-medium content-default",
			Text = p1.option.priceText
		})
	}) else ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-small auto-xy",
		testId = p1.testId
	}, {
		OriginalPrice = ReactModule.createElement(View, { LayoutOrder = 1, tag = "auto-xy" }, {
			Content = ReactModule.createElement(View, {
				ZIndex = 1,
				tag = "row align-y-center gap-xxsmall auto-xy"
			}, {
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					tag = "content-default",
					name = FoundationModule.Enums.IconName.Robux,
					size = IconSize.Small,
					testId = `{p1.testId}-robux-icon`
				}),
				Amount = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-medium content-default",
					Text = p1.option.originalPriceText
				})
			}),
			Strikethrough = ReactModule.createElement(View, {
				ZIndex = 2,
				tag = "position-center-left anchor-center-left",
				Size = UDim2.new(1, 0, 0, 1),
				backgroundStyle = UseTokensResult.Color.Content.Default,
				testId = `{p1.testId}-strikethrough`
			})
		}),
		Free = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-title-medium content-emphasis",
			Text = p1.option.priceText,
			testId = `{p1.testId}-free`
		})
	})
end

local function CampaignOptionItem(Frame) --[[ Line: 306 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), OptionSelectorGroup (copy), CampaignPrice (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(Frame.optionRef, function() --[[ Line: 316 ]]
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end)
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Selector = ReactModule.createElement(OptionSelectorGroup.Item, {
			value = Frame.option.value,
			label = Frame.option.title,
			metadata = Frame.option.runDates,
			description = Frame.option.description,
			isDisabled = Frame.isInteractionDisabled,
			ref = UseRefResult
		}),
		Price = ReactModule.createElement(View, {
			ZIndex = 2,
			tag = "anchor-top-right auto-xy",
			Position = UDim2.new(1, -UseTokensResult.Padding.XLarge, 0, UseTokensResult.Padding.XLarge)
		}, {
			Content = ReactModule.createElement(CampaignPrice, { option = Frame.option, testId = `{Frame.testId}-price` })
		})
	})
end

return function(p1) --[[ Line: 345 | Named "CreateAdCampaignSheetView" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Sheet (copy), SnapPoints (copy), View (copy), IconButton (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy), FFlagBuildAdsUiPolishModule (copy), Chip (copy), ChipVariant (copy), ChipSize (copy), Icon (copy), IconSize (copy), Text (copy), OptionSelectorGroup (copy), OptionSelectorGroupSize (copy), CampaignOptionItem (copy), createBenefitRows (copy), AdCampaignLegalText (copy), Button (copy)
	local UseTokensResult = UseTokensFunction()
	local IsTwoOptions = p1.variant == "twoOptions"
	local Ceiled = math.ceil(UseTokensResult.Typography.CaptionMedium.FontSize * UseTokensResult.Typography.CaptionMedium.LineHeight * 2)
	local TwoOptionsAdCampaign: string = if IsTwoOptions then "two-options-ad-campaign" else "create-ad-campaign"
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		isOpen = p1.isOpen,
		ref = if IsTwoOptions then p1.sheetRootRef else nil,
		snapPoints = SnapPoints,
		onClose = p1.onClose,
		testId = if IsTwoOptions then "TwoOptionsAdCampaignSheet" else nil
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = false }, {
			HeaderRow = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = {
					["row align-y-center size-full-0 auto-y"] = true,
					["flex-between"] = not IsTwoOptions or p1.showCloseButton,
					["align-x-right"] = IsTwoOptions and not p1.showCloseButton
				}
			}, {
				Close = if IsTwoOptions and not p1.showCloseButton then nil else ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					icon = FoundationModule.Enums.IconName.X,
					size = InputSize.Large,
					variant = ButtonVariant.Utility,
					isDisabled = p1.isCreatePending,
					onActivated = p1.onClose,
					testId = if IsTwoOptions then `{TwoOptionsAdCampaign}-close` else nil
				}),
				Balance = if FFlagBuildAdsUiPolishModule then ReactModule.createElement(Chip, {
					LayoutOrder = 2,
					text = p1.balanceText,
					leading = FoundationModule.Enums.IconName.Robux,
					variant = ChipVariant.Standard,
					size = ChipSize.Medium,
					onActivated = if IsTwoOptions then p1.onOpenBuyRobux else function() --[[ Line: 397 ]] end,
					isDisabled = not IsTwoOptions or p1.isCreatePending,
					testId = if IsTwoOptions then "two-options-ad-campaign-balance" else nil
				}) else ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small auto-xy padding-right-small",
					onActivated = if IsTwoOptions and not p1.isCreatePending then p1.onOpenBuyRobux else nil,
					testId = if IsTwoOptions then "two-options-ad-campaign-balance" else nil
				}, {
					Icon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = FoundationModule.Enums.IconName.Robux,
						size = IconSize.Medium,
						tag = {
							["content-emphasis"] = p1.balanceState == "ready",
							["content-muted"] = p1.balanceState ~= "ready"
						}
					}),
					Amount = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						Text = p1.balanceText,
						tag = {
							["auto-xy text-label-medium"] = true,
							["content-emphasis"] = p1.balanceState == "ready",
							["content-muted"] = p1.balanceState ~= "ready"
						}
					})
				})
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			Body = ReactModule.createElement(View, {
				tag = {
					["col size-full-0 auto-y"] = true,
					["gap-large"] = not IsTwoOptions,
					["gap-xlarge"] = IsTwoOptions
				}
			}, {
				Introduction = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col gap-xxsmall size-full-0 auto-y"
				}, {
					Title = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-emphasis",
						Text = p1.title
					}),
					Description = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-emphasis",
						Text = p1.description
					})
				}),
				Campaign = if IsTwoOptions then ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "col gap-medium size-full-0 auto-y"
				}, {
					Title = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
						Text = p1.startCampaignTitle
					}),
					Options = ReactModule.createElement(OptionSelectorGroup.Root, {
						LayoutOrder = 2,
						testId = "two-options-ad-campaign-options",
						value = p1.selectedOption,
						onValueChanged = p1.onOptionChanged,
						size = OptionSelectorGroupSize.Medium,
						Selectable = not p1.isCreatePending
					}, {
						Feedback = if p1.feedbackOption == nil then nil else ReactModule.createElement(CampaignOptionItem, {
							LayoutOrder = 1,
							testId = "two-options-ad-campaign-feedback-option",
							option = p1.feedbackOption,
							optionRef = if p1.selectedOption == p1.feedbackOption.value then p1.defaultOptionRef else nil,
							isInteractionDisabled = p1.isCreatePending
						}),
						Plays = if p1.playsOption == nil then nil else ReactModule.createElement(CampaignOptionItem, {
							LayoutOrder = 2,
							testId = "two-options-ad-campaign-plays-option",
							option = p1.playsOption,
							optionRef = if p1.selectedOption == p1.playsOption.value then p1.defaultOptionRef else nil,
							isInteractionDisabled = p1.isCreatePending
						})
					})
				}) else ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium bg-surface-0"
				}, {
					Name = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "fill auto-y text-label-large text-wrap text-align-x-left content-emphasis",
						Text = p1.campaignTitle
					}),
					Price = ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-small auto-xy"
					}, {
						Estimated = ReactModule.createElement(View, { LayoutOrder = 1, tag = "auto-xy" }, {
							Content = ReactModule.createElement(View, {
								ZIndex = 1,
								tag = "row align-y-center gap-xxsmall auto-xy"
							}, {
								Icon = ReactModule.createElement(Icon, {
									LayoutOrder = 1,
									tag = "content-default",
									name = FoundationModule.Enums.IconName.Robux,
									size = IconSize.Small
								}),
								Amount = ReactModule.createElement(Text, {
									LayoutOrder = 2,
									tag = "auto-xy text-body-large content-default",
									Text = p1.estimatedPriceText
								})
							}),
							Strikethrough = ReactModule.createElement(View, {
								ZIndex = 2,
								tag = "position-center-left anchor-center-left",
								testId = "create-ad-campaign-strikethrough",
								Size = UDim2.new(1, 0, 0, UseTokensResult.Stroke.Standard),
								backgroundStyle = UseTokensResult.Color.Content.Default
							})
						}),
						Free = ReactModule.createElement(Text, {
							LayoutOrder = 2,
							tag = "auto-xy text-title-large content-emphasis",
							Text = p1.freeText
						})
					})
				}),
				Disclaimer = if IsTwoOptions then nil else ReactModule.createElement(Text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = p1.earnedRobuxDisclaimer
				}),
				Included = if IsTwoOptions then nil else ReactModule.createElement(View, {
					LayoutOrder = 4,
					tag = "col gap-xxlarge size-full-0 auto-y padding-xlarge stroke-standard stroke-default radius-medium bg-surface-0"
				}, {
					Title = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
						Text = p1.includedTitle
					}),
					Benefits = ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "col gap-xxlarge size-full-0 auto-y padding-bottom-small padding-left-medium"
					}, (createBenefitRows(p1.benefits)))
				}),
				Legal = ReactModule.createElement(AdCampaignLegalText, {
					LayoutOrder = 5,
					text = p1.legalText,
					onAdvertisingTerms = p1.onAdvertisingTerms,
					onAdvertisingStandards = p1.onAdvertisingStandards
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Footer = ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
				Error = if p1.hasCreateError then ReactModule.createElement(Text, {
					LayoutOrder = 0,
					Text = p1.createErrorText,
					Size = if IsTwoOptions then UDim2.new(1, 0, 0, Ceiled) else nil,
					tag = {
						["auto-y text-caption-medium text-wrap text-align-x-left text-align-y-bottom content-system-alert"] = IsTwoOptions,
						["size-full-0 auto-y text-caption-medium text-wrap text-align-x-left content-system-alert"] = not IsTwoOptions
					},
					testId = `{TwoOptionsAdCampaign}-create-error`
				}) else nil,
				AdCredits = if IsTwoOptions and p1.showAdCreditsCallout then ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-small",
					testId = "two-options-ad-campaign-ad-credits"
				}, {
					Link = ReactModule.createElement(View, {
						tag = "row align-y-center size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium",
						testId = "two-options-ad-campaign-ad-credits-link",
						onActivated = p1.onOpenAdsManager
					}, {
						Copy = ReactModule.createElement(View, { LayoutOrder = 1, tag = "col fill gap-xxsmall auto-y" }, {
							Title = ReactModule.createElement(Text, {
								LayoutOrder = 1,
								tag = "size-full-0 auto-y text-title-small text-wrap text-align-x-left content-emphasis",
								Text = p1.adCreditsTitle
							}),
							Description = ReactModule.createElement(Text, {
								LayoutOrder = 2,
								tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
								Text = p1.adCreditsAction
							})
						}),
						ExternalLink = ReactModule.createElement(Icon, {
							LayoutOrder = 2,
							tag = "auto-xy content-emphasis",
							testId = "two-options-ad-campaign-ad-credits-icon",
							name = FoundationModule.Enums.IconName.ArrowUpRightFromSquare,
							size = IconSize.Small
						})
					})
				}) else nil,
				Create = ReactModule.createElement(Button, {
					LayoutOrder = 2,
					text = p1.createText,
					size = InputSize.Medium,
					variant = ButtonVariant.Emphasis,
					width = UDim.new(1, 0),
					isDisabled = if IsTwoOptions then p1.isCreateDisabled else nil,
					isLoading = p1.isCreatePending or IsTwoOptions and p1.isFundingCheckPending,
					onActivated = p1.onCreate,
					testId = `{TwoOptionsAdCampaign}-create-button`
				}),
				Moderation = ReactModule.createElement(Text, {
					LayoutOrder = 3,
					tag = "auto-y text-caption-small text-wrap text-align-x-left content-default",
					Text = p1.moderationNotice,
					Size = UDim2.new(1, 0, 0, (math.ceil(UseTokensResult.Typography.CaptionSmall.FontSize * UseTokensResult.Typography.CaptionSmall.LineHeight * 2))),
					testId = `{TwoOptionsAdCampaign}-moderation-notice`
				})
			})
		})
	})
end