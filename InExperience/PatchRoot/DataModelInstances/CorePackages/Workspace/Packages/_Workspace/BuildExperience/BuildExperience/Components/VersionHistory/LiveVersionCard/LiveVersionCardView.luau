local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local icon = foundationModule.Icon
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

local function MetricItem(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref), skeleton (ref), radius (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-xxsmall auto-xy",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			tag = "content-action-standard",
			name = p1.iconName,
			size = iconSize.XSmall
		}),
		Value = if p1.value ~= nil then if p1.isLoading then reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(var1.Size.Size_200, var1.Size.Size_300),
			radius = radius.Small,
			testId = `{p1.testId}-skeleton`
		}) else nil else reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-caption-medium content-action-standard",
			Text = p1.value
		})
	})
end

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), MetricItem (ref), iconName (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var1
	local testId = p1.testId or "LiveVersionCardView"
	local var2 = if p1.totalUpVotes == nil then if p1.totalVisits == nil then p1.isTotalUpVotesLoading or p1.isTotalVisitsLoading else true else true
	local createElement = reactModule.createElement
	local t = {
		tag = "col gap-large size-full-0 auto-y padding-x-large padding-bottom-large padding-top-medium radius-large clip bg-shift-200",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		LayoutOrder = 1,
		tag = "col gap-xxsmall size-full-0 auto-y",
		testId = `{testId}-content`
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		LayoutOrder = 1,
		tag = "row align-x-left align-y-top gap-small size-full-0 auto-y",
		testId = `{testId}-eyebrow`
	}
	local t_5 = {
		VersionAndTitle = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col align-x-left align-y-top fill gap-xxsmall auto-y"
		}, {
			Version = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-caption-medium text-align-x-left content-muted",
				Text = p1.versionLabel,
				testId = `{testId}-version`
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = p1.title,
				testId = `{testId}-title`
			})
		})
	}
	
	if var2 then
		var1 = reactModule.createElement
		var1 = var1(view, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-small auto-xy padding-x-small padding-y-xsmall radius-small bg-action-standard",
			testId = `{testId}-metrics`
		}, {
			TotalUpVotes = if p1.totalUpVotes == nil and not p1.isTotalUpVotesLoading then nil else reactModule.createElement(MetricItem, {
				layoutOrder = 1,
				iconName = iconName.ThumbUp,
				value = p1.totalUpVotes,
				isLoading = p1.isTotalUpVotesLoading,
				testId = `{testId}-total-up-votes`
			}),
			TotalVisits = if p1.totalVisits == nil and not p1.isTotalVisitsLoading then nil else reactModule.createElement(MetricItem, {
				layoutOrder = 2,
				iconName = iconName.Eye,
				value = p1.totalVisits,
				isLoading = p1.isTotalVisitsLoading,
				testId = `{testId}-total-visits`
			})
		})
	else
		var1 = nil
	end
	t_5.Metrics = var1
	t_3.Eyebrow = createElement_2(view, t_4, t_5)
	t_3.Description = reactModule.createElement(text, {
		LayoutOrder = 2,
		tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis",
		Text = p1.description,
		testId = `{testId}-description`
	})
	t_1.Content = createElement_1(view, t_2, t_3)
	t_1.Actions = reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = "row size-full-0 auto-y",
		testId = `{testId}-actions`
	}, {
		Play = reactModule.createElement(button, {
			text = p1.playText,
			icon = iconName.PlaySmall,
			size = inputSize.Small,
			variant = buttonVariant.SoftEmphasis,
			fillBehavior = fillBehavior.Fill,
			isDisabled = p1.isPlayDisabled,
			onActivated = p1.onPlayActivated,
			testId = `{testId}-play`
		})
	})
	
	return createElement(view, t, t_1)
end