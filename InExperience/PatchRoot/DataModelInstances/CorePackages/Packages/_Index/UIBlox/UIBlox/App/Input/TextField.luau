local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.Parent.React)
local inputLabelModule = require(parent.InputLabel)
local helperTextModule = require(parent.HelperText)
local imageSetComponentModule = require(parent_2.Core.ImageSet.ImageSetComponent)
local _ = require(parent_1.ImageSet.ImagesTypes)
local useStyleModule = require(parent_2.Core.Style.useStyle)
local useCursorModule = require(parent_2.App.SelectionCursor.useCursor)
local UIBloxConfigModule = require(parent_2.UIBloxConfig)
local t = { width = UDim.new(0, 400) }

return function(p0) --[[ line: 54 | named "TextField" ]]
	-- upvalues: useStyleModule (ref), reactModule (ref), useCursorModule (ref), t (ref), inputLabelModule (ref), imageSetComponentModule (ref), UIBloxConfigModule (ref), helperTextModule (ref)
	local tokens = useStyleModule().Tokens
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local textField = tokens.Component.TextField
	local focus = tokens.Semantic.Stroke.Focus
	local small = tokens.Semantic.Icon.Size.Small
	local input = tokens.Semantic.Stroke.Input
	local var13 = math.ceil(input) * 2
	local focus_1 = tokens.Semantic.Stroke.Focus
	local var14 = math.ceil(focus_1) * 2
	local var15 = useCursorModule(UDim.new(0, textField.Base.Field.BorderRadius), focus, focus)
	local var16 = useCursorModule(UDim.new(0.5), small / 2, focus)
	local var17 = if p0.width ~= nil then t.width else p0.width
	
	local function _() --[[ line: 80 | named "canUseTextInputType" ]]
		local ok, status = pcall(function() --[[ line: 81 ]]
			local coreGuiService = game:GetService("CoreGui")
			local _ = coreGuiService.Name
			
			return coreGuiService
		end)
		
		return ok and status ~= nil
	end
	
	local _ = function() --[[ line: 89 | named "getTextBoxWidthOffset" ]]
		-- upvalues: p0 (ref), small (ref), textField (ref)
		local var38 = 0
		
		if p0.iconLeading then
			var38 = var38 - small - textField.Base.Field.Gap * 2
		end
		if p0.iconButton then
			var38 = var38 - small - textField.Base.Field.Gap * 2
		end
		return var38
	end
	
	local function onTextChange(p1) --[[ line: 102 ]]
		-- upvalues: p0 (ref)
		if p1 == nil then
			p0.onChange("")
			
			return
		end
		p0.onChange(p1.Text)
	end
	
	local function onFocusGained() --[[ line: 110 ]]
		-- upvalues: p0 (ref), var8 (ref), var12 (ref)
		if p0.disabled and var8.current then
			var8.current:ReleaseFocus()
			
			return
		end
		var12(true)
		
		if p0.onFocusGained then
			p0.onFocusGained()
		end
	end
	
	local function onFocusLost() --[[ line: 121 ]]
		-- upvalues: var12 (ref)
		var12(false)
	end
	
	local createElement = reactModule.createElement
	local var21 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(var17, UDim.new(0, 0)),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	}
	local t_2 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, tokens.Component.InputLabel.Base.Spacing.Bottom)
		}),
		InputLabel = if p0.label then reactModule.createElement(inputLabelModule, { LayoutOrder = 1, text = p0.label, required = p0.required }) else nil
	}
	local createElement_1 = reactModule.createElement
	local var24 = "CanvasGroup"
	local t_3 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, tokens.Global.Size_600),
		GroupTransparency = if p0.disabled then 1 - textField.Disabled.Field.Opacity else 0
	}
	local t_4 = {}
	local createElement_2 = reactModule.createElement
	local var27 = "ImageButton"
	local t_5 = {
		Size = UDim2.new(1, -var13, 1, -var13),
		Position = UDim2.new(0, var13 / 2, 0, var13 / 2),
		BackgroundTransparency = 1,
		Selectable = not p0.disabled,
		Image = "",
		SelectionImageObject = var15,
		[reactModule.Event.Activated] = function() --[[ line: 159 ]]
			-- upvalues: var8 (ref)
			if var8.current then
				var8.current:CaptureFocus()
			end
		end,
		[reactModule.Event.MouseEnter] = function() --[[ line: 164 ]]
			-- upvalues: var10 (ref)
			var10(true)
		end,
		[reactModule.Event.MouseLeave] = function() --[[ line: 167 ]]
			-- upvalues: var10 (ref)
			var10(false)
		end
	}
	local t_6 = {
		Corner = reactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, textField.Base.Field.BorderRadius)
		}),
		Border = reactModule.createElement("UIStroke", {
			Color = if p0.error then textField.Error.Field.BorderColor.Color3 else textField.Base.Field.BorderColor.Color3,
			Transparency = if p0.error then textField.Error.Field.BorderColor.Transparency elseif var11 then 0 else textField.Base.Field.BorderColor.Transparency,
			Thickness = input
		})
	}
	local createElement_3 = reactModule.createElement
	local var30 = "Frame"
	local t_7 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -var14, 1, -var14),
		Position = UDim2.new(0, var14 / 2, 0, var14 / 2)
	}
	local t_8 = {
		Corner = reactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, textField.Base.Field.BorderRadius - var14 / 2)
		}),
		Focus = if p0.disabled or not var9 and not var11 then nil else reactModule.createElement("UIStroke", {
			Color = textField.Base.Field.BorderColor.Color3,
			Transparency = tokens.Global.Opacity_12,
			Thickness = focus_1
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, textField.Base.Field.Spacing.Leading),
			PaddingRight = UDim.new(0, textField.Base.Field.Spacing.Trailing)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, textField.Base.Field.Gap * 2)
		}),
		IconLeading = if p0.iconLeading then reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = p0.iconLeading,
			Size = UDim2.new(0, small, 0, small),
			ImageColor3 = textField.Base.IconLeading.ContentColor.Color3,
			ImageTransparency = textField.Base.IconLeading.ContentColor.Transparency
		}) else nil
	}
	local createElement_4 = reactModule.createElement
	local var33 = "TextBox"
	local t_9 = { ref = var8, Text = p0.text }
	local ok, status = pcall(function() --[[ line: 81 ]]
		local coreGuiService = game:GetService("CoreGui")
		local _ = coreGuiService.Name
		
		return coreGuiService
	end)
	t_9.TextInputType = if ok and status ~= nil then p0.textInputType else nil
	t_9.ClearTextOnFocus = false
	local new = UDim2.new
	local var35 = 1
	local var36 = 0
	
	if p0.iconLeading then
		var36 = var36 - small - textField.Base.Field.Gap * 2
	end
	if p0.iconButton then
		var36 = var36 - small - textField.Base.Field.Gap * 2
	end
	t_9.Size = new(var35, var36, 1, 0)
	t_9.TextEditable = not p0.disabled
	t_9.BackgroundTransparency = 1
	t_9.TextXAlignment = Enum.TextXAlignment.Left
	t_9.TextYAlignment = Enum.TextYAlignment.Center
	t_9.Font = textField.Base.Field.Typography.Font
	t_9.OpenTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport and p0.openTypeFeatures then p0.openTypeFeatures else nil
	t_9.TextSize = textField.Base.Field.Typography.FontSize
	t_9.LineHeight = 1
	t_9.TextColor3 = textField.Base.FieldValue.ContentColor.Color3
	t_9.TextTransparency = textField.Base.FieldValue.ContentColor.Transparency
	t_9.PlaceholderText = p0.placeholder
	t_9.PlaceholderColor3 = tokens.Semantic.Color.Text.Default.Color3
	t_9.ClipsDescendants = true
	t_9.Selectable = false
	t_9.LayoutOrder = 2
	t_9[reactModule.Event.Focused] = onFocusGained
	t_9[reactModule.Event.FocusLost] = onFocusLost
	t_9[reactModule.Change.Text] = onTextChange
	t_8.TextBox = createElement_4(var33, t_9)
	t_8.IconButton = if p0.iconButton then reactModule.createElement(imageSetComponentModule.Button, {
		BackgroundTransparency = 1,
		Image = p0.iconButton,
		Size = UDim2.new(0, small, 0, small),
		ImageColor3 = textField.Base.IconLeading.ContentColor.Color3,
		Selectable = not p0.disabled,
		SelectionImageObject = var16,
		LayoutOrder = 3,
		[reactModule.Event.Activated] = if not p0.disabled then p0.onButtonPress else nil
	}) else nil
	t_6.BorderFrame = createElement_3(var30, t_7, t_8)
	t_4.Input = createElement_2(var27, t_5, t_6)
	t_2.InputCanvas = createElement_1(var24, t_3, t_4)
	t_2.HelperText = if p0.hint then reactModule.createElement(helperTextModule, { LayoutOrder = 3, text = p0.hint, error = p0.error }) else nil
	
	return createElement(var21, t_1, t_2)
end