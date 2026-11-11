local UserInputService = game:GetService("UserInputService")
local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAmpV2WizardCodeInputAspectRatioModule = require(AmpV2Wizard.FFlagAmpV2WizardCodeInputAspectRatio)

local function noop(_) end

return function(Frame)
	-- upvalues: noop (copy), UseTokensFunction (copy), ReactModule (copy), FFlagAmpV2WizardCodeInputAspectRatioModule (copy), UserInputService (copy), View (copy), Text (copy)
	local Value: string = Frame.value
	local OnChangedFunction = Frame.onChanged
	local OnComplete = Frame.onComplete or noop
	local IsMasked = Frame.isMasked
	local Length = Frame.length or 6
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef("")
	local v1 = nil
	local UseResult = nil
	
	if FFlagAmpV2WizardCodeInputAspectRatioModule then
		local UseBindingResult2 = nil
		v1, UseBindingResult2 = ReactModule.useBinding(64)
		UseResult = ReactModule.useCallback(function(Frame)
			-- upvalues: UseBindingResult2 (ref)
			UseBindingResult2((math.round(Frame.AbsoluteSize.X * 1.3333333333333333)))
		end, {})
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UserInputService (upval)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		if not UserInputService.OnScreenKeyboardVisible or UserInputService:GetFocusedTextBox() ~= Current then
			Current:ReleaseFocus()
			task.defer(function()
				-- upvalues: UseRefResult (upval)
				local Current = UseRefResult.current
				
				if Current ~= nil then
					Current:CaptureFocus()
				end
			end)
			
			return
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current:ReleaseFocus()
		end
	end, {})
	ReactModule.useImperativeHandle(Frame.controlRef, function()
		-- upvalues: UseResult1 (copy), UseResult2 (copy)
		return { focus = UseResult1, releaseFocus = UseResult2 }
	end, { UseResult1, UseResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy)
		UseResult1()
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function(TextBox)
		-- upvalues: Length (copy), UseRefResult1 (copy), OnChangedFunction (copy), OnComplete (copy)
		local D = TextBox.Text:gsub("%D", "")
		
		if Length < #D then
			D = D:sub(1, Length)
		end
		if TextBox.Text ~= D then
			TextBox.Text = D
		end
		if D == UseRefResult1.current then return end
		UseRefResult1.current = D
		OnChangedFunction(D)
		
		if #D == Length then
			TextBox:ReleaseFocus()
			OnComplete(D)
		end
	end, { OnChangedFunction, OnComplete, Length })
	local t = {}
	
	for i = 1, Length do
		local Segment = Value:sub(i, i)
		local IsNotSegmentMatch = Segment ~= ""
		local IsIMatch: boolean = UseStateResult and i == #Value + 1
		local Text1: string = `Box_{i}`
		local CreateElementFunction = ReactModule.createElement
		local config = {
			tag = "col align-x-center align-y-center gap-small size-0-full padding-small radius-medium bg-shift-200",
			testId = "code-input-box",
			flexItem = { FlexMode = Enum.UIFlexMode.Fill },
			onAbsoluteSizeChanged = if FFlagAmpV2WizardCodeInputAspectRatioModule and i == 1 then UseResult else nil
		}
		config.LayoutOrder = i
		config.onActivated = UseResult1
		config.stroke = if IsIMatch then {
			Color = UseTokensResult.Color.System.Emphasis.Color3,
			Transparency = UseTokensResult.Color.System.Emphasis.Transparency,
			Thickness = UseTokensResult.Stroke.Thick
		} else nil
		t[Text1] = CreateElementFunction(View, config, {
			Digit = if IsNotSegmentMatch and not IsMasked then ReactModule.createElement(Text, {
				tag = "auto-xy text-title-large content-emphasis",
				Text = Segment
			}) else nil,
			Dot = if IsNotSegmentMatch and IsMasked then ReactModule.createElement(View, {
				tag = "radius-circle",
				Size = UDim2.fromOffset(8, 8),
				backgroundStyle = UseTokensResult.Color.Content.Emphasis
			}) else nil
		})
	end
	return ReactModule.createElement(View, {
		tag = "size-full-0",
		Size = if FFlagAmpV2WizardCodeInputAspectRatioModule and v1 ~= nil then v1:map(function(YOffset): UDim2
			return UDim2.new(1, 0, 0, YOffset)
		end) else UDim2.new(1, 0, 0, 64),
		LayoutOrder = Frame.LayoutOrder
	}, {
		Boxes = ReactModule.createElement(View, { tag = "row gap-medium size-full" }, t),
		HiddenInput = ReactModule.createElement("TextBox", {
			Size = UDim2.fromOffset(1, 1),
			BackgroundTransparency = 1,
			TextTransparency = 1,
			TextSize = 1,
			Text = Value,
			ClearTextOnFocus = false,
			ManualFocusRelease = true,
			OverlayNativeInput = true,
			TextInputType = Enum.TextInputType.Number,
			ref = UseRefResult,
			[ReactModule.Change.Text] = UseResult3,
			[ReactModule.Event.Focused] = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(true)
			end,
			[ReactModule.Event.FocusLost] = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		})
	})
end