local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local useCursor = foundationModule.Hooks.useCursor
local reactModule = require(parent.React)
local useState = reactModule.useState
local memo = reactModule.memo
local useMemo = reactModule.useMemo
local UIBloxModule = require(parent.UIBlox)
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local var5 = memo(UIBloxModule.Core.Control.Interactable)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local _ = require(appChat.types)
local t = {
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
	onActivated = function() --[[ line: 51 ]]
		print("BaseCell onActivated")
	end,
	dividerColor3 = Color3.fromRGB(227, 227, 227)
}

return memo(function(p0) --[[ line: 61 | named "BaseCell" ]]
	-- upvalues: cryoModule (ref), t (ref), useState (ref), controlState (ref), reactModule (ref), useMemo (ref), useCursor (ref), foundationModule (ref), var5 (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref)
	local var8 = cryoModule.Dictionary.join(t, p0)
	local var9, var10 = useState(controlState.Initialize)
	local var11 = reactModule.useCallback(function(_, p1) --[[ line: 65 ]]
		-- upvalues: var8 (ref), var10 (ref)
		if not var8.isDisabled then
			var10(p1)
		end
	end, { var8.isDisabled })
	local var12 = reactModule.useCallback(function() --[[ line: 71 ]]
		-- upvalues: var8 (ref)
		if not var8.isDisabled then
			var8.onActivated()
		end
	end, { var8.isDisabled, var8.onActivated })
	local var13 = useMemo(function() --[[ line: 77 ]]
		-- upvalues: var9 (ref), controlState (copy), reactModule (copy), var8 (ref)
		return if var9 == controlState.Pressed then reactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = var8.onPressedBackgroundTransparency,
			BackgroundColor3 = var8.onPressedBackground3
		}) else nil
	end, {
		var9,
		var8.onPressedBackground3,
		var8.onPressedBackgroundTransparency
	})
	local var14 = useMemo(function() --[[ line: 87 ]]
		-- upvalues: var8 (ref), reactModule (copy)
		return if var8.showDivider then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			divider = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = var8.dividerTransparency,
				BackgroundColor3 = var8.dividerColor3,
				Size = UDim2.new(1, -var8.avatarCircleCellWidth, 0, 1)
			})
		}) else nil
	end, {
		var8.showDivider,
		var8.dividerTransparency,
		var8.dividerColor3,
		var8.avatarCircleCellWidth
	})
	
	return reactModule.createElement(var5, {
		onStateChanged = var11,
		[reactModule.Event.Activated] = var12,
		[reactModule.Tag] = if fFlagDebugAppChatEnableDomLocatorsModule and var8.testId ~= nil then `data-testid={var8.testId}` else nil,
		AutoButtonColor = false,
		Selectable = var8.Selectable,
		SelectionImageObject = useCursor(foundationModule.Enums.CursorType.RoundedSlot),
		Size = var8.Size,
		AutomaticSize = var8.AutomaticSize,
		BackgroundColor3 = var8.BackgroundColor3,
		BackgroundTransparency = var8.BackgroundTransparency,
		LayoutOrder = var8.LayoutOrder,
		BorderSizePixel = 0
	}, useMemo(function() --[[ line: 113 ]]
		-- upvalues: cryoModule (copy), var8 (ref), var13 (ref), var14 (ref)
		return cryoModule.Dictionary.join(var8.children or {}, { overlay = var13, divider = var14 })
	end, { var8.children, var13, var14 }))
end)