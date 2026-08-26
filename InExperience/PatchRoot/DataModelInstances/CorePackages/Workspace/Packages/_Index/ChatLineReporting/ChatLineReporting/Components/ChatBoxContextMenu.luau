local guiService = game:GetService("GuiService")
local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local UIBloxModule = require(parent.UIBlox)
local otterModule = require(parent.Otter)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local currentCamera = game.Workspace.CurrentCamera
local constantsModule = require(chatLineReporting.Common.Constants)
local reactModule = require(parent.React)
local images = UIBloxModule.App.ImageSet.Images
local contextualMenu = UIBloxModule.App.Menu.ContextualMenu
local menuDirection = UIBloxModule.App.Menu.MenuDirection
local chatLineReportRootModule = require(chatLineReporting.Components.ChatLineReportRoot)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagChatLineReportingFocusFixesEnabled = sharedFlagsModule.FFlagChatLineReportingFocusFixesEnabled
local getFFlagMemoizeChatReportingMenu = sharedFlagsModule.GetFFlagMemoizeChatReportingMenu
local t = {
	motorCallback = otterModule.instant,
	open = { targetValue = 1 },
	close = { targetValue = 0 }
}
local t_1 = {
	reportAbuse = "Feature.ReportAbuse.Action.EnterChatLineReporting"
}

return function(p1)
	-- upvalues: useLocalization (ref), t_1 (ref), currentCamera (ref), constantsModule (ref), reactModule (ref), contextualMenu (ref), images (ref), fFlagChatLineReportingFocusFixesEnabled (ref), guiService (ref), chatLineReportRootModule (ref), getFFlagMemoizeChatReportingMenu (ref), menuDirection (ref), t (ref)
	local var1 = useLocalization(t_1)
	local var2 = if currentCamera then currentCamera.ViewportSize else Vector2.new(constantsModule.ViewportSize, constantsModule.ViewportSize)
	local var3 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref), constantsModule (copy)
		if var3.current and var2.X < var3.current.AbsolutePosition.X + var3.current.AbsoluteSize.X then
			var3.current.AnchorPoint = Vector2.new(1, 0)
			var3.current.Position = UDim2.new(1, constantsModule.FramePositionXOffsetLeft, 0, constantsModule.FramePositionYOffset)
		end
	end, { var3, var2 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(constantsModule.FrameSizeXScale, constantsModule.FrameSizeXOffset, 1, 0),
		Position = UDim2.new(1, constantsModule.FramePositionXOffset, 0, constantsModule.FramePositionYOffset),
		ref = var3
	}, {
		ContextualMenu = reactModule.createElement(contextualMenu, {
			closeBackgroundVisible = false,
			open = true,
			buttonProps = {
				{
					icon = images["icons/actions/feedback"],
					text = var1.reportAbuse,
					onActivated = function()
						-- upvalues: fFlagChatLineReportingFocusFixesEnabled (copy), guiService (copy), chatLineReportRootModule (copy), getFFlagMemoizeChatReportingMenu (copy), p1 (ref)
						if fFlagChatLineReportingFocusFixesEnabled and guiService.MenuIsOpen then
							local menuClosedConnection = nil
							menuClosedConnection = guiService.MenuClosed:Connect(function()
								-- upvalues: chatLineReportRootModule (copy), getFFlagMemoizeChatReportingMenu (copy), p1 (copy), menuClosedConnection (write)
								chatLineReportRootModule.initialize(if getFFlagMemoizeChatReportingMenu() then p1.getMessages() else p1.messages)
								menuClosedConnection:Disconnect()
							end)
						else
							chatLineReportRootModule.initialize(if getFFlagMemoizeChatReportingMenu() then p1.getMessages() else p1.messages)
						end
						p1.setContextMenuOpen(false)
					end
				}
			},
			elementHeight = constantsModule.TopBannerSize,
			menuDirection = menuDirection.Down,
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			openPositionX = UDim.new(0, 0),
			openPositionY = UDim.new(0, 0),
			borderCornerRadius = constantsModule.ContextualMenuBorderRadius,
			motorOverrideOptions = t,
			background = {
				Transparency = p1.backgroundTransparency,
				Color = p1.backgroundColor3
			},
			screenSize = var2,
			onDismiss = function()
				-- upvalues: p1 (ref)
				p1.setContextMenuOpen(false)
			end
		})
	})
end