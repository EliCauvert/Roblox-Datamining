local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceDevProductRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductRecovery)
local FoundationCloudAssetsModule = if FFlagBuildExperienceMonetizationNativeUIModule then require(Parent.FoundationCloudAssets) else nil
local LocalizationRoactContext = LocalizationModule.LocalizationRoactContext
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local AgentCardModule = require(script.Parent.AgentCard)
local DevProductSummaryModule = require(script.Parent.devProductSummary)
local SummaryKeysFunction = DevProductSummaryModule.summaryKeys
local CreateCardTitleFunction = DevProductSummaryModule.createCardTitle
local SummaryTextFunction = DevProductSummaryModule.summaryText
local AgentCardActionsModule = require(script.Parent.AgentCardActions)
local ChatCardPriorityModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.ChatCardPriority)
local UseChatCardEmphasisModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.useChatCardEmphasis)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local FFlagBuildExperienceMonetizationFailureCausesModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationFailureCauses)
local FFlagBuildExperienceMonetizationCardFixesModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationCardFixes)
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
return function(p1)
	-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), UseLocalizationFunction (copy), SummaryKeysFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), FFlagBuildExperienceDevProductRecoveryModule (copy), FFlagBuildExperienceMonetizationFailureCausesModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), UseChatCardEmphasisModule (copy), ChatCardPriorityModule (copy), Sheet (copy), Text (copy), View (copy), Image (copy), AssetId (ref), SummaryTextFunction (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), AgentCardActionsModule (copy), DevProductSummaryModule (copy), AgentCardModule (copy), CreateCardTitleFunction (copy), FFlagBuildExperienceMonetizationCardFixesModule (copy)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseLocalizationResult = UseLocalizationFunction({
		title = SummaryKeysFunction(p1).title,
		approve = LocalizationStringsModule.AGENT_DEV_PRODUCT_APPROVE,
		reject = if FFlagBuildExperienceMonetizationNativeUIModule then LocalizationStringsModule.MONETIZATION_CANCEL else LocalizationStringsModule.AGENT_DEV_PRODUCT_REJECT,
		defaultName = LocalizationStringsModule.AGENT_DEV_PRODUCT_DEFAULT_NAME,
		unavailablePrice = LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE_UNAVAILABLE,
		preview = if FFlagBuildExperienceMonetizationNativeUIModule then LocalizationStringsModule.GAME_CONFIGURATION_PREVIEW else nil,
		create = if FFlagBuildExperienceMonetizationNativeUIModule then LocalizationStringsModule.MONETIZATION_EMPTY_CREATE_PRODUCT else nil,
		error = if FFlagBuildExperienceDevProductRecoveryModule then LocalizationStringsModule.BUILD_ELIGIBILITY_ERROR_TITLE else nil,
		retry = if FFlagBuildExperienceDevProductRecoveryModule then LocalizationStringsModule.MONETIZATION_RETRY else nil,
		imageInReview = if FFlagBuildExperienceMonetizationFailureCausesModule then LocalizationStringsModule.MONETIZATION_CAUSE_IMAGE_IN_REVIEW else nil,
		imagePreparing = if FFlagBuildExperienceMonetizationFailureCausesModule then LocalizationStringsModule.MONETIZATION_CAUSE_IMAGE_PREPARING else nil,
		imageTooLarge = if FFlagBuildExperienceMonetizationFailureCausesModule then LocalizationStringsModule.MONETIZATION_CAUSE_IMAGE_TOO_LARGE else nil,
		imageTimedOut = if FFlagBuildExperienceMonetizationFailureCausesModule then LocalizationStringsModule.MONETIZATION_CAUSE_IMAGE_TIMED_OUT else nil,
		imageFailed = if FFlagBuildExperienceMonetizationFailureCausesModule then LocalizationStringsModule.MONETIZATION_CAUSE_IMAGE_FAILED else nil,
		moderated = if FFlagBuildExperienceMonetizationFailureCausesModule then LocalizationStringsModule.MONETIZATION_MODERATION_ERROR else nil,
		noUniverse = if FFlagBuildExperienceMonetizationFailureCausesModule then LocalizationStringsModule.MONETIZATION_CAUSE_NO_UNIVERSE else nil,
		rateLimited = if FFlagBuildExperienceMonetizationFailureCausesModule then LocalizationStringsModule.MONETIZATION_CAUSE_RATE_LIMITED else nil
	})
	local TestId = p1.testId or "agent-dev-product-card"
	local IsIsPending: boolean = FFlagBuildExperienceDevProductRecoveryModule and p1.isPending == true
	local IsCanRetry: boolean = FFlagBuildExperienceDevProductRecoveryModule and p1.canRetry == true
	local IsIsReadOnly = p1.isReadOnly == true
	local IsIsActionDisabled: boolean = p1.isActionDisabled == true or IsIsPending
	local IsIsActionDisabled1: boolean = IsIsActionDisabled or IsIsReadOnly
	local UseRefResult = if FFlagBuildExperienceDevProductRecoveryModule then ReactModule.useRef(false) else nil
	local IsCreate: boolean = FFlagBuildExperienceMonetizationNativeUIModule and p1.action == "create"
	local UseChatCardEmphasisModuleResult = if FFlagBuildExperienceChatCardEmphasisModule then UseChatCardEmphasisModule(if IsIsActionDisabled1 then nil else ChatCardPriorityModule.AgentProposal) else nil
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
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: IsIsActionDisabled1 (copy), p1 (copy)
		if not IsIsActionDisabled1 then
			p1.onApprove()
			
			return
		end
	end, { IsIsActionDisabled1, p1.onApprove })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: IsIsActionDisabled1 (copy), p1 (copy)
		if not IsIsActionDisabled1 then
			p1.onReject()
			
			return
		end
	end, { IsIsActionDisabled1, p1.onReject })
	local Element = ReactModule.createElement(AgentCardActionsModule, {
		layoutOrder = if FFlagBuildExperienceDevProductRecoveryModule then 5 elseif IsCreate or p1.imageAssetId == nil then 3 else 4
	}, {
		Approve = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = if IsCanRetry then UseLocalizationResult.retry elseif IsCreate then UseLocalizationResult.preview else UseLocalizationResult.approve,
			size = InputSize.Small,
			variant = if UseChatCardEmphasisModuleResult == false then ButtonVariant.SoftEmphasis else ButtonVariant.Emphasis,
			fillBehavior = FillBehavior.Fill,
			isDisabled = if IsCreate then IsIsPending or IsIsReadOnly else IsIsActionDisabled1,
			onActivated = if IsCreate and not IsCanRetry then UseResult else UseResult1,
			testId = if IsCreate then `{TestId}-preview-button` else `{TestId}-approve-button`
		}),
		Reject = if IsCreate and IsIsActionDisabled then nil else ReactModule.createElement(Button, {
			LayoutOrder = 2,
			text = UseLocalizationResult.reject,
			size = InputSize.Small,
			variant = ButtonVariant.Standard,
			fillBehavior = FillBehavior.Fill,
			isDisabled = IsIsActionDisabled1,
			onActivated = UseResult2,
			testId = `{TestId}-reject-button`
		})
	})
	local UsesCreateCardLayoutResult = DevProductSummaryModule.usesCreateCardLayout(p1)
	
	return ReactModule.createElement(AgentCardModule, {
		title = if UsesCreateCardLayoutResult then CreateCardTitleFunction(p1, UseContextResult, UseLocalizationResult.defaultName, UseLocalizationResult.unavailablePrice) elseif IsCreate then p1.name or UseLocalizationResult.defaultName else UseLocalizationResult.title,
		fitToContent = if IsCreate or FFlagBuildExperienceMonetizationCardFixesModule then true else nil,
		textContent = if UsesCreateCardLayoutResult then p1.description or "" else SummaryTextFunction(p1, UseContextResult, UseLocalizationResult.defaultName, UseLocalizationResult.unavailablePrice),
		layoutOrder = p1.layoutOrder,
		testId = TestId,
		footer = if FFlagBuildExperienceDevProductRecoveryModule then Element else nil
	}, {
		Preview = if IsCreate then ReactModule.createElement(Sheet.Root, {
			isOpen = IsOpen,
			onClose = function()
				-- upvalues: FFlagBuildExperienceDevProductRecoveryModule (upval), IsOpen (ref), IsIsActionDisabled1 (copy), p1 (copy), Callback (ref)
				if not FFlagBuildExperienceDevProductRecoveryModule and not IsOpen and not IsIsActionDisabled1 then
					p1.onApprove()
				end
				Callback(false)
			end,
			snapPoints = { 0.5, 1 },
			testId = `{TestId}-preview`
		}, {
			Header = ReactModule.createElement(Sheet.Header, nil, {
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
						Text = SummaryTextFunction(p1, UseContextResult, UseLocalizationResult.defaultName, UseLocalizationResult.unavailablePrice),
						testId = `{TestId}-preview-summary`
					}),
					Description = ReactModule.createElement(Text, {
						LayoutOrder = 3,
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
						Text = p1.description or "",
						testId = `{TestId}-preview-description`
					})
				})
			}),
			Actions = if IsIsActionDisabled1 then nil else ReactModule.createElement(Sheet.Actions, nil, {
				Create = ReactModule.createElement(Button, {
					text = if IsCanRetry then UseLocalizationResult.retry else UseLocalizationResult.create,
					size = InputSize.Large,
					variant = ButtonVariant.Emphasis,
					fillBehavior = FillBehavior.Fill,
					isDisabled = not IsOpen,
					onActivated = function()
						-- upvalues: IsIsActionDisabled1 (copy), IsOpen (ref), UseRefResult (copy), p1 (copy), Callback (ref)
						if IsIsActionDisabled1 or not IsOpen then return end
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
		}) else nil,
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
			Text = (if p1.errorCause == nil then nil else UseLocalizationResult[p1.errorCause]) or UseLocalizationResult.error,
			testId = `{TestId}-error`
		}) else nil,
		Actions = if FFlagBuildExperienceDevProductRecoveryModule then nil else Element
	})
end