local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local localizationService = game:GetService("LocalizationService")
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local localizationRoactContext = localizationModule.LocalizationRoactContext
local numberLocalization = localizationModule.NumberLocalization
local useLocalization = localizationModule.Hooks.useLocalization
local agentCardModule = require(script.Parent.AgentCard)
local agentCardActionsModule = require(script.Parent.AgentCardActions)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

local function formatSummary(p1, p2, p3)
	-- upvalues: fFlagBuildLocalization (ref)
	return if fFlagBuildLocalization then p1:Format(p2, p3) else string.gsub(p2, "{([%w_]+)}", function(p4)
		-- upvalues: p3 (ref)
		return p3[p4] or `{p4}`
	end)
end

local function summaryText(p1, p2, p3, p4)
	-- upvalues: numberLocalization (ref), localizationService (ref), formatSummary (ref), localizationStringsModule (ref)
	local action = p1.action
	
	if action == "create" then
		local list = {
			formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_CREATE, {
				NAME = p1.name or p3,
				PRICE = if p1.priceInRobux ~= nil then p4 else numberLocalization.localize(tostring(p1.priceInRobux), localizationService.RobloxLocaleId)
			})
		}
		
		if p1.description ~= nil then
			table.insert(list, formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		return table.concat(list, "\n")
	elseif action == "update" then
		local list = {
			formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_UPDATE, { PRODUCT_ID = tostring(p1.productId) })
		}
		
		if p1.name ~= nil then
			table.insert(list, formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_NAME, { NAME = p1.name }))
		end
		if p1.description ~= nil then
			table.insert(list, formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		if p1.priceInRobux ~= nil then
			table.insert(list, formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_PRICE, {
				PRICE = numberLocalization.localize(tostring(p1.priceInRobux), localizationService.RobloxLocaleId)
			}))
		end
		return table.concat(list, "\n")
	else
		return if action == "activate" then formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_ACTIVATE, { PRODUCT_ID = tostring(p1.productId) }) elseif action == "deactivate" then formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_DEACTIVATE, { PRODUCT_ID = tostring(p1.productId) }) else formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_MANAGE, {})
	end
end

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), reactModule (ref), localizationRoactContext (ref), useLocalization (ref), localizationStringsModule (ref), agentCardModule (ref), summaryText (ref), agentCardActionsModule (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var2 = if fFlagBuildLocalization then useLocalization({
		title = localizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
		approve = localizationStringsModule.AGENT_DEV_PRODUCT_APPROVE,
		reject = localizationStringsModule.AGENT_DEV_PRODUCT_REJECT,
		defaultName = localizationStringsModule.AGENT_DEV_PRODUCT_DEFAULT_NAME,
		unavailablePrice = localizationStringsModule.AGENT_DEV_PRODUCT_PRICE_UNAVAILABLE
	}) else nil
	local testId = p1.testId or "agent-dev-product-card"
	local var3 = p1.isActionDisabled == true
	
	return reactModule.createElement(agentCardModule, {
		title = if fFlagBuildLocalization then var2.title else localizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
		textContent = summaryText(p1, var1, if fFlagBuildLocalization then var2.defaultName else localizationStringsModule.AGENT_DEV_PRODUCT_DEFAULT_NAME, if fFlagBuildLocalization then var2.unavailablePrice else localizationStringsModule.AGENT_DEV_PRODUCT_PRICE_UNAVAILABLE),
		layoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Actions = reactModule.createElement(agentCardActionsModule, nil, {
			Approve = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = if fFlagBuildLocalization then var2.approve else localizationStringsModule.AGENT_DEV_PRODUCT_APPROVE,
				size = inputSize.Small,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = var3,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var3 (ref), p1 (ref)
					if var3 then
						return
					end
					p1.onApprove()
				end, { var3, p1.onApprove }),
				testId = `{testId}-approve-button`
			}),
			Reject = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = if fFlagBuildLocalization then var2.reject else localizationStringsModule.AGENT_DEV_PRODUCT_REJECT,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				isDisabled = var3,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var3 (ref), p1 (ref)
					if var3 then
						return
					end
					p1.onReject()
				end, { var3, p1.onReject }),
				testId = `{testId}-reject-button`
			})
		})
	})
end