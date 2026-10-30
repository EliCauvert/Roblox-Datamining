local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ShareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local ShareSheetRowModule = require(script.Parent.ShareSheetRow)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local _ = require(ShareSheet.Recipients.RecipientSource)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)
local CopyLinkModule = require(ShareSheet.copyLink)
local ShareLinkModule = require(ShareSheet.shareLink)
local IconName = FoundationModule.Enums.IconName
local View = FoundationModule.View
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), CopyLinkModule (copy), ShareSheetTelemetryModule (copy), FFlagShareSheetFriendsSort (copy), ShareLinkModule (copy), ShareSheetItemContainerModule (copy), IconName (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), View (copy), ShareSheetRowModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		copied = "Feature.UniversalShareSheet.Action.CopiedLink",
		copyLink = "Feature.SocialShare.Action.CopyLink",
		share = "Feature.SocialShare.Action.Share"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseRefResult (copy)
		UseStateResult2(true)
		
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(2, function()
			-- upvalues: UseRefResult (upval), UseStateResult2 (upval)
			UseRefResult.current = nil
			UseStateResult2(false)
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: CopyLinkModule (upval), Frame (copy), UseResult (copy), ShareSheetTelemetryModule (upval), FFlagShareSheetFriendsSort (upval)
		CopyLinkModule({ context = Frame.context, url = Frame.url })
		UseResult()
		ShareSheetTelemetryModule.logInteraction({
			context = Frame.context,
			recipientSource = if FFlagShareSheetFriendsSort then Frame.recipientSource else nil,
			telemetryId = Frame.telemetryId or "",
			interactionType = ShareSheetTelemetryModule.InteractionType.CopyLink
		})
	end, {
		Frame.context,
		Frame.recipientSource,
		Frame.telemetryId,
		Frame.url,
		UseResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: ShareLinkModule (upval), Frame (copy), ShareSheetTelemetryModule (upval), FFlagShareSheetFriendsSort (upval)
		ShareLinkModule({ context = Frame.context, url = Frame.url })
		ShareSheetTelemetryModule.logInteraction({
			context = Frame.context,
			recipientSource = if FFlagShareSheetFriendsSort then Frame.recipientSource else nil,
			telemetryId = Frame.telemetryId or "",
			interactionType = ShareSheetTelemetryModule.InteractionType.NativeShare
		})
	end, {
		Frame.context,
		Frame.recipientSource,
		Frame.telemetryId,
		Frame.url
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
			end
		end
	end, {})
	local config = {
		CopyLink = ReactModule.createElement(ShareSheetItemContainerModule, {
			LayoutOrder = 1,
			icon = if UseStateResult then IconName.Check else IconName.ChainLink,
			label = if UseStateResult then UseLocalizationResult.copied else UseLocalizationResult.copyLink,
			onActivated = UseResult1,
			shouldAnimate = UseStateResult
		}),
		Share = if Frame.canShare then ReactModule.createElement(ShareSheetItemContainerModule, {
			LayoutOrder = 2,
			icon = IconName.ArrowUpFromLandscapeRectangle,
			label = UseLocalizationResult.share,
			onActivated = UseResult2
		}) else nil
	}
	
	return if FFlagShareSheetPeoplePickerEnabledModule then ReactModule.createElement(View, {
		tag = "row gap-medium size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, config) else ReactModule.createElement(ShareSheetRowModule, { LayoutOrder = Frame.LayoutOrder }, config)
end