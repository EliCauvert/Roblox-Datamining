local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local _ = require(corePackagesService.Workspace.Packages.SharedFlags)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local getFFlagEnableConnectDisconnectInSettingsAndChromeModule = require(robloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local fIntVoiceChatTooltipDelayModule = require(robloxGui.Modules.Flags.FIntVoiceChatTooltipDelay)
local constantsModule = require(robloxGui.Modules.TopBar.Constants)
local topBarHeight = constantsModule.TopBarHeight

return function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), guiService (ref), fIntVoiceChatTooltipDelayModule (ref), utilityModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), topBarHeight (ref), constantsModule (ref), roactModule (ref), styledTextLabel (ref), coreGuiService (ref), tooltipOrientation (ref), withTooltip (ref)
	local var11 = useStyle()
	local var12 = reactModule.useRef(nil)
	local onClose = p0.onClose
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var12 (ref), guiService (copy), onClose (ref), fIntVoiceChatTooltipDelayModule (copy)
		if p0.showPrompt then
			var12.current = guiService.MenuOpened:Connect(function()
				-- upvalues: var12 (copy), onClose (copy)
				if var12.current then
					var12.current:Disconnect()
					var12.current = nil
					onClose()
				end
			end)
			task.delay(fIntVoiceChatTooltipDelayModule, function()
				-- upvalues: var12 (copy), p0 (copy), onClose (copy)
				if var12.current then
					var12.current:Disconnect()
					var12.current = nil
				end
				if p0.showPrompt then
					onClose()
				end
			end)
		end
		return function()
			-- upvalues: var12 (copy)
			if var12.current then
				var12.current:Disconnect()
				var12.current = nil
			end
		end
	end, { p0.showPrompt })
	local _ = 38
	local var13 = if utilityModule:IsSmallTouchScreen() then 64 else 64
	
	if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		local _ = topBarHeight
	end
	local var14 = constantsModule.useDisplayScaleState(topBarHeight)
	
	return withTooltip({
		minContentWidth = 240,
		headerText = p0.titleText,
		renderCustomComponents = function(_)
			-- upvalues: roactModule (copy), styledTextLabel (copy), p0 (ref), var11 (ref)
			return roactModule.createElement(styledTextLabel, {
				layoutOrder = 0,
				text = p0.subtitleText,
				textTruncate = Enum.TextTruncate.None,
				textXAlignment = Enum.TextXAlignment.Left,
				fontStyle = var11.Font.CaptionSmall,
				colorStyle = var11.Theme.TextDefault,
				automaticSize = Enum.AutomaticSize.XY
			})
		end,
		onClose = onClose,
		backgroundColor = var11.Theme.BackgroundUIDefault.Color,
		backgroundTransparency = var11.Theme.BackgroundUIDefault.Transparency
	}, {
		DisplayOrder = 10,
		guiTarget = coreGuiService,
		active = p0.showPrompt,
		preferredOrientation = tooltipOrientation.Bottom
	}, function(p1)
		-- upvalues: roactModule (copy), var13 (ref), var14 (write), reactModule (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var13, 0, var14),
			[reactModule.Change.AbsoluteSize] = p1,
			[reactModule.Change.AbsolutePosition] = p1
		})
	end)
end