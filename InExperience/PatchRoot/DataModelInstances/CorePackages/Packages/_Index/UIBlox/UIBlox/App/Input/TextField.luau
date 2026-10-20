local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local ReactModule = require(Parent3.React)
local FoundationModule = require(Parent3.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local InputLabelModule = require(Parent.InputLabel)
local HelperTextModule = require(Parent.HelperText)
local ImageSetComponentModule = require(Parent2.Core.ImageSet.ImageSetComponent)
local _ = require(Parent1.ImageSet.ImagesTypes)
local UseStyleModule = require(Parent2.Core.Style.useStyle)
local UseCursorModule = require(Parent2.App.SelectionCursor.useCursor)
local UIBloxConfigModule = require(Parent2.UIBloxConfig)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local config = { width = UDim.new(0, 400) }

return function(Frame)
	-- upvalues: UseStyleModule (copy), ReactModule (copy), UseCursorModule (copy), config (copy), InputLabelModule (copy), ImageSetComponentModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), UIBloxConfigModule (copy), HelperTextModule (copy)
	local Tokens = UseStyleModule().Tokens
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local Thick = Tokens.Stroke.Thick
	local Size400: number = Tokens.Size.Size_400
	local Standard: number = Tokens.Stroke.Standard
	local ScaledCeiled = math.ceil(Standard) * 2
	local Thick1: number = Tokens.Stroke.Thick
	local ScaledCeiled1 = math.ceil(Thick1) * 2
	local UseCursorModuleResult = UseCursorModule(UDim.new(0, Tokens.Radius.Medium), Thick, Thick)
	local UseCursorModuleResult1 = UseCursorModule(UDim.new(0.5), Size400 / 2, Thick)
	
	local function _(): boolean
		local Success, Result = pcall(function()
			local CoreGui = game:GetService("CoreGui")
			local _ = CoreGui.Name
			
			return CoreGui
		end)
		
		return Success and Result ~= nil
	end
	
	local _ = function(): number
		-- upvalues: Frame (copy), Size400 (copy), Tokens (copy)
		local v1 = 0
		
		if Frame.iconLeading then
			v1 = v1 - Size400 - Tokens.Gap.Small * 2
		end
		if Frame.iconButton then
			v1 = v1 - Size400 - Tokens.Gap.Small * 2
		end
		return v1
	end
	
	local function onTextChange(p1)
		-- upvalues: Frame (copy)
		if p1 == nil then
			Frame.onChange("")
			
			return
		else
			Frame.onChange(p1.Text)
		end
	end
	
	local function onFocusGained()
		-- upvalues: Frame (copy), UseRefResult (copy), UseStateResult2_1 (copy)
		if Frame.disabled and UseRefResult.current then
			UseRefResult.current:ReleaseFocus()
			
			return
		end
		UseStateResult2_1(true)
		
		if Frame.onFocusGained then
			Frame.onFocusGained()
		end
	end
	
	local function onFocusLost()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end
	
	local CreateElementFunction3 = ReactModule.createElement
	local v1 = "Frame"
	local config1 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(if Frame.width == nil then config.width else Frame.width, UDim.new(0, 0)),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}
	local config2 = {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Tokens.Size.Size_100)
		}),
		InputLabel = if Frame.label then ReactModule.createElement(InputLabelModule, {
			LayoutOrder = 1,
			text = Frame.label,
			required = Frame.required
		}) else nil
	}
	local CreateElementFunction1 = ReactModule.createElement
	local v2 = "CanvasGroup"
	local config3 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, Tokens.Size.Size_1200),
		GroupTransparency = if Frame.disabled then 0.68 else 0
	}
	local t = {}
	local CreateElementFunction4 = ReactModule.createElement
	local v3 = "ImageButton"
	local config4 = {
		Size = UDim2.new(1, -ScaledCeiled, 1, -ScaledCeiled),
		Position = UDim2.new(0, ScaledCeiled / 2, 0, ScaledCeiled / 2),
		BackgroundTransparency = 1,
		Selectable = not Frame.disabled,
		Image = "",
		SelectionImageObject = UseCursorModuleResult,
		[ReactModule.Event.Activated] = function()
			-- upvalues: UseRefResult (copy)
			if UseRefResult.current then
				UseRefResult.current:CaptureFocus()
			end
		end,
		[ReactModule.Event.MouseEnter] = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(true)
		end,
		[ReactModule.Event.MouseLeave] = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end
	}
	local config5 = {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Medium) }),
		Border = ReactModule.createElement("UIStroke", {
			Color = if Frame.error then Tokens.Color.ActionAlert.Border.Color3 else Tokens.Color.Stroke.Emphasis.Color3,
			Transparency = if Frame.error then Tokens.Color.ActionAlert.Border.Transparency elseif UseStateResult1 then 0 else Tokens.Color.Stroke.Emphasis.Transparency,
			Thickness = Standard
		})
	}
	local CreateElementFunction2 = ReactModule.createElement
	local v4 = "Frame"
	local config6 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -ScaledCeiled1, 1, -ScaledCeiled1),
		Position = UDim2.new(0, ScaledCeiled1 / 2, 0, ScaledCeiled1 / 2)
	}
	local config7 = {
		Corner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, Tokens.Radius.Medium - ScaledCeiled1 / 2)
		}),
		Focus = if Frame.disabled or not UseStateResult and not UseStateResult1 then nil else ReactModule.createElement("UIStroke", {
			Transparency = 0.88,
			Color = Tokens.Color.Stroke.Emphasis.Color3,
			Thickness = Thick1
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Tokens.Size.Size_300),
			PaddingRight = UDim.new(0, Tokens.Size.Size_300)
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Tokens.Gap.Small * 2)
		}),
		IconLeading = if Frame.iconLeading then ReactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = Frame.iconLeading,
			Size = UDim2.new(0, Size400, 0, Size400),
			ImageColor3 = Tokens.Color.Content.Muted.Color3,
			ImageTransparency = Tokens.Color.Content.Muted.Transparency
		}) else nil
	}
	local CreateElementFunction = ReactModule.createElement
	local v5 = "TextBox"
	local Label = { ref = UseRefResult, Text = Frame.text }
	local Success, Result = pcall(function()
		local CoreGui = game:GetService("CoreGui")
		local _ = CoreGui.Name
		
		return CoreGui
	end)
	
	if Success then
		Success = Result ~= nil
	end
	Label.TextInputType = Success and Frame.textInputType or nil
	Label.ClearTextOnFocus = false
	local NewFunction = UDim2.new
	local v6 = 1
	local SizeDelta = 0
	
	if Frame.iconLeading then
		SizeDelta = SizeDelta - Size400 - Tokens.Gap.Small * 2
	end
	if Frame.iconButton then
		SizeDelta = SizeDelta - Size400 - Tokens.Gap.Small * 2
	end
	Label.Size = NewFunction(v6, SizeDelta, 1, 0)
	Label.TextEditable = not Frame.disabled
	Label.BackgroundTransparency = 1
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.TextYAlignment = Enum.TextYAlignment.Center
	Label.Font = if FoundationFontFaceMigration then nil else Tokens.Typography.BodyLarge.Font
	Label.FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font) else nil
	Label.OpenTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport and Frame.openTypeFeatures then Frame.openTypeFeatures else nil
	Label.TextSize = Tokens.Typography.BodyLarge.FontSize
	Label.LineHeight = 1
	Label.TextColor3 = Tokens.Color.Content.Emphasis.Color3
	Label.TextTransparency = Tokens.Color.Content.Emphasis.Transparency
	Label.PlaceholderText = Frame.placeholder
	Label.PlaceholderColor3 = Tokens.Color.Content.Default.Color3
	Label.ClipsDescendants = true
	Label.Selectable = false
	Label.LayoutOrder = 2
	Label[ReactModule.Event.Focused] = onFocusGained
	Label[ReactModule.Event.FocusLost] = onFocusLost
	Label[ReactModule.Change.Text] = onTextChange
	config7.TextBox = CreateElementFunction(v5, Label)
	config7.IconButton = if Frame.iconButton then ReactModule.createElement(ImageSetComponentModule.Button, {
		BackgroundTransparency = 1,
		Image = Frame.iconButton,
		Size = UDim2.new(0, Size400, 0, Size400),
		ImageColor3 = Tokens.Color.Content.Muted.Color3,
		Selectable = not Frame.disabled,
		SelectionImageObject = UseCursorModuleResult1,
		LayoutOrder = 3,
		[ReactModule.Event.Activated] = if Frame.disabled then nil else Frame.onButtonPress
	}) else nil
	config5.BorderFrame = CreateElementFunction2(v4, config6, config7)
	t.Input = CreateElementFunction4(v3, config4, config5)
	config2.InputCanvas = CreateElementFunction1(v2, config3, t)
	config2.HelperText = if Frame.hint then ReactModule.createElement(HelperTextModule, { LayoutOrder = 3, text = Frame.hint, error = Frame.error }) else nil
	
	return CreateElementFunction3(v1, config1, config2)
end