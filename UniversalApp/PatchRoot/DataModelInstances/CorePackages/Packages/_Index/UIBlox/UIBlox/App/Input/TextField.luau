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

return function(p1)
	-- upvalues: useStyleModule (ref), reactModule (ref), UIBloxConfigModule (ref), useCursorModule (ref), t (ref), inputLabelModule (ref), imageSetComponentModule (ref), helperTextModule (ref)
	local tokens = useStyleModule().Tokens
	local var1 = reactModule.useRef(nil)
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Stroke.Thick else tokens.Semantic.Stroke.Focus
	local var7 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_400 else tokens.Semantic.Icon.Size.Small
	local var8 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Stroke.Standard else tokens.Semantic.Stroke.Input
	local var9 = math.ceil(var8) * 2
	local var10 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Stroke.Thick else tokens.Semantic.Stroke.Focus
	local var11 = math.ceil(var10) * 2
	local var12 = useCursorModule(UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Medium else tokens.Component.TextField.Base.Field.BorderRadius), var6, var6)
	local var13 = useCursorModule(UDim.new(0.5), var7 / 2, var6)
	local var14 = if p1.width ~= nil then t.width else p1.width
	
	local function _()
		local ok, status = pcall(function()
			local coreGuiService = game:GetService("CoreGui")
			local _ = coreGuiService.Name
			
			return coreGuiService
		end)
		
		return ok and status ~= nil
	end
	
	local function getTextBoxWidthOffset()
		-- upvalues: p1 (ref), var7 (ref), UIBloxConfigModule (copy), tokens (ref)
		local var15 = 0
		
		if p1.iconLeading then
			var15 = var15 - var7 - (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Gap.Small else tokens.Component.TextField.Base.Field.Gap) * 2
		end
		if p1.iconButton then
			var15 = var15 - var7 - (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Gap.Small else tokens.Component.TextField.Base.Field.Gap) * 2
		end
		return var15
	end
	
	local function onTextChange(p2)
		-- upvalues: p1 (ref)
		if p2 == nil then
			p1.onChange("")
			
			return
		end
		p1.onChange(p2.Text)
	end
	
	local function onFocusGained()
		-- upvalues: p1 (ref), var1 (ref), var5 (ref)
		if p1.disabled and var1.current then
			var1.current:ReleaseFocus()
			
			return
		end
		var5(true)
		
		if p1.onFocusGained then
			p1.onFocusGained()
		end
	end
	
	local function onFocusLost()
		-- upvalues: var5 (ref)
		var5(false)
	end
	
	local createElement = reactModule.createElement
	local var15 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(var14, UDim.new(0, 0)),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder
	}
	local t_2 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Component.InputLabel.Base.Spacing.Bottom)
		}),
		InputLabel = if p1.label then reactModule.createElement(inputLabelModule, { LayoutOrder = 1, text = p1.label, required = p1.required }) else nil
	}
	local createElement_1 = reactModule.createElement
	local var16 = "CanvasGroup"
	local t_3 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1200 else tokens.Global.Size_600),
		GroupTransparency = if p1.disabled then 1 - tokens.Component.TextField.Disabled.Field.Opacity else 0
	}
	local t_4 = {}
	local createElement_2 = reactModule.createElement
	local var17 = "ImageButton"
	local t_5 = {
		Size = UDim2.new(1, -var9, 1, -var9),
		Position = UDim2.new(0, var9 / 2, 0, var9 / 2),
		BackgroundTransparency = 1,
		Selectable = not p1.disabled,
		Image = "",
		SelectionImageObject = var12,
		[reactModule.Event.Activated] = function()
			-- upvalues: var1 (ref)
			if var1.current then
				var1.current:CaptureFocus()
			end
		end,
		[reactModule.Event.MouseEnter] = function()
			-- upvalues: var3 (ref)
			var3(true)
		end,
		[reactModule.Event.MouseLeave] = function()
			-- upvalues: var3 (ref)
			var3(false)
		end
	}
	local t_6 = {
		Corner = reactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Medium else tokens.Component.TextField.Base.Field.BorderRadius)
		}),
		Border = reactModule.createElement("UIStroke", {
			Color = if p1.error then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.ActionAlert.Border.Color3 else tokens.Component.TextField.Error.Field.BorderColor.Color3 elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Stroke.Emphasis.Color3 else tokens.Component.TextField.Base.Field.BorderColor.Color3,
			Transparency = if p1.error then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.ActionAlert.Border.Transparency else tokens.Component.TextField.Error.Field.BorderColor.Transparency elseif var4 then 0 elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Stroke.Emphasis.Transparency else tokens.Component.TextField.Base.Field.BorderColor.Transparency,
			Thickness = var8
		})
	}
	local createElement_3 = reactModule.createElement
	local var18 = "Frame"
	local t_7 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -var11, 1, -var11),
		Position = UDim2.new(0, var11 / 2, 0, var11 / 2)
	}
	local t_8 = {
		Corner = reactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Medium else tokens.Component.TextField.Base.Field.BorderRadius) - var11 / 2)
		}),
		Focus = if p1.disabled or not var2 and not var4 then nil else reactModule.createElement("UIStroke", {
			Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Stroke.Emphasis.Color3 else tokens.Component.TextField.Base.Field.BorderColor.Color3,
			Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then 0.88 else tokens.Global.Opacity_12,
			Thickness = var10
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
		IconLeading = if p1.iconLeading then reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = p1.iconLeading,
			Size = UDim2.new(0, var7, 0, var7),
			ImageColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Muted.Color3 else tokens.Component.TextField.Base.IconLeading.ContentColor.Color3,
			ImageTransparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Muted.Transparency else tokens.Component.TextField.Base.IconLeading.ContentColor.Transparency
		}) else nil
	}
	local createElement_4 = reactModule.createElement
	local var19 = "TextBox"
	local t_9 = { ref = var1, Text = p1.text }
	local ok, status = pcall(function()
		local coreGuiService = game:GetService("CoreGui")
		local _ = coreGuiService.Name
		
		return coreGuiService
	end)
	t_9.TextInputType = if ok and status ~= nil then p1.textInputType else nil
	t_9.ClearTextOnFocus = false
	t_9.Size = UDim2.new(1, getTextBoxWidthOffset(), 1, 0)
	t_9.TextEditable = not p1.disabled
	t_9.BackgroundTransparency = 1
	t_9.TextXAlignment = Enum.TextXAlignment.Left
	t_9.TextYAlignment = Enum.TextYAlignment.Center
	t_9.Font = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.BodyLarge.Font else tokens.Component.TextField.Base.Field.Typography.Font
	t_9.OpenTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport and p1.openTypeFeatures then p1.openTypeFeatures else nil
	t_9.TextSize = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.BodyLarge.FontSize else tokens.Component.TextField.Base.Field.Typography.FontSize
	t_9.LineHeight = 1
	t_9.TextColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis.Color3 else tokens.Component.TextField.Base.FieldValue.ContentColor.Color3
	t_9.TextTransparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis.Transparency else tokens.Component.TextField.Base.FieldValue.ContentColor.Transparency
	t_9.PlaceholderText = p1.placeholder
	t_9.PlaceholderColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default.Color3 else tokens.Semantic.Color.Text.Default.Color3
	t_9.ClipsDescendants = true
	t_9.Selectable = false
	t_9.LayoutOrder = 2
	t_9[reactModule.Event.Focused] = onFocusGained
	t_9[reactModule.Event.FocusLost] = onFocusLost
	t_9[reactModule.Change.Text] = onTextChange
	t_8.TextBox = createElement_4(var19, t_9)
	t_8.IconButton = if p1.iconButton then reactModule.createElement(imageSetComponentModule.Button, {
		BackgroundTransparency = 1,
		Image = p1.iconButton,
		Size = UDim2.new(0, var7, 0, var7),
		ImageColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Muted.Color3 else tokens.Component.TextField.Base.IconLeading.ContentColor.Color3,
		Selectable = not p1.disabled,
		SelectionImageObject = var13,
		LayoutOrder = 3,
		[reactModule.Event.Activated] = if not p1.disabled then p1.onButtonPress else nil
	}) else nil
	t_6.BorderFrame = createElement_3(var18, t_7, t_8)
	t_4.Input = createElement_2(var17, t_5, t_6)
	t_2.InputCanvas = createElement_1(var16, t_3, t_4)
	t_2.HelperText = if p1.hint then reactModule.createElement(helperTextModule, { LayoutOrder = 3, text = p1.hint, error = p1.error }) else nil
	
	return createElement(var15, t_1, t_2)
end