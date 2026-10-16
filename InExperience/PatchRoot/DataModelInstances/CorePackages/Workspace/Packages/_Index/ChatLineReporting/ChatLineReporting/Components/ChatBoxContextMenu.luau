local GuiService = game:GetService("GuiService")
local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local UIBloxModule = require(Parent.UIBlox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local CurrentCamera = game.Workspace.CurrentCamera
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local ReactModule = require(Parent.React)
local Images = UIBloxModule.App.ImageSet.Images
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local ChatLineReportRootModule = require(ChatLineReporting.Components.ChatLineReportRoot)
local GetFFlagMemoizeChatReportingMenuFunction = require(Parent.SharedFlags).GetFFlagMemoizeChatReportingMenu
local MotorOverrideOptions = {
	motorCallback = require(Parent.Otter).instant,
	open = { targetValue = 1 },
	close = { targetValue = 0 }
}
local config = {
	reportAbuse = "Feature.ReportAbuse.Action.EnterChatLineReporting"
}

return function(p1) --[[ Line: 34 ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), CurrentCamera (copy), ConstantsModule (copy), ReactModule (copy), ContextualMenu (copy), Images (copy), GuiService (copy), ChatLineReportRootModule (copy), GetFFlagMemoizeChatReportingMenuFunction (copy), MenuDirection (copy), MotorOverrideOptions (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local ViewportSize = if CurrentCamera then CurrentCamera.ViewportSize else Vector2.new(ConstantsModule.ViewportSize, ConstantsModule.ViewportSize)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 41 ]]
		-- upvalues: UseRefResult (copy), ViewportSize (copy), ConstantsModule (upval)
		if UseRefResult.current and ViewportSize.X < UseRefResult.current.AbsolutePosition.X + UseRefResult.current.AbsoluteSize.X then
			UseRefResult.current.AnchorPoint = Vector2.new(1, 0)
			UseRefResult.current.Position = UDim2.new(1, ConstantsModule.FramePositionXOffsetLeft, 0, ConstantsModule.FramePositionYOffset)
		end
	end, { UseRefResult, ViewportSize })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(ConstantsModule.FrameSizeXScale, ConstantsModule.FrameSizeXOffset, 1, 0),
		Position = UDim2.new(1, ConstantsModule.FramePositionXOffset, 0, ConstantsModule.FramePositionYOffset),
		ref = UseRefResult
	}, {
		ContextualMenu = ReactModule.createElement(ContextualMenu, {
			closeBackgroundVisible = false,
			open = true,
			buttonProps = {
				{
					icon = Images["icons/actions/feedback"],
					text = UseLocalizationResult.reportAbuse,
					onActivated = function() --[[ Line: 66 ]]
						-- upvalues: GuiService (upval), ChatLineReportRootModule (upval), GetFFlagMemoizeChatReportingMenuFunction (upval), p1 (copy)
						if GuiService.MenuIsOpen then
							local Connection = nil
							Connection = GuiService.MenuClosed:Connect(function() --[[ Line: 72 ]]
								-- upvalues: ChatLineReportRootModule (upval), GetFFlagMemoizeChatReportingMenuFunction (upval), p1 (upval), Connection (ref)
								ChatLineReportRootModule.initialize(if GetFFlagMemoizeChatReportingMenuFunction() then p1.getMessages() else p1.messages)
								Connection:Disconnect()
							end)
						else
							ChatLineReportRootModule.initialize(if GetFFlagMemoizeChatReportingMenuFunction() then p1.getMessages() else p1.messages)
						end
						p1.setContextMenuOpen(false)
					end
				}
			},
			elementHeight = ConstantsModule.TopBannerSize,
			menuDirection = MenuDirection.Down,
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			openPositionX = UDim.new(0, 0),
			openPositionY = UDim.new(0, 0),
			borderCornerRadius = ConstantsModule.ContextualMenuBorderRadius,
			motorOverrideOptions = MotorOverrideOptions,
			background = {
				Transparency = p1.backgroundTransparency,
				Color = p1.backgroundColor3
			},
			screenSize = ViewportSize,
			onDismiss = function() --[[ Line: 51 ]]
				-- upvalues: p1 (copy)
				p1.setContextMenuOpen(false)
			end
		})
	})
end