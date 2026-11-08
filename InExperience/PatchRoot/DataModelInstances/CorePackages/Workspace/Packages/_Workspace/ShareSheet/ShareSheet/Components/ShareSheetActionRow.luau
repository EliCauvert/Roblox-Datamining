local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ShareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local _ = require(ShareSheet.Recipients.RecipientSource)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)
local CopyLinkModule = require(ShareSheet.copyLink)
local ShareLinkModule = require(ShareSheet.shareLink)
local IconName = FoundationModule.Enums.IconName
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), CopyLinkModule (copy), ShareSheetTelemetryModule (copy), ShareLinkModule (copy), ShareSheetItemContainerModule (copy), IconName (copy), View (copy)
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
		-- upvalues: CopyLinkModule (upval), p1 (copy), UseResult (copy), ShareSheetTelemetryModule (upval)
		CopyLinkModule({ context = p1.context, url = p1.url })
		UseResult()
		ShareSheetTelemetryModule.logInteraction({
			context = p1.context,
			recipientSource = p1.recipientSource,
			telemetryId = p1.telemetryId or "",
			interactionType = ShareSheetTelemetryModule.InteractionType.CopyLink
		})
	end, {
		p1.context,
		p1.recipientSource,
		p1.telemetryId,
		p1.url,
		UseResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: ShareLinkModule (upval), p1 (copy), ShareSheetTelemetryModule (upval)
		ShareLinkModule({ context = p1.context, url = p1.url })
		ShareSheetTelemetryModule.logInteraction({
			context = p1.context,
			recipientSource = p1.recipientSource,
			telemetryId = p1.telemetryId or "",
			interactionType = ShareSheetTelemetryModule.InteractionType.NativeShare
		})
	end, { p1.context, p1.recipientSource, p1.telemetryId, p1.url })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
			end
		end
	end, {})
	
	return ReactModule.createElement(View, { tag = "row gap-medium size-full-0 auto-y" }, {
		CopyLink = ReactModule.createElement(ShareSheetItemContainerModule, {
			LayoutOrder = 1,
			icon = if UseStateResult then IconName.Check else IconName.ChainLink,
			label = if UseStateResult then UseLocalizationResult.copied else UseLocalizationResult.copyLink,
			onActivated = UseResult1,
			shouldAnimate = UseStateResult
		}),
		Share = if p1.canShare then ReactModule.createElement(ShareSheetItemContainerModule, {
			LayoutOrder = 2,
			icon = IconName.ArrowUpFromLandscapeRectangle,
			label = UseLocalizationResult.share,
			onActivated = UseResult2
		}) else nil
	})
end