local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local fFlagBuildExperienceDevProductRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceDevProductRecovery)
local var1 = if fFlagBuildExperienceMonetizationNativeUIModule then require(parent.FoundationCloudAssets) else nil
local localizationService = game:GetService("LocalizationService")
local localizationRoactContext = localizationModule.LocalizationRoactContext
local numberLocalization = localizationModule.NumberLocalization
local useLocalization = localizationModule.Hooks.useLocalization
local agentCardModule = require(script.Parent.AgentCard)
local agentCardActionsModule = require(script.Parent.AgentCardActions)
local chatCardPriorityModule = require(buildExperience.Components.Chat.ChatCardEmphasis.ChatCardPriority)
local useChatCardEmphasisModule = require(buildExperience.Components.Chat.ChatCardEmphasis.useChatCardEmphasis)
local fFlagBuildExperienceChatCardEmphasisModule = require(buildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local button = foundationModule.Button
local image = foundationModule.Image
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local assetId = nil

if fFlagBuildExperienceMonetizationNativeUIModule then
	var1.preloadAsset("pictograms/robux")
	assetId = var1.Assets["pictograms/robux"].assetId
end
local function formatSummary(p1, p2, p3)
	return p1:Format(p2, p3)
end

local function summaryText(p1, p2, p3, p4)
	-- upvalues: numberLocalization (ref), localizationService (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), formatSummary (ref), localizationStringsModule (ref)
	local action = p1.action
	
	if action == "create" then
		local name = p1.name or p3
		local var2 = if p1.priceInRobux ~= nil then p4 else numberLocalization.localize(tostring(p1.priceInRobux), localizationService.RobloxLocaleId)
		
		if fFlagBuildExperienceMonetizationNativeUIModule then
			return formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_PRICE, { PRICE = var2 })
		end
		local list = {
			formatSummary(p2, localizationStringsModule.AGENT_DEV_PRODUCT_CREATE, { NAME = name, PRICE = var2 })
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
	-- upvalues: reactModule (ref), localizationRoactContext (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), fFlagBuildExperienceDevProductRecoveryModule (ref), fFlagBuildExperienceChatCardEmphasisModule (ref), useChatCardEmphasisModule (ref), chatCardPriorityModule (ref), sheet (ref), text (ref), view (ref), image (ref), assetId (write), summaryText (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), agentCardActionsModule (ref), agentCardModule (ref)
	local var2 = reactModule.useContext(localizationRoactContext)
	local var3 = useLocalization({
		title = localizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
		approve = localizationStringsModule.AGENT_DEV_PRODUCT_APPROVE,
		reject = if fFlagBuildExperienceMonetizationNativeUIModule then localizationStringsModule.MONETIZATION_CANCEL else localizationStringsModule.AGENT_DEV_PRODUCT_REJECT,
		defaultName = localizationStringsModule.AGENT_DEV_PRODUCT_DEFAULT_NAME,
		unavailablePrice = localizationStringsModule.AGENT_DEV_PRODUCT_PRICE_UNAVAILABLE,
		preview = if fFlagBuildExperienceMonetizationNativeUIModule then localizationStringsModule.GAME_CONFIGURATION_PREVIEW else nil,
		create = if fFlagBuildExperienceMonetizationNativeUIModule then localizationStringsModule.MONETIZATION_EMPTY_CREATE_PRODUCT else nil,
		error = if fFlagBuildExperienceDevProductRecoveryModule then localizationStringsModule.BUILD_ELIGIBILITY_ERROR_TITLE else nil,
		retry = if fFlagBuildExperienceDevProductRecoveryModule then localizationStringsModule.MONETIZATION_RETRY else nil
	})
	local testId = p1.testId or "agent-dev-product-card"
	local var4 = fFlagBuildExperienceDevProductRecoveryModule and p1.isPending == true
	local var5 = fFlagBuildExperienceDevProductRecoveryModule and p1.canRetry == true
	local var6 = if p1.isActionDisabled ~= true then var4 else true
	local var7 = if fFlagBuildExperienceDevProductRecoveryModule then reactModule.useRef(false) else nil
	local var8 = fFlagBuildExperienceMonetizationNativeUIModule and p1.action == "create"
	local var9 = if fFlagBuildExperienceChatCardEmphasisModule then useChatCardEmphasisModule(if var6 then nil else chatCardPriorityModule.AgentProposal) else nil
	local var10 = false
	local var11 = nil
	local var12 = nil
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		local var13, var14 = reactModule.useState(false)
		var10 = var13
		var11 = var14
		var12 = reactModule.useCallback(function()
			-- upvalues: var7 (ref), var11 (write)
			if var7 ~= nil then
				var7.current = false
			end
			var11(true)
		end, { var11 })
	end
	local var15 = if var8 then reactModule.createElement(sheet.Root, {
		isOpen = var10,
		onClose = function()
			-- upvalues: fFlagBuildExperienceDevProductRecoveryModule (copy), var10 (write), var6 (ref), p1 (ref), var11 (write)
			if not fFlagBuildExperienceDevProductRecoveryModule and not var10 and not var6 then
				p1.onApprove()
			end
			var11(false)
		end,
		snapPoints = { 0.5, 1 },
		testId = `{testId}-preview`
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
				Text = p1.name or var3.defaultName
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			Details = reactModule.createElement(view, { tag = "col align-x-center gap-large size-full-0 auto-y" }, {
				Image = if p1.imageAssetId ~= nil then reactModule.createElement(image, {
					LayoutOrder = 1,
					tag = "size-3000-3000 content-emphasis",
					Image = assetId,
					ScaleType = Enum.ScaleType.Fit,
					testId = `{testId}-preview-image`
				}) else reactModule.createElement(image, {
					LayoutOrder = 1,
					tag = "size-3000-3000 radius-medium",
					Image = `rbxassetid://{p1.imageAssetId}`,
					ScaleType = Enum.ScaleType.Fit,
					testId = `{testId}-preview-image`
				}),
				Price = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-emphasis",
					Text = summaryText(p1, var2, var3.defaultName, var3.unavailablePrice)
				}),
				Description = reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = p1.description or "",
					testId = `{testId}-preview-description`
				})
			})
		}),
		Actions = if not var6 then reactModule.createElement(sheet.Actions, nil, {
			Create = reactModule.createElement(button, {
				text = if var5 then var3.retry else var3.create,
				size = inputSize.Large,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = not var10,
				onActivated = function()
					-- upvalues: var6 (ref), var10 (write), var7 (ref), p1 (ref), var11 (write)
					if var6 or not var10 then return end
					if var7 ~= nil then
						if var7.current then return end
						var7.current = true
						p1.onApprove()
					end
					var11(false)
				end,
				testId = `{testId}-create-button`
			})
		}) else nil
	}) else nil
	local createElement = reactModule.createElement
	createElement = createElement(agentCardActionsModule, {
		layoutOrder = if fFlagBuildExperienceDevProductRecoveryModule then 5 elseif var8 or p1.imageAssetId == nil then 3 else 4
	}, {
		Approve = reactModule.createElement(button, {
			LayoutOrder = 1,
			text = if var5 then var3.retry elseif var8 then var3.preview else var3.approve,
			size = inputSize.Small,
			variant = if var9 == false then buttonVariant.SoftEmphasis else buttonVariant.Emphasis,
			fillBehavior = fillBehavior.Fill,
			isDisabled = if var8 then var4 else var6,
			onActivated = if var8 and not var5 then var12 else reactModule.useCallback(function()
				-- upvalues: var6 (ref), p1 (ref)
				if var6 then
					return
				end
				p1.onApprove()
			end, { var6, p1.onApprove }),
			testId = if var8 then `{testId}-preview-button` else `{testId}-approve-button`
		}),
		Reject = if var8 and var6 then nil else reactModule.createElement(button, {
			LayoutOrder = 2,
			text = var3.reject,
			size = inputSize.Small,
			variant = buttonVariant.Standard,
			fillBehavior = fillBehavior.Fill,
			isDisabled = var6,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var6 (ref), p1 (ref)
				if var6 then
					return
				end
				p1.onReject()
			end, { var6, p1.onReject }),
			testId = `{testId}-reject-button`
		})
	})
	
	return reactModule.createElement(agentCardModule, {
		title = if var8 then p1.name or var3.defaultName else var3.title,
		fitToContent = if var8 then true else nil,
		textContent = summaryText(p1, var2, var3.defaultName, var3.unavailablePrice),
		layoutOrder = p1.layoutOrder,
		testId = testId,
		footer = if fFlagBuildExperienceDevProductRecoveryModule then createElement else nil
	}, {
		Preview = var15,
		ImagePreview = if var8 or p1.imageAssetId == nil then nil else reactModule.createElement(image, {
			LayoutOrder = 3,
			tag = "size-3000-3000 radius-medium",
			Image = `rbxassetid://{p1.imageAssetId}`,
			ScaleType = Enum.ScaleType.Fit,
			testId = `{testId}-image-preview`
		}),
		Error = if fFlagBuildExperienceDevProductRecoveryModule and p1.hasError and not var4 then reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-alert",
			Text = var3.error,
			testId = `{testId}-error`
		}) else nil,
		Actions = if fFlagBuildExperienceDevProductRecoveryModule then nil else createElement
	})
end