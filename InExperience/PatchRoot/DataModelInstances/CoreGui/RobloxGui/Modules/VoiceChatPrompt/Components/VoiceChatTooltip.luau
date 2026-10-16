local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local _ = require(CorePackages.Workspace.Packages.SharedFlags)
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local FIntVoiceChatTooltipDelayModule = require(RobloxGui.Modules.Flags.FIntVoiceChatTooltipDelay)
local ConstantsModule = require(RobloxGui.Modules.TopBar.Constants)
local TopBarHeight = ConstantsModule.TopBarHeight

return function(p1) --[[ Line: 33 | Named "VoiceChatTooltip" ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), GuiService (copy), FIntVoiceChatTooltipDelayModule (copy), UtilityModule (copy), TopBarHeight (copy), ConstantsModule (copy), RoactModule (copy), StyledTextLabel (copy), CoreGui (copy), TooltipOrientation (copy), WithTooltipFunction (copy)
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local OnCloseFunction = p1.onClose
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), GuiService (upval), OnCloseFunction (copy), FIntVoiceChatTooltipDelayModule (upval)
		if p1.showPrompt then
			UseRefResult.current = GuiService.MenuOpened:Connect(function() --[[ Line: 41 ]]
				-- upvalues: UseRefResult (upval), OnCloseFunction (upval)
				if UseRefResult.current then
					UseRefResult.current:Disconnect()
					UseRefResult.current = nil
					OnCloseFunction()
				end
			end)
			task.delay(FIntVoiceChatTooltipDelayModule, function() --[[ Line: 48 ]]
				-- upvalues: UseRefResult (upval), p1 (upval), OnCloseFunction (upval)
				if UseRefResult.current then
					UseRefResult.current:Disconnect()
					UseRefResult.current = nil
				end
				if p1.showPrompt then
					OnCloseFunction()
				end
			end)
		end
		return function() --[[ Line: 59 ]]
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
			end
		end
	end, { p1.showPrompt })
	local UseDisplayScaleStateResult = 38
	local XOffset: number = if UtilityModule:IsSmallTouchScreen() then 64 else 64
	UseDisplayScaleStateResult = TopBarHeight
	UseDisplayScaleStateResult = ConstantsModule.useDisplayScaleState(TopBarHeight)
	
	return WithTooltipFunction({
		minContentWidth = 240,
		headerText = p1.titleText,
		renderCustomComponents = function(_) --[[ Line: 78 ]]
			-- upvalues: RoactModule (upval), StyledTextLabel (upval), p1 (copy), UseStyleResult (copy)
			return RoactModule.createElement(StyledTextLabel, {
				layoutOrder = 0,
				text = p1.subtitleText,
				textTruncate = Enum.TextTruncate.None,
				textXAlignment = Enum.TextXAlignment.Left,
				fontStyle = UseStyleResult.Font.CaptionSmall,
				colorStyle = UseStyleResult.Theme.TextDefault,
				automaticSize = Enum.AutomaticSize.XY
			})
		end,
		onClose = OnCloseFunction,
		backgroundColor = UseStyleResult.Theme.BackgroundUIDefault.Color,
		backgroundTransparency = UseStyleResult.Theme.BackgroundUIDefault.Transparency
	}, {
		DisplayOrder = 10,
		guiTarget = CoreGui,
		active = p1.showPrompt,
		preferredOrientation = TooltipOrientation.Bottom
	}, function(p2) --[[ Line: 101 ]]
		-- upvalues: RoactModule (upval), XOffset (copy), UseDisplayScaleStateResult (ref), ReactModule (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, XOffset, 0, UseDisplayScaleStateResult),
			[ReactModule.Change.AbsoluteSize] = p2,
			[ReactModule.Change.AbsolutePosition] = p2
		})
	end)
end