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

return function(p0) --[[ line: 27 | named "ShareSheetActionRow" ]]
	-- upvalues: reactModule (ref), useLocalization (ref), copyLinkModule (ref), shareSheetTelemetryModule (ref), shareLinkModule (ref), shareSheetRowModule (ref), shareSheetItemContainerModule (ref), iconName (ref)
	local var8, var9 = reactModule.useState(false)
	local var10 = reactModule.useRef(nil)
	local var11 = useLocalization({
		copyLink = "Feature.SocialShare.Action.CopyLink",
		share = "Feature.SocialShare.Action.Share"
	})
	local var12 = reactModule.useCallback(function() --[[ line: 34 ]]
		-- upvalues: copyLinkModule (copy), p0 (ref), var9 (ref), var10 (ref), shareSheetTelemetryModule (copy)
		copyLinkModule({ context = p0.context, url = p0.url })
		var9(true)
		
		if var10.current then
			task.cancel(var10.current)
		end
		var10.current = task.delay(2, function() --[[ line: 43 ]]
			-- upvalues: var10 (copy), var9 (copy)
			var10.current = nil
			var9(false)
		end)
		shareSheetTelemetryModule.logShareSheetLinkCopied({
			context = p0.context,
			url = p0.url,
			telemetryId = p0.telemetryId or ""
		})
	end, { p0.context, p0.url, p0.telemetryId })
	local var13 = reactModule.useCallback(function() --[[ line: 54 ]]
		-- upvalues: shareLinkModule (copy), p0 (ref)
		shareLinkModule({ context = p0.context, url = p0.url })
	end, { p0.context, p0.url })
	reactModule.useEffect(function() --[[ line: 60 ]]
		-- upvalues: var10 (ref)
		return function() --[[ line: 61 ]]
			-- upvalues: var10 (copy)
			if var10.current then
				task.cancel(var10.current)
			end
		end
	end, {})
	
	return reactModule.createElement(shareSheetRowModule, { LayoutOrder = p0.LayoutOrder }, {
		CopyLink = reactModule.createElement(shareSheetItemContainerModule, {
			LayoutOrder = 1,
			icon = if var8 then iconName.Check else iconName.ChainLink,
			label = if var8 then "Copied" else var11.copyLink,
			onActivated = var12,
			shouldAnimate = var8
		}),
		Share = if p0.canShare then reactModule.createElement(shareSheetItemContainerModule, {
			LayoutOrder = 2,
			icon = iconName.ArrowUpFromLandscapeRectangle,
			label = var11.share,
			onActivated = var13
		}) else nil
	})
end