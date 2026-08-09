local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local markdownModule = require(parent.Markdown)
local reactModule = require(parent.React)
local agentCardModule = require(script.Parent.AgentCard)
local agentCardActionsModule = require(script.Parent.AgentCardActions)
local button = foundationModule.Button
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local markdownViewer = markdownModule.Components.MarkdownViewer

local function AgentPlanSheet(p0) --[[ line: 44 ]]
	-- upvalues: foundationModule (ref), reactModule (ref), sheet (ref), text (ref), view (ref), markdownViewer (ref)
	local default = foundationModule.Hooks.useTokens().Color.Content.Default
	
	return reactModule.createElement(sheet.Root, {
		defaultSnapPointIndex = 1,
		isOpen = p0.isOpen,
		onClose = p0.onClose,
		snapPoints = { 0.5, 1 },
		testId = p0.testId
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "gap-xsmall size-full-0 auto-y margin-x-small text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p0.title
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			OverviewAndBody = reactModule.createElement(view, {
				tag = "col gap-large size-full-0 auto-y margin-x-small padding-bottom-large"
			}, {
				Overview = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = "Overview",
					tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-default"
				}),
				Body = reactModule.createElement(markdownViewer, {
					Markdown = p0.textContent,
					WrapperProps = {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-medium content-emphasis",
						testId = `{p0.testId}-text-content`
					},
					MarkdownRendererProps = {
						textStyles = {
							color = `#{default.Color3:ToHex()}`,
							transparency = default.Transparency
						}
					}
				})
			})
		})
	})
end

return function(p1) --[[ line: 97 | named "AgentPlanCard" ]]
	-- upvalues: reactModule (ref), agentCardModule (ref), agentCardActionsModule (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), AgentPlanSheet (ref)
	local testId = p1.testId or "agent-plan-card"
	local var7, var8 = reactModule.useState(false)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Card = reactModule.createElement(agentCardModule, {
			title = p1.title,
			textContent = p1.summary or p1.textContent,
			layoutOrder = p1.layoutOrder,
			testId = testId
		}, {
			Actions = reactModule.createElement(agentCardActionsModule, nil, {
				Build = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = "Build",
					size = inputSize.Small,
					variant = buttonVariant.SoftEmphasis,
					fillBehavior = fillBehavior.Fill,
					isDisabled = p1.isBuildDisabled == true,
					onActivated = reactModule.useCallback(function() --[[ line: 101 ]]
						-- upvalues: p1 (ref)
						if p1.isBuildDisabled == true then
							return
						end
						p1.onBuild()
					end, { p1.isBuildDisabled, p1.onBuild }),
					testId = `{testId}-build-button`
				}),
				View = reactModule.createElement(button, {
					LayoutOrder = 2,
					text = "View",
					size = inputSize.Small,
					variant = buttonVariant.Standard,
					fillBehavior = fillBehavior.Fill,
					onActivated = reactModule.useCallback(function() --[[ line: 108 ]]
						-- upvalues: var8 (ref)
						var8(true)
					end, {}),
					testId = `{testId}-view-button`
				})
			})
		}),
		Sheet = reactModule.createElement(AgentPlanSheet, {
			title = p1.title,
			textContent = p1.textContent,
			isOpen = var7,
			onClose = reactModule.useCallback(function() --[[ line: 112 ]]
				-- upvalues: var8 (ref)
				var8(false)
			end, {}),
			testId = `{testId}-sheet`
		})
	})
end