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

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), guiService (ref), fIntVoiceChatTooltipDelayModule (ref), utilityModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), topBarHeight (ref), constantsModule (ref), roactModule (ref), styledTextLabel (ref), coreGuiService (ref), tooltipOrientation (ref), withTooltip (ref)
	local var1 = useStyle()
	local var2 = reactModule.useRef(nil)
	local onClose = p1.onClose
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), guiService (copy), onClose (ref), fIntVoiceChatTooltipDelayModule (copy)
		if p1.showPrompt then
			var2.current = guiService.MenuOpened:Connect(function()
				-- upvalues: var2 (copy), onClose (copy)
				if var2.current then
					var2.current:Disconnect()
					var2.current = nil
					onClose()
				end
			end)
			task.delay(fIntVoiceChatTooltipDelayModule, function()
				-- upvalues: var2 (copy), p1 (copy), onClose (copy)
				if var2.current then
					var2.current:Disconnect()
					var2.current = nil
				end
				if p1.showPrompt then
					onClose()
				end
			end)
		end
		return function()
			-- upvalues: var2 (copy)
			if var2.current then
				var2.current:Disconnect()
				var2.current = nil
			end
		end
	end, { p1.showPrompt })
	local _ = 38
	local var3 = if utilityModule:IsSmallTouchScreen() then 64 else 64
	
	if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		local _ = topBarHeight
	end
	local var4 = constantsModule.useDisplayScaleState(topBarHeight)
	
	return withTooltip({
		minContentWidth = 240,
		headerText = p1.titleText,
		renderCustomComponents = function(_)
			-- upvalues: roactModule (copy), styledTextLabel (copy), p1 (ref), var1 (ref)
			return roactModule.createElement(styledTextLabel, {
				layoutOrder = 0,
				text = p1.subtitleText,
				textTruncate = Enum.TextTruncate.None,
				textXAlignment = Enum.TextXAlignment.Left,
				fontStyle = var1.Font.CaptionSmall,
				colorStyle = var1.Theme.TextDefault,
				automaticSize = Enum.AutomaticSize.XY
			})
		end,
		onClose = onClose,
		backgroundColor = var1.Theme.BackgroundUIDefault.Color,
		backgroundTransparency = var1.Theme.BackgroundUIDefault.Transparency
	}, {
		DisplayOrder = 10,
		guiTarget = coreGuiService,
		active = p1.showPrompt,
		preferredOrientation = tooltipOrientation.Bottom
	}, function(p2)
		-- upvalues: roactModule (copy), var3 (ref), var4 (write), reactModule (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var3, 0, var4),
			[reactModule.Change.AbsoluteSize] = p2,
			[reactModule.Change.AbsolutePosition] = p2
		})
	end)
end