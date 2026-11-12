local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ShareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local ShareSheetRowModule = require(script.Parent.ShareSheetRow)
local _ = require(script.Parent.getShareSheetRowLayout)
local FFlagShareSheetDesktopReadinessModule = require(ShareSheet.Flags.FFlagShareSheetDesktopReadiness)
local _ = require(ShareSheet.Recipients.RecipientSource)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)
local CopyLinkModule = require(ShareSheet.copyLink)
local ShareLinkModule = require(ShareSheet.shareLink)
local IconName = FoundationModule.Enums.IconName
local View = FoundationModule.View

return function(Frame)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), CopyLinkModule (copy), ShareSheetTelemetryModule (copy), ShareLinkModule (copy), FFlagShareSheetDesktopReadinessModule (copy), CreateNextOrderFunction (copy), ShareSheetItemContainerModule (copy), IconName (copy), ShareSheetRowModule (copy), View (copy)
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
		-- upvalues: CopyLinkModule (upval), Frame (copy), UseResult (copy), ShareSheetTelemetryModule (upval)
		CopyLinkModule({ context = Frame.context, url = Frame.url })
		UseResult()
		ShareSheetTelemetryModule.logInteraction({
			context = Frame.context,
			recipientSource = Frame.recipientSource,
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
		-- upvalues: ShareLinkModule (upval), Frame (copy), ShareSheetTelemetryModule (upval)
		ShareLinkModule({ context = Frame.context, url = Frame.url })
		ShareSheetTelemetryModule.logInteraction({
			context = Frame.context,
			recipientSource = Frame.recipientSource,
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
	local NextOrder = if FFlagShareSheetDesktopReadinessModule then CreateNextOrderFunction() else nil
	local NextOrderResult = if FFlagShareSheetDesktopReadinessModule then NextOrder() else nil
	local NextOrderResult1 = if FFlagShareSheetDesktopReadinessModule then NextOrder() else nil
	local config = {
		CopyLink = ReactModule.createElement(ShareSheetItemContainerModule, {
			icon = if UseStateResult then IconName.Check else IconName.ChainLink,
			label = if UseStateResult then UseLocalizationResult.copied else UseLocalizationResult.copyLink,
			onActivated = UseResult1,
			shouldAnimate = UseStateResult,
			width = if FFlagShareSheetDesktopReadinessModule then Frame.rowLayout.getTileWidth(NextOrderResult) else nil,
			LayoutOrder = if FFlagShareSheetDesktopReadinessModule then NextOrderResult else 1
		}),
		Share = if Frame.canShare then ReactModule.createElement(ShareSheetItemContainerModule, {
			icon = IconName.ArrowUpFromLandscapeRectangle,
			label = UseLocalizationResult.share,
			onActivated = UseResult2,
			width = if FFlagShareSheetDesktopReadinessModule then Frame.rowLayout.getTileWidth(NextOrderResult1) else nil,
			LayoutOrder = if FFlagShareSheetDesktopReadinessModule then NextOrderResult1 else 2
		}) else nil
	}
	
	return if FFlagShareSheetDesktopReadinessModule then ReactModule.createElement(ShareSheetRowModule, {
		isScrollingEnabled = false,
		LayoutOrder = Frame.LayoutOrder,
		margin = Frame.rowLayout.margin,
		gap = Frame.rowLayout.gap
	}, config) else ReactModule.createElement(View, { tag = "row gap-medium size-full-0 auto-y" }, config)
end