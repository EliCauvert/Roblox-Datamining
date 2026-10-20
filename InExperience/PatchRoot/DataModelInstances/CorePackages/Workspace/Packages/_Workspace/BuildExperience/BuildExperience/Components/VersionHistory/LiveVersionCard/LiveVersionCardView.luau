local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function MetricItem(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-xxsmall auto-xy",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			tag = "content-action-standard",
			name = p1.iconName,
			size = IconSize.XSmall
		}),
		Value = if p1.value == nil then if p1.isLoading then ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_200, UseTokensResult.Size.Size_300),
			radius = Radius.Small,
			testId = `{p1.testId}-skeleton`
		}) else nil else ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-caption-medium content-action-standard",
			Text = p1.value
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), MetricItem (copy), IconName (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local TestId = p1.testId or "LiveVersionCardView"
	
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y padding-x-large padding-bottom-large padding-top-medium radius-large clip bg-shift-200",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Content = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y",
			testId = `{TestId}-content`
		}, {
			Eyebrow = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-top gap-small size-full-0 auto-y",
				testId = `{TestId}-eyebrow`
			}, {
				VersionAndTitle = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col align-x-left align-y-top fill gap-xxsmall auto-y"
				}, {
					Version = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-caption-medium text-align-x-left content-muted",
						Text = p1.versionLabel,
						testId = `{TestId}-version`
					}),
					Title = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
						Text = p1.title,
						testId = `{TestId}-title`
					})
				}),
				Metrics = if p1.totalUpVotes ~= nil or p1.totalVisits ~= nil or (p1.isTotalUpVotesLoading or p1.isTotalVisitsLoading) then ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small auto-xy padding-x-small padding-y-xsmall radius-small bg-action-standard",
					testId = `{TestId}-metrics`
				}, {
					TotalVisits = if p1.totalVisits == nil and not p1.isTotalVisitsLoading then nil else ReactModule.createElement(MetricItem, {
						layoutOrder = 1,
						iconName = IconName.Eye,
						value = p1.totalVisits,
						isLoading = p1.isTotalVisitsLoading,
						testId = `{TestId}-total-visits`
					}),
					TotalUpVotes = if p1.totalUpVotes == nil and not p1.isTotalUpVotesLoading then nil else ReactModule.createElement(MetricItem, {
						layoutOrder = 2,
						iconName = IconName.ThumbUp,
						value = p1.totalUpVotes,
						isLoading = p1.isTotalUpVotesLoading,
						testId = `{TestId}-total-up-votes`
					})
				}) else nil
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis",
				Text = p1.description,
				testId = `{TestId}-description`
			})
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row size-full-0 auto-y",
			testId = `{TestId}-actions`
		}, {
			Play = ReactModule.createElement(Button, {
				text = p1.playText,
				icon = IconName.PlaySmall,
				size = InputSize.Small,
				variant = ButtonVariant.SoftEmphasis,
				fillBehavior = FillBehavior.Fill,
				isDisabled = p1.isPlayDisabled,
				onActivated = p1.onPlayActivated,
				testId = `{TestId}-play`
			})
		})
	})
end