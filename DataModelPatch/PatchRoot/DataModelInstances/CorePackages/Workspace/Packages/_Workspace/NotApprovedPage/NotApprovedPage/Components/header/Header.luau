local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local BuilderIconsModule = require(Parent.BuilderIcons)
local CircleSlash = BuilderIconsModule.Icon.CircleSlash
local IconVariant = BuilderIconsModule.IconVariant
local TriangleExclamation = BuilderIconsModule.Icon.TriangleExclamation
local BackButtonModule = require(NotApprovedPage.Components.header.BackButton)
local HeaderPopoverMenuModule = require(NotApprovedPage.Components.header.HeaderPopoverMenu)
local HeaderProgressBarModule = require(NotApprovedPage.Components.HeaderProgressBar)
local _ = require(NotApprovedPage.Common.Types)
local UsePageNavigationFunction = require(NotApprovedPage.Contexts.PageNavigationContext).usePageNavigation
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local Constants = require(Parent.NotApprovedPageShared).Constants
local INTERVENTIONTYPES = Constants.INTERVENTION_TYPES
local PUNISHMENTTYPETOINTERVENTIONMAP = Constants.PUNISHMENT_TYPE_TO_INTERVENTION_MAP

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UsePageNavigationFunction (copy), UseNotApprovedPageContextFunction (copy), PUNISHMENTTYPETOINTERVENTIONMAP (copy), INTERVENTIONTYPES (copy), CircleSlash (copy), TriangleExclamation (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), IconVariant (copy), Text (copy), HeaderPopoverMenuModule (copy), BackButtonModule (copy), HeaderProgressBarModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UsePageNavigationResult = UsePageNavigationFunction()
	local Translations = UseNotApprovedPageContextFunction().translations
	local IsFirstPage = UsePageNavigationResult.isFirstPage
	local TotalPages: number = UsePageNavigationResult.totalPages
	local PunishmentTypeDescription = p1.moderationDetail.punishmentTypeDescription
	local VerificationCategory = p1.moderationDetail.verificationCategory
	local PUNISHMENTTYPETOINTERVENTION = PUNISHMENTTYPETOINTERVENTIONMAP[PunishmentTypeDescription] or INTERVENTIONTYPES.Banned
	local IsPUNISHMENTTYPETOINTERVENTIONMatch = PUNISHMENTTYPETOINTERVENTION == INTERVENTIONTYPES.Warning
	local IsPUNISHMENTTYPETOINTERVENTIONMatch1 = PUNISHMENTTYPETOINTERVENTION == INTERVENTIONTYPES.Deleted
	local IsNotVerificationCategoryMatch: boolean = VerificationCategory and VerificationCategory ~= ""
	local GenericSuspended = if IsNotVerificationCategoryMatch then Translations.genericSuspended else Translations[PunishmentTypeDescription]
	
	if not GenericSuspended or GenericSuspended == "" then
		GenericSuspended = Translations.genericSuspended
	end
	local CircleSlash1 = if IsPUNISHMENTTYPETOINTERVENTIONMatch1 then CircleSlash else TriangleExclamation
	local Warning = if IsPUNISHMENTTYPETOINTERVENTIONMatch and not IsNotVerificationCategoryMatch then UseTokensResult.Color.System.Warning else UseTokensResult.Color.System.Alert
	
	return if IsFirstPage then ReactModule.createElement(View, {
		tag = "size-full-0 auto-y row flex-between items-center gap-medium padding-xxlarge"
	}, {
		LeftContent = ReactModule.createElement(View, {
			tag = "auto-xy row gap-small items-center wrap shrink",
			LayoutOrder = 1
		}, {
			PunishmentIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = CircleSlash1,
				size = IconSize.Large,
				variant = IconVariant.Regular,
				style = Warning
			}),
			PunishmentLabel = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small content-emphasis text-wrap text-align-x-left",
				LayoutOrder = 2,
				Text = GenericSuspended
			})
		}),
		RightContent = ReactModule.createElement(View, { tag = "auto-xy shrink-0", LayoutOrder = 2 }, {
			PopoverMenu = ReactModule.createElement(HeaderPopoverMenuModule, { LogoutThunk = p1.LogoutThunk })
		})
	}) else ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-xlarge items-start padding-y-xxlarge padding-right-xxlarge"
	}, {
		BackButtonContainer = ReactModule.createElement(View, { tag = "auto-xy padding-left-medium", LayoutOrder = 1 }, { BackButton = ReactModule.createElement(BackButtonModule) }),
		ProgressBarContainer = TotalPages > 2 and ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-left-xxlarge",
			LayoutOrder = 2
		}, {
			ProgressBar = ReactModule.createElement(HeaderProgressBarModule)
		})
	})
end)