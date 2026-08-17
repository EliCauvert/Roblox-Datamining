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
	-- upvalues: useStyleModule (ref), reactModule (ref), UIBloxConfigModule (ref), useCursorModule (ref), t (ref), inputLabelModule (ref), imageSetComponentModule (ref), helperTextModule (ref)
	local tokens = useStyleModule().Tokens
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local var13 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Stroke.Thick else tokens.Semantic.Stroke.Focus
	local var14 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_400 else tokens.Semantic.Icon.Size.Small
	local var15 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Stroke.Standard else tokens.Semantic.Stroke.Input
	local var16 = math.ceil(var15) * 2
	local var17 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Stroke.Thick else tokens.Semantic.Stroke.Focus
	local var18 = math.ceil(var17) * 2
	local var19 = useCursorModule(UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Medium else tokens.Component.TextField.Base.Field.BorderRadius), var13, var13)
	local var20 = useCursorModule(UDim.new(0.5), var14 / 2, var13)
	local var21 = if p0.width ~= nil then t.width else p0.width
	
	local function _() --[[ line: 94 | named "canUseTextInputType" ]]
		local ok, status = pcall(function() --[[ line: 95 ]]
			local coreGuiService = game:GetService("CoreGui")
			local _ = coreGuiService.Name
			
			return coreGuiService
		end)
		
		return ok and status ~= nil
	end
	
	local function getTextBoxWidthOffset() --[[ line: 103 ]]
		-- upvalues: p0 (ref), var14 (ref), UIBloxConfigModule (copy), tokens (ref)
		local var41 = 0
		
		if p0.iconLeading then
			var41 = var41 - var14 - (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Gap.Small else tokens.Component.TextField.Base.Field.Gap) * 2
		end
		if p0.iconButton then
			var41 = var41 - var14 - (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Gap.Small else tokens.Component.TextField.Base.Field.Gap) * 2
		end
		return var41
	end
	
	local function onTextChange(p1) --[[ line: 120 ]]
		-- upvalues: p0 (ref)
		if p1 == nil then
			p0.onChange("")
			
			return
		end
		p0.onChange(p1.Text)
	end
	
	local function onFocusGained() --[[ line: 128 ]]
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
	
	local function onFocusLost() --[[ line: 139 ]]
		-- upvalues: var12 (ref)
		var12(false)
	end
	
	local createElement = reactModule.createElement
	local var26 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(var21, UDim.new(0, 0)),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	}
	local t_2 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Component.InputLabel.Base.Spacing.Bottom)
		}),
		InputLabel = if p0.label then reactModule.createElement(inputLabelModule, { LayoutOrder = 1, text = p0.label, required = p0.required }) else nil
	}
	local createElement_1 = reactModule.createElement
	local var29 = "CanvasGroup"
	local t_3 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1200 else tokens.Global.Size_600),
		GroupTransparency = if p0.disabled then 1 - tokens.Component.TextField.Disabled.Field.Opacity else 0
	}
	local t_4 = {}
	local createElement_2 = reactModule.createElement
	local var32 = "ImageButton"
	local t_5 = {
		Size = UDim2.new(1, -var16, 1, -var16),
		Position = UDim2.new(0, var16 / 2, 0, var16 / 2),
		BackgroundTransparency = 1,
		Selectable = not p0.disabled,
		Image = "",
		SelectionImageObject = var19,
		[reactModule.Event.Activated] = function() --[[ line: 189 ]]
			-- upvalues: var8 (ref)
			if var8.current then
				var8.current:CaptureFocus()
			end
		end,
		[reactModule.Event.MouseEnter] = function() --[[ line: 194 ]]
			-- upvalues: var10 (ref)
			var10(true)
		end,
		[reactModule.Event.MouseLeave] = function() --[[ line: 197 ]]
			-- upvalues: var10 (ref)
			var10(false)
		end
	}
	local t_6 = {
		Corner = reactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Medium else tokens.Component.TextField.Base.Field.BorderRadius)
		}),
		Border = reactModule.createElement("UIStroke", {
			Color = if p0.error then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.ActionAlert.Border.Color3 else tokens.Component.TextField.Error.Field.BorderColor.Color3 elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Stroke.Emphasis.Color3 else tokens.Component.TextField.Base.Field.BorderColor.Color3,
			Transparency = if p0.error then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.ActionAlert.Border.Transparency else tokens.Component.TextField.Error.Field.BorderColor.Transparency elseif var11 then 0 elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Stroke.Emphasis.Transparency else tokens.Component.TextField.Base.Field.BorderColor.Transparency,
			Thickness = var15
		})
	}
	local createElement_3 = reactModule.createElement
	local var35 = "Frame"
	local t_7 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -var18, 1, -var18),
		Position = UDim2.new(0, var18 / 2, 0, var18 / 2)
	}
	local t_8 = {
		Corner = reactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Medium else tokens.Component.TextField.Base.Field.BorderRadius) - var18 / 2)
		}),
		Focus = if p0.disabled or not var9 and not var11 then nil else reactModule.createElement("UIStroke", {
			Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Stroke.Emphasis.Color3 else tokens.Component.TextField.Base.Field.BorderColor.Color3,
			Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then 0.88 else tokens.Global.Opacity_12,
			Thickness = var17
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Component.TextField.Base.Field.Spacing.Leading),
			PaddingRight = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Component.TextField.Base.Field.Spacing.Trailing)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Gap.Small else tokens.Component.TextField.Base.Field.Gap) * 2)
		}),
		IconLeading = if p0.iconLeading then reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = p0.iconLeading,
			Size = UDim2.new(0, var14, 0, var14),
			ImageColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Muted.Color3 else tokens.Component.TextField.Base.IconLeading.ContentColor.Color3,
			ImageTransparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Muted.Transparency else tokens.Component.TextField.Base.IconLeading.ContentColor.Transparency
		}) else nil
	}
	local createElement_4 = reactModule.createElement
	local var38 = "TextBox"
	local t_9 = { ref = var8, Text = p0.text }
	local ok, status = pcall(function() --[[ line: 95 ]]
		local coreGuiService = game:GetService("CoreGui")
		local _ = coreGuiService.Name
		
		return coreGuiService
	end)
	t_9.TextInputType = if ok and status ~= nil then p0.textInputType else nil
	t_9.ClearTextOnFocus = false
	t_9.Size = UDim2.new(1, getTextBoxWidthOffset(), 1, 0)
	t_9.TextEditable = not p0.disabled
	t_9.BackgroundTransparency = 1
	t_9.TextXAlignment = Enum.TextXAlignment.Left
	t_9.TextYAlignment = Enum.TextYAlignment.Center
	t_9.Font = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.BodyLarge.Font else tokens.Component.TextField.Base.Field.Typography.Font
	t_9.OpenTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport and p0.openTypeFeatures then p0.openTypeFeatures else nil
	t_9.TextSize = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.BodyLarge.FontSize else tokens.Component.TextField.Base.Field.Typography.FontSize
	t_9.LineHeight = 1
	t_9.TextColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis.Color3 else tokens.Component.TextField.Base.FieldValue.ContentColor.Color3
	t_9.TextTransparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis.Transparency else tokens.Component.TextField.Base.FieldValue.ContentColor.Transparency
	t_9.PlaceholderText = p0.placeholder
	t_9.PlaceholderColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default.Color3 else tokens.Semantic.Color.Text.Default.Color3
	t_9.ClipsDescendants = true
	t_9.Selectable = false
	t_9.LayoutOrder = 2
	t_9[reactModule.Event.Focused] = onFocusGained
	t_9[reactModule.Event.FocusLost] = onFocusLost
	t_9[reactModule.Change.Text] = onTextChange
	t_8.TextBox = createElement_4(var38, t_9)
	t_8.IconButton = if p0.iconButton then reactModule.createElement(imageSetComponentModule.Button, {
		BackgroundTransparency = 1,
		Image = p0.iconButton,
		Size = UDim2.new(0, var14, 0, var14),
		ImageColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Muted.Color3 else tokens.Component.TextField.Base.IconLeading.ContentColor.Color3,
		Selectable = not p0.disabled,
		SelectionImageObject = var20,
		LayoutOrder = 3,
		[reactModule.Event.Activated] = if not p0.disabled then p0.onButtonPress else nil
	}) else nil
	t_6.BorderFrame = createElement_3(var35, t_7, t_8)
	t_4.Input = createElement_2(var32, t_5, t_6)
	t_2.InputCanvas = createElement_1(var29, t_3, t_4)
	t_2.HelperText = if p0.hint then reactModule.createElement(helperTextModule, { LayoutOrder = 3, text = p0.hint, error = p0.error }) else nil
	
	return createElement(var26, t_1, t_2)
end