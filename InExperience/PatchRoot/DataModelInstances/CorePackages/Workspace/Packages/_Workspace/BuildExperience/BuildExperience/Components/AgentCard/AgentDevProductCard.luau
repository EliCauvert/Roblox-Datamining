local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceDevProductRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductRecovery)
local FFlagCreatorAgentChatMonetizationToolHelpersModule = require(BuildExperience.Flags.FFlagCreatorAgentChatMonetizationToolHelpers)
local FoundationCloudAssetsModule = if FFlagBuildExperienceMonetizationNativeUIModule then require(Parent.FoundationCloudAssets) else nil
local LocalizationService = game:GetService("LocalizationService")
local LocalizationRoactContext = LocalizationModule.LocalizationRoactContext
local NumberLocalization = LocalizationModule.NumberLocalization
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local AgentCardModule = require(script.Parent.AgentCard)
local AgentCardActionsModule = require(script.Parent.AgentCardActions)
local ChatCardPriorityModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.ChatCardPriority)
local UseChatCardEmphasisModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.useChatCardEmphasis)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local Button = FoundationModule.Button
local Image = FoundationModule.Image
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local AssetId = nil

if FFlagBuildExperienceMonetizationNativeUIModule then
	FoundationCloudAssetsModule.preloadAsset("pictograms/robux")
	AssetId = FoundationCloudAssetsModule.Assets["pictograms/robux"].assetId
end
local config = {
	title = LocalizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
	create = LocalizationStringsModule.AGENT_DEV_PRODUCT_CREATE,
	update = LocalizationStringsModule.AGENT_DEV_PRODUCT_UPDATE,
	activate = LocalizationStringsModule.AGENT_DEV_PRODUCT_ACTIVATE,
	deactivate = LocalizationStringsModule.AGENT_DEV_PRODUCT_DEACTIVATE
}
local config1 = {
	gamePass = {
		title = LocalizationStringsModule.AGENT_GAME_PASS_TITLE,
		create = LocalizationStringsModule.AGENT_GAME_PASS_CREATE,
		update = LocalizationStringsModule.AGENT_GAME_PASS_UPDATE,
		activate = LocalizationStringsModule.AGENT_GAME_PASS_ACTIVATE,
		deactivate = LocalizationStringsModule.AGENT_GAME_PASS_DEACTIVATE
	},
	subscription = {
		title = LocalizationStringsModule.AGENT_SUBSCRIPTION_TITLE,
		create = LocalizationStringsModule.AGENT_SUBSCRIPTION_CREATE,
		update = LocalizationStringsModule.AGENT_SUBSCRIPTION_UPDATE,
		activate = LocalizationStringsModule.AGENT_SUBSCRIPTION_ACTIVATE,
		deactivate = LocalizationStringsModule.AGENT_SUBSCRIPTION_DEACTIVATE,
		deactivateCancelRenewals = LocalizationStringsModule.AGENT_SUBSCRIPTION_DEACTIVATE_CANCEL_RENEWALS,
		delete = LocalizationStringsModule.AGENT_SUBSCRIPTION_DELETE
	}
}
local config2 = {
	consumable = LocalizationStringsModule.AGENT_SUBSCRIPTION_PRODUCT_TYPE_CONSUMABLE,
	currency = LocalizationStringsModule.AGENT_SUBSCRIPTION_PRODUCT_TYPE_CURRENCY,
	durable = LocalizationStringsModule.AGENT_SUBSCRIPTION_PRODUCT_TYPE_DURABLE
}

local function _(p1)
	-- upvalues: config1 (copy), config (copy)
	local Entry = nil
	if p1.itemKind == nil then
		Entry = config
	else
		Entry = config1[p1.itemKind]
		
		if not Entry then
			return config
		end
	end
	return Entry
end

local _ = function(p1, p2)
	return if p2.action == "create" or p2.action == "update" or p2.action == "title" then nil elseif p2.action == "deactivate" and p2.cancelRenewals == true and p1.deactivateCancelRenewals ~= nil then p1.deactivateCancelRenewals else p1[p2.action]
end

local _ = function(p1)
	return p1.itemId or tostring(p1.productId)
end

local function formatSummary(p1, AGENTDEVPRODUCTDESCRIPTION, p2)
	return p1:Format(AGENTDEVPRODUCTDESCRIPTION, p2)
end

local function appendSubscriptionProductType(List, p1, p2)
	-- upvalues: config2 (copy), formatSummary (copy), LocalizationStringsModule (copy)
	if p1.itemKind ~= "subscription" or p1.productType == nil then return end
	local Entry = config2[p1.productType]
	
	if Entry ~= nil then
		table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_SUBSCRIPTION_PRODUCT_TYPE, { PRODUCT_TYPE = p2:Format(Entry, {}) }))
		
		return
	end
end

local function devProductSummaryText(p1, UseContextResult, DefaultName, UnavailablePrice)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), formatSummary (copy), LocalizationStringsModule (copy)
	local Action = p1.action
	
	if Action == "create" then
		local Name = p1.name or DefaultName
		local UnavailablePrice1 = if p1.priceInRobux == nil then UnavailablePrice else NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
		
		if FFlagBuildExperienceMonetizationNativeUIModule then
			return formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE, { PRICE = UnavailablePrice1 })
		end
		local List = {
			formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_CREATE, { NAME = Name, PRICE = UnavailablePrice1 })
		}
		
		if p1.description ~= nil then
			table.insert(List, formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		return table.concat(List, "\n")
	else
		if Action ~= "update" then
			return if Action == "activate" then formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_ACTIVATE, { PRODUCT_ID = tostring(p1.productId) }) elseif Action == "deactivate" then formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_DEACTIVATE, { PRODUCT_ID = tostring(p1.productId) }) else formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_MANAGE, {})
		end
		local List = {
			formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_UPDATE, { PRODUCT_ID = tostring(p1.productId) })
		}
		
		if p1.name ~= nil then
			table.insert(List, formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_NAME, { NAME = p1.name }))
		end
		if p1.description ~= nil then
			table.insert(List, formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		if p1.priceInRobux ~= nil then
			table.insert(List, formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE, {
				PRICE = NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
			}))
		end
		return table.concat(List, "\n")
	end
end

local function itemSummaryText(p1, UseContextResult, DefaultName, UnavailablePrice)
	-- upvalues: config1 (copy), config (copy), NumberLocalization (copy), LocalizationService (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), formatSummary (copy), LocalizationStringsModule (copy), appendSubscriptionProductType (copy)
	local Action = p1.action
	local Config = if p1.itemKind == nil then config else config1[p1.itemKind] or config
	
	if Action == "create" then
		local Name = p1.name or DefaultName
		local UnavailablePrice1 = if p1.priceInRobux == nil then UnavailablePrice else NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
		local List = if FFlagBuildExperienceMonetizationNativeUIModule then {
			formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE, { PRICE = UnavailablePrice1 })
		} else {
			formatSummary(UseContextResult, Config.create, { NAME = Name, PRICE = UnavailablePrice1 })
		}
		appendSubscriptionProductType(List, p1, UseContextResult)
		
		if FFlagBuildExperienceMonetizationNativeUIModule then
			return table.concat(List, "\n")
		end
		if p1.description ~= nil then
			table.insert(List, formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		return table.concat(List, "\n")
	else
		if Action ~= "update" then
			local DeactivateCancelRenewals = if p1.action == "create" or p1.action == "update" or p1.action == "title" then nil elseif p1.action == "deactivate" and p1.cancelRenewals == true and Config.deactivateCancelRenewals ~= nil then Config.deactivateCancelRenewals else Config[p1.action]
			
			return if DeactivateCancelRenewals == nil then formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_MANAGE, {}) else formatSummary(UseContextResult, DeactivateCancelRenewals, { PRODUCT_ID = p1.itemId or tostring(p1.productId) })
		end
		local List = {
			formatSummary(UseContextResult, Config.update, { PRODUCT_ID = p1.itemId or tostring(p1.productId) })
		}
		
		if p1.name ~= nil then
			table.insert(List, formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_NAME, { NAME = p1.name }))
		end
		if p1.description ~= nil then
			table.insert(List, formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		if p1.priceInRobux ~= nil then
			table.insert(List, formatSummary(UseContextResult, LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE, {
				PRICE = NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
			}))
		end
		return table.concat(List, "\n")
	end
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: FFlagCreatorAgentChatMonetizationToolHelpersModule (copy), devProductSummaryText (copy), itemSummaryText (copy)
	return if FFlagCreatorAgentChatMonetizationToolHelpersModule or p1.itemKind ~= nil then itemSummaryText(p1, p2, p3, p4) else devProductSummaryText(p1, p2, p3, p4)
end

return function(p1)
	-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), UseLocalizationFunction (copy), config1 (copy), config (copy), LocalizationStringsModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), FFlagBuildExperienceDevProductRecoveryModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), UseChatCardEmphasisModule (copy), ChatCardPriorityModule (copy), Sheet (copy), Text (copy), View (copy), Image (copy), AssetId (ref), FFlagCreatorAgentChatMonetizationToolHelpersModule (copy), devProductSummaryText (copy), itemSummaryText (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), AgentCardActionsModule (copy), AgentCardModule (copy)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseLocalizationResult = UseLocalizationFunction({
		title = (if p1.itemKind == nil then config else config1[p1.itemKind] or config).title,
		approve = LocalizationStringsModule.AGENT_DEV_PRODUCT_APPROVE,
		reject = if FFlagBuildExperienceMonetizationNativeUIModule then LocalizationStringsModule.MONETIZATION_CANCEL else LocalizationStringsModule.AGENT_DEV_PRODUCT_REJECT,
		defaultName = LocalizationStringsModule.AGENT_DEV_PRODUCT_DEFAULT_NAME,
		unavailablePrice = LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE_UNAVAILABLE,
		preview = if FFlagBuildExperienceMonetizationNativeUIModule then LocalizationStringsModule.GAME_CONFIGURATION_PREVIEW else nil,
		create = if FFlagBuildExperienceMonetizationNativeUIModule then LocalizationStringsModule.MONETIZATION_EMPTY_CREATE_PRODUCT else nil,
		error = if FFlagBuildExperienceDevProductRecoveryModule then LocalizationStringsModule.BUILD_ELIGIBILITY_ERROR_TITLE else nil,
		retry = if FFlagBuildExperienceDevProductRecoveryModule then LocalizationStringsModule.MONETIZATION_RETRY else nil
	})
	local TestId = p1.testId or "agent-dev-product-card"
	local IsIsPending: boolean = FFlagBuildExperienceDevProductRecoveryModule and p1.isPending == true
	local IsCanRetry: boolean = FFlagBuildExperienceDevProductRecoveryModule and p1.canRetry == true
	local IsIsActionDisabled: boolean = p1.isActionDisabled == true or IsIsPending
	local UseRefResult = if FFlagBuildExperienceDevProductRecoveryModule then ReactModule.useRef(false) else nil
	local IsCreate: boolean = FFlagBuildExperienceMonetizationNativeUIModule and p1.action == "create"
	local UseChatCardEmphasisModuleResult = if FFlagBuildExperienceChatCardEmphasisModule then UseChatCardEmphasisModule(if IsIsActionDisabled then nil else ChatCardPriorityModule.AgentProposal) else nil
	local IsOpen = false
	local Callback = nil
	local UseResult = nil
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		IsOpen, Callback = ReactModule.useState(false)
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), Callback (ref)
			if UseRefResult ~= nil then
				UseRefResult.current = false
			end
			Callback(true)
		end, { Callback })
	end
	local Element = nil
	if IsCreate then
		local DefaultName = UseLocalizationResult.defaultName
		local UnavailablePrice = UseLocalizationResult.unavailablePrice
		Element = ReactModule.createElement(Sheet.Root, {
			isOpen = IsOpen,
			onClose = function()
				-- upvalues: FFlagBuildExperienceDevProductRecoveryModule (upval), IsOpen (ref), IsIsActionDisabled (copy), p1 (copy), Callback (ref)
				if not FFlagBuildExperienceDevProductRecoveryModule and not IsOpen and not IsIsActionDisabled then
					p1.onApprove()
				end
				Callback(false)
			end,
			snapPoints = { 0.5, 1 },
			testId = `{TestId}-preview`
		}, {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
				Title = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
					Text = p1.name or UseLocalizationResult.defaultName
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, nil, {
				Details = ReactModule.createElement(View, { tag = "col align-x-center gap-large size-full-0 auto-y" }, {
					Image = if p1.imageAssetId == nil then ReactModule.createElement(Image, {
						LayoutOrder = 1,
						tag = "size-3000-3000 content-emphasis",
						Image = AssetId,
						ScaleType = Enum.ScaleType.Fit,
						testId = `{TestId}-preview-image`
					}) else ReactModule.createElement(Image, {
						LayoutOrder = 1,
						tag = "size-3000-3000 radius-medium",
						Image = `rbxassetid://{p1.imageAssetId}`,
						ScaleType = Enum.ScaleType.Fit,
						testId = `{TestId}-preview-image`
					}),
					Price = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-emphasis",
						Text = if FFlagCreatorAgentChatMonetizationToolHelpersModule or p1.itemKind ~= nil then itemSummaryText(p1, UseContextResult, DefaultName, UnavailablePrice) else devProductSummaryText(p1, UseContextResult, DefaultName, UnavailablePrice)
					}),
					Description = ReactModule.createElement(Text, {
						LayoutOrder = 3,
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
						Text = p1.description or "",
						testId = `{TestId}-preview-description`
					})
				})
			}),
			Actions = if IsIsActionDisabled then nil else ReactModule.createElement(Sheet.Actions, nil, {
				Create = ReactModule.createElement(Button, {
					text = if IsCanRetry then UseLocalizationResult.retry else UseLocalizationResult.create,
					size = InputSize.Large,
					variant = ButtonVariant.Emphasis,
					fillBehavior = FillBehavior.Fill,
					isDisabled = not IsOpen,
					onActivated = function()
						-- upvalues: IsIsActionDisabled (copy), IsOpen (ref), UseRefResult (copy), p1 (copy), Callback (ref)
						if IsIsActionDisabled or not IsOpen then return end
						if UseRefResult ~= nil then
							if UseRefResult.current then return end
							UseRefResult.current = true
							p1.onApprove()
						end
						Callback(false)
					end,
					testId = `{TestId}-create-button`
				})
			})
		})
	else
		Element = nil
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: IsIsActionDisabled (copy), p1 (copy)
		if not IsIsActionDisabled then
			p1.onApprove()
			
			return
		end
	end, { IsIsActionDisabled, p1.onApprove })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: IsIsActionDisabled (copy), p1 (copy)
		if not IsIsActionDisabled then
			p1.onReject()
			
			return
		end
	end, { IsIsActionDisabled, p1.onReject })
	local Element1 = ReactModule.createElement(AgentCardActionsModule, {
		layoutOrder = if FFlagBuildExperienceDevProductRecoveryModule then 5 elseif IsCreate or p1.imageAssetId == nil then 3 else 4
	}, {
		Approve = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = if IsCanRetry then UseLocalizationResult.retry elseif IsCreate then UseLocalizationResult.preview else UseLocalizationResult.approve,
			size = InputSize.Small,
			variant = if UseChatCardEmphasisModuleResult == false then ButtonVariant.SoftEmphasis else ButtonVariant.Emphasis,
			fillBehavior = FillBehavior.Fill,
			isDisabled = if IsCreate then IsIsPending else IsIsActionDisabled,
			onActivated = if IsCreate and not IsCanRetry then UseResult else UseResult1,
			testId = if IsCreate then `{TestId}-preview-button` else `{TestId}-approve-button`
		}),
		Reject = if IsCreate and IsIsActionDisabled then nil else ReactModule.createElement(Button, {
			LayoutOrder = 2,
			text = UseLocalizationResult.reject,
			size = InputSize.Small,
			variant = ButtonVariant.Standard,
			fillBehavior = FillBehavior.Fill,
			isDisabled = IsIsActionDisabled,
			onActivated = UseResult2,
			testId = `{TestId}-reject-button`
		})
	})
	local DefaultName = UseLocalizationResult.defaultName
	local UnavailablePrice = UseLocalizationResult.unavailablePrice
	
	return ReactModule.createElement(AgentCardModule, {
		title = if IsCreate then p1.name or UseLocalizationResult.defaultName else UseLocalizationResult.title,
		fitToContent = if IsCreate then true else nil,
		textContent = if FFlagCreatorAgentChatMonetizationToolHelpersModule or p1.itemKind ~= nil then itemSummaryText(p1, UseContextResult, DefaultName, UnavailablePrice) else devProductSummaryText(p1, UseContextResult, DefaultName, UnavailablePrice),
		layoutOrder = p1.layoutOrder,
		testId = TestId,
		footer = if FFlagBuildExperienceDevProductRecoveryModule then Element1 else nil
	}, {
		Preview = Element,
		ImagePreview = if IsCreate or p1.imageAssetId == nil then nil else ReactModule.createElement(Image, {
			LayoutOrder = 3,
			tag = "size-3000-3000 radius-medium",
			Image = `rbxassetid://{p1.imageAssetId}`,
			ScaleType = Enum.ScaleType.Fit,
			testId = `{TestId}-image-preview`
		}),
		Error = if FFlagBuildExperienceDevProductRecoveryModule and p1.hasError and not IsIsPending then ReactModule.createElement(Text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-alert",
			Text = UseLocalizationResult.error,
			testId = `{TestId}-error`
		}) else nil,
		Actions = if FFlagBuildExperienceDevProductRecoveryModule then nil else Element1
	})
end