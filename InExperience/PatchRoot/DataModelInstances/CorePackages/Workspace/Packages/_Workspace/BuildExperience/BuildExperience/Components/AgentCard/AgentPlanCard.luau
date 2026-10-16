local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local AgentCardModule = require(script.Parent.AgentCard)
local AgentCardActionsModule = require(script.Parent.AgentCardActions)
local GetMarkdownRendererPropsModule = require(BuildExperience.utils.getMarkdownRendererProps)
local ChatCardPriorityModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.ChatCardPriority)
local UseChatCardEmphasisModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.useChatCardEmphasis)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local Button = FoundationModule.Button
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local MarkdownViewer = require(Parent.Markdown).Components.MarkdownViewer

local function AgentPlanSheet(p1) --[[ Line: 46 ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FoundationModule (copy), ReactModule (copy), GetMarkdownRendererPropsModule (copy), Sheet (copy), Text (copy), View (copy), MarkdownViewer (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Default = UseTokensResult.Color.Content.Default
	
	return ReactModule.createElement(Sheet.Root, {
		defaultSnapPointIndex = 1,
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		snapPoints = { 0.5, 1 },
		testId = p1.testId
	}, {
		Header = ReactModule.createElement(Sheet.Header, nil, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y margin-x-small padding-y-small text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p1.title
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			OverviewAndBody = ReactModule.createElement(View, {
				tag = "col gap-xsmall size-full-0 auto-y margin-x-small padding-bottom-large"
			}, {
				Overview = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-default",
					Text = UseLocalizationFunction({ overview = LocalizationStringsModule.AGENT_PLAN_OVERVIEW }).overview
				}),
				Body = ReactModule.createElement(MarkdownViewer, {
					Markdown = p1.textContent,
					WrapperProps = {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-medium content-emphasis",
						testId = `{p1.testId}-text-content`
					},
					MarkdownRendererProps = ReactModule.useMemo(function() --[[ Line: 52 ]]
						-- upvalues: GetMarkdownRendererPropsModule (upval), UseTokensResult (copy), Default (copy)
						return GetMarkdownRendererPropsModule(UseTokensResult, Default)
					end, { UseTokensResult, Default })
				})
			})
		})
	})
end

return function(p1) --[[ Line: 98 | Named "AgentPlanCard" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), UseChatCardEmphasisModule (copy), ChatCardPriorityModule (copy), AgentCardModule (copy), AgentCardActionsModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), AgentPlanSheet (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		build = LocalizationStringsModule.AGENT_PLAN_BUILD,
		view = LocalizationStringsModule.AGENT_PLAN_VIEW
	})
	local TestId = p1.testId or "agent-plan-card"
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseChatCardEmphasisModuleResult = if FFlagBuildExperienceChatCardEmphasisModule then UseChatCardEmphasisModule(if p1.isBuildDisabled == true then nil else ChatCardPriorityModule.AgentProposal) else nil
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Card = ReactModule.createElement(AgentCardModule, {
			title = p1.title,
			textContent = p1.summary or p1.textContent,
			layoutOrder = p1.layoutOrder,
			testId = TestId
		}, {
			Actions = ReactModule.createElement(AgentCardActionsModule, nil, {
				Build = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = UseLocalizationResult.build,
					size = InputSize.Small,
					variant = if UseChatCardEmphasisModuleResult == false then ButtonVariant.SoftEmphasis else ButtonVariant.Emphasis,
					fillBehavior = FillBehavior.Fill,
					isDisabled = p1.isBuildDisabled == true,
					onActivated = ReactModule.useCallback(function() --[[ Line: 111 ]]
						-- upvalues: p1 (copy)
						if p1.isBuildDisabled ~= true then
							p1.onBuild()
							
							return
						end
					end, { p1.isBuildDisabled, p1.onBuild }),
					testId = `{TestId}-build-button`
				}),
				View = ReactModule.createElement(Button, {
					LayoutOrder = 2,
					text = UseLocalizationResult.view,
					size = InputSize.Small,
					variant = ButtonVariant.Standard,
					fillBehavior = FillBehavior.Fill,
					onActivated = ReactModule.useCallback(function() --[[ Line: 118 ]]
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(true)
					end, {}),
					testId = `{TestId}-view-button`
				})
			})
		}),
		Sheet = ReactModule.createElement(AgentPlanSheet, {
			title = p1.title,
			textContent = p1.textContent,
			isOpen = UseStateResult,
			onClose = ReactModule.useCallback(function() --[[ Line: 122 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end, {}),
			testId = `{TestId}-sheet`
		})
	})
end