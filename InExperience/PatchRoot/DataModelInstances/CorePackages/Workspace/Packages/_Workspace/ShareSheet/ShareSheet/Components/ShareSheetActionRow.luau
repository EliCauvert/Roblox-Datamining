local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local shareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local shareSheetRowModule = require(script.Parent.ShareSheetRow)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local copyLinkModule = require(shareSheet.copyLink)
local shareLinkModule = require(shareSheet.shareLink)
local iconName = foundationModule.Enums.IconName

return function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), copyLinkModule (ref), shareSheetTelemetryModule (ref), shareLinkModule (ref), shareSheetRowModule (ref), shareSheetItemContainerModule (ref), iconName (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(nil)
	local var4 = useLocalization({
		copyLink = "Feature.SocialShare.Action.CopyLink",
		share = "Feature.SocialShare.Action.Share"
	})
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var3 (ref)
		var2(true)
		
		if var3.current then
			task.cancel(var3.current)
		end
		var3.current = task.delay(2, function()
			-- upvalues: var3 (copy), var2 (copy)
			var3.current = nil
			var2(false)
		end)
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: copyLinkModule (copy), p1 (ref), var5 (ref), shareSheetTelemetryModule (copy)
		copyLinkModule({ context = p1.context, url = p1.url })
		var5()
		shareSheetTelemetryModule.logInteraction({
			context = p1.context,
			telemetryId = p1.telemetryId or "",
			interactionType = shareSheetTelemetryModule.InteractionType.CopyLink
		})
	end, { p1.context, p1.telemetryId, p1.url, var5 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: shareLinkModule (copy), p1 (ref), shareSheetTelemetryModule (copy)
		shareLinkModule({ context = p1.context, url = p1.url })
		shareSheetTelemetryModule.logInteraction({
			context = p1.context,
			telemetryId = p1.telemetryId or "",
			interactionType = shareSheetTelemetryModule.InteractionType.NativeShare
		})
	end, { p1.context, p1.telemetryId, p1.url })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			if var3.current then
				task.cancel(var3.current)
			end
		end
	end, {})
	
	return reactModule.createElement(shareSheetRowModule, { LayoutOrder = p1.LayoutOrder }, {
		CopyLink = reactModule.createElement(shareSheetItemContainerModule, {
			LayoutOrder = 1,
			icon = if var1 then iconName.Check else iconName.ChainLink,
			label = if var1 then "Copied" else var4.copyLink,
			onActivated = var6,
			shouldAnimate = var1
		}),
		Share = if p1.canShare then reactModule.createElement(shareSheetItemContainerModule, {
			LayoutOrder = 2,
			icon = iconName.ArrowUpFromLandscapeRectangle,
			label = var4.share,
			onActivated = var7
		}) else nil
	})
end