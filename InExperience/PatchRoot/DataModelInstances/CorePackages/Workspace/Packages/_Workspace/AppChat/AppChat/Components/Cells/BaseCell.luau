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
local var1 = memo(UIBloxModule.Core.Control.Interactable)
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
	onActivated = function()
		print("BaseCell onActivated")
	end,
	dividerColor3 = Color3.fromRGB(227, 227, 227)
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useState (ref), controlState (ref), reactModule (ref), useMemo (ref), useCursor (ref), foundationModule (ref), var1 (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local var3, var4 = useState(controlState.Initialize)
	local var5 = reactModule.useCallback(function(_, p2)
		-- upvalues: var2 (ref), var4 (ref)
		if not var2.isDisabled then
			var4(p2)
		end
	end, { var2.isDisabled })
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		if not var2.isDisabled then
			var2.onActivated()
		end
	end, { var2.isDisabled, var2.onActivated })
	local var7 = useMemo(function()
		-- upvalues: var3 (ref), controlState (copy), reactModule (copy), var2 (ref)
		return if var3 == controlState.Pressed then reactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = var2.onPressedBackgroundTransparency,
			BackgroundColor3 = var2.onPressedBackground3
		}) else nil
	end, {
		var3,
		var2.onPressedBackground3,
		var2.onPressedBackgroundTransparency
	})
	local var8 = useMemo(function()
		-- upvalues: var2 (ref), reactModule (copy)
		return if var2.showDivider then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			divider = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = var2.dividerTransparency,
				BackgroundColor3 = var2.dividerColor3,
				Size = UDim2.new(1, -var2.avatarCircleCellWidth, 0, 1)
			})
		}) else nil
	end, {
		var2.showDivider,
		var2.dividerTransparency,
		var2.dividerColor3,
		var2.avatarCircleCellWidth
	})
	
	return reactModule.createElement(var1, {
		onStateChanged = var5,
		[reactModule.Event.Activated] = var6,
		[reactModule.Tag] = if fFlagDebugAppChatEnableDomLocatorsModule and var2.testId ~= nil then `data-testid={var2.testId}` else nil,
		AutoButtonColor = false,
		Selectable = var2.Selectable,
		SelectionImageObject = useCursor(foundationModule.Enums.CursorType.RoundedSlot),
		Size = var2.Size,
		AutomaticSize = var2.AutomaticSize,
		BackgroundColor3 = var2.BackgroundColor3,
		BackgroundTransparency = var2.BackgroundTransparency,
		LayoutOrder = var2.LayoutOrder,
		BorderSizePixel = 0
	}, useMemo(function()
		-- upvalues: cryoModule (copy), var2 (ref), var7 (ref), var8 (ref)
		return cryoModule.Dictionary.join(var2.children or {}, { overlay = var7, divider = var8 })
	end, { var2.children, var7, var8 }))
end)