local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local UseCursorFunction = FoundationModule.Hooks.useCursor
local ReactModule = require(Parent.React)
local UseStateFunction = ReactModule.useState
local MemoFunction = ReactModule.memo
local UseMemoFunction = ReactModule.useMemo
local UIBloxModule = require(Parent.UIBlox)
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local MemoResult = MemoFunction(UIBloxModule.Core.Control.Interactable)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local _ = require(AppChat.types)
local config = {
	BackgroundTransparency = 0,
	onPressedBackgroundTransparency = 1,
	LayoutOrder = 0,
	isDisabled = false,
	showDivider = true,
	dividerTransparency = 0,
	avatarCircleCellWidth = 60,
	Size = UDim2.new(1, 0, 0, 48),
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	onPressedBackgroundColor3 = Color3.fromRGB(242, 242, 242),
	onActivated = function() --[[ Line: 51 ]]
		print("BaseCell onActivated")
	end,
	dividerColor3 = Color3.fromRGB(227, 227, 227)
}

return MemoFunction(function(p1) --[[ Line: 61 | Named "BaseCell" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStateFunction (copy), ControlState (copy), ReactModule (copy), UseMemoFunction (copy), UseCursorFunction (copy), FoundationModule (copy), MemoResult (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStateResult, UseStateResult2 = UseStateFunction(ControlState.Initialize)
	local UseResult = ReactModule.useCallback(function(_, p2) --[[ Line: 65 ]]
		-- upvalues: JoinResult (copy), UseStateResult2 (copy)
		if not JoinResult.isDisabled then
			UseStateResult2(p2)
		end
	end, { JoinResult.isDisabled })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 71 ]]
		-- upvalues: JoinResult (copy)
		if not JoinResult.isDisabled then
			JoinResult.onActivated()
		end
	end, { JoinResult.isDisabled, JoinResult.onActivated })
	local UseMemoResult = UseMemoFunction(function() --[[ Line: 77 ]]
		-- upvalues: UseStateResult (copy), ControlState (upval), ReactModule (upval), JoinResult (copy)
		return if UseStateResult == ControlState.Pressed then ReactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = JoinResult.onPressedBackgroundTransparency,
			BackgroundColor3 = JoinResult.onPressedBackground3
		}) else nil
	end, {
		UseStateResult,
		JoinResult.onPressedBackground3,
		JoinResult.onPressedBackgroundTransparency
	})
	local UseMemoResult1 = UseMemoFunction(function() --[[ Line: 87 ]]
		-- upvalues: JoinResult (copy), ReactModule (upval)
		return if JoinResult.showDivider then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			layout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			divider = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = JoinResult.dividerTransparency,
				BackgroundColor3 = JoinResult.dividerColor3,
				Size = UDim2.new(1, -JoinResult.avatarCircleCellWidth, 0, 1)
			})
		}) else nil
	end, {
		JoinResult.showDivider,
		JoinResult.dividerTransparency,
		JoinResult.dividerColor3,
		JoinResult.avatarCircleCellWidth
	})
	
	return ReactModule.createElement(MemoResult, {
		onStateChanged = UseResult,
		[ReactModule.Event.Activated] = UseResult1,
		[ReactModule.Tag] = if FFlagDebugAppChatEnableDomLocatorsModule and JoinResult.testId ~= nil then `data-testid={JoinResult.testId}` else nil,
		AutoButtonColor = false,
		Selectable = JoinResult.Selectable,
		SelectionImageObject = UseCursorFunction(FoundationModule.Enums.CursorType.RoundedSlot),
		Size = JoinResult.Size,
		AutomaticSize = JoinResult.AutomaticSize,
		BackgroundColor3 = JoinResult.BackgroundColor3,
		BackgroundTransparency = JoinResult.BackgroundTransparency,
		LayoutOrder = JoinResult.LayoutOrder,
		BorderSizePixel = 0
	}, (UseMemoFunction(function() --[[ Line: 113 ]]
		-- upvalues: CryoModule (upval), JoinResult (copy), UseMemoResult (copy), UseMemoResult1 (copy)
		return CryoModule.Dictionary.join(JoinResult.children or {}, { overlay = UseMemoResult, divider = UseMemoResult1 })
	end, { JoinResult.children, UseMemoResult, UseMemoResult1 })))
end)