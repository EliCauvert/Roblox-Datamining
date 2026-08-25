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

return function(p0)
	-- upvalues: useLocalization (ref), t_1 (ref), currentCamera (ref), constantsModule (ref), reactModule (ref), contextualMenu (ref), images (ref), fFlagChatLineReportingFocusFixesEnabled (ref), guiService (ref), chatLineReportRootModule (ref), getFFlagMemoizeChatReportingMenu (ref), menuDirection (ref), t (ref)
	local var10 = useLocalization(t_1)
	local var11 = if currentCamera then currentCamera.ViewportSize else Vector2.new(constantsModule.ViewportSize, constantsModule.ViewportSize)
	local var12 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var11 (ref), constantsModule (copy)
		if var12.current and var11.X < var12.current.AbsolutePosition.X + var12.current.AbsoluteSize.X then
			var12.current.AnchorPoint = Vector2.new(1, 0)
			var12.current.Position = UDim2.new(1, constantsModule.FramePositionXOffsetLeft, 0, constantsModule.FramePositionYOffset)
		end
	end, { var12, var11 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(constantsModule.FrameSizeXScale, constantsModule.FrameSizeXOffset, 1, 0),
		Position = UDim2.new(1, constantsModule.FramePositionXOffset, 0, constantsModule.FramePositionYOffset),
		ref = var12
	}, {
		ContextualMenu = reactModule.createElement(contextualMenu, {
			closeBackgroundVisible = false,
			open = true,
			buttonProps = {
				{
					icon = images["icons/actions/feedback"],
					text = var10.reportAbuse,
					onActivated = function()
						-- upvalues: fFlagChatLineReportingFocusFixesEnabled (copy), guiService (copy), chatLineReportRootModule (copy), getFFlagMemoizeChatReportingMenu (copy), p0 (ref)
						if fFlagChatLineReportingFocusFixesEnabled and guiService.MenuIsOpen then
							local menuClosedConnection = nil
							menuClosedConnection = guiService.MenuClosed:Connect(function()
								-- upvalues: chatLineReportRootModule (copy), getFFlagMemoizeChatReportingMenu (copy), p0 (copy), menuClosedConnection (write)
								chatLineReportRootModule.initialize(if getFFlagMemoizeChatReportingMenu() then p0.getMessages() else p0.messages)
								menuClosedConnection:Disconnect()
							end)
						else
							chatLineReportRootModule.initialize(if getFFlagMemoizeChatReportingMenu() then p0.getMessages() else p0.messages)
						end
						p0.setContextMenuOpen(false)
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
				Transparency = p0.backgroundTransparency,
				Color = p0.backgroundColor3
			},
			screenSize = var11,
			onDismiss = function()
				-- upvalues: p0 (ref)
				p0.setContextMenuOpen(false)
			end
		})
	})
end