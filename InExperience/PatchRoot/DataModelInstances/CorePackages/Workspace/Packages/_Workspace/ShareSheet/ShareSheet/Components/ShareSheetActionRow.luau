local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagShareSheetTelemetryRefactorModule = require(shareSheet.Flags.FFlagShareSheetTelemetryRefactor)
local shareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local shareSheetRowModule = require(script.Parent.ShareSheetRow)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local copyLinkModule = require(shareSheet.copyLink)
local shareLinkModule = require(shareSheet.shareLink)
local iconName = foundationModule.Enums.IconName

return function(p0)
	-- upvalues: reactModule (ref), useLocalization (ref), copyLinkModule (ref), fFlagShareSheetTelemetryRefactorModule (ref), shareSheetTelemetryModule (ref), shareLinkModule (ref), shareSheetRowModule (ref), shareSheetItemContainerModule (ref), iconName (ref)
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useRef(nil)
	local var12 = useLocalization({
		copyLink = "Feature.SocialShare.Action.CopyLink",
		share = "Feature.SocialShare.Action.Share"
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var11 (ref)
		var10(true)
		
		if var11.current then
			task.cancel(var11.current)
		end
		var11.current = task.delay(2, function()
			-- upvalues: var11 (copy), var10 (copy)
			var11.current = nil
			var10(false)
		end)
	end, {})
	local var14 = reactModule.useCallback(function()
		-- upvalues: copyLinkModule (copy), p0 (ref), var13 (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy)
		copyLinkModule({ context = p0.context, url = p0.url })
		var13()
		
		if fFlagShareSheetTelemetryRefactorModule then
			shareSheetTelemetryModule.logInteraction({
				context = p0.context,
				telemetryId = p0.telemetryId or "",
				interactionType = shareSheetTelemetryModule.InteractionType.CopyLink
			})
			
			return
		end
		shareSheetTelemetryModule.logShareSheetLinkCopied({
			context = p0.context,
			url = p0.url,
			telemetryId = p0.telemetryId or ""
		})
	end, { p0.context, p0.telemetryId, p0.url, var13 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: shareLinkModule (copy), p0 (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy)
		shareLinkModule({ context = p0.context, url = p0.url })
		
		if fFlagShareSheetTelemetryRefactorModule then
			shareSheetTelemetryModule.logInteraction({
				context = p0.context,
				telemetryId = p0.telemetryId or "",
				interactionType = shareSheetTelemetryModule.InteractionType.NativeShare
			})
		end
	end, { p0.context, p0.telemetryId, p0.url })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref)
		return function()
			-- upvalues: var11 (copy)
			if var11.current then
				task.cancel(var11.current)
			end
		end
	end, {})
	
	return reactModule.createElement(shareSheetRowModule, { LayoutOrder = p0.LayoutOrder }, {
		CopyLink = reactModule.createElement(shareSheetItemContainerModule, {
			LayoutOrder = 1,
			icon = if var9 then iconName.Check else iconName.ChainLink,
			label = if var9 then "Copied" else var12.copyLink,
			onActivated = var14,
			shouldAnimate = var9
		}),
		Share = if p0.canShare then reactModule.createElement(shareSheetItemContainerModule, {
			LayoutOrder = 2,
			icon = iconName.ArrowUpFromLandscapeRectangle,
			label = var12.share,
			onActivated = var15
		}) else nil
	})
end